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

;%AN22^INT^1^59547,73865^0
AN22 ;
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MOYEN 
 K @(TEMPO)
 S @TEMPO@(1)="L",@TEMPO@(2)="NN" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("MOYEN1^%AN22")
 
 S NN=$$^%QZCHW("$MOYENNE"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$MOYENNE",TYPVER="ACTION",PARLIS="EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
MOYEN1 
 S %COMPIL=""
 G DEPIL^%ANGEPIL
 
 
 
ELIM K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="I" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ELIMINER"))+1 D LEC
 D EMPIL^%ANGEPIL("ELIM2^%AN22") G ATTRIBUT^%AN3
ELIM2 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR
 I C'=")" D M("Une "")"" apres l'attribut ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$ELIMINER")
 D SET^%ANA(NORES,1,A1) G DEPIL^%ANGEPIL
 
SUPPR K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="OB",@TEMPO@(3)="L" D EMPV^%ANGEPIL(TEMPO)
 S OB=0
 F I=1:1:$L($$^%QZCHW("$ELIMINER.INDIVIDU")) D LEC
 G:C'="(" FINSUP
 D LEC,EMPIL^%ANGEPIL("SUP1^%AN22") G ATTRIBUT^%AN3
SUP1 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR I C'=")" S RESULT=0 D KILL^%ANA(NORES),M("Il manque un "")"" ...") G DEPIL^%ANGEPIL
 D LEC S OB=NORES
FINSUP S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,1,OB)
 D SET^%ANA(NORES,"TEXTE","$ELIMINER.INDIVIDU") G DEPIL^%ANGEPIL
 
SUBST K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1",@TEMPO@(3)="V2",@TEMPO@(4)="V3" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SUBSTITUER"))+1 D LEC
 D EMPIL^%ANGEPIL("SUBST0^%AN22") G EXPRESS^%AN4
SUBST0 G:RESULT=0 DEPIL^%ANGEPIL S V1=NORES
 D CAR
 I C'=";" D M("Un "";"" apres le 1er argument ..."),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SUBST1^%AN22") G EXPRESS^%AN4
SUBST1 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D CAR S V2=NORES
 I C'=";" D M("Une "";"" apres le 2nd argument ..."),KILL^%ANA(V1),KILL^%ANA(V2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SUBST2^%AN22") G EXPRESS^%AN4
SUBST2 I RESULT=0 D KILL^%ANA(V1),KILL^%ANA(V2) G DEPIL^%ANGEPIL
 D CAR S V3=NORES
 I C'=")" D M("Une "")"" apres le troisieme argument ..."),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SUBSTITUER")
 D SET^%ANA(NORES,1,V1),SET^%ANA(NORES,2,V2),SET^%ANA(NORES,3,V3) G DEPIL^%ANGEPIL
 
AFF K @(TEMPO) S @TEMPO@(1)="RES",@TEMPO@(2)="NN",@TEMPO@(3)="L",@TEMPO@(4)="NAF",@TEMPO@(5)="A2",@TEMPO@(6)="%COMP22",@TEMPO@(7)="%COMP23",@TEMPO@(8)="%COMP24"
 D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("AFF0^%AN22"),CAR
 G:C="$" OBJET^%AN1
 S %COMP22=%COMPIL,%COMPIL=""
 G:NOCOMPIL=0 VARTEMP^%AN3
 G ATTRIBUT^%AN3
AFF0 G:RESULT=0 DEPIL^%ANGEPIL S NAF=NORES
 D CAR
 I C'="=" D KILL^%ANA(NAF),M("Un signe ""="" apres l'attribut ...") S RESULT=0 G DEPIL^%ANGEPIL
 G:NOCOMPIL AFF01
 S %COMP23=$P(%COMPIL,"(",2),%COMP23=$E(%COMP23,1,$L(%COMP23)-1)
 S %COMP24=$P(%COMP23,",",2)
 S %COMP23=$P(%COMP23,",") S:%COMP24="""""" %COMP24=1
 S %COMPIL=%COMP22_"^V($J,""%"","_%COMP23_","_%COMP24_")="
AFF01 D LEC,EMPIL^%ANGEPIL("AFF1^%AN22") G EXPRESS^%AN4
AFF1 I RESULT=0 D KILL^%ANA(NAF) G DEPIL^%ANGEPIL
 S A2=NORES,NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","AFFECTATION")
 D SET^%ANA(NORES,1,NAF)
 D SET^%ANA(NORES,2,A2) G DEPIL^%ANGEPIL
 
LATT K @(TEMPO) S @TEMPO@(1)="N",@TEMPO@(2)="OK",@TEMPO@(3)="OTOP",@TEMPO@(4)="TOP" D EMPV^%ANGEPIL(TEMPO) S TOP=0
BLATT D EMPIL^%ANGEPIL("BLATT1^%AN22") G ATTRIBUT^%AN3
BLATT1 I RESULT=0 D KILL^%ANA(NORES) G DEPIL^%ANGEPIL
 S OTOP=TOP,TOP=$$NEW^%ANA
 D SET^%ANA(TOP,"TYPE","LISTE.ATTRIBUTS")
 D SET^%ANA(TOP,1,NORES)
 D SET^%ANA(TOP,2,OTOP)
 D CAR S OK=(C=";")!(C=")") I '(OK) D M("Un "";"" pour separer deux attributs ..."),KILL^%ANA(TOP) S RESULT=0 G DEPIL^%ANGEPIL
 I C'=")" D LEC G BLATT
FATT S NORES=TOP G DEPIL^%ANGEPIL

