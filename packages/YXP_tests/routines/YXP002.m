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
;! Nomprog     : %VVIDEO                                                      !
;! Module      : Vidéo (V)                                                    !
;! But         :                                                              !
;!                                                                            !
;! Description : Gestion de l'affichage.                                      !
;!                                                                            !
;! CARS, CARSP : Affiche le cadre des menus et le descriptif                  !
;! G0ON, G0OFF : Graphique ON/OFF                                             !
;! CLEBAS : S DX=0,DY=22 D CLEBAS^%VVIDEO : Supprime ligne 22                 !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;! HL003 ! HL     ! 19/08/09 ! Erreur au démarrage                            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VVIDEO ;Gestion de l'affichage.

CLEAR ;ERASE ENTIRE PAGE: $C(27,91,50,74)
 W $C(27,91,50,74) S (DX,DY)=0 X XY Q
 ;HL004 G CLEAR^%VVIDEO2

XY(X,Y) ;XY CRT: W $C(27,91)_((DY+1))_$C(59)_((DX+1))_$C(72)
XY2 N DX,DY 
 S DX=X,DY=Y,XY="W $C(27,91)_((DY+1))_$C(59)_((DX+1))_$C(72)" X XY Q
 ;HL004 I (SUB="C-DTM") S DX=X,DY=Y X XY Q  ;; cao
 ;HL004 N A,B  ;;cao
 ;HL004 S DX=X,DY=Y  ;;cao
 ;HL004 S A=X,B=Y   ;;cao
 ;HL004 S XY="w $C(27,91)_(B+1)_$C(59)_(A+1)_$C(72) S $X=" X XY Q

TRAIT ;;HORIZONTAL LINE: "q"
 S X="qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" ;HORIZONTAL LINE: "q"
 D G0ON W X D G0OFF Q
 ;HL004 G TRAIT^%VVIDEO2

132 ;HL004
 Q:TADTM=0
 S %A=$I,IOM=132 O %A U %A W *27,"[?3h" Q

80 ;HL004
 Q:TADTM=0
 S %A=$I,IOM=80 
 O %A 
 W *27,"[?3l" 
 Q

ALT ;
 W *27,"(1",MSG,*27,"(B" Q
 
NET ;
 W /EL Q
 
BLK ;BLINK ON: $C(27,91,53,109)
 ;W $C(27,91,53,109) Q
 S TMPX=$X,TMPY=$Y W $C(27,91,53,109) S $X=TMPX,$Y=TMPY K TMPX,TMPY Q
 ;HL004 i $D(VB) G FIN
 ;HL004 I (SUB="C-DTM") W /AI Q 
 ;HL004 ;HL2 W $C(27,$A("["),$A(5),$A("m"))
 ;HL004 S TMPX=$X,TMPY=$Y W $C(27,$A("["),$A(5),$A("m")) S $X=TMPX,$Y=TMPY Q 
 
BLD ;HIGH INTENSITY (BOLD): $C(27,91,49,109)
 W $C(27,91,49,109) Q
 ;S TMPX=$X,TMPY=$Y S DX=0,DY=0 X XY W $C(27,91,49,109) S DX=TMPX,DY=TMPY X XY K TMPX,TMPY Q
 S TMPX=$X,TMPY=$Y W $C(27,91,49,109) S $X=TMPX,$Y=TMPY K TMPX,TMPY Q
 ;W $C(27,91,49,109) Q
 ;HL004 i $D(VB) G FIN 
 ;HL004 I (SUB="C-DTM") W /AB Q
 ;HL004 ;HL2 w $C(27,$A("["),$A(1),$A("m"))
 ;HL004 S TMPX=$X,TMPY=$Y w $C(27,$A("["),$A(1),$A("m")) S $X=TMPX,$Y=TMPY Q 
 
CAG ;SINGLE HIGH DOUBLE WIDE: $C(27,35,54)
 W $C(27,35,54) Q
 ;HL004 Q:TADTM=0
 ;HL004 ;HL W *27,"#",6 Q
 ;HL004 Q

MOY ;SINGLE HIGH SINGLE WIDE: $C(27,35,53)
 W $C(27,35,53) Q
 ;HL004 Q:TADTM=0
 ;HL004 ;HL W *27,"#",6 Q
 ;HL004 Q

CUROF ;CURSOR OFF: $C(27)_"[?25l"
 W $C(27)_"[?25l" Q
 ;S TMPX=$X,TMPY=$Y S DX=0,DY=0 X XY W $C(27)_"[?25l" S DX=TMPX,DY=TMPY X XY K TMPX,TMPY Q
 S TMPX=$X,TMPY=$Y W $C(27)_"[?25l" S $X=TMPX,$Y=TMPY K TMPX,TMPY Q
 ;HL004 I (SUB="C-DTM") W /VF Q  ;; cao
 ;HL004 ;;w $C(27,$A("["),$A(2),$A(5),$A("l")) Q  ;; cao
 ;HL004 W *27,"[1v" Q
 
CURON ;CURSOR ON: $C(27)_"[?25h"
 W $C(27)_"[?25h" Q
 ;S TMPX=$X,TMPY=$Y S DX=0,DY=0 X XY W $C(27)_"[?25h" S DX=TMPX,DY=TMPY X XY K TMPX,TMPY Q
 S TMPX=$X,TMPY=$Y W $C(27)_"[?25h" S $X=TMPX,$Y=TMPY K TMPX,TMPY Q
 ;HL004 I (SUB="C-DTM") W /VN Q  ;;cao  
 ;HL004 ;;w $C(27,$A("["),$A(2),$A(5),$A("h")) Q  ;;cao
 ;HL004 Q:'(TADTM)
 ;HL004 W *27,"[0v" Q
 
 ;HL004 CUROF I '$D(VB) Q  G CUROF^%VVIDEO2
 ;HL004 CURON I '$D(VB) Q  G CURON^%VVIDEO2

CURBLK W *27,"[5v" Q
CURIMO W *27,"[4v" Q
CURUDL W *27,"[2v" Q
CURBLO W *27,"[3v" Q
 
NORM ;RESET: $C(27)_"[!p"
 W $C(27)_"[!p" Q
 ;HL004 I $$GET^%SGVAR("FOREGROUND")'="" W /COLOR($$GET^%SGVAR("FOREGROUND"),$$GET^%SGVAR("BACKGROUND")) Q
 ;HL004 I (SUB="C-DTM") W /AA Q  ;;cao
 ;HL004 W $C(27,$A("["),$A(0),$A("m")) Q  ;;cao
 ;HL004 S TMPX=$X,TMPY=$Y W $C(27,$A("["),$A(0),$A("m")) S $X=TMPX,$Y=TMPY Q 
 
REV ;REVERSE VIDEO ON: $C(27,91,55,109)
 W $C(27,91,55,109) Q
 ;HL004 I $D(VB) G FIN
 ;HL004 N FRG,BCG
 ;HL004 I $$GET^%SGVAR("FOREGROUND")'="" S BCG=$$GET^%SGVAR("BACKGROUND"),FRG=$$GET^%SGVAR("FOREGROUND")#8 S:FRG=BCG BCG=0 S:FRG=BCG BCG=7 W /COLOR(BCG,FRG)
 ;HL004 I (SUB="C-DTM") W /AE Q   ;; cao
 ;HL004 ;HL2 W $C(27,$A("["),$A(7),$A("m")) Q   ;; cao
 ;HL004 S TMPX=$X,TMPY=$Y W $C(27,$A("["),$A(7),$A("m")) S $X=TMPX,$Y=TMPY Q 
 
SCRL W *27,"[",DYH,";",DYB,"r" Q
OFSCRL G OFSCRL^%VVIDEO2
SMTHSCRL W *27,"[?4h" Q
JMPSCRL W *27,"[?4l" Q
ONTTREV W *27,"[?5h" Q
OFTTREV W *27,"[?5l" Q
 
UDL
 i $D(VB) G FIN
 I (SUB="C-DTM") W /AC Q  ;; cao
 W $C(27,$A("["),$A(4),$A("m")) Q   ;; cao
 
APPKP Q:'(TADTM)
 W *27,"=" Q
 
NUMKP Q:'(TADTM)
 W *27,">" Q

BIG ;Set IBM PC Color - foreground %1, background %2
 S DX=DXG,DY=DYH X XY D COLOR^%VVIDEO3(4,0) X XY W MSG X XY D COLOR^%VVIDEO3(7,0) K MSG,DXG,DYH Q

 ;HL004 S DX=DXG,DY=DYH X XY
 ;HL004 I SUB="C-DTM" W /COLOR(4,0) X XY W MSG X XY W /COLOR(7,0) K MSG,DXG,DYH Q
 ;HL004 ;HL W *27,"#3" S DY=DY+1 X XY W *27,"#4" F DY=DYH,DYH+1 X XY W MSG
 ;HL004 D COLOR^%VVIDEO3(4,0) X XY W MSG X XY D COLOR^%VVIDEO3(7,0) K MSG,DXG,DYH
 ;HL004 K MSG,DXG,DYH Q

 ;HL004 G BIG^%VVIDEO2

LWIN
 W *27,"[>3;",DYH,";",DXG,";",DYB,";",DXD,"J" K DXD,DXG,DYH,DYB Q
 ;HL004 G LWIN^%VVIDEO2
 
G0ON ;GRAPHICS ON: $C(27)_"(0"
 W $C(27)_"(0" Q
 S TMPX=$X,TMPY=$Y S DX=0,DY=0 X XY W $C(27)_"(0" S DX=TMPX,DY=TMPY X XY K TMPX,TMPY Q
 ;HL004 I SUB="C-DTM" W /LN Q
 ;HL004 W *27,"(0" Q
 
G0OFF ;GRAPHICS OFF: $C(27)_"(B"
 W $C(27)_"(B" Q
 S TMPX=$X,TMPY=$Y S DX=0,DY=0 X XY W $C(27)_"(B" S DX=TMPX,DY=TMPY X XY K TMPX,TMPY Q
 ;HL004 I SUB="C-DTM" W /LF Q
 ;HL004 W *27,"(B" Q
 
CARLA(DXG,DYH,LH,LV) 
CARLA2 N DXD,DYB,BLD,GRAPH
 S BLD=0,GRAPH=0,DXD=(DXG+LH)-1,DYB=(DYH+LV)-1 D CARL Q


CARSP(DXG,DYH,LV,LH,BLD) D CARS Q
CARSA(DXG,DYH,LH,LV) 
CARS ;Affiche un rectangle (DXG,DYH,LV,LH,BLD)
 N CHG,CHD,CBG,CBD,VER,HOR
 S CHG="l" ;TOP LEFT CORNER: "l"
 S HOR="q" ;HORIZONTAL LINE: "q"
 S CHD="k" ;TOP RIGHT CORNER: "k"
 S VER="x" ;VERTICAL LINE: "x"
 S CBG="m" ;BOTTOM LEFT CORNER: "m"
 S CBD="j" ;BOTTOM RIGHT CORNER: "j"
 ;HL999 S:((DXG+LH)>79) LH=79-DXG
 S:((DXG+LH)>79) LH=79-DXG
 S:'($D(BLD)) BLD=0 D:BLD=1 BLD D G0ON S DX=DXG,DY=DYH X XY W CHG F C1=1:1:LH-2 W HOR
 W CHD,?0,"        "
 ;F C1=1:1:LV-2 S DX=DXG,DY=DYH+C1 X XY W VER S DX=($X+LH)-2 X XY W VER
 ;S DX=DXG,DY=(DYH+C1)+1 X XY W CBG F C1=1:1:LH-2 W HOR
 ;W CBD
 D G0OFF
 D:BLD=1 NORM K BLD,DXG,DYH,C1,LH,LV Q

 ;HL999 S CHG=$S('(TADTM):$C(218),1:$C(108)),HOR=$S('(TADTM):$C(196),1:$C(113))
 ;HL999 S CHD=$S('(TADTM):$C(191),1:$C(107)),VER=$S('(TADTM):$C(179),1:$C(120))
 ;HL999 S CBG=$S('(TADTM):$C(192),1:$C(109)),CBD=$S('(TADTM):$C(217),1:$C(106))
 ;HL999 S:('(TADTM))&((DXG+LH)>79) LH=79-DXG
 ;HL999 D CUROF^%VVIDEO2 S:'($D(BLD)) BLD=0 D:BLD=1 BLD S DX=0,DY=0 X XY D G0ON S DX=DXG,DY=DYH X XY W CHG F C1=1:1:LH-2 W HOR
 ;HL999 W CHD F C1=1:1:LV-2 S DX=DXG,DY=DYH+C1 X XY W VER S DX=($X+LH)-2 X XY W VER
 ;HL999 S DX=DXG,DY=(DYH+C1)+1 X XY W CBG F C1=1:1:LH-2 W HOR
 ;HL999 W CBD
 ;HL999 I '(TADTM) S DX=DXG+1,DY=DYH+1 X XY
 ;HL999 D G0OFF,CURON^%VVIDEO2 X:'(TADTM) XY
 ;HL999 D:BLD=1 NORM K BLD,DXG,DYH,C1,LH,LV Q

TRV
 N VER S VER=$S('(TADTM):$C(179),1:$C(120))
 D CUROF^%VVIDEO2 S:'($D(BLD)) BLD=0 D:BLD=1 BLD D G0ON F C1=0:1:LV-1 S DX=DXG,DY=DYH+C1 X XY W VER
 D CURON^%VVIDEO2,G0OFF D:BLD=1 NORM^%VVIDEO K DXG,DYH,C1,LV,BLD Q

TRH
 N HOR S HOR=$S('(TADTM):$C(196),1:$C(113))
 D CUROF^%VVIDEO2 S:'($D(BLD)) BLD=0 D:BLD=1 BLD S DX=DXG,DY=DYH X XY D G0ON F C1=1:1:LH W HOR
 D CURON^%VVIDEO2,G0OFF D:BLD=1 NORM K DXG,DYH,C1,LV,BLD Q

DAMIER G DAMIER^%VVIDEO1
CARL G CARL^%VVIDEO1
FIG G FIG^%VVIDEO2
L G L^%VVIDEO2
KS G KS^%VVIDEO2

CARSPE(C) 
 Q:'(IBMPC) C
 Q:TADTM C
 Q:C="l" $C(218)
 Q:C="t" $C(195)
 Q:C="q" $C(196)
 Q:C="x" $C(179)
 Q:C="m" $C(192)
 Q:C="v" $C(193)
 Q:C="j" $C(217)
 Q:C="w" $C(194)
 Q:C="u" $C(180)
 Q:C="k" $C(191)
 Q:C="n" $C(197)
 Q C

 ;HL004 Q:'(IBMPC) C
 ;HL004 Q:TADTM C
 ;HL004 G CARSPE2^%VVIDEO2



ECHON
 D RM
 U $P:(ECHO) Q  ;HL2
 ;HL003 O 0:(RM:"C") Q  ;HL
 ;HL003 I '(DTM) O 0:(RM:"C") Q
 ;HL003 O 0:(EM=1)
 ;HL003 Q

ECHOFF
 D RM
 U $P:(NOECHO) U $P:ESCAPE Q  ;HL2
 ;HL003 O 0:(RM:"CS") Q  ;HL
 ;HL003 I '(DTM) O 0:(RM:"CS") Q
 ;HL003 O 0:(EM=0)
 ;HL003 Q

RM ;RIGHT MARGIN: 80
 S:'($D(RM)) RM=80 Q

CLFEN(DXG,DYH,LV,LH) 
CLFEN2
 N DX,DY,L D CUROF^%VVIDEO2 S L=(DYH+LV)-1,DX=DXG F DY=DYH:1:L X XY W $J("",LH)
 S (DX,DY)=0 X XY
 D CURON^%VVIDEO2 Q
 
CRTSAVE G CRTSAVE^%VVIDEO2
POCLEPA
 I $D(VB) G FIN
 S DX=0,DY=23 X XY D CLEBAS Q
 
CLEBAS 
 X XY W $C(27,91,50,75) Q
 ;HL2 X XY W /EF Q
 
CLETEX ;HL
 F I=6:1:23 S DX=0,DY=I X XY D CLEBAS
 ;F I=6:1:23 W /CUP(I,1),*27,"#5",/EL
 Q 
 
CLEPAG ; CLEAR PAGE
 W # Q 
 ;HL004 W # Q 
 ;HL004 ;HL ---------
 ;HL004 ;HL2 W /CUP(1,1)
 ;HL004 ;HL2 F I=1:1:25 W /CUP(I,1),*27,"#5",/EL
 ;HL004 ;HL2 W /CUP(1,1),/EL
 ;HL004 ;HL2 Q 
 ;HL004 ;HL ---------
 ;HL004 i $D(VB) G FIN
 ;HL004 S:'($D(%TABTRA)) %TABTRA=0 Q:%TABTRA
 ;HL004 S DX=0,DY=0 X XY W /EF Q
 
 ;HL004 I $D(SUB) W $S(SUB="C-ADM3":$C(26),SUB="C-TDV":$C(25),1:"")
 ;HL004 Q
 
TDVCLB G TDVCLB^%VVIDEO1
TDVCLI G TDVCLI^%VVIDEO1
TDVCLL G TDVCLL^%VVIDEO1

FIN ;
 Q



TEST
 ;D TEST^YXP002
 W #
 D CARSP(0,6,13,80,1),CARSP(0,19,4,50,0)


