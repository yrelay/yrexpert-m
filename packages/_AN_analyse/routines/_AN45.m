;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%AN45^INT^1^59547,73865^0
AN45 ;
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
COPIER 
 K @(TEMPO) S @TEMPO@(1)="TYP",@TEMPO@(2)="LTYP",@TEMPO@(3)="REPTR",@TEMPO@(4)="VARTR",@TEMPO@(6)="NOM2LI",@TEMPO@(7)="LMES",@TEMPO@(8)="NOM1",@TEMPO@(9)="WH",@TEMPO@(10)="ORD2"
 D EMPV^%ANGEPIL(TEMPO)
 S LMES=$L($$^%QZCHW("$COPIER.INDIVIDU"))
 F I=1:1:LMES D LEC
 S (TYP,REPTR,VARTR,ORD2,NOM2LI,NOM1,WH)=0
 D CAR I C'="(" D M("Une ( etait attendue apres $COPIER.INDIVIDU") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COP1^%AN45") G ENTIER^%AN1
COP1 G:RESULT=0 ERRCOP
 S TYP=NORES,LTYP=$$RED^%ANA(NORES,"TEXTE")
 I ((LTYP'=1)&(LTYP'=2))&(LTYP'=3) D M("Le type de la recopie doit etre egal a 1,2 ou 3") G ERRCOP
 D CAR
 I C'=";" D M("Un ; etait attendu apres le type de la transformation") G ERRCOP
 D LEC,EMPIL^%ANGEPIL("COP2^%AN45") G:LTYP=1 VARTEMP^%AN3 G EXPRESS^%AN4
COP2 G:RESULT=0 ERRCOP
 S VARTR=NORES
 I LTYP=1,$E($$RED^%ANA(NORES,"TEXTE"))'="%" D M("Une variable temporaire doit commencer par %") G ERRCOP
 D CAR
 I C'=";" D M("Un ; etait attendu apres "_$S(LTYP=1:"la variable temporaire",1:"le nom de la transformation")) G ERRCOP
 D LEC,EMPIL^%ANGEPIL("COP21^%AN45") G EXPRESS^%AN4
COP21 G:RESULT=0 ERRCOP
 S REPTR=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom du repertoire") G ERRCOP
 D LEC,EMPIL^%ANGEPIL("COP3^%AN45") G EXPRESS^%AN4
COP3 G:RESULT=0 ERRCOP
 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom de l'individu") G ERRCOP
 S NOM1=NORES
 D LEC,EMPIL^%ANGEPIL("COP4^%AN45") G EXPRESS^%AN4
COP4 G:RESULT=0 ERRCOP
 S NOM2LI=NORES
 D CAR
 G:LTYP=2 COPF
 I C'=";" D M("Un ; etait attendu apres le nom de l'individu a creer par recopie") G ERRCOP
 D LEC,EMPIL^%ANGEPIL("COP5^%AN45") G EXPRESS^%AN4
COP5 G:RESULT=0 ERRCOP
 S ORD2=NORES
 D CAR
 I LTYP=3 G COPF
 I C'=";" D M("Un ; etait attendu apres le no d'ordre de l'individu a creer par recopie") G ERRCOP
 D LEC,EMPIL^%ANGEPIL("COP6^%AN45") G EXPRESS^%AN4
COP6 G:RESULT=0 ERRCOP
 S WH=NORES
 D CAR
COPF I C'=")" D M("Une ) etait attendue") G ERRCOP
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$COPIER.INDIVIDU")
 D SET^%ANA(NORES,1,TYP),SET^%ANA(NORES,2,VARTR),SET^%ANA(NORES,3,REPTR),SET^%ANA(NORES,4,NOM1),SET^%ANA(NORES,5,NOM2LI)
 D:(LTYP=1)!(LTYP=3) SET^%ANA(NORES,6,ORD2)
 D:(LTYP=1)!(LTYP=3) SET^%ANA(NORES,7,WH)
 G DEPIL^%ANGEPIL
ERRCOP S RESULT=0 D KILL^%ANA(NOM1),KILL^%ANA(VARTR),KILL^%ANA(TYP),KILL^%ANA(REPTR),KILL^%ANA(NOM2LI),KILL^%ANA(WH),KILL^%ANA(ORD2)
 G DEPIL^%ANGEPIL
 
 
INDIV K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOB",@TEMPO@(3)="REP",@TEMPO@(4)="VT",@TEMPO@(5)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$INDIVIDU"))+1 D LEC
 S (NOB,REP,VT)=0
 S %COMP1=%COMPIL_"D ^%EDCIND(""",%COMPIL=""
 D EMPIL^%ANGEPIL("INDV1^%AN45") G VARTEMP^%AN3
INDV1 G:RESULT=0 DEPIL^%ANGEPIL
 S VT=NORES
 D CAR I C'=";" D M("Un "";"" apres la variable temporaire...") G ERRIND
 S %COMPIL=%COMP1_$$RED^%ANA(NORES,"TEXTE")_""","
 D LEC,EMPIL^%ANGEPIL("INDV3^%AN45") G EXPRESS^%AN4
INDV3 I RESULT=0 G ERRIND
 S REP=NORES
 D CAR I C'=";" D M("Un "";"" apres le repertoire...") G ERRIND
 S %COMPIL=%COMPIL_","
 D LEC,EMPIL^%ANGEPIL("INDV4^%AN45") G EXPRESS^%AN4
INDV4 I RESULT=0 G ERRIND
 S %COMPIL=%COMPIL_")"
 S NOB=NORES
 D CAR I C'=")" D M("Une "")"" apres le nom de l'individu ...") G ERRIND
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$INDIVIDU")
 D SET^%ANA(NORES,1,VT),SET^%ANA(NORES,2,REP)
 D SET^%ANA(NORES,3,NOB)
 G DEPIL^%ANGEPIL
ERRIND D KILL^%ANA(VT),KILL^%ANA(REP),KILL^%ANA(NOB)
 S RESULT=0,%COMPIL=""
 G DEPIL^%ANGEPIL
 
 
QUEMAND K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="SAIS",@TEMPO@(3)="OBJ"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$QUEMANDER"))+1 D LEC
 S (SAIS,OBJ)=0
 D EMPIL^%ANGEPIL("QUEM1^%AN45") G EXPRESS^%AN4
QUEM1 G:RESULT=0 DEPIL^%ANGEPIL
 S SAIS=NORES
 D CAR
 G:C=")" QUEMF
 I C'=";" D M("Un "";"" ou une "")"" apres le nom de la saisie...") G ERRQUEM
 D LEC,EMPIL^%ANGEPIL("QUEM2^%AN45") G IDF^%AN3
QUEM2 I RESULT=0 G ERRQUEM
 S OBJ=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue...") G ERRQUEM
QUEMF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$QUEMANDER")
 D SET^%ANA(NORES,1,SAIS),SET^%ANA(NORES,2,OBJ)
 G DEPIL^%ANGEPIL
ERRQUEM D KILL^%ANA(SAIS),KILL^%ANA(OBJ)
 S RESULT=0 G DEPIL^%ANGEPIL
 ;

