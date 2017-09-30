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
;! HL002 ! HL     ! 12/07/12 ! Agrandir cadre autour de TOTEM                 !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOTCADRE^INT^1^59547,74876^0
TOTCADRE ;
 
 
 
 
 
 
 
 
CADRE 
 N LINK S LINK=$S($D(^KLNTOT($J)):1,1:0)
 S DYH=0,DYB=4,DXG=1,DXD=13 D CLEPAG^%VVIDEO S DX=0 F DY=0:1:4 X XY D CAG^%VVIDEO
 ;HL002 D ^%AB3CADR S DXG=2,DYH=1,BLD=1,LH=11,LV=2 D CARS^%VVIDEO S DYH=0,DYB=4,DXG=17,DXD=36 D ^%AB3CADR
 D ^%AB3CADR S DXG=2,DYH=1,BLD=1,LH=11,LV=3 D CARS^%VVIDEO S DYH=0,DYB=4,DXG=17,DXD=36 D ^%AB3CADR
 S TEMPO=1000000,DX=3,DY=2,MSG=$S(LINK:" L I N K ",1:"T O T E M")
 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO X XY W MSG D NORM^%VVIDEO S MSG=NUFA D BLD^%VVIDEO S DX=19,DY=1 X XY W MSG D NORM^%VVIDEO S DX=18,DY=2 X XY W "------------------"
 D T1
FIN Q
T1 I ^TOZE($I,"ANIMATION") S DXG=1,DYH=5,BLD=1,LH=74,LV=3 D CARS^%VVIDEO
 Q

