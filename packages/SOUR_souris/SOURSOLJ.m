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

;SOURSOLJ^INT^1^59547,74869^0
SOURSOLJ ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Solutions des jeux") D TO4^%VZCD,POCLEPA^%VVIDEO W $$^%QZCHW("Mot de passe ? ") S B="GRENOBLE" D ^PASS2 G:B["?" END
DEB S DX=0,DY=6 D CLEBAS^%VVIDEO K %JEU S DX=0,DY=8 X XY F %U=1:1 S LI=$P($T(JEU+%U),";;",2) Q:LI="*"  W !,?10,$S(%U<10:" ",1:""),%U,"   ",LI S %JEU(%U)=1
CH D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix : ") S DX=$X D ^%VLEC G:Y1="" END G:'($D(%JEU(Y1))) CH S %J=Y1,DX=0,DY=6 D CLEBAS^%VVIDEO
 K ^PAGE($I) S SOL="SOL"_%J,PG=1,LIM=21,LI=8 F %U=0:1 S LIG=$P($T(@SOL+%U),";;",2) Q:LIG="*"  S ^PAGE($I,PG,LI)=LIG,LI=LI+1 I LI>LIM S PG=PG+1,LI=8
 S NBPG=$S($D(^PAGE($I,PG)):PG,1:PG-1),PG=1 D AFF
QU D POCLEPA^%VVIDEO W $$^%QZCHW("+,-,page,(CTRLA)Abandon ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" QU G PL:Y1="+",PL:Y1="=",MS:Y1="-" G:'($D(^PAGE($I,Y1))) QU S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
FIN G DEB
END K ^PAGE($I),DXG,DXD,DYH,DYB,GRAPH,MSG,NPG,NBPG,PG,LI,LIM,%U,Y1 Q
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=6,MSG=$$^%QZCHW("Page ")_PG_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG S LI=-1 F %U=1:1 S LI=$N(^PAGE($I,PG,LI)) Q:LI=-1  S DY=LI,DX=5 X XY W ^PAGE($I,PG,LI)
 Q
JEU ;;
 ;;La pyramide
 ;;La chicane
 ;;*
SOL1 ;;1  Si DIRECTION.SOURIS=NORD
 ;;      alors PROCHAINE.DIRECTION=EST
 ;;
 ;;2  Si DIRECTION.SOURIS=EST et OBSTACLE.EST=0 et OBSTACLE.SUD=1
 ;;      alors PROCHAINE.DIRECTION=EST
 ;;
 ;;3  Si DIRECTION.SOURIS=SUD
 ;;   alors PROCHAINE.DIRECTION=EST
 ;;
 ;;4  Si DIRECTION.SOURIS=EST et OBSTACLE.EST=0 et OBSTACLE.SUD=0
 ;;      alors PROCHAINE.DIRECTION=SUD
 ;;*
SOL2 ;;1  INTENSITE.FLAIR.MAXI=$MAX(FL.NORD;FL.SUD;FL.EST;FL.OUEST)
 ;;
 ;;2  FLAIR.MAXI=$FLAIRMAX(FL.NORD;FL.SUD;FL.EST;FL.OUEST)
 ;;
 ;;3  Si INT.FL.MAX=0 et OBSTACLE.EST=1
 ;;      alors PROCHAINE.DIRECTION=NORD
 ;;
 ;;4  Si INT.FL.MAX=0 et OBSTACLE.EST=0
 ;;      alors PROCHAINE.DIRECTION=EST
 ;;
 ;;5  Si INT.FL.MAX'=0
 ;;      alors PROCHAINE.DIRECTION=FLAIR.MAXI
 ;;*

