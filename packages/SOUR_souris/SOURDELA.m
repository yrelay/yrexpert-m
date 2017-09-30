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

;SOURDELA^INT^1^59547,74868^0
SOURDELA ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Labyrinthes stockes") D TO4^%VZCD K ^PAGE($I) S PX=1,LIM=21,LI=8,%J=-1 F %U=1:1 S %J=$N(^[QUI]SOURJEUX(%J)) Q:%J=-1  I %J'="z" S ^PAGE($I,PX,LI)=%J,LI=LI+1 I LI>LIM S PX=PX+1,LI=8
 S NBPX=$S($D(^PAGE($I,PX)):PX,1:PX-1),PX=1 D AFF
QU D POCLEPA^%VVIDEO W $$^%QZCHW("xS(Suppres. no x),x?(Visual. no x),+,-,page,(CTRLA)Abandon ") S DX=$X D ^%VLEC G:CTRLA=1 END G:Y1="" QU G PL:Y1="+",PL:Y1="=",MS:Y1="-",SUP:Y1[$$^%QZCHW("S"),VIS:Y1["?" G:'($D(^PAGE($I,Y1))) QU S PX=Y1 D AFF G QU
PL S NPX=PX+1 G:'($D(^PAGE($I,NPX))) QU S PX=NPX D AFF G QU
MS S NPX=PX-1 G:'($D(^PAGE($I,NPX))) QU S PX=NPX D AFF G QU
SUP S NU=$P(Y1,$$^%QZCHW("S"),1) G:NU="" QU G:'($D(%J(NU))) QU S LAB=$P(%J(NU),"|",1),LI=$P(%J(NU),"|",2) D POCLEPA^%VVIDEO W $$^%QZCHW("OK pour supprimer "),LAB,$$^%QZCHW(" (O/N) ? ") R *REP G:$C(REP)'=$$^%QZCHW("O") QU K ^[QUI]SOURJEUX(LAB) S DXG=0,DXD=79,(DYH,DYB)=LI+1 D LWIN^%VVIDEO K ^PAGE($I,PX,LI) G QU
VIS S NU=$P(Y1,"?",1) G:NU="" QU G:'($D(%J(NU))) QU S LAB=$P(%J(NU),"|",1),%LABY="^[QUI]SOURJEUX(LAB)" D ^SOURAIRJ,^SOURLABY,POCLEPA^%VVIDEO W " [RETURN] " R *RET
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Labyrinthes stockes") D TO4^%VZCD,AFF G QU
END K ^PAGE($I),DXG,DXD,DYH,DYB,GRAPH,MSG,NPX,NBPX,PX,LI,LIM,%U,Y1 Q
AFF K %J S DX=0,DY=6,NJ=1 D CLEBAS^%VVIDEO S DY=6,MSG=$$^%QZCHW("Page ")_PX_"/"_NBPX,DX=40-($L(MSG)\2) X XY W MSG S LI=-1 F %U=1:1 S LI=$N(^PAGE($I,PX,LI)) Q:LI=-1  S DY=LI,DX=5 X XY W $S(NJ<10:" ",1:""),NJ,"   ",^PAGE($I,PX,LI) S %J(NJ)=^PAGE($I,PX,LI)_"|"_LI,NJ=NJ+1
 Q

