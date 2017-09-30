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

;%AN32^INT^1^59547,73865^0
%AN32 ;
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
ARCTG 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ARCTG")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ARCTG") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ARC1^%AN32") G EXPRESS^%AN4
ARC1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$ARCTG"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $ARCTG"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ARCTG")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
TANG 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TG")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $TG") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TG1^%AN32") G EXPRESS^%AN4
TG1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$TG"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $TG"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$TG")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
EXP 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$EXP")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $EXP") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("EXP1^%AN32") G EXPRESS^%AN4
EXP1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$EXP"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $EXP"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$EXP")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
SQR 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SQR")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $SQR") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SQR1^%AN32") G EXPRESS^%AN4
SQR1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$SQR"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $SQR"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SQR")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
SQ 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SQ")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $SQ") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SQ1^%AN32") G EXPRESS^%AN4
SQ1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$SQ"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $SQ"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SQ")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
PUIS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="N2",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$PUIS")) D LEC
 S %COMP1=%COMPIL,%COMPIL="",%COMP2=""
 D CAR I C'="(" D M("Une ( etait attendue apres $PUIS") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("PUI1^%AN32") G EXPRESS^%AN4
PUI1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR I C'=";" D M("Un ; etait attendu entre deux arguments"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("PUI2^%AN32") G EXPRESS^%AN4
PUI2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S N2=NORES
 D CAR
FPUI I C'=")" D M("Une ) etait attendue a la fin de $PUIS"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$PUIS"",("_%COMP2_")_""/""_("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$PUIS")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,N2)
 G DEPIL^%ANGEPIL
 
CHRONO 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="N2",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$CHRONOMETRE")) D LEC
 S %COMP1=%COMPIL,%COMPIL="",%COMP2=""
 D CAR I C'="(" D M("Une ( etait attendue apres $CHRONOMETRE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CHRONO1^%AN32") G EXPRESS^%AN4
CHRONO1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR I C'=";" D M("Un ; etait attendu entre deux arguments"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CHRONO2^%AN32") G EXPRESS^%AN4
CHRONO2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S N2=NORES
 D CAR
FCHRON I C'=")" D M("Une ) etait attendue a la fin de $CHRONOMETRE"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFON(""$CHRONOMETRE"",""^%QMDACHR"",""ENT^%TLCAFON/""_("_%COMP2_")_""/""_("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$CHRONOMETRE")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,N2)
 G DEPIL^%ANGEPIL

