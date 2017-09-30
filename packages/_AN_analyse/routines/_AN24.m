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

;%AN24^INT^1^59547,73865^0
AN24 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
POUR K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="A3",@TEMPO@(4)="I",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2",@TEMPO@(7)="%COMP6",@TEMPO@(8)="%COMP4"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$POUR")) D LEC
 D CAR I C'="(" D M("Une ( est necessaire apres $POUR ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP6=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("POUR2^%AN24") S A1=NORES G ATTRIBUT^%AN3
POUR2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(A1),KILL^%ANA(NORES) G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("POUR3^%AN24") S A2=NORES G CHAINE^%AN1
POUR3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 D CAR I C'=")" D M("Une "")"" etait attendue..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=$$RED^%ANA(NORES,"TEXTE"),%COMP4=$P(%COMP2,"(",2),%COMP4=$P(%COMP4,",",1),%COMP2=$P(%COMP2,",",4)
 S %COMPIL=%COMP6_"D ^%EDCPOUR("_%COMP4_","_%COMP2_","""_%COMPIL_""")"
 S A3=NORES,NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$POUR"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 D LEC G DEPIL^%ANGEPIL
 
POURVAL K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="A3",@TEMPO@(4)="I",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2",@TEMPO@(7)="%COMP6",@TEMPO@(8)="%COMP4",@TEMPO@(9)="%COMP10",@TEMPO@(10)="A4"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$PARCOURIR.VALEURS")) D LEC
 D CAR I C'="(" D M("Une ( est necessaire apres $PARCOURIR.VALEURS ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP6=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("POURVAL1^%AN24") S PP=P G VARTEMP^%AN3
POURVAL1 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=""""_$$RED^%ANA(NORES,"TEXTE")_""""
 S A1=NORES
 D LEC,EMPIL^%ANGEPIL("POURV11^%AN24") S PP=P G VARTEMP^%AN3
POURV11 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP10=""""_$$RED^%ANA(NORES,"TEXTE")_"""",%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("POURVAL2^%AN24") S A2=NORES G ATTRIBUT^%AN3
POURVAL2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(A1),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("POURVAL3^%AN24") S A3=NORES G CHAINE^%AN1
POURVAL3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 D CAR I C'=")" D M("Une "")"" etait attendue..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=$$RED^%ANA(NORES,"TEXTE"),%COMP4=$P(%COMP2,"(",2),%COMP4=$P(%COMP4,",",1),%COMP2=$P(%COMP2,",",4)
 S %COMPIL=%COMP6_"D ^%EDCPOUV("_%COMP4_","_%COMP2_","""_%COMPIL_""","_%COMP1_","_%COMP10_")"
 S A4=NORES,NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PARCOURIR.VALEURS"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3),SET^%ANA(NORES,4,A4)
 D LEC G DEPIL^%ANGEPIL

