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

;%QFECRAN^INT^1^59547,73875^0
GRECRAN ;
ENTETE D CLEPAG^%VVIDEO S DX=0,DY=0 X XY
 S CAG=1 D ^%VZCDB(@CUSTOM1@("TITRE"),0) S DX=0,DY=1 D CLEBAS^%VVIDEO Q
GDVID D EFCADR S COTE="D",BLD=0 D CADRG S BLD=1 D CADRD S DX=1,DY=2 X XY W %NINDS D BLD^%VVIDEO S DX=41,DY=2 X XY W %NGROS D NORM^%VVIDEO Q
DGVID D EFCADR S COTE="G",BLD=0 D CADRD S BLD=1 D CADRG S DX=41,DY=2 X XY W %NGROS D BLD^%VVIDEO S DX=1,DY=2 X XY W %NINDS D NORM^%VVIDEO Q
CADRE D EFCADR,CADRG,CADRD S STR=^ATTR($J,"O",ATAF) D SMLCAS S DX=1,DY=2 X XY W %NINDS W:^ATTR($J,"O",ATAF)'="" " (",STR,")"
 S STR=ATAFG D SMLCAS S DX=41,DY=2 X XY W %NGROS," (",STR,")" Q
AFFGD S DX=0,DY=2 D CLEBAS^%VVIDEO,CADRE,APG^%QFPAG,APD^%QFPAG Q
SMLCAS Q:STR=""  S STR1="" F I=1:1:$L(STR) S ASCII=$A($E(STR,I)) S:(ASCII<91)&(ASCII>64) ASCII=ASCII+32 S STR1=STR1_$C(ASCII)
 S STR=STR1 Q
CADRG I AFFLIST=0 G CADRGL
 I ZOOM G CADRGZ
 I COTE="G" S BLD=1,DXG=0,DYH=4,LH=41,LV=19 D CARS^%VVIDEO S BLD=0 Q
 S DXG=1,DYH=5,LH=39,LV=17 D CARS^%VVIDEO Q
CADRGZ I COTE="G" S BLD=0,DXG=0,DXD=40,DYH=4,DYB=22 D CARL^%VVIDEO,REV^%VVIDEO S DX=1,DY=4 X XY W "Zoom ",GROZOOM D NORM^%VVIDEO Q
 S DXG=1,DXD=39,DYH=5,DYB=21 D CARL^%VVIDEO,REV^%VVIDEO S DX=2,DY=5 X XY W "Zoom ",GROZOOM D NORM^%VVIDEO Q
CADRGL I COTE="G" S BLD=0,DXG=0,DXD=40,DYH=4,DYB=22 D CARL^%VVIDEO,REV^%VVIDEO S DX=1,DY=4 X XY W %NINDS," sans affectation" D NORM^%VVIDEO Q
 S DXG=1,DXD=39,DYH=5,DYB=21 D CARL^%VVIDEO,REV^%VVIDEO S DX=2,DY=5 X XY W %NINDS," sans affectation" D NORM^%VVIDEO Q
CADRD I COTE="D" S DXG=40,DYH=4,LV=19,LH=40,BLD=1 D CARS^%VVIDEO S BLD=0 Q
 S DXG=41,DYH=5,LV=17,LH=38 D CARS^%VVIDEO Q
EFCADR D CUROF^%VVIDEO S DX=0,DY=4 X XY W "                                                                                "
 S DX=0,DY=5 X XY W "                                                                                "
 F DY=6:1:20 S DX=0 X XY W "  " S DX=39 X XY W "   " S DX=78 X XY W "  "
 S DX=0,DY=21 X XY W "                                                                                "
 S DX=0,DY=22 X XY W "                                                                                "
 D CURON^%VVIDEO Q
BLANC S BLANC="" F BLI=1:1:NBL S BLANC=BLANC_" "
 Q
SCREESH D CLEPAG^%VVIDEO,ENTETE,AFFGD Q

