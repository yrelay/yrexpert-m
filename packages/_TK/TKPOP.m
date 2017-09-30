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

;TKPOP^INT^1^59547,74869^0
TKPOP ;
 
 G BEG
 
 
 
 
 
 
 
 
 
 
BEG D:$D(TK)=0 INIT^TKDEV I $P(Y,"\",5)'="",$D(^TKPAINT($P(Y,"\",5),0,^TK($I),1)) F TI=1:1 Q:$D(^(TI))=0  W ^(TI)
 S TC=$P(Y,"\",3),TP=$P(Y,"\",2) G:TP["Y" Y
 S TB=$P(Y,"\",6),TF=$L(TB,","),TD=((TF/TC)+9E-1)\1 F TI=1:1:TF S Y(TI)=$P(TB,",",TI),TJ(((TI-1)\TD)+1,80-$L(Y(TI)))=""
 G SET
Y I $D(Y(0)) S TA=Y(0)
 E  F TA=1:1 I $D(Y(TA))=0 S TA=TA-1 Q
 S TI=0,TD=((TA/TC)+9E-1)\1 S:TD["." TD=(TD+9E-1)\1
 F TJ=1:1:TC S TG=TI+TD S:TG>TA TG=TA F TI=TI+1:1:TG S TJ(TJ,80-$L(Y(TI)))=""
SET I $O(TJ(TC,""))="" S TC=TC-1 G Y
 S TF=+(Y),TT=$P($P(Y,"\",1),",",2) I TT="" S TT=$S(TP["C":%R,TP["T":1,1:(TK("R")-TD)-1)
COL S TW=0,%C=TF+1 F TJ=1:1:TC S TW=(TW+82)-$O(TJ(TJ,"")),TC(TJ)=%C,%C=(TF+1)+TW I %C>TK("C") S TF=1 G COL:(TW+2)<TK("C") W $$^%QZCHW("too wide") Q
 X ^TK("TERM-ON"),^TK("WRAP-OFF"),^TK("ECHO-OFF")
 K TJ S:TW#2 TW=TW+1 S @($S(TP["R":"TRO=TK(""RON""),TR=TK(""ROF"")",1:"TRO=TK(""ROF""),TR=TK(""RON"")")) W $S(TP["H":TK("HI"),1:TK("LO")),TRO
 S %C=TF I TP["L" S TE=TK("VL")_$J("",TW)_TK("VL"),TM=TK("HL")_TK("HL") D:TP["T" 1,2,3 D:TP'["T" 3,4,1 G LIST
 S TE=$J("",TW+2) I TP["T" F %R=TT:1:(TT+TD)+1 W @(TKP),TE
 E  F %R=(TT+TD)+1:-1:TT W @(TKP),TE
LIST I $L($P(Y,"\",4)) S %C=(((TW-$L($P(Y,"\",4)))\2)+%C)+1,%R=TT W @(TKP),$P(Y,"\",4)
 S TM=0,TE="TA="_TKP,TH="" F TJ=1:1:TC S %C=TC(TJ),%R=TT F TM=TM+1:1:TM+TD Q:$D(Y(TM))=0  S %R=%R+1,@(TE),TX=" "_Y(TM) S:TX'["*" TB(TM)=TA_TX_" ",TH=TH_$E(TX,1,5)_"\" S:TX["*" TX=$P(TX,"*"),TH=TH_"\" W TA,TX S ^pospop($J,TM)=%R_"~"_%C
 S TA=TI-1,TI=TD S:TI>TA TI=TA G:TP["W" WRITONLY
 I TH?."\" S %C=%C+$L(TX) S:$D(LNG)=0 LNG=(TW-$L(TX))-1 X ^TKREAD G SEL1
SEL S TM=^TK("TERMST"),TG=" ",TI=TC*TD,ZF="",X=+($O(TB(0)))
SEL0 F X=X:0:TI W TR,TB(X) R TE#1 X TM G:ZF=$C(13) SEL1 W TRO,TB(X) G:TE?1NA SEL2 S @($S(ZF=TK("UK"):"X=X-1",ZF=TK("RK"):"X=X+TD",ZF=TK("LK"):"X=X-TD",1:"X=+$O(TB(X))")) D:$D(TB(X))=0 TT
 S X=$O(TB(0)) G SEL0
SEL1 W TK("ROF") S %C=TF G:TP["D" END S TE=$J("",TW+2) I TP'["T" F %R=TT:1:(TT+TD)+1 W @(TKP),TE
 E  F %R=(TD+1)+TT:-1:TT W @(TKP),TE
END W TK("Z") X ^TK("TERM-OFF"),^TK("WRAP-ON"),^TK("ECHO-ON") K TD,TE,TA,TB,TM,TG,TH,TI,TJ,TW,TR,TP,TT,TF,TC,ZF,TRO,TX Q
TT I ZF=TK("UK") S X=$S(X<1:TI,1:X-1) G:$D(TB(X))=0 TT Q
 I ZF=TK("RK") S X=$S(X>TI:(X#TD)+1,1:X+TD) G:$D(TB(X))=0 TT Q
 I ZF=TK("LK") S X=$S(X<1:((TD+X)-1)+TI,1:X-TD) G:$D(TB(X))=0 TT Q
 S X=$O(TB(0)) Q
SEL2 S TG=TG_TE,TJ=$F(TH,TG) I TJ S X=$L($E(TH,1,TJ-1),"\") G SEL0
 I $L(TG)>2 S TG=" " G SEL2
 S TG=" " G SEL0
WRITONLY I (+($P(TP,"W",2)))=0 G END
 H +($P(TP,"W",2)) G SEL1
 
1 S %R=TT W @(TKP),TK("TLC") F TI=2:2:TW W TM
 W TK("TRC") Q
2 F %R=TT+1:1:TT+TD W @(TKP),TE
 Q
3 S %R=(TT+TD)+1 W @(TKP),TK("BLC") F TI=2:2:TW W TM
 W TK("BRC") Q
4 F %R=TT+TD:-1:TT+1 W @(TKP),TE

