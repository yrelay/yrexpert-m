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

;%AN27^INT^1^59547,73865^0
%AN27 ;
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
CREERL 
 K @(TEMPO) S @TEMPO@(1)="VAR1",@TEMPO@(2)="CAR1",@TEMPO@(3)="CAR2",@TEMPO@(4)="I",@TEMPO@(5)="CLE",@TEMPO@(6)="LG",@TEMPO@(7)="CAR"
 F I=1:1:$L($$^%QZCHW("$CREERL")) D LEC
 D CAR I C'="(" D M(" Une ""("" etait attendue apres $CREERL ") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CR1^%AN27") G VARTEMP^%AN3
CR1 G:RESULT=0 DEPIL^%ANGEPIL S VAR1=NORES
 D CAR I C'=";" D M(" Un "";"" apres la variable..."),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CR2^%AN27") G CHAINE^%AN1
CR2 G:RESULT=0 DEPIL^%ANGEPIL S CAR1=NORES
 D CAR I C'=";" D M(" Un "";"" apres cette chaine de caractere..."),KILL^%ANA(CAR1),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC,EMPIL^%ANGEPIL("CR3^%AN27") G EXPRESS^%AN4
CR3 G:RESULT=0 DEPIL^%ANGEPIL S CAR2=NORES
 
 
 
 D CAR I C'=")" D M(" Une "")"" etait attendue a la fin de $CREERL"),KILL^%ANA(VAR1),KILL^%ANA(CAR1),KILL^%ANA(CAR2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CREERL"),SET^%ANA(NORES,1,VAR1),SET^%ANA(NORES,2,CAR1),SET^%ANA(NORES,3,CAR2)
 G DEPIL^%ANGEPIL
 
ELIML 
 N PAR K @(TEMPO) S @TEMPO@(1)="VAR1",@TEMPO@(2)="I" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ELIMINERL"))+1 D LEC
 D EMPIL^%ANGEPIL("SUP1^%AN27")
 G EXPRESS^%AN4
SUP1 G:RESULT=0 DEPIL^%ANGEPIL S VAR1=NORES
 D CAR I C'=")" D M("Une "")"" etait attendue a la fin de $ELIMINERL"),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$ELIMINERL")
 D SET^%ANA(NORES,1,VAR1)
 G DEPIL^%ANGEPIL
 
AJINDL 
 N PAR K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="VAR1",@TEMPO@(3)="CAR1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$AJOUTERL"))+1 D LEC
 S CAR1=0 D EMPIL^%ANGEPIL("AJ1^%AN27")
 G EXPRESS^%AN4
AJ1 G:RESULT=0 DEPIL^%ANGEPIL S VAR1=NORES
 D CAR
 G:C=")" FINAJ
 I C'=";" D M(" Un "";""... ou une "")"" comme fin de $AJOUTERL"),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("AJ2^%AN27"),LEC G EXPRESS^%AN4
AJ2 G:RESULT=0 DEPIL^%ANGEPIL S CAR1=NORES
 D CAR I C'=")" D M(" Une "")"" etait attendue a la fin de $AJOUTERL"),KILL^%ANA(CAR1),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
FINAJ D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$AJOUTERL"),SET^%ANA(NORES,1,VAR1),SET^%ANA(NORES,2,CAR1)
 G DEPIL^%ANGEPIL
 
SUPINDL 
 N PAR K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="VAR1",@TEMPO@(3)="CAR1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$RETIRERL"))+1 D LEC
 S CAR1=0 D EMPIL^%ANGEPIL("SUPI1^%AN27")
 G EXPRESS^%AN4
SUPI1 G:RESULT=0 DEPIL^%ANGEPIL S VAR1=NORES
 D CAR G:C=")" FINSI I C'=";" D M(" Un "";""... ou une "")"" comme fin de $RETIRERL "),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("SUPI2^%AN27"),LEC
 G EXPRESS^%AN4
SUPI2 G:RESULT=0 DEPIL^%ANGEPIL S CAR1=NORES
 D CAR I C'=")" D M(" Une "")"" etait attendue a la fin de $RETIRERL"),KILL^%ANA(CAR1),KILL^%ANA(VAR1) S RESULT=0 G DEPIL^%ANGEPIL
FINSI D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$RETIRERL"),SET^%ANA(NORES,1,VAR1),SET^%ANA(NORES,2,CAR1)
 G DEPIL^%ANGEPIL

