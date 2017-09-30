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
;! Nomprog     : %VVIDEO2                                                     !
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
;! HL003 ! HL     ! 21/08/09 ! CURON & CUROF transférer sur %VVIDEO           !
;! HL004 ! HL     ! 09/07/12 ! PB caractères parasites terminal-gnome         !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VVIDEO2 ;
GEVIDEO ;;10:17 AM  12 Feb 1992
 
CLEAR G CLEAR^%VVIDEO ;HL003
 ;HL003 W *27,*91,*50,*74 S (DX,DY)=0 X XY I $D(SUB) W $S(SUB="C-ADM3":$C(26),SUB="C-TDV":$C(25),1:"")
 ;HL003 Q

XY(X,Y) G XY2^%VVIDEO

TRAIT G TRAIT^%VVIDEO ;HL003
 ;HL003 S X="qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
 ;HL003 S:TADTM=0 X=$TR($E(X,1,79),"q",$C(196))
 ;HL003 U 0 D G0ON^%VVIDEO W X D G0OFF^%VVIDEO Q
132 G 132^%VVIDEO ;HL003
 ;HL003 Q
80 G 80^%VVIDEO ;HL003
 ;HL003 Q

ALT G ALT^%VVIDEO
NET G NET^%VVIDEO
BLK G BLK^%VVIDEO
BLD G BLD^%VVIDEO
CAG G CAG^%VVIDEO
MOY G MOY^%VVIDEO

CUROF G CUROF^%VVIDEO ;HL003
CURON G CURON^%VVIDEO ;HL003

CURBLK G CURBLK^%VVIDEO
CURIMO G CURIMO^%VVIDEO
CURUDL G CURUDL^%VVIDEO
CURBLO G CURBLO^%VVIDEO
NORM G NORM^%VVIDEO
REV G REV^%VVIDEO
SCRL G SCRL^%VVIDEO
OFSCRL Q:'(TADTM)
 W *27,"[r" Q
SMTHSCRL G SMTHSCRL^%VVIDEO
JMPSCRL G JMPSCRL^%VVIDEO
ONTTREV G ONTTREV^%VVIDEO
OFTTREV G ONFTREV^%VVIDEO
UDL G UDL^%VVIDEO
 
APPKP G APPKP^%VVIDEO
 
NUMKP G NUMKP^%VVIDEO

BIG G BIG^%VVIDEO ;HL003
 ;HL003 S DX=DXG,DY=DYH X XY
 ;HL003 I SUB="C-DTM" W /COLOR(4,0) X XY W MSG X XY W /COLOR(7,0) K MSG,DXG,DYH Q
 ;HL003 ;HL W *27,"#3" S DY=DY+1 X XY W *27,"#4" F DY=DYH,DYH+1 X XY W MSG
 ;HL003 D COLOR^%VVIDEO3(4,0) X XY W MSG X XY D COLOR^%VVIDEO3(7,0) K MSG,DXG,DYH
 ;HL003 K MSG,DXG,DYH Q

LWIN G LWIN^%VVIDEO
 ;HL003 Q:SUB="C-DTM"
 ;HL003 W *27,"[>3;",DYH,";",DXG,";",DYB,";",DXD,"J" K DXD,DXG,DYH,DYB Q

G0ON G G0ON^%VVIDEO
G0OFF G G0OFF^%VVIDEO
CARLA(DXG,DYH,LH,LV) G CARLA2^%VVIDEO
CARSA(DXG,DYH,LH,LV) G CARS^%VVIDEO
CARS G CARS^%VVIDEO
TRV G TRV^%VVIDEO
TRH G TRH^%VVIDEO
DAMIER G DAMIER^%VVIDEO1
CARL G CARL^%VVIDEO1
FIG D CUROF S KS=0,%V=-1 F %U=0:0 S %V=$N(@TGR@(%V)) Q:%V=-1  S %V1=@TGR@(%V),%V2=$P(%V1,"~",2) D @%V2
 D G0OFF^%VVIDEO G FIN^%VVIDEO1
L S %V3=$P(%V1,"~",3),@("L"_%V3)=$P(%V1,"~",4),DXG=$P(%V1,"~",5),DYH=$P(%V1,"~",6) D @("TR"_%V3) Q
;HL004 KS S DX=$P(%V1,"~",4),DY=$P(%V1,"~",5) D:'(KS) G0ON^%VVIDEO X XY W $$CARSPE($P(%V1,"~",3)) S KS=1 Q
KS S DX=$P(%V1,"~",4),DY=$P(%V1,"~",5) D:'(KS) G0ON^%VVIDEO X XY W $$CARSPE($P(%V1,"~",3)) S ($X,$Y)=0 S KS=1 Q
CARSPE(C) 
CARSPE2 G CARSPE2^%VVIDEO ;HL003
 ;HL003 Q:'(IBMPC) C
 ;HL003 Q:TADTM C
 ;HL003 Q:C="l" $C(218)
 ;HL003 Q:C="t" $C(195)
 ;HL003 Q:C="q" $C(196)
 ;HL003 Q:C="x" $C(179)
 ;HL003 Q:C="m" $C(192)
 ;HL003 Q:C="v" $C(193)
 ;HL003 Q:C="j" $C(217)
 ;HL003 Q:C="w" $C(194)
 ;HL003 Q:C="u" $C(180)
 ;HL003 Q:C="k" $C(191)
 ;HL003 Q:C="n" $C(197)
 ;HL003 Q C

ECHON G ECHON^%VVIDEO
ECHOFF G ECHOFF^%VVIDEO
RM G RM^%VVIDEO
CARSP(DXG,DYH,LV,LH,BLD) D CARS^%VVIDEO Q
CLFEN(DXG,DYH,LV,LH) 
 G CLFEN2^%VVIDEO
 
CRTSAVE G CRTSAVE^%VVIDEO
 ;HL003 Q:'(TADTM)
 ;HL003 Q
 ;HL003 W *27,*91,*62,13,*104 Q
 
POCLEPA G POCLEPA^%VVIDEO
 
CLEBAS G CLEBAS^%VVIDEO
 
CLEPAG G CLEPAG^%VVIDEO
 
TDVCLB G TDVCLB^%VVIDEO1
TDVCLI G TDVCLI^%VVIDEO1
TDVCLL G TDVCLL^%VVIDEO1

