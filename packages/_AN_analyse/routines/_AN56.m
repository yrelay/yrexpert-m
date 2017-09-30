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

;%AN56^INT^1^59547,73866^0
AN56 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
POURC 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2,A3)=0
 F I=1:1:$L($$^%QZCHW("$POURCENT"))+1 D LEC
 D EMPIL^%ANGEPIL("POURC1^%AN56") G EXPRESS^%AN4
POURC1 G:RESULT=0 DEPIL^%ANGEPIL
 S A1=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERPOU
 D LEC,EMPIL^%ANGEPIL("POURC2^%AN56") G EXPRESS^%AN4
POURC2 I RESULT=0 G ERPOU
 S A2=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERPOU
 D LEC,EMPIL^%ANGEPIL("POURC3^%AN56") G NOMBRE^%AN1
 
POURC3 I RESULT=0 G ERPOU
 S A3=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERPOU
 
FPOURC D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION.LOGIQUE"),SET^%ANA(NORES,"TEXTE","$POURCENT"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 G DEPIL^%ANGEPIL
 
ERPOU D KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
CRESYN 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2,A3)=0
 F I=1:1:$L($$^%QZCHW("$CREER.SYNONYME")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $CREER.SYNONYME") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SYNO1^%AN56") G EXPRESS^%AN4
SYNO1 G:RESULT=0 DEPIL^%ANGEPIL
 S A1=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERSYN
 D LEC,EMPIL^%ANGEPIL("SYNO2^%AN56") G EXPRESS^%AN4
SYNO2 I RESULT=0 G ERSYN
 S A2=NORES
 D CAR
 G:C=")" FSYNO
 I C'=";" D M("Un "";"" ou une "")"" etait attendu ...") G ERSYN
 D LEC,EMPIL^%ANGEPIL("SYNO3^%AN56") G EXPRESS^%AN4
SYNO3 I RESULT=0 G ERSYN
 S A3=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERSYN
 
FSYNO D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION.LOGIQUE"),SET^%ANA(NORES,"TEXTE","$CREER.SYNONYME")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 G DEPIL^%ANGEPIL
 
ERSYN D KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
SYN 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2",@TEMPO@(6)="%COMP3"
 D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2)=0
 F I=1:1:$L($$^%QZCHW("$SYNONYME")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $SYNONYME") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("SYN1^%AN56") G EXPRESS^%AN4
SYN1 G:RESULT=0 DEPIL^%ANGEPIL
 S A1=NORES
 S %COMP2=%COMPIL
 D CAR
 I C=")" S %COMP3="" G FSYN
 I C'=";" D M("Un "";"" ou une "")"" etait attendu ...") G ERRS
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("SYN2^%AN56") G EXPRESS^%AN4
SYN2 I RESULT=0 G ERRS
 S A2=NORES,%COMP3=%COMPIL
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRS
 
FSYN D LEC
 S NORES=$$NEW^%ANA
 S %COMPIL=%COMP1_$S(%COMP3="":"$$S^%QAX("_%COMP2,1:"$$SC^%QAX("_%COMP2_","_%COMP3)_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SYNONYME")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2)
 G DEPIL^%ANGEPIL
 
ERRS D KILL^%ANA(A1),KILL^%ANA(A2)
 S RESULT=0 G DEPIL^%ANGEPIL

