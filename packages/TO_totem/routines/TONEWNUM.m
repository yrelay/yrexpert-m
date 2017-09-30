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

;TONEWNUM^INT^1^59547,74873^0
TONEWNUM ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Renumerotation de ")_ART D TO4^%VZCD S DX=5,DY=6,DELTA=5,TEM2=4000,TEM=4000 X XY
 S NU=-1 F UU=1:1 S NU=$N(POSENR(NU)) Q:NU=-1  X XY W $S(NU<10:" ",1:""),NU," ",POSENR(NU) S NBN=NU,DY=DY+1
 S TYP="",POSY=6,LH=6,LB=20,SENS="H"
13 D POCLEPA^%VVIDEO W $$^%QZCHW("CTRLI:Intervertir,CTRLD:vers Haut<->Bas,CTRLH:partie haute,CTRLB Bas.") D BLD^%VVIDEO,BLK^%VVIDEO S DX=32,DY=5 X XY W $$^%QZCHW("Decalage vers le haut") X XY D NORM^%VVIDEO S MPASX=0,MPASY=1,NYI=LH-1,NYS=LB+1,NXI=-1,NXS=79
RECH S DE=20,FI=22 D CLFEN^%VVIDEO(0,20,3,80),IDENT S DX=0,DY=POSY S:'($D(POSENR(POSY))) DY=6 S ATT=10000 X XY D ^%VZECUR S POSY=$Y
 I X1=1 G FIN
 I '($D(POSENR(POSY-DELTA))) S POSY=6 G RECH
 I TYP="",(X1'=9)&((X1'=2)&((X1'=8)&(X1'=4))) G RECH
 I X1=4 S DXC=$X,DYC=$Y,DX=32,DY=5 X XY W "                       " D BLK^%VVIDEO,BLD^%VVIDEO S DX=32 X XY S SENS=$S(SENS="H":"B",1:"H") W $S(SENS="H":$$^%QZCHW("Decalage vers le haut"),1:$$^%QZCHW("Decalage vers le bas")) D NORM^%VVIDEO S DX=DXC,DY=DYC X XY G RECH
NUM S TYP=$S(X1=9:"SUB",X1=2:"DEC",1:"HAUT"),DXC=$X,DYC=$Y
 S DX=0,DY=22 X XY W $S(TYP="SUB":$$^%QZCHW("Intervertir le No ")_(POSY-DELTA)_$$^%QZCHW(" avec le No : "),1:$$^%QZCHW("Nbre de boucle de decalage a partir de ")_(POSY-DELTA)_" : ")
QU S DX=$X,DY=$Y D ^%VLEC
 I (CTRLA=1)!((CTRLF=1)!(Y1="")) S TYP="",POSY=6 G RECH
 I ($L(Y1)=0)!(Y1[".") X XY W "     " X XY G QU
 S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) X XY W "     " X XY G QU
 I Y1>NBN X XY W "     " X XY G QU
 S NEW=Y1
 S DX=DXC,DY=DYC X XY D @TYP G RECH
SUB S NUC=POSY-DELTA,NUT=NEW+DELTA
 S LIB2=POSENR(NEW),LLIB2=$L(LIB2),EFF2="" F UU=1:1:LLIB2 S EFF2=EFF2_" "
 S DY=NUT,DX=8 X XY W EFF2 S DX=40,DY=POSY X XY W LIB2 F UU=1:1:TEM S WW=""
 G:TYP="SUB" SSUB
 S NUP=DER-1 F EE=1:1:NBX S LIBP=POSENR(NUP) D SDEC S NUP=NUP-1
 S DX=40,DY=POSY X XY W EFF2 S DX=8 X XY W LIB2 S POSENR(POSY-DELTA)=LIB2 F GG=1:1:TEM2 W ""
 G FIN
SDEC S EFFP="",LLIBP=$L(LIBP) F RE=1:1:LLIBP S EFFP=EFFP_" "
 S DX=8,DY=NUP+DELTA X XY W EFFP S DY=DY+1 X XY W LIBP S INUP=NUP+1,POSENR(INUP)=LIBP F GG=1:1:TEM2 W ""
 G FIN
SSUB S LIB1=POSENR(NUC),LLIB1=$L(LIB1),EFF="" F UU=1:1:LLIB1 S EFF=EFF_" "
 S DY=POSY,DX=8 X XY W EFF S DY=NUT X XY W LIB1 F UU=1:1:TEM S WW=""
 S DX=40,DY=POSY X XY W EFF2 S DX=8 X XY W LIB2
 S POSENR(NEW)=LIB1,POSENR(NUC)=LIB2
 S TYP="" G FIN
DEC I SENS="H" D CUROF^%VVIDEO,^TONUMHAU,CURON^%VVIDEO G FIN
 S NBX=NBN-(POSY-DELTA),NBF=NEW,DER=NBN D CUROF^%VVIDEO F HH=1:1:NBF S NEW=NBN D SUB
 D CURON^%VVIDEO G FIN
HAUT I SENS="H" D CUROF^%VVIDEO,^TONUMHAU,CURON^%VVIDEO G FIN
 S NBX=(POSY-DELTA)-1,NBF=NEW,DER=POSY-DELTA,POSZ=POSY D CUROF^%VVIDEO F HH=1:1:NBF S NEW=POSZ-DELTA,POSY=6 D SUB
 D CURON^%VVIDEO G FIN
TEST K POSENR
 S NU=1 F UU=0:0 W !,NU,"  " R VV Q:VV=""  S POSENR(NU)=VV,NU=NU+1
 D ^TONEWNUM Q
FIN Q
IDENT S NDI=1,IDENT(1)=ART,IDENT(2)="",ID="IDENT(1)",NN=-1 F EW=0:0 S NN=$N(POSENR(NN)) Q:NN=-1  S LC=$L(POSENR(NN)) S:(LC+$L(@ID))>80 NDI=NDI+1,ID="IDENT("_NDI_")",@ID="" S @ID=@ID_"/"_POSENR(NN)
 S NNI=1,DX=0 F DY=20:1 Q:'($D(IDENT(NNI)))  S AF=IDENT(NNI),NNI=NNI+1 X XY W AF
 Q

