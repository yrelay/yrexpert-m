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

;%AN49^INT^1^59547,73865^0
AN49 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
ARCOTG 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ARCOTG")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ARCOTG") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ACTG1^%AN49") G EXPRESS^%AN4
ACTG1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$ARCOTG"",("_%COMPIL_"))"
 I C'=")" D M("Une ) etait attendue a la fin de $ARCOTG"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ARCOTG")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
ABS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ABS")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ABS") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ABS1^%AN49") G EXPRESS^%AN4
ABS1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$ABS"",("_%COMPIL_"))"
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $ABS"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ABS")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
LOGN 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$LN")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $LOGN") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LOGN1^%AN49") G EXPRESS^%AN4
LOGN1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$LN"",("_%COMPIL_"))"
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $LOGN"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$LN")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
LOG 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N1",@TEMPO@(3)="N2",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$LOG")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $LOG") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("LOG1^%AN49") G EXPRESS^%AN4
LOG1 G:RESULT=0 DEPIL^%ANGEPIL
 S N1=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un ; etait attendu apres la 1ere expression"),KILL^%ANA(N1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LOG2^%AN49") G EXPRESS^%AN4
LOG2 I RESULT=0 D KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S N2=NORES D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $LOG"),KILL^%ANA(N1),KILL^%ANA(N2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$LOG"",("_%COMP2_")_""/""_("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$LOG")
 D SET^%ANA(NORES,1,N1),SET^%ANA(NORES,2,N2)
 G DEPIL^%ANGEPIL
 
DEJAL 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N1"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$DEJALONNER")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $DEJALONNER") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DEJAL1^%AN49") G EXPRESS^%AN4
DEJAL1 G:RESULT=0 DEPIL^%ANGEPIL
 S N1=NORES
 I C'=")" D M("Une ) etait attendue a la fin de $DEJALONNER"),KILL^%ANA(N1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$DEJALONNER")
 D SET^%ANA(NORES,1,N1)
 G DEPIL^%ANGEPIL
 ;

