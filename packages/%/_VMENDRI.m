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

;%VMENDRI^INT^1^59547,74035^0
GEMENDRI(PG,XG,XD,YH,MES) 
 K ^GM1($J,PG),^GM2($J,PG),^GM3($J,PG),^GM4($J,PG),^GM6($J,PG) S LI="",LGI=0,LMX=(XD-XG)-1,LC=YH,CC=XG+1 S:LC>23 LC=23 S ^GM4($J,PG,LC)="",%U=""
LU S %U=$O(@MES@(%U)) G:%U="" FLU S %V=@MES@(%U),%W=$P(%V,"^",2,999),%V=$P(%V,"^",1),LGC=(LGI+$L($TR(%V,"#","")))+1 I (LGC>LMX)&(LGI'=0) S LGI=0,CC=XG+1,LC=LC+1,^GM4($J,PG,LC)=""
 S ^GM4($J,PG,LC)=^GM4($J,PG,LC)_%V_" ",^GM2($J,PG,LC,CC)=%V,^GM1($J,PG,$TR($S(%V["#":$P(%V,"#",2,999),1:%V),"#",""))=LC_"/"_CC,^GM3($J,PG,LC,CC)=%W,^GM6($J,PG,LC,CC)=$S($D(@MES@(%U,"COM")):@MES@(%U,"COM"),1:""),LGI=(LGI+$L($TR(%V,"#","")))+1
 I $D(@MES@(%U,"EQU")) S EQ=@MES@(%U,"EQU") F %Z=1:1 S %EQI=$P(EQ,"^",%Z) Q:%EQI=""  S ^GM1($J,PG,%EQI)=LC_"/"_CC
 S CC=(CC+$L($TR(%V,"#","")))+1 G LU
FLU S LI=$ZP(^GM2($J,PG,""))+1 S:LI>23 LI=23 S ^GM6($J,PG)=$S(($D(@MES)#10)=1:@MES_"^0",1:LI_"^"_XG_"^"_XD_"^0")
FIN S:'($D(RM)) RM=80 O 0 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q
 
SEL(PG,AD,CONT) 
 S AD="",CONT="",T1="^GM4($J,PG)",T2="^GM2($J,PG)",T3="^GM1($J,PG)",T4="^GM3($J,PG)",T6="^GM6($J,PG)" F T5=T1,T2,T3,T4,T6 I '($D(@T5)) X ^TOLISRAM Q
 S TBMOV=T2,PY=$O(@T2@("")),(DX,PX)=$O(@T2@(PY,"")),DY=-1 F %U=1:1 S DY=$N(@T1@(DY)) Q:DY=-1  S DX=PX X XY S LIB=@T1@(DY) D WRIT
 S %EQI=^GM6($J,PG) D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2)+1,$P(%EQI,"^",3)-1)
LEC S DX=PX,DY=PY X XY D ^%VMOVREV S PX=$X,PY=$Y,XC=$C(X1) G GET:X1=13,CTRL:X1'>26,ALP:XC<1,ALP:XC>9 O 0
NUM R *X1:1 I (X1=-1)!(X1=13) S CONT="",AD=XC G FIN
 G:X1'>32 NUM S XC=XC_$C(X1) G NUM
ALP S X1=$C(X1) G:$D(@T3@(X1)) EX S:'($D(RM)) RM=80 O 0
LP S X2=$ZP(@T3@(X1)),X2=$O(@T3@(X2)) G:$E(X2,1,$L(X1))'=X1 LEC S X3=$O(@T3@(X2)) G EX1:$E(X3,1,$L(X1))'=X1 D ^%VSQUEAK R *X:60 G:X'>26 LEC S X1=X1_$C(X) G LP
EX1 S X1=X2 G EX
EX S YC=@T3@(X1),XC=$P(YC,"/",2),YC=$P(YC,"/",1),AD=@T4@(YC,XC) D COM(YC,XC),REV(YC,XC) G FIN
GET S AD=@T4@(PY,PX) G:X1=13 FIN D COM(PY,PX),REV(PY,PX) G FIN
CTRL S CONT=$C(X1+64) G FIN
REV(AY,AX) 
 Q:'($D(%MC))  S DX=$P(%MC,"^",1),DY=$P(%MC,"^",2),LIB=$P(%MC,"^",3,999) X XY D WRIT S DX=AX,DY=AY D REV^%VVIDEO X XY W $TR(^GM2($J,PG,DY,DX),"#","") X XY D NORM^%VVIDEO
 Q
COM(AY,AX) 
 S EQ=^GM6($J,PG,AY,AX),%EQI=^GM6($J,PG)
 D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3))
 D ^%VCRIFLD(EQ,$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) S $P(^GM6($J,PG),"^",4)=$L(EQ) Q
WRIT S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S %A1=$X D:(%X#2)=1 BLD^%VVIDEO D:(%X#2)=0 NORM^%VVIDEO S DX=%A1 X XY
 K %B,%X,%A1,%Y D NORM^%VVIDEO Q

