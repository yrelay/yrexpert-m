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

;TOXMAJFO^INT^1^59547,74877^0
TOXMAJFO ;
 S TIT=$$^%QZCHW("Reformulation des Temps et Couts") D ^TOGETAR2 G:'($D(^TACOMPIL($I))) FIN S NU=-1,DX=0,DY=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S DX=0,DY=6 X XY
LNU S NU=$N(^TACOMPIL($I,NU)) G:NU=-1 FIN S ART=^TACOMPIL($I,NU),PH=-1
LPH S PH=$N(^[QUI]FORMULE(ART,PH)) G:PH=-1 LNU S OP=-1
LOP S OP=$N(^[QUI]FORMULE(ART,PH,OP)) G:OP=-1 LPH S SEC=-1
LSEC S SEC=$N(^[QUI]FORMULE(ART,PH,OP,SEC)) G:SEC=-1 LOP S CD=-1
LCD S CD=$N(^[QUI]FORMULE(ART,PH,OP,SEC,CD)) G:CD=-1 LSEC
 W "." S CH=^[QUI]FORMULE(ART,PH,OP,SEC,CD),FCH=$S($D(^[QUI]FLFORM(ART,PH,OP,SEC,CD)):^[QUI]FLFORM(ART,PH,OP,SEC,CD),1:CH),BL=$P(CH,"^",17),FBL=$P(FCH,"^",17) G LCD:BL=0,LCD:BL'[":"
 S $P(CH,"^",17)=0,$P(FCH,"^",17)=0,^[QUI]FORMULE(ART,PH,OP,SEC,CD)=CH
 S ^[QUI]FLFORM(ART,PH,OP,SEC,CD)=FCH,BLG=$P(BL,"'",2,999),FBLG=$P(FBL,"'",2,999)
 S ^[QUI]AUTREFO(ART,PH,OP,SEC,CD,$$^%QZCHW("TEMPS.SYNTHESE.STANDARD"))="^"_BL,^[QUI]FLAUTRFO(ART,PH,OP,SEC,CD,$$^%QZCHW("TEMPS.SYNTHESE.STANDARD"))="^"_FBL
 S ^[QUI]AUTREFO(ART,PH,OP,SEC,CD,$$^%QZCHW("COUT.OPERATION.UNITAIRE"))=$$^%QZCHW("^COUT.OPERATION.UNITAIRE'")_BLG,^[QUI]FLAUTRFO(ART,PH,OP,SEC,CD,$$^%QZCHW("COUT.OPERATION.UNITAIRE"))=$$^%QZCHW("^COUT.OPERATION.UNITAIRE'")_FBLG
 G LCD
FIN Q

