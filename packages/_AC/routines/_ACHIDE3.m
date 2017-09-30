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

;%ACHIDE3^INT^1^59547,73864^0
ACHIDE3 ;
 
 
 
 
 
 
 
 
OUV 
 N %F,I,P,X1,TEMP,T,X,Y
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DEFOUV") K @(TEMP)
 F I="OUV","EXI","MOD" D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(STO,I),$$CONCAS^%QZCHAD(TEMP,I))
 S DX=0,DY=22 D CLEBAS^%VVIDEO S DY=23,DX=0 X XY W $$^%QZCHW("CTRLA : sortie, CTRLF : stockage, [RETURN] : creation, CTRLG : suppression")
 
 S DY=$O(@STO@("PLAN","")),DX=$O(@STO@("PLAN",DY,""))
DEP D POS^%ACHIDEF(DY,DX) X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,7,13 G:I=X1 @X1
 G ER
B 
 I DY=((@STO@("POS","DERY")+HC)-2) S DY=@STO@("POS","DYH")-1 G DEP
 S DY=DY+1 G DEP
H 
 I DY=(@STO@("POS","DYH")-1) S DY=(@STO@("POS","DERY")+HC)-2 G DEP
 S DY=DY-1 G DEP
G 
 I DX=(@STO@("POS","DXG")-1) S DX=(@STO@("POS","DERX")+LC)-2 G DEP
 S DX=DX-1 G DEP
D 
 I DX=((@STO@("POS","DERX")+LC)-2) S DX=@STO@("POS","DXG")-1 G DEP
 S DX=DX+1 G DEP
1 
 K @(TEMP) Q
6 
 K @STO@("OUV"),@STO@("EXI"),@STO@("MOD")
 D GLOCOP^%QCAGLC(TEMP,STO)
 
 S @STO@("DISTANCE")=0
 G 1
7 
 D SUPO(TEMP,DY,DX) G DEP
13 
 I '($D(@STO@("PLAN",DY))) S P=DY G 131
 I $D(@STO@("PLAN",DY,DX)) G:'($D(@STO@("PLAN",DY,DX,"INVI"))) ER
 S P=DX
130 S P=$ZP(@STO@("PLAN",DY,P)) I P="" S P=DY G 131
 I $D(@STO@("PLAN",DY,P,"INVI")) G 130
 S T="H"
 I $P(@STO@("PLAN",DY,P),"^",5)'=T S P=DY G 131
 D F13(DY,P,T,DY,DX)
 G D
131 S P=$ZP(@STO@("PLAN",P)) G:P="" ER
 I '($D(@STO@("PLAN",P,DX))) G 131
 G:$D(@STO@("PLAN",P,DX,"INVI")) 131
 S T="V"
 I $P(@STO@("PLAN",P,DX),"^",6)'=T G ER
 D F13(P,DX,T,DY,DX)
 G D
 
ER D ^%VSQUEAK G DEP
 
F13(Y,X,T,DY,DX) 
 N N,N1,N2
 D SUPO(TEMP,DY,DX)
 I '($D(@TEMP@("EXI",T,Y,X))) S @TEMP@("EXI",T,Y,X)=""
 S @TEMP@("EXI",T,Y,X)=@TEMP@("EXI",T,Y,X)_DY_"^"_DX_"/"
 
 S N=@STO@("PLAN",Y,X)
 S N1=$P(N,"^",3),N1=$S(N1="":"EXT",1:N1+0)
 S N2=$S(T="H":$P(N,"^",2),1:$P(N,"^",4)),N2=$S(N2="":"EXT",1:N2+0)
 S @TEMP@("MOD",N1,N2,DY,DX)=Y_"^"_X,@TEMP@("MOD",N2,N1,DY,DX)=Y_"^"_X
 S @TEMP@("OUV",DY,DX)=T_"^"_Y_"^"_X_"^"_N1_"^"_N2
 X XY D REV^%VVIDEO X XY W " " D NORM^%VVIDEO
 Q
 
SUPO(TEMP,DY,DX) 
 N T,X,Y,P,N1,N2
 Q:'($D(@TEMP@("OUV",DY,DX)))
 S T=@TEMP@("OUV",DY,DX),Y=$P(T,"^",2),X=$P(T,"^",3)
 S N1=$P(T,"^",4),N2=$P(T,"^",5),T=$P(T,"^",1)
 K @TEMP@("OUV",DY,DX)
 K @TEMP@("MOD",N1,N2,DY,DX),@TEMP@("MOD",N2,N1,DY,DX)
 S P=DY_"^"_DX
 S @TEMP@("EXI",T,Y,X)=$P(@TEMP@("EXI",T,Y,X),P,1)_$P(@TEMP@("EXI",T,Y,X),P_"/",2)
 I @TEMP@("EXI",T,Y,X)="" K @TEMP@("EXI",T,Y,X)
 D G0ON^%VVIDEO X XY W $$CARSPE^%VVIDEO($S(T="H":"q",1:"x"))
 D G0OFF^%VVIDEO Q
 
CHR(Y,X,Y1,X1,S) 
 N P S P=YO_"^"_XO
 I '($D(@STO@("EXI",S,Y,X))) S @STO@("EXI",S,Y,X)=""
 S @STO@("EXI",S,Y,X)=@STO@("EXI",S,Y,X)_P_"/"
 S @STO@("OUV",YO,XO)=S_"^"_Y_"^"_X
 
 S @STO@("EXI",S,Y1,X1)=$P(@STO@("EXI",S,Y1,X1),P,1)_$P(@STO@("EXI",S,Y1,X1),P_"/",2)
 I @STO@("EXI",S,Y1,X1)="" K @STO@("EXI",S,Y1,X1)
 Q
 
 
COROUV(STO,LC,HC) 
 N N,NC1,NC2,S,X,Y,X1,Y1,X2,Y2,XO,YO
 
 Q:'($D(@STO@("OUV")))
 K @STO@("MOD"),@STO@("EXI")
 
 S XO=@STO@("POS","DXG")-1,YO=@STO@("POS","DYH")-1
 
 S Y=""
OUY 
 S Y=$O(@STO@("OUV",Y)) Q:Y=""
 S X=""
OUX 
 S X=$O(@STO@("OUV",Y,X)) I X="" G OUY
 S S=$P(@STO@("OUV",Y,X),"^",1)
 
 F X1=X:-1:XO Q:(X1#(LC-1))=XO
 F Y1=Y:-1:YO Q:(Y1#(HC-1))=YO
 
 I '($D(@STO@("PLAN",Y1,X1))) G SUP
HV 
 
 
 I '($D(@STO@("PLAN",Y1,X1,"INVI"))) G THV
 I @STO@("PLAN",Y1,X1,"INVI")'=S G SUP
 
 
 I S="H" S X1=(X1-LC)+1 G HV
 S Y1=(Y1-HC)+1
 G HV
THV 
 I (X1=X)&(Y1=Y) G SUP
 S N=$P(@STO@("PLAN",Y1,X1),"^",3)
 S X2=$S(S="H":X1,1:(X1-LC)+1),Y2=$S(S="H":(Y1-HC)+1,1:Y1)
 I '($D(@STO@("PLAN",Y2,X2))) G:N="" SUP G STO
 I $P(@STO@("PLAN",Y2,X2),"^",3)=N G SUP
 G STO
 
SUP 
 K @STO@("OUV",Y,X) G OUX
 
STO 
 I '($D(@STO@("EXI",S,Y1,X1))) S @STO@("EXI",S,Y1,X1)=""
 S @STO@("EXI",S,Y1,X1)=@STO@("EXI",S,Y1,X1)_Y_"^"_X_"/"
 
 S N=@STO@("PLAN",Y1,X1)
 S NC1=$P(N,"^",3),NC1=$S(NC1="":"EXT",1:NC1+0)
 S NC2=$S(S="H":$P(N,"^",2),1:$P(N,"^",4)),NC2=$S(NC2="":"EXT",1:NC2+0)
 S (@STO@("MOD",NC2,NC1,Y,X),@STO@("MOD",NC1,NC2,Y,X))=Y1_"^"_X1
 S @STO@("OUV",Y,X)=S_"^"_Y1_"^"_X1_"^"_NC1_"^"_NC2
 G OUX

