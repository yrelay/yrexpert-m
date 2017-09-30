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

;%AN46^INT^1^59547,73865^0
AN46 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
NOTE K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3",@TEMPO@(5)="A4",@TEMPO@(6)="A5",@TEMPO@(7)="A6",@TEMPO@(8)="A7",@TEMPO@(9)="A8",@TEMPO@(21)="A9",@TEMPO@(22)="A10",@TEMPO@(23)="PARAM"
 S @TEMPO@(10)="%COMP1",@TEMPO@(11)="%COMP2",@TEMPO@(12)="%COMP3",@TEMPO@(13)="%COMP4",@TEMPO@(14)="%COMP5",@TEMPO@(15)="%COMP6",@TEMPO@(16)="%COMP7",@TEMPO@(17)="%COMP8",@TEMPO@(18)="%COMP9",@TEMPO@(19)="%COMP10",@TEMPO@(20)="%COMP11"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$IMPRIMER.NOTE"))+1 D LEC
NOTE1 S %COMP1=%COMPIL,%COMPIL="",(A1,A2,A3,A4,A5,A6,A7,A8,A9,A10)=0
 S %COMP2="""""",%COMP3="",%COMP4="""""",%COMP5="",%COMP6="""""",%COMP7=1
 S %COMP8="",%COMP9="",%COMP10=0,%COMP11=0
 I C=";" D LEC G NOT
IND D EMPIL^%ANGEPIL("INR^%AN46") G IDF2^%AN3
INR G:RESULT=0 ERR
 S %COMP2=""""_%COMPIL_"""",A1=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
NOT D EMPIL^%ANGEPIL("NOTR^%AN46") G EXPRESS^%AN4
NOTR G:RESULT=0 ERR
 S %COMP3=$S(%COMPIL["""NOTE""":"""""",1:%COMPIL)
 S A2=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
INDNOT I C=";" D LEC G SAUT
 D EMPIL^%ANGEPIL("INDNOTR^%AN46") G EXPRESS^%AN4
INDNOTR G:RESULT=0 ERR
 S %COMP4=%COMPIL,A3=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
SAUT D EMPIL^%ANGEPIL("SAUTR^%AN46") G EXPRESS^%AN4
SAUTR G:RESULT=0 ERR
 S %COMP5=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A4=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
LARG I C=";" D LEC G CAD
 D EMPIL^%ANGEPIL("LARGR^%AN46") G EXPRESS^%AN4
LARGR G:RESULT=0 ERR
 S %COMP6=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A5=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
CAD I C=";" D LEC G COX
 D EMPIL^%ANGEPIL("CADR^%AN46") G BOOL^%AN20
CADR G:RESULT=0 ERR
 S %COMP7=%COMPIL,A6=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
COX I C=";" D LEC G COY
 D EMPIL^%ANGEPIL("COXR^%AN46") G EXPRESS^%AN4
COXR G:RESULT=0 ERR
 S %COMP8=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A7=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
COY I C=";" D LEC G IMPIND
 D EMPIL^%ANGEPIL("COYR^%AN46") G EXPRESS^%AN4
COYR G:RESULT=0 ERR
 S %COMP9=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A8=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
IMPIND I C=";" D LEC G IMPTIT
 D EMPIL^%ANGEPIL("IMPINDR^%AN46") G BOOL^%AN20
IMPINDR G:RESULT=0 ERR
 S %COMP10=%COMPIL,A9=NORES,%COMPIL=""
 D CAR I C'=";" D M("un "";"" etait attendu") S RESULT=0 G ERR
 D LEC
 
IMPTIT G:C=")" FINMOD
 D EMPIL^%ANGEPIL("IMPTITR^%AN46") G BOOL^%AN20
IMPTITR G:RESULT=0 ERR
 S %COMP11=%COMPIL,A10=NORES,%COMPIL=""
 D CAR I C'=")" D M("une "")"" etait attendue") S RESULT=0 G ERR
 
FINMOD D LEC
 S %COMPIL=""
 G:CH["$ENCOMBREMENT.NOTE" ENCOMBR1
 S:%COMP8'="" %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP8_" "
 S:%COMP9'="" %COMPIL=%COMPIL_"S ^V($J,""%"",""%Y"",1)="_%COMP9_" "
 S %COMPIL=%COMP1_%COMPIL_"D COOR^%EDCENVL,^%EDCNOTB("_%COMP2_","_%COMP3_","_%COMP4_","_%COMP5_","_%COMP6_","_%COMP7_","_%COMP10_","_%COMP11_",1,"""","""")"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$IMPRIMER.NOTE")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 D SET^%ANA(NORES,4,A4),SET^%ANA(NORES,5,A5),SET^%ANA(NORES,6,A6)
 D SET^%ANA(NORES,7,A7),SET^%ANA(NORES,8,A8),SET^%ANA(NORES,9,A9)
 D SET^%ANA(NORES,10,A10)
 K ^TEMPORAI($J,$P($ZPOS,"^",2)) G DEPIL^%ANGEPIL
 
ERR F I="A1","A2","A3","A4","A5","A6","A7","A8","A9","A10" D KILL^%ANA(I)
 K ^TEMPORAI($J,$P($ZPOS,"^",2))
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
ENCOMBR K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3",@TEMPO@(5)="A4",@TEMPO@(6)="A5",@TEMPO@(7)="A6",@TEMPO@(8)="A7",@TEMPO@(9)="A8",@TEMPO@(21)="A9",@TEMPO@(22)="A10",@TEMPO@(23)="PARAM"
 S @TEMPO@(10)="%COMP1",@TEMPO@(11)="%COMP2",@TEMPO@(12)="%COMP3",@TEMPO@(13)="%COMP4",@TEMPO@(14)="%COMP5",@TEMPO@(15)="%COMP6",@TEMPO@(16)="%COMP7",@TEMPO@(17)="%COMP8",@TEMPO@(18)="%COMP9",@TEMPO@(19)="%COMP10",@TEMPO@(20)="%COMP11"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ENCOMBREMENT.NOTE"))+1 D LEC
 G NOTE1
ENCOMBR1 
 S:%COMP8="" %COMP8=""""""
 S:%COMP9="" %COMP9=""""""
 S %COMPIL=%COMP1_"$$^%EDCNOTB("_%COMP2_","_%COMP3_","_%COMP4_","_%COMP5_","_%COMP6_","_%COMP7_","_%COMP10_","_%COMP11_",0,"_%COMP8_","_%COMP9_")"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ENCOMBREMENT.NOTE")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 D SET^%ANA(NORES,4,A4),SET^%ANA(NORES,5,A5),SET^%ANA(NORES,6,A6)
 D SET^%ANA(NORES,7,A7),SET^%ANA(NORES,8,A8),SET^%ANA(NORES,9,A9)
 D SET^%ANA(NORES,10,A10)
 K ^TEMPORAI($J,$P($ZPOS,"^",2)) G DEPIL^%ANGEPIL

