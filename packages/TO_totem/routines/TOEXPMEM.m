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

;TOEXPMEM^INT^1^59547,74872^0
TOEXPMEM ;
 
 
 
 
 S DX=0,DY=5 D CLEBAS^%VVIDEO K TBFIG S TBFIG($P($ZPOS,"^",2),1)="TOUR" D ^%VZCFIG S %FIG="TOUR" D BLD^%VVIDEO,DES^%VZCFIG,NORM^%VVIDEO
 S EV=^[QUI]EXPLICI(YA,ORD,PARA)
GETPLAG K P S P(1)=$P(EV,"^",4),P(2)=$P(EV,"^",5),P(3)=$P(EV,"^",18),P(4)=$$^%QZCHW("Plages"),P(5)=$$^%QZCHW("Valeur par defaut"),P(6)=$$^%QZCHW("Valeurs legales")
GETVLEG K ^VAL($J) S %U=1,LIM=15,LI=15,CO=5 F TT=6:1:17 S VL=$P(EV,"^",TT) I VL'="" S ^VAL($J,LI,(((%U-1)#2)*35)+CO)=VL S:(%U#2)=0 LI=LI+1 S %U=%U+1
 S DY=6,LI=" "_PARA_$$^%QZCHW(" de ")_YA_" " D BLD^%VVIDEO,REV^%VVIDEO S DX=40-($L(LI)\2) X XY W LI D NORM^%VVIDEO S TAB=$P($T(AFF),";;",2) F %U=1:1 K LI S LI=$P(TAB,"/",%U) G:LI="" SUI D T0
T0 F %V=1:1:4 S LI(%V)=$P(LI,",",%V)
 S DX=LI(3),DY=LI(2) D:LI(4)=1 BLD^%VVIDEO X XY W P(LI(1)) D:LI(4)=1 NORM^%VVIDEO Q
SUI G:'($D(^VAL($J))) NOV S DY=-1 F %U=0:0 S DY=$N(^VAL($J,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(^VAL($J,DY,DX)) Q:DX=-1  X XY W ^VAL($J,DY,DX)
 S TBMOV="^VAL($J,DY,DX)",MPASX=35,MPASY=1,NXI=CO-1,NXS=70,NYI=LIM-1,NYS=22,(PX,DX)=CO,(PY,DY)=LIM
LEC S AQI=0,DX=PX,DY=PY D ^%VZEREV S PX=$X,PY=$Y G FIN:X1=1,AQI:X1=13,LEC
NOV D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer ") R *X:60 S AQI=0 G FIN
AQI S AQI=^VAL($J,PY,PX) G FIN
FIN K TBFIG,%FIG,EV,ORD,P,%U,LIM,LI,CO,TT,VL,%V,TAB,TBMOV Q
AFF ;;5,8,5,1/3,10,10,0/4,8,45,1/6,13,5,1/1,10,50,0/2,11,50,0
TOUR ;;~L~H~59~11~5/~L~H~7~3~7/~L~H~59~11~7/~L~H~6~71~7/~L~H~74~3~12/~L~H~74~3~22/~L~V~14~2~8/~L~V~1~10~6/~L~V~4~40~8/~L~V~1~70~6/~L~V~14~77~8/~KS~l~2~7/~KS~t~2~12/~KS~m~2~22/~KS~l~10~5/~KS~v~10~7/~KS~w~40~7/~KS~v~40~12/~KS~k~70~5/~KS~v~70~7/~KS~k~77~7/
 ;;~KS~u~77~12/~KS~j~77~22/
 ;;

