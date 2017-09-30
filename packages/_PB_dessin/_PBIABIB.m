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

;%PBIABIB^INT^1^59547,73873^0
PTIABIBL ;
 N AGRAND,OBJET,R,ROTATION,VERSION
DEB D ^%PBPZALF,^%PBPZOFG,CLEPAG^%VVIDEO,CAD S Y1=""
 S DX=12,DY=10 X XY W "Objet  : " S DX=$X,DY=$Y W $J("",$L(Y1)) X XY
 D ^%VLEC G:CTRLA!(Y1="") FIN G:Y1'="?" S0
 S Y1=$$^%QUCHOYO("^[QUI]GRAPHE2",.R,3) G:Y1="" FIN G @R
0 S DX=12,DY=10 X XY W "Objet  : ",Y1 G S0
1 D POCLEPA^%VVIDEO G 0
2 D CLEPAG^%VVIDEO,CAD S DX=12,DY=10 X XY W "Objet  : ",Y1 G S0
S0 S OBJET=Y1,Y1=""
 S DX=12,DY=12 X XY W "Version : " S DX=$X,DY=$Y W $J("",$L(Y1)) X XY
 D ^%VLEC G:CTRLA!(Y1="") FIN G:Y1'="?" S1
 S Y1=$$^%QUCHOYO("^[QUI]GRAPHE2(OBJET)",.R,3) G:Y1="" FIN G @("X"_R)
X0 S DX=12,DY=12 X XY W "Version : ",Y1 G S1
X1 D POCLEPA^%VVIDEO G X0
X2 D CLEPAG^%VVIDEO,CAD S DX=12,DY=10 X XY W "Objet  : ",OBJET
 S DX=12,DY=12 X XY W "Version : ",Y1 G S1
S1 S VERSION=Y1,Y1=""
 D @("D"_($D(^[QUI]GRAPHE2(OBJET,VERSION))'=0)) G ENDD
FIN G ENDD
 
D0 
 D POCLEPA^%VVIDEO,^%VSQUEAK W "Cet objet n'existe pas ..." H 3 D POCLEPA^%VVIDEO G DEB
D1 
 I (O=OBJET)&(V=VERSION) D POCLEPA^%VVIDEO,^%VSQUEAK W "Il ne vous est pas permis d'utiliser l'objet que vous creez en ce moment ..." H 3 D POCLEPA^%VVIDEO Q
L0 D POCLEPA^%VVIDEO W "Agrandissement [1] : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA END S:Y1="" Y1=1
 G:'($F(Y1,"/",0)) LOK
 I ($P(Y1,"/",1)'?1N.N)!($P(Y1,"/",2)'?1N.N) D ^%VSQUEAK G L0
 S @("Y1="_Y1) G LOS
LOK S %PCH=Y1 D ^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L0
LOS S AGRAND=(Y1*DIST)/$$LEC^%PBSOV(OBJET,VERSION,"MESURE")
L1 D POCLEPA^%VVIDEO W "Rotation [0] : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA ENDD S:Y1="" Y1=0 S %PCH=Y1 D ^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L1
 S ROTATION=Y1
L2 
 
 D CLEPAG^%VVIDEO,REV^%VVIDEO,^%PBPZONG
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez le point de raccordement du dessin avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.X,.Y) G:R=0 ENDD
 S R=$$ADD^%PBSOV(O,V,$$IMAGE^%PBEL(OBJET,VERSION,X,Y,ROTATION,AGRAND))
 D ^%PBPZGRA,^%PBISAGE(OBJET,VERSION,X,Y,$$NORM^%PBCACV(ROTATION),AGRAND,1,0)
 
ENDD D ^%PBPZALF,^%PBPZONG Q  W *
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="INTEGRATION D'UN AUTRE OBJET" D 4^%VZCD Q

