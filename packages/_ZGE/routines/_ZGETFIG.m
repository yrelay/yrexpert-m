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

;%ZGETFIG^INT^1^59547,74037^0
%ZGETFIG ;
 D CLEPAG,CURRENT^%IS S DX=0,DY=0 X XY F DY=0:1:23 X XY W DY
 S DY=0,DX=0 X XY F DX=0:1:%COL-1 W $S((DX#10)=0:DX/10,1:".")
 D G0ON^%VVIDEO K ^DES($J),^HORI($J),^INTER($J),^VERT($J) S SS=1,DIR="X"
 S MPASX=1,MPASY=1,NXI=-1,NXS=%COL,NYI=-1,NYS=24,DX=40,DY=10,PY=DY,PX=DX
LEC S DX=3,DY=0 X XY W "     " X XY W PX,"/",PY S DX=PX,DY=PY X XY D MOVCUR S PX=$X,PY=$Y G END:X1=6,DEL:X1=127,ANUL:X1=1 G:X1=127 DEL G:X1<49 LEC G:(X1>57)&(X1<72) LEC
TR G:X1'>57 TRF G:((X1'=72)&(X1'=73))&(X1'=86) LEC
TRF S X1=$C(X1) S:(X1'="I")&((X1'="H")&(X1'="V")) ^DES($J,PX,PY)=X1 G @X1
7 W "l" G LEC
8 W "w" G LEC
9 W "k" G LEC
6 W "u" G LEC
3 W "j" G LEC
2 W "v" G LEC
1 W "m" G LEC
4 W "t" G LEC
5 W "n" G LEC
H W "q" S DIR="X",^HORI($J,PY,PX)=1 S:PX<(%COL-1) PX=PX+SS G LEC
V W "x" S DIR="Y",^VERT($J,PX,PY)=1 S:PY<(%COL-1) PY=PY+SS G LEC
I S SS=SS*-1 G LEC
DEL K ^DES($J,PX,PY),^VERT($J,PX,PY),^HORI($J,PY,PX) W " " S @("P"_DIR)=@("P"_DIR)+SS G LEC
END D G0OFF^%VVIDEO,INTER Q
ANUL D G0OFF^%VVIDEO Q
INTER K ^INTER($J) S NI=1,LO=0,TL="H",TB="^HORI($J)" D INTE0
 S NI=NI+1,LO=0,TL="V",TB="^VERT($J)" D INTE0 S NI=NI+1,PX=-1 F %U=1:1 S PX=$N(^DES($J,PX)) Q:PX=-1  S DY=-1 F %U=0:0 S PY=$N(^DES($J,PX,PY)) Q:PY=-1  S LO=^DES($J,PX,PY),^INTER($J,NI)="~KS~"_$P($T(@LO),"""",2)_"~"_PX_"~"_PY,NI=NI+1
 Q
INTE0 S (OPY,PY)=-1 F %U=0:0 S PY=$N(@TB@(PY)) Q:PY=-1  K TX S LO=0,NX=1,(OPX,PX)=-2 F %U=0:0 S PX=$N(@TB@(PY,PX)) D:PX=-1 INTE1 Q:PX=-1  D INTE1
 Q
INTE1 I PX'=(OPX+1),OPX'=-2 S COR=$S(TL="V":PY_"~"_TX(1),1:TX(1)_"~"_PY),^INTER($J,NI)="~L~"_TL_"~"_LO_"~"_COR K TX S NX=1,NI=NI+1,LO=0
 S TX(NX)=PX,NX=NX+1,LO=LO+1,OPX=PX Q
REST D CLEPAG S TGR="^INTER($J)" D FIG^%VVIDEO Q
CLEPAG W *27,"[2J" Q
MOVCUR S:'($D(IOM)) IOM=80 O 0:(RM:1) U 0:(IOM)
LOOP1 I '($D(ATT)) S ATT=10000
LOOP R *X1:ATT S:X1=-1 X1=13
 I X1=27 G @X1
 E  G FIN
ECRI R *Y
 I (Y=127)!(Y=13) G @Y
 E  S DX=DX+1,C=C_$C(Y) G ECRI
127 S DX=DX-1 I DX<PX S PX=DX X XY G ECRI
 E  X XY W " " X XY S LON=$L(C)-1,C=$E(C,1,LON) G ECRI
13 Q
27 R *X2,*X3
 G FIN:(X2=27)!(X3=27) I (((X1'=27)!(X2'=91))!(X3'>64))!(X3'<69) D SQUEAK G LOOP
 D @X3,TEST G LOOP
SHOW X XY W "*" Q
CLEPOS X XY Q
FIN O 0:(RM:0) U 0:(IOM) Q
65 S DDX=0,DDY=-(MPASY) Q
66 S DDX=0,DDY=MPASY Q
67 S DDY=0,DDX=MPASX Q
68 S DDY=0,DDX=-(MPASX) Q
TEST S NX=DX+DDX,NY=DY+DDY W *-1 I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D SQUEAK Q
 S DX=3,DY=0 X XY W "     " X XY W NX,"/",NY S DX=NX,DY=NY X XY K NX,NY Q
SQUEAK W *7,*7,*-1 Q

