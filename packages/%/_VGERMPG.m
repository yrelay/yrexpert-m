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

;%VGERMPG^INT^1^59547,74034^0
GEGERMPG(PG,XG,XD,YH,YB,DL,MES,AD,CONT) 
 S AD="",CONT="",T1="^GM4($I,PG)",T2="^GM2($I,PG)",T3="^GM1($I,PG)",T4="^GM3($I,PG)",T5="^GM5($I,PG)",T6="^GM6($I,PG)" F %U=T1,T2,T3,T4,T5,T6 I '($D(@%U)) D GENER Q
 S (PAGP,PAG)=1
AFM G:PAGP=PAG AFM1
AFM0 S IPG=PAGP,AD1="W $J("""",$L($TR(LIB,""#"","""")))",AD2="W $J("""",$L(OP))" D AFM2
AFM1 S IPG=PAG,AD1="D WRIT",AD2="W OP" D AFM2 S MSG="Page "_PAG_"/"_$ZP(@T1@("")),DY=YH-1,DX=((XD+XG)\2)-6 X XY W $J("",12) S DX=((XD+XG)\2)-($L(MSG)\2) X XY W MSG G SUI
AFM2 S PY=$O(@T2@(IPG,"")),(DX,PX)=$O(@T2@(IPG,PY,"")),DY=-1 F %U=1:1 S DY=$N(@T1@(IPG,DY)) Q:DY=-1  S DX=PX X XY S LIB=@T1@(IPG,DY) X AD1
 S OP=$S(($D(@MES)#10)=1:$P(@MES,"^",4),1:0) G:'(OP) SUI S LC=-1 F %U=0:0 S LC=$N(^GM5($I,PG,IPG,LC)) Q:LC=-1  S CC=-1 F %U=0:0 S CC=$N(^GM5($I,PG,IPG,LC,CC)) Q:CC=-1  S OP=^GM5($I,PG,IPG,LC,CC),DY=LC,DX=(CC-$L(OP))-2 X XY,AD2
 K AD1,AD2,IPG Q
SUI D EFBM
LEC S TBMOV="^GM2($I,PG,PAG)",DX=PX,DY=PY,T5="^GM6($I,PG,PAG)" X XY D ^%VMOVREV S PX=$X,PY=$Y,XC=$C(X1) G PL:XC="+",PL:XC="=",MS:XC="-",PAG:X1=12,GET:X1=13,CTRL:X1'>26,ALP:XC<1,ALP:XC>9 O 0
NUM R *X1:2 I (X1=-1)!(X1=13) S CONT="",X1=XC G EX
 D TOUCHE^%INCCLAV(X1,.X1)
 G:X1'>32 NUM S XC=XC_$C(X1) G NUM
PAG S PAGP=PAG D EFBM S DX=$P(%EQI,"^",2)+1,DY=$P(%EQI,"^",1) X XY W "Page : " S DX=$X D ^%VLEC I Y1="" D EFBM G AFM
PAGT G:'($D(@T2@(Y1))) PAG I Y1=PAG D EFBM G LEC
 S PAG=Y1 D EFBM G AFM
PL S PAGP=PAG,Y1=PAG+1 G:'($D(@T2@(Y1))) LEC S PAG=Y1 G AFM
MS S PAGP=PAG,Y1=PAG-1 G:'($D(@T2@(Y1))) LEC S PAG=Y1 G AFM
ALP S X1=$C(X1) G:$D(@T3@(PAG,X1)) EX S:'($D(RM)) RM=80 O 0
LP S X2=$ZP(@T3@(PAG,X1)),X2=$O(@T3@(PAG,X2)) G:$E(X2,1,$L(X1))'=X1 LEC S X3=$O(@T3@(PAG,X2)) G EX1:$E(X3,1,$L(X1))'=X1 D ^%VSQUEAK
 R *X:60 D TOUCHE^%INCCLAV(X,.X) G:X'>26 LEC S X1=X1_$C(X) G LP
EX1 S X1=X2 G EX
EX G:'($D(@T3@(PAG,X1))) LEC S YC=@T3@(PAG,X1),XC=$P(YC,"/",2),YC=$P(YC,"/",1),AD=@T4@(PAG,YC,XC) D COM(YC,XC),REV(YC,XC) G FIN
GET S AD=@T4@(PAG,PY,PX) G:X1=13 FIN D COM(PY,PX),REV(PY,PX) G FIN
CTRL S CONT=$C(X1+64)_"^"_@T4@(PAG,PY,PX) G FIN
REV(AY,AX) 
 Q:'($D(%MC))  S DX=$P(%MC,"^",1),DY=$P(%MC,"^",2),LIB=$P(%MC,"^",3,999) X XY D WRIT S DX=AX,DY=AY D REV^%VVIDEO X XY W $TR(^GM2($I,PG,PAG,DY,DX),"#","") X XY D NORM^%VVIDEO
 Q
COM(AY,AX) 
 S EQ=^GM6($I,PG,PAG,AY,AX),%EQI=^GM6($I,PG)
 D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3))
 D ^%VCRIFLD(EQ,$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) S $P(^GM6($I,PG,PAG),"^",4)=$L(EQ) Q
WRIT S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S %A1=$X D:(%X#2)=1 BLD^%VVIDEO D:(%X#2)=0 NORM^%VVIDEO S DX=%A1 X XY
 K %B,%X,%A1,%Y D NORM^%VVIDEO Q
GENER S:DL=0 DL=1 S PAG=1,OP=$S(($D(@MES)#10)=1:$P(@MES,"^",4),1:0) D KILL(PG) S LI="",LGI=0,LMX=(XD-XG)-1,LC=YH,CC=XG+1 S:LC>23 LC=23 S ^GM4($I,PG,PAG,LC)="",%U=""
LU S %U=$O(@MES@(%U)) G:%U="" FLU S %V=@MES@(%U),%W=$P(%V,"^",2,999),%V=$P(%V,"^",1),LGC=(LGI+$L($TR(%V,"#","")))+DL I (LGC>LMX)&(LGI'=0) S LGI=0,CC=XG+1,LC=LC+1 S:LC>YB LC=YH,PAG=PAG+1 S ^GM4($I,PG,PAG,LC)=""
 S ^GM4($I,PG,PAG,LC)=^GM4($I,PG,PAG,LC)_%V_$J("",DL),^GM2($I,PG,PAG,LC,CC)=%V,^GM1($I,PG,PAG,$TR($S(%V["#":$P(%V,"#",2,999),1:%V),"#",""))=LC_"/"_CC,^GM3($I,PG,PAG,LC,CC)=%W,^GM6($I,PG,PAG,LC,CC)=$S($D(@MES@(%U,"COM")):@MES@(%U,"COM"),1:"")
 S LGI=(LGI+$L($TR(%V,"#","")))+DL
 I $D(@MES@(%U,"EQU")) S EQ=@MES@(%U,"EQU") F %Z=1:1 S %EQI=$P(EQ,"^",%Z) Q:%EQI=""  S ^GM1($I,PG,PAG,%EQI)=LC_"/"_CC,^GM5($I,PG,PAG,LC,CC)=%EQI
 S CC=(CC+$L($TR(%V,"#","")))+DL G LU
FLU S LI=$ZP(^GM2($I,PG,1,""))+1 S:LI>23 LI=23 S ^GM6($I,PG)=$S(($D(@MES)#10)=1:$P(@MES,"^",1,3)_"^0",1:LI_"^"_XG_"^"_XD_"^0")
FIN S:'($D(RM)) RM=80 O 0 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q
KILL(NM) 
 K ^GM1($I,NM),^GM2($I,NM),^GM3($I,NM),^GM4($I,NM),^GM5($I,NM),^GM6($I,NM) Q
EFBM S %EQI=^GM6($I,PG),LEQ=$P(%EQI,"^",4) S:LEQ=0 LEQ=(XD-XG)+1 D ^%VCRIFLD($J("",LEQ),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) Q
TEST D ^XGETEST Q

