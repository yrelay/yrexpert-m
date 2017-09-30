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

;%AN14^INT^1^59547,73865^0
AN14 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
 
PAGE K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 S NORES=$$NEW^%ANA F I=1:1:$L($$^%QZCHW("$PAGE")) D LEC
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PAGE")
 S %COMPIL=%COMPIL_"S %FONC=""CLEAR"" D ^%PBPZ" G DEPIL^%ANGEPIL
 
 
ETIQ K @(TEMPO) S @TEMPO@(1)="B",@TEMPO@(2)="I",@TEMPO@(3)="OK" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0 F I=1:1:$L($$^%QZCHW("$ETIQUETTE")) D LEC
 D CAR I C'="(" D M("Une ( est necessaire apres $ETIQUETTE ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S B=$$NEW^%ANA
 D SET^%ANA(B,"TYPE","ACTION"),SET^%ANA(B,"TEXTE","$ETIQUETTE"),EMPIL^%ANGEPIL("ETIQ2^%AN14")
 S %COMPIL="" G CHAINE^%AN1
ETIQ2 I RESULT=0 D KILL^%ANA(B) G DEPIL^%ANGEPIL
 D CAR I C'=")" D M("Une ) est necessaire a la fin de $ETIQUETTE ..."),KILL^%ANA(B),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %ETIQ=$$RED^%ANA(NORES,"TEXTE")
 S %COMPIL=";ETIQUETTE" D SET^%ANA(B,1,NORES),LEC S NORES=B G DEPIL^%ANGEPIL
 
 
PLACER K @(TEMPO) S @TEMPO@(1)="VALPLA" D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("PLACERE^%AN14") S VALPLA="" G PLACER^%AN8
PLACERP K @(TEMPO) S @TEMPO@(1)="VALPLA" D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("PLACERE^%AN14") S VALPLA="P" G PLACER^%AN8
PLACERD K @(TEMPO) S @TEMPO@(1)="VALPLA" D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("PLACERE^%AN14") S VALPLA="D" G PLACER^%AN8
PLACERE G DEPIL^%ANGEPIL
 
 
ALIGNER G ALIGNER^%AN8
 
 
FIN K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$FIN")) D LEC
 S %COMPIL=%COMPIL_"S ARRET=1"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$FIN") G DEPIL^%ANGEPIL
 
 
ARRET K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$SORTIR.BOUCLE")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$SORTIR.BOUCLE") G DEPIL^%ANGEPIL
 
 
HALT K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$FIN.TRAITER.LISTE")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$FIN.TRAITER.LISTE") G DEPIL^%ANGEPIL
 
 
ABANDON K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO) S NORES=0 F I=1:1:$L($$^%QZCHW("$ABANDON")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ABANDON") G DEPIL^%ANGEPIL

