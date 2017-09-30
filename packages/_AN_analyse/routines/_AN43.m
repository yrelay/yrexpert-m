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

;%AN43^INT^1^59547,73865^0
%AN43 ;
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
MESDMD 
 D M($$^%QZCHW("L'action $DMD a ete remplacee par $DEMANDER"))
 S RESULT=0
 G RET^%ANGEPIL
 
 
TOTAL 
 K @(TEMPO)
 S @TEMPO@(1)="L",@TEMPO@(2)="NN" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("TOTAL1^%AN43")
 
 S NN=$$^%QZCHW("$TOTALISER"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$TOTALISER",TYPVER="ACTION",PARLIS="EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
TOTAL1 
 S %COMPIL=""
 G DEPIL^%ANGEPIL
 
 
 
SOMME 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(2)="A2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SOMME"))+1 D LEC
 D EMPIL^%ANGEPIL("SOMME1^%AN43") G ATTRIBUT^%AN3
SOMME1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M("Un "";"" apres l'attribut ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SOMME2^%AN43") G ATTRIBUT^%AN3
SOMME2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES
 D CAR I C'=")" D M("Une "")"" apres l'attribut ...") S RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$SOMME")
 D SET^%ANA(NORES,1,A1)
 D SET^%ANA(NORES,2,A2) G DEPIL^%ANGEPIL
 
 
 
ITEATT K @(TEMPO)
 S @TEMPO@(1)="VNOM",@TEMPO@(2)="VVAL",@TEMPO@(3)="VIND",@TEMPO@(4)="NIND"
 S @TEMPO@(5)="NETIQ",@TEMPO@(6)="%COMP1",@TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP30",@TEMPO@(9)="%COMP4",@TEMPO@(10)="%COMP5",@TEMPO@(11)="%COMP6",@TEMPO@(12)="%COMP7"
 D EMPV^%ANGEPIL(TEMPO)
 K @(TEMPO)
 F I=1:1:$L($$^%QZCHW("$AUSCULTER"))+1 D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 S (VNOM,VVAL,VIND,NIND,NETIQ)=0
 S (%COMP2,%COMP30,%COMP4,%COMP5,%COMP6,%COMP7)=""
 D EMPIL^%ANGEPIL("ITEATT1^%AN43") G VARTEMP^%AN3
ITEATT1 G:RESULT=0 ERITEATT
 S %COMP2=""""_$$RED^%ANA(NORES,"TEXTE")_""""
 S VNOM=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERITEATT
 D LEC,EMPIL^%ANGEPIL("ITEATT2^%AN43") G VARTEMP^%AN3
ITEATT2 G:RESULT=0 ERITEATT
 S %COMP30=""""_$$RED^%ANA(NORES,"TEXTE")_""""
 S VVAL=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERITEATT
 D LEC,EMPIL^%ANGEPIL("ITEATT3^%AN43") G VARTEMP^%AN3
ITEATT3 G:RESULT=0 ERITEATT
 S %COMP4=""""_$$RED^%ANA(NORES,"TEXTE")_"""",%COMPIL=""
 S VIND=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERITEATT
 D LEC G:C=";" ITEATT5
 D EMPIL^%ANGEPIL("ITEATT4^%AN43") G ATTRIBUT^%AN3
ITEATT4 G:RESULT=0 ERITEATT
 S %COMP5=$$RED^%ANA(NORES,1),%COMP5=$$RED^%ANA(%COMP5,"TEXTE")
 S %COMP6=$$RED^%ANA(NORES,3),%COMP6=$$RED^%ANA(%COMP6,"TEXTE")
 S %COMPIL=""
 S NIND=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERITEATT
ITEATT5 D LEC,EMPIL^%ANGEPIL("ITEATT6^%AN43") G EXPRESS^%AN4
ITEATT6 G:RESULT=0 ERITEATT
 S %COMP7=%COMPIL
 S NETIQ=NORES
 D CAR I C'=")" D M("Une ) etait attendue") G ERITEATT
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$AUSCULTER")
 D SET^%ANA(NORES,1,VNOM),SET^%ANA(NORES,2,VVAL),SET^%ANA(NORES,3,VIND)
 D SET^%ANA(NORES,4,NIND),SET^%ANA(NORES,5,NETIQ)
 S %COMPIL=%COMP1_"D ^%EDCAUSC("""_%COMP5_""","""_%COMP6_""","_%COMP7_","_%COMP2_","_%COMP30_","_%COMP4_")"
 G DEPIL^%ANGEPIL
ERITEATT S RESULT=0
 D KILL^%ANA(VNOM),KILL^%ANA(VVAL),KILL^%ANA(VIND),KILL^%ANA(NIND)
 D KILL^%ANA(NETIQ) G DEPIL^%ANGEPIL

