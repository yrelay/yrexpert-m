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

;%AN29^INT^1^59547,73865^0
AN29 ;
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
DEPOU K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="OB",@TEMPO@(3)="L",@TEMPO@(4)="MOD",@TEMPO@(5)="MOD1"
 D EMPV^%ANGEPIL(TEMPO)
 S OB=0,MOD=0
 F I=1:1:$L($$^%QZCHW("$DEPOUILLER")) D LEC
 I C'="(" S RESULT=0 D M("Il manque une ""("" ...") G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DEPOU1^%AN29") G ENTIER^%AN1
DEPOU1 G:RESULT=0 DEPIL^%ANGEPIL
 S MOD=NORES D CAR
 S MOD1=$$RED^%ANA(MOD,"TEXTE")
 I (MOD1'=0)&(MOD1'=1) D M("Le mode doit etre egal a 0 ou a 1") S RESULT=0 G DEPIL^%ANGEPIL
 G:C'=";" FDEPOU
 D LEC,EMPIL^%ANGEPIL("DEPOU2^%AN29") G VARTEMP^%AN3
DEPOU2 I RESULT=0 D KILL^%ANA(MOD) G DEPIL^%ANGEPIL
 S OB=NORES
FDEPOU D CAR I C'=")" S RESULT=0 D KILL^%ANA(MOD),KILL^%ANA(OB),M("Il manque un "")"" ...") G DEPIL^%ANGEPIL
 D LEC
FINSUP S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,1,MOD),SET^%ANA(NORES,2,OB)
 D SET^%ANA(NORES,"TEXTE","$DEPOUILLER") G DEPIL^%ANGEPIL
 
ABAQ 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM",@TEMPO@(3)="ID",@TEMPO@(4)="NORME",@TEMPO@(5)="PREMIS",@TEMPO@(6)="CONC",@TEMPO@(7)="ATRONLY" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ABAQUE")) D LEC
 S (NOM,NORME,ID,PREMIS,CONC)=0
 S %COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ABAQUE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ABAQ1^%AN29") G EXPRESS^%AN4
ABAQ1 G:RESULT=0 DEPIL^%ANGEPIL S NOM=NORES,%COMPIL=""
 D CAR
 G:C=")" ABAQF
 I C'=";" D M("Un ; etait attendu apres le nom de l'abaque") G ERRABAQ
 D LEC,EMPIL^%ANGEPIL("ABAQ2^%AN29") G EXPRESS^%AN4
ABAQ2 G:RESULT=0 ERRABAQ
 S NORME=NORES,%COMPIL=""
 D CAR I C'=";" D M("Un ; etait attendu apres la norme") G ERRABAQ
 D LEC,EMPIL^%ANGEPIL("ABAQ3^%AN29") G EXPRESS^%AN4
ABAQ3 G:RESULT=0 ERRABAQ
 S ID=NORES,%COMPIL=""
 D CAR
 G:C=")" ABAQF
 I C'=";" D M("Un ; etait attendu apres l'identificateur") G ERRABAQ
 S ATRONLY=0
 D LEC,EMPIL^%ANGEPIL("ABAQ4^%AN29") G LISTE^%AN29
ABAQ4 G:RESULT=0 ERRABAQ
 S PREMIS=NORES,%COMPIL=""
 D CAR I C'=";" D M("Un ; etait attendu apres les premisses") G ERRABAQ
 S ATRONLY=1
 D LEC,EMPIL^%ANGEPIL("ABAQ5^%AN29") G LISTE^%AN29
ABAQ5 G:RESULT=0 ERRABAQ
 S CONC=NORES,%COMPIL=""
 D CAR I C'=")" D M("Une ) etait attendue a la fin") G ERRABAQ
ABAQF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ABAQUE")
 D SET^%ANA(NORES,1,NOM),SET^%ANA(NORES,2,NORME),SET^%ANA(NORES,3,ID),SET^%ANA(NORES,4,PREMIS),SET^%ANA(NORES,5,CONC)
 G DEPIL^%ANGEPIL
ERRABAQ S RESULT=0
 D KILL^%ANA(NOM),KILL^%ANA(NORME),KILL^%ANA(ID),KILL^%ANA(PREMIS),KILL^%ANA(CONC)
 G DEPIL^%ANGEPIL
 
LISTE 
 
 
 
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LISTC",@TEMPO@(3)="IND",@TEMPO@(4)="NORME",@TEMPO@(5)="PREMIS",@TEMPO@(6)="CONC",@TEMPO@(7)="N",@TEMPO@(8)="L" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,%COMPIL="" D CAR G:ATRONLY=1 SUITL
 G:C'="""" SUITL
 D LEC
 I C="""" D LEC G DEPIL^%ANGEPIL
 S RESULT=0 D M("Un 2eme """" etait attendu")
 G DEPIL^%ANGEPIL
SUITL S L=$$^%QZCHW("$LISTE"),N=$L(L)
 I $E(CH,P,P+N)'=(L_"(") D M("$LISTE( etait attendu") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:N D LEC
 K LISTC S IND=1
BOUCLIST D LEC,EMPIL^%ANGEPIL("LISTE1^%AN29") S %COMPIL=""
 G:ATRONLY ATTRIBUT^%AN3 G EXPRESS^%AN4
LISTE1 G:RESULT=0 ERRLIST S LISTC(IND)=NORES
 D CAR S IND=IND+1 G:C=";" BOUCLIST
 I C'=")" D M("Une ) etait attendue a la fin") G ERRLIST
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=""
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$LISTE")
 F L=1:1:IND-1 D SET^%ANA(NORES,L,LISTC(L))
 G DEPIL^%ANGEPIL
ERRLIST S RESULT=0
 F L=1:1:IND-1 D KILL^%ANA(LISTC(L))
 G DEPIL^%ANGEPIL
 
MESSAG K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="MS"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MESSAGE")) D LEC
 I C'="(" S RESULT=0 D M("Il manque une ""("" ...") G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("MESSAG1^%AN29") G EXPRESS^%AN4
MESSAG1 G:RESULT=0 DEPIL^%ANGEPIL
 S MS=NORES D CAR
 D CAR I C'=")" S RESULT=0 D KILL^%ANA(MS),M("Il manque une "")"" ...") G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,1,MS)
 D SET^%ANA(NORES,"TEXTE","$MESSAGE") G DEPIL^%ANGEPIL

