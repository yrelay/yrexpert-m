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

;%VMENVID^INT^1^59547,74035^0
GEMENVID ;
 ;;        ensemble de routines permettant d'effectuer des effets
 ;;        videos et d'affecter la variable VID utilisee par ceux-ci,
 ;;        en tenant compte du type d'effets desires
 ;;        utilises par le gestionnaire de menu GEMENUPG
 ;;
 ;;      XG    coord. horiz. limite gauche du cadre d'affichage
 ;;      XD      "      "      "    droite      "        "
 ;;      YH      "    vertic.  "    haute       "        "
 ;;      YB      "      "      "    basse       "        "
 ;;      REVID valeur specifiant le type d'effets video desire
 ;;
 ;;      REVID =
 ;;        0    pas d'effets speciaux
 ;;        1    affichage en inverse video
 ;;        2    affichage en inverse video et en "bold"
 ;;             --------------------------------  
REV12 
 D REV^%VVIDEO
 I REVID=2 D BLD^%VVIDEO
REV1 D CUROF^%VVIDEO S LG=(XD-XG)+1,DX=XG F DY=YH:1:YB X XY W ?$X+LG
 D CURON^%VVIDEO Q
CADR 
 D CARSA^%VVIDEO(XG-1,YH-1,(XD-XG)+3,(YB-YH)+3) Q
VIDEO 
 
 K VID S VID=$P($T(@("VID"_REVID)),";;",2) F %U=1:1 S IT=$P(VID,"#",%U) Q:IT=""  S VID(REVID,$P(IT,"=",1))=$P(IT,"=",2)
 Q
VID0 ;;NORM=NORM^%VVIDEO#BLD=BLD^%VVIDEO#REV=REV^%VVIDEO#REV/BLD=REV^%VVIDEO,BLD^%VVIDEO
VID1 ;;NORM=NORM^%VVIDEO,REV^%VVIDEO#BLD=REV^%VVIDEO,BLD^%VVIDEO#REV=NORM^%VVIDEO#REV/BLD=NORM^%VVIDEO
VID2 ;;NORM=REV^%VVIDEO,BLD^%VVIDEO#BLD=NORM^%VVIDEO#REV=NORM^%VVIDEO,REV^%VVIDEO#REV/BLD=NORM^%VVIDEO

