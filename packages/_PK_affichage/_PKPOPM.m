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

;%PKPOPM^INT^1^59547,73874^0
%PKPOPM(MAT,CARAC,MODIF) ;;04:35 PM  29 Sep 1993; ; 29 Sep 93  4:44 PM
 N GY,TB,%CY,POSINX,Y,NBLIG,NBCOL,LGCOL,DEBUT
 N CA,TD,TE,TA,TB,TM,TG,TH,TI,TJ,TW,TR,TP,TT,TF,TC,ZF,TRO,TX
 N LARGCOL
 
 S GY=$$TEMP^%SGUTIL
 S GY2=$$TEMP^%SGUTIL
 S TB=$$TEMP^%SGUTIL
 S DEBUT=$$TEMP^%SGUTIL
 S NBLIG=@CARAC@("NBL"),NBCOL=@CARAC@("NBC")
 S %CY=0,SER=0,POSINX=1
 
 F %J=1:1:NBCOL S LARGCOL(%J)=$S($D(@CARAC@("LGCOL",%J)):@CARAC@("LGCOL",%J),1:0) I LARGCOL(%J)=0 F %I=1:1:NBLIG S V=@MAT@(%I,%J) S:$L(V)>LARGCOL(%J) LARGCOL(%J)=$L(V)
 
 F %J=1:1:NBCOL F %I=1:1:NBLIG S V=@MAT@(%I,%J),%CY=%CY+1,@GY2@(%CY)=V,V=V_$E("                                                    ",1,LARGCOL(%J)-$L(V)) S:$D(@CARAC@("NOMODL",%I))!$D(@CARAC@("NOMODC",%J)) V=V_"*" S @GY@(%CY)=V
 S Y=@CARAC@("CG")_","_@CARAC@("LH")_"\THRLY"_$S(MODIF:"",1:"W")_"\"_NBCOL_"\"_@CARAC@("TITRE")_"\\"
 G BEG
 
 
 
 
 
 
 
 
 
 
 
 
 
BEG 
 D:$D(PK)=0 INIT^%PKDEV I $P(Y,"\",5)'="",$D(^%PKPAINT($P(Y,"\",5),0,^%PK($I),1)) F TI=1:1 Q:$D(^(TI))=0  W ^(TI)
 
 S CTR=""
 S TC=$P(Y,"\",3),TP=$P(Y,"\",2) G:TP["Y" Y
 S TB=$P(Y,"\",6),TF=$L(TB,","),TD=((TF/TC)+9E-1)\1 F TI=1:1:TF S @GY@(TI)=$P(TB,",",TI),TJ(((TI-1)\TD)+1,(80+(SER*2))-$L(@GY@(TI)))=""
 G SET
Y I $D(@GY@(0)) S TA=@GY@(0)
 E  F TA=1:1 I $D(@GY@(TA))=0 S TA=TA-1 Q
 S TI=0,TD=((TA/TC)+9E-1)\1 S:TD["." TD=(TD+9E-1)\1
 F TJ=1:1:TC S TG=TI+TD S:TG>TA TG=TA F TI=TI+1:1:TG S TJ(TJ,(80+(2*SER))-$L($P(@GY@(TI),"*")))=""
SET I $O(TJ(TC,""))="" S TC=TC-1 G Y
 S TF=+(Y),TT=$P($P(Y,"\",1),",",2) I TT="" S TT=$S(TP["C":%R,TP["T":1,1:(PK("R")-TD)-1)
COL S TW=0,%C=TF+1 F TJ=1:1:TC S TW=(TW+82)-$O(TJ(TJ,"")),TC(TJ)=%C,%C=(TF+1)+TW
 D CHGPK^%PKUTIL
 I %C>PK("C") S TF=1 G COL:(TW+2)<PK("C") W $$^%QZCHW("too wide") S CTR=-1 G END
 
 K TJ S:TW#2 TW=TW+1 S @($S(TP["R":"TRO=PK(""RON""),TR=PK(""ROF"")",1:"TRO=PK(""ROF""),TR=PK(""RON"")")) W $S(TP["H":PK("HI"),1:PK("LO")),TRO
 S %C=TF I TP["L" S TE=PK("VL")_$J("",TW)_PK("VL"),TM=PK("HL")_PK("HL") D:TP["T" 1,2,3 D:TP'["T" 3,4,1 G LIST
 S TE=$J("",TW+2) I TP["T" F %R=TT:1:(TT+TD)+1 W @(PKP),TE
 E  F %R=(TT+TD)+1:-1:TT W @(PKP),TE
LIST I $L($P(Y,"\",4)) S %C=(((TW-$L($P(Y,"\",4)))\2)+%C)+1,%R=TT W @(PKP),$P(Y,"\",4)
 S TM=0,TE="TA="_PKP,TH=""
 F TJ=1:1:TC S %C=TC(TJ),%R=TT F TM=TM+1:1:TM+TD Q:$D(@GY@(TM))=0  D MKTB
 G SUITE
MKTB S %R=%R+1,@(TE),TX=$S(SER:"",1:" ")_@GY@(TM),CA=$E(TX,$L(TX))
 S:CA'="*" @TB@(TM)=TA_TX_$S(SER:"",1:" "),TH=TH_$$MAJ^%VMINUSC($E(TX,1,15))_"\",@DEBUT@(TM)=TA_$S(SER:"",1:" ")
 S:CA="*" TX=$P(TX,"*"),TH=TH_"\"
 W TA,TX
 Q
SUITE 
 S TA=TI-1,TI=TD S:TI>TA TI=TA G:TP["W" WRITONLY
 I TH?."\" S %C=%C+$L(TX) S:$D(LNG)=0 LNG=(TW-$L(TX))-1 X ^%PKREAD G SEL1
SEL S TM=^%PK("TERMST"),TG=" ",TI=TC*TD,ZF="",X=+($O(@TB@(0)))
 
SEL0 G:X>TI SEL00
 W TR,@TB@(X)
 R TE#1 X TM
 G:ZF=$C(7) CTR7
 
 W TRO,@TB@(X)
 I $A(ZF)=0 G:"+=_-?"[TE SEL3 G SEL2
 S POSINX=1
 G:ZF=$C(13) CTR13
 S @($S(ZF=PK("UK"):"X=X-1",ZF=PK("RK"):"X=X+TD",ZF=PK("LK"):"X=X-TD",1:"X=+$O(@TB@(X))"))
 D TOUCHE^%INCCLAV($A(ZF),.TE)
 I (TE<27)&(TE>0) G END
 D:$D(@TB@(X))=0 TT
 G SEL0
SEL00 S X=$O(@TB@(0))
 G SEL0
 
SEL1 W PK("ROF") S %C=TF G:TP["D" END S TE=$J("",TW+2) I TP'["T" F %R=TT:1:(TT+TD)+1 W @(PKP),TE
 E  F %R=(TD+1)+TT:-1:TT W @(PKP),TE
 S POSINX=1
 G SEL0
 
 
CTR13 S X=X+TD G:$D(@TB@(X)) SEL0
CTR13B S X=$S(X>TI:(X#TD)+1,1:X+TD) G:$D(@TB@(X))=0 CTR13B G SEL0
 
 
CTR7 S @TB@(X)=@DEBUT@(X)_$E("                       ",1,$L(@GY@(X)))_$P(@TB@(X),@GY@(X),2)
 S (@GY2@(X),@GY@(X))=""
 
 G SEL0
 
TT I ZF=PK("UK") S X=$S(X<1:TI,1:X-1) G:$D(@TB@(X))=0 TT Q
 I ZF=PK("RK") S X=$S(X>TI:(X#TD)+1,1:X+TD) G:$D(@TB@(X))=0 TT Q
 I ZF=PK("LK") S X=$S(X<1:((TD+X)-1)+TI,1:X-TD) G:$D(@TB@(X))=0 TT Q
 S X=$O(@TB@(0)) Q
 
SEL3 G:TG'=" " SEL2
 I TE="?" S CTR="?" G END
 I "=+"[TE S CTR="+" G END
 S CTR="-" G END
 
SEL2 
 
 S @TB@(X)=@DEBUT@(X)_$E(@GY@(X),1,POSINX-1)_TE_$E(@GY@(X),POSINX+1,$L(@GY@(X)))_$P(@TB@(X),@GY@(X),2,999)
 S @GY2@(X)=$E(@GY2@(X),1,POSINX-1)_TE_$E(@GY2@(X),POSINX+1,$L(@GY2@(X)))
 S @GY@(X)=$E(@GY@(X),1,POSINX-1)_TE_$E(@GY@(X),POSINX+1,$L(@GY@(X)))
 S POSINX=POSINX+1
 G SEL0
 S TG=TG_TE,TJ=$F(TH,TG) I TJ S X=$L($E(TH,1,TJ-1),"\") G SEL0
 I $L(TG)>2 S TG=" " G SEL2
 S TG=" " G SEL0
 
WRITONLY I (+($P(TP,"W",2)))=0 G END
 H +($P(TP,"W",2)) G SEL1
 
1 S %R=TT W @(PKP),PK("TLC") F TI=2:2:TW W TM
 W PK("TRC") Q
2 F %R=TT+1:1:TT+TD W @(PKP),TE
 Q
3 S %R=(TT+TD)+1 W @(PKP),PK("BLC") F TI=2:2:TW W TM
 W PK("BRC") Q
4 F %R=TT+TD:-1:TT+1 W @(PKP),TE
 Q
 
END W PK("Z")
 D RETMOD^%PKUTIL
 S %CY=0
 F %J=1:1:NBCOL F %I=1:1:NBLIG S %CY=%CY+1,@MAT@(%I,%J)=@GY2@(%CY)
 K @(GY),@(TB),@(GY2),@(DEBUT)
 Q
 
 
TST N MAT,CAR
 S MAT=$$TEMP^%SGUTIL,CAR=$$TEMP^%SGUTIL
 S @MAT@(1,1)="a",^(2)="a1",^(3)="a2"
 S @MAT@(2,1)="b",^(2)="b1",^(3)="b2"
 S @MAT@(3,1)="c",^(2)="c1",^(3)="c2"
 S @CAR@("LGCOL",1)=8,@CAR@("LGCOL",2)=6,@CAR@("LGCOL",3)=18
 S @CAR@("CG")=10,^("LH")=10,^("NBL")=3,^("NBC")=3,@CAR@("NOMODC",1)=""
 S @CAR@("TITRE")="titre"
 D ^%PKPOPM(MAT,CAR,1)
 D ^%VZEAVT("vu")
 D ^%PKPOPM(MAT,CAR,0)
 F i=1:1:3 F j=1:1:3 W !,i," ",j," ____",@MAT@(i,j)_"____"
 Q
 ;

