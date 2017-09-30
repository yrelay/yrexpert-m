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

;%MZTREPG^INT^1^59547,73872^0
MOZTREPG ;
 
 D POCLEPA^%VVIDEO W $$L5^%QSLIB S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=22
 D ECHOFF^%VVIDEO
DEB1 S DY=PY+1 S:DY>21 (DY,PY)=21 S DX=0 X XY D ^%VZECUR G:X1=1 1 S PY=$Y
 G:'($D(^AFFPAG($J,EGAP,PY))) DEB1 G:(X1'=1)&((X1'=7)&((X1'=83)&((X1'=6)&((X1'=86)&(X1'=65))))) DEB1
 S ENR=^AFFGAM($J,EGAP,PY),ARC=$P(ENR,"^",1) G @X1
FIN Q
END K COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
65 D ^%MZATTKN(^AFFGAM($J,EGAP,PY)),REAFF G DEB
6 G END
1 G END
83 S PARA=^AFFGAM($J,EGAP,PY),^GAMASUP($J,EGAP,PY)=PARA D ON^%MZAFLGA
 G DEB1
7 K ^GAMASUP($J,EGAP,PY) D ON^%MZAFLGA
 G DEB1
86 S OODDXX=$X,OODDYY=PY,NUGA=^AFFGAM($J,EGAP,PY),LILIM=15,IMPR=0 D CLEPAG^%VVIDEO,^%MZLSTAR,^%MZS02(NUGA),GRENS^%MZEDIGA,CHA^%MZEDIGA,E^%MZEDIGA,CLEPAG^%VVIDEO,REAFF S LILIM=17,DX=OODDXX,(PY,DY)=OODDYY-1 K OODDXX,OODDYY
 G DEB1
REAFF D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("REPERTOIRE DES GAMMES"))
 S DX=40-($L(GAP)\2),DY=5 X XY W GAP S DX=0,DY=6 X XY W TIT
 D AFF1^%MZAFLGA
 D POCLEPA^%VVIDEO W $$L5^%QSLIB Q

