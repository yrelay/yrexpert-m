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
;! HL002 ! HL     ! 04/09/09 ! S ($X,$Y)=0 pour éviter un saut de ligne       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VQUIKM2^INT^1^59547,74036^0
GELECMEN(AD,CONT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CONFIRM
 S CONFIRM=0,AD=""
 G ENTR
 
 
CONF(AD,CONT,CONFIRM) 
ENTR N %A1,%B,%EQI,%U,%XY,%Y,CHP,CP,DX,DY,EQ,LIB,PX,PY,T1,T2,T3,T4,T5,T6,X1,X2,X3,XC,YC
 S AD="",CONT=""
 S T1=$$CONCAS^%QZCHAD(%GF,4),T2=$$CONCAS^%QZCHAD(%GF,2)
 S T3=$$CONCAS^%QZCHAD(%GF,1),T4=$$CONCAS^%QZCHAD(%GF,3)
 S T5=$$CONCAS^%QZCHAD(%GF,5),T6=$$CONCAS^%QZCHAD(%GF,6),TBMOV=T2,PY=$O(@T2@(""))
 O $I S PX=$O(@T2@(PY,"")),DY=-1 F %U=1:1 S DY=$N(@T1@(DY)) Q:DY=-1  S DX=PX X XY S LIB=@T1@(DY) D WRIT
 S %EQI=@%GF@(6) D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2)+1,$P(%EQI,"^",3)-1)
 
LEC S CP=0
LEC1 S %LLI="",DX=PX,DY=PY,T5=T6 X XY D ^%VMOVREV S PX=$X,PY=$Y G GET:X1=13,CTRL:X1'>26
 I '($D(CONFIRM)) N CONFIRM S CONFIRM=0
 G:CONFIRM ERRLEC
 G CHAIN:X1=47
 S X1=$C(X1) G:$D(@T3@(X1)) EX S:'($D(RM)) RM=80 O 0
 
 
 
 
 
 
 
 
 
LP I CP=1 S CHP=CHP_X1 G LEC1
 S X2=$ZP(@T3@(X1)),X2=$O(@T3@(X2)) G:$E(X2,1,$L(X1))'=X1 LEC S X3=X2,%XY=@T3@(X3) F %U=0:0 S X3=$O(@T3@(X3)) G:X3="" EX1 G EX1:$E(X3,1,$L(X1))'=X1 Q:@T3@(X3)'=%XY
 
 
 
 D ^%VSQUEAK R *X:60 G LEC:X'>26 S X1=X1_$C(X) G LP
 
ERRLEC D ^%VSQUEAK
 G LEC
 
CHAIN S CP=1,CHP="" G LEC1
EX1 S X1=X2 G EX
 
 
 
EX S YC=@T3@(X1),XC=$P(YC,"/",2),YC=$P(YC,"/",1),AD=@T4@(YC,XC) D COM(YC,XC),REV(YC,XC) G FIN
 
 
 
 
GET I CP=1 S CP=0,X1=CHP G LP
 S AD=@T4@(PY,PX) D COM(PY,PX),REV(PY,PX) G FIN
 
 
CTRL S %LLI="",CONT=$C(X1+64) G FIN
FIN S:'($D(RM)) RM=80 O 0
 K %Z,%EQI,EQ,LI,LGI,LMX,CC,LC Q %LLI
 
REV(AY,AX) 
 Q:'($D(%MC))  S DX=$P(%MC,"^",1),DY=$P(%MC,"^",2),LIB=$P(%MC,"^",3,999) X XY D WRIT S DX=AX,DY=AY,%LLI=$TR(@%GF@(2,DY,DX),"#","") D BLD^%VVIDEO,UDL^%VVIDEO X XY W %LLI X XY D NORM^%VVIDEO
 Q
 
COM(AY,AX) 
 S EQ=@%GF@(6,AY,AX),%EQI=@%GF@(6)
 D ^%VCRIFLD($J("",$P(%EQI,"^",4)),$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3))
 D ^%VCRIFLD(EQ,$P(%EQI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) S $P(@%GF@(6),"^",4)=$L(EQ) Q
 
WRIT
 ;HL002 S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S %A1=$X D:(%X#2)=1 BLD^%VVIDEO D:(%X#2)=0 NORM^%VVIDEO S DX=%A1 X XY
 S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W %Y S ($X,$Y)=0 S %A1=$X D:(%X#2)=1 BLD^%VVIDEO D:(%X#2)=0 NORM^%VVIDEO S ($X,$Y)=0 S DX=%A1 X XY
 K %B,%X,%A1,%Y D NORM^%VVIDEO
 Q






