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

;TKSCHEM3^INT^1^59547,74869^0
TKSCHEM3 ;
 
 
BEG S %R=3,%C=1 W @(TKP),TK("CS"),TK("LO") S %R=4,%C=20 F I=1:1:4 S %R=%R+2 W @(TKP),$P($$^%QZCHW("Printer Number,First Code to print,Last Code to print,Detail (Y or N)"),",",I)
 S (FC,LC,DV,TP)="",%R=14,%C=48 W @(TKP),$$^%QZCHW("<-- Here to Continue"),TK("HI")
SEL S %C=42,LNG=10 X ^TK("ECHO-OFF") F I=1:0:4 S V=$P("DV,FC,LC,TP",",",I),X=@V,%R=(I*2)+4,L=1,RX=0 W @(TKP) D RD S @V=X,I=I+$S(RX=1:-1,1:1) Q:I=0
 G END:I=0,END:DV="" D PRINT
END K OC,NC,FC,PE,DV,A,LC,TP X ^TK("ECHO-ON") Q
 
RD R B#1 X TK("T") G RB:B=""
 G ER:L>LNG W B S X=$E(X,1,L-1)_B_$E(X,L+1,99),L=L+1 G RD
RB G UP:ZF=TK("UK"),DN:ZF=TK("DK"),TB:ZF=$C(9),CR:ZF=$C(13)
 G RT:ZF=TK("RK"),LT:ZF=TK("LK"),IN:ZF=TK("INK"),DL:ZF=TK("DLK"),127:ZF=$C(127),RE:ZF=TK("CL")
ER W *7 G RD
LT G RD:L'>1 S L=L-1 W TK("L") G RD
RT G RD:L'<LNG W TK("RT") S L=L+1 G RD
127 G:L=1 RD S X=$E(X,1,L-2)_" "_$E(X,L,99),L=L-1 W *8," ",*8 G RD
DN S RX=2 G CR
UP S RX=1 G CR
TB S RX=3
CR I $E(X)=" " S X=$E(X,2,99) G CR
OUT Q
DL W $E(X,L+1,99)," " S X=$E(X,1,L-1)_$E(X,L+1,99)_" " W @(TKP),$E(X,1,L-1) G RD
IN G:$E(X,LNG)'=" " ER W " ",$E(X,L,LNG-1) S X=$E(X,1,L-1)_" "_$E(X,L,LNG-1) W @(TKP),$E(X,1,L-1) G RD
RE S X=$E(X,0,L-1),CC=%C,%C=(%C+L)-1 W @(TKP),$J("",LNG-L),@(TKP) S %C=CC,L=$L(X) K CC G RD
 
 
PRINT I DV'=0 O DV::0 E  S %R=14,%C=20 W @(TKP),TK("HI"),$$^%QZCHW("Device "),DV,$$^%QZCHW(" is busy - Press RETURN and try later ") R X#1 Q
 S %R=21,%C=34 W @(TKP),TK("RON"),$$^%QZCHW(" Please Wait "),TK("ROF")
 S PE=55 I DV=0 S %R=2,%C=1,PE=23 W @(TKP),TK("CS"),#
 U DV D PR1 U 0
 C:DV'=0 DV K A,PE,TP,DV,FC,LC,C,B Q
 
PR1 K A S C=". . . . . . . . . . . . . . . . . ." D PSET^TKSCHEM1 W !,! D:$D(^TKSCHEMA(FC)) PR2 F I=1:1 S FC=$O(^TKSCHEMA(FC)) Q:FC=""  Q:FC]LC  D PR2
 S A=PE G PR3
PR2 S B=^TKSCHEMA(FC) I (TP["N")!(TP["n") S A=1 W FC,?10,$E($P(B,"`"),1,30),?42,$P(B,"`",3),?66,$P(B,"`",4) G PR3
 S A=17 F I=1:1:26 W "---"
 W !,!,FC,!,! F I=1:1 Q:$D(A(I))=0  W $P(A(I),"\",2),$E(C,$X,38)," ",$P(B,"`",+(A(I))),!
PR3 W ! I DV>0 W:(PE-A)<$Y # Q
 I (PE-A)<$Y W !,!,$$^%QZCHW("Press RETURN") R X W @(TKP),TK("CS"),#,!,! Q
 Q
 
COPY S %R=3,%C=1 W @(TKP),TK("CS"),TK("LO") S %R=4,%C=20 F I=1:1:2 S %R=%R+2 W @(TKP),$P("Old Code Name,New Code Name",",",I)
 S (OC,NC)=""
CP0 S %R=12,%C=48 W @(TKP),$$^%QZCHW("<-- Here to Continue"),TK("HI")
SEL1 S %C=42,LNG=10 X ^TK("ECHO-OFF") F I=1:0:2 S V=$P("OC,NC",",",I),X=@V,%R=(I*2)+4,L=1,RX=0 W @(TKP) D RD S @V=X,I=I+$S(RX=1:-1,1:1) Q:I=0
 G END:I=0,END:OC="" S %R=15,%C=20 W @(TKP),TK("CL") I $D(^TKSCHEMA(OC))=0 W "Old Code not Found - Must enter a valid code" G CP0
 I NC="" W $$^%QZCHW("Enter a New Code name to copy to") G CP0
 W $$^%QZCHW("...done") S ^TKSCHEMA(NC)=^TKSCHEMA(OC) H 2 G COPY

