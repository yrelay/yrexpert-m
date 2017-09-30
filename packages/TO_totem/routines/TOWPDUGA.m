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

;TOWPDUGA^INT^1^59547,74876^0
TOWPDUGA ;
 S %AJCMS=""
 K ^GAMADUP($I) S NB=0
LOOP S CMS=0,SCR="DUPGAM"
 D CLEPAG^%VVIDEO,B^%VACTISC G FS:ABENDSCR=1
 F IC=5:1:8 D ACCEPT^TOWUCONT I REFUSE=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("IMPOSSIBLE...") H 2 G LOOP
 S LIM=3 I (RESUL(8)[",")!(RESUL(8)["-") S LIM=2
 S %TAB="^[QUI]OCGRIL(""GAMLAC""" F C=5:1:5+LIM Q:RESUL(C)=""  S %TAB=%TAB_","""_RESUL(C)_""""
 S %TAB=%TAB_")" I $D(@%TAB) D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Ce schema existe , desirez-vous le remplacer (O/N) ? ") R *REMP G:REMP=79 SUIT G LOOP
SUIT D POCLEPA^%VVIDEO W $$^%QZCHW("Confirmez-vous cette duplication (O/N) ? ") R *CONF G:CONF'=79 LOOP D POCLEPA^%VVIDEO
 S NB=NB+1,GMD="" F EL=1:1:8 S GMD=GMD_RESUL(EL)_"^"
 S ^GAMADUP($I,NB)=GMD K GMD
 B
FS S DX=0,DY=23 X XY U 0
 W $$^%QZCHW("Fin de saisie : F") R *F S F=$C(F) G:F'="F" LOOP S NBDUP=NB I $D(^GAMADUP($I)) D ^TOWDUPGA
FIN K ^GAMADUP($I),REMP,CONF,C,%TAB,CMS,%AJCMS,SCR,F,NB,EL Q

