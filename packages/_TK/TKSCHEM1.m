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

;TKSCHEM1^INT^1^59547,74869^0
TKSCHEM1 ;
 
 
BEG S %R=3,%C=1 W @(TKP),TK("CS")
 S B="" I $D(^TKSCHEMA(S1)) S B=^(S1)
 S (OLD,NEW)=B,%R=4,%C=2 W @(TKP),TK("CS"),TK("LO"),$$^%QZCHW("Dictionary Item: "),TK("HI"),S1
DIS F I=1:1:16 S T=$P($T(@I),";",2,999),P=$P(T,"\",2),%R=$P(T,"\",3),%C=$P(T,"\",4),X=$P(T,"\",5) W @(TKP),TK("HI"),$J(I_") ",4),TK("LO"),X,$E("....................................",1,(35-%C)-$L(X)) D:$P(NEW,"`",P)]"" DSPLY
 
SEL S %R=24,%C=15 W @(TKP),TK("LO"),$$^%QZCHW("Type "),TK("HI"),"E",TK("LO")," to Edit information, ",TK("HI"),"D",TK("LO")," to Delete code, or ",TK("HI"),"Q",TK("LO")," to Quit ",TK("HI") R A#1 S:A?1L A=$C($A(A)-32) I (A="")!("DQE"'[A) W *7,*8 G SEL
 I A="Q" S J=-1 K NEW,OLD,T Q
 I A="D" G DELETE
SELECT S %R=24,%C=15 W @(TKP),TK("CL") S %C=20 W @(TKP),TK("HI"),$$^%QZCHW("Here to Continue ==>")
 X ^TK("ECHO-OFF") F J=1:1:16 S T=$P($T(@J),";",2,999),%R=$P(T,"\",6),%C=$P(T,"\",7),S=1,RX=0 W @(TKP) D RD S:'(S) $P(NEW,"`",P)=X I RX=1 S J=J-2 Q:J<0
 I J<0 K NEW,OLD,T Q
 S %R=24 W @(TKP),$$^%QZCHW("wait")
FILE X ^TK("ECHO-ON") I NEW'=OLD S ^TKSCHEMA(S1)=NEW F I=3,4,7,8,9,10,11 I $P(NEW,"`",I)'=$P(OLD,"`",I) D FIXUP^TKSCHEM2 Q
 K T,NEW,OLD Q
DELETE W @(TKP),TK("CL"),TK("LO"),$$^%QZCHW("Do you want to delete this code ("),TK("HI"),$$^%QZCHW("Y or N"),TK("LO"),") ",TK("HI") R A#1 I A'="","Yy"[A S J=1 K ^TKSCHEMA(S1) W $$^%QZCHW("...deleted") H 1
 S J=1 K NEW,OLD,T Q
 
DSPLY S %R=$P(T,"\",6),%C=$P(T,"\",7) W @(TKP),TK("HI"),$P(NEW,"`",P) Q
SET S P=$P(T,"\",2),LNG=$P(T,"\",9),CHR=$P(T,"\",10),MAX=$P(T,"\",11),MIN=$P(T,"\",12),X=$P(NEW,"`",P),X=X_$J("",LNG-$L(X)),L=1,S=0 Q
PSET F I=1:1 S A=$P($T(@I),";",2,999) Q:A=""  S A(I)=$P(A,"\",2)_"\"_$P($P($P(A,"\",5),"["),"(")
 Q
 
DATA 
1 
2 
3 
4 
5 
6 
7 
8 
9 
10 
11 
12 
13 
14 
15 
16 
RD R B#1 X TK("T") G RB:B="" D:S SET I CHR'="",CHR'[B G ER
 G ER:L>LNG W B S X=$E(X,1,L-1)_B_$E(X,L+1,99),L=L+1 G RD
RB G UP:ZF=TK("UK"),DN:ZF=TK("DK"),TB:ZF=$C(9),CR:ZF=$C(13)
 D:S SET G RT:ZF=TK("RK"),LT:ZF=TK("LK"),IN:ZF=TK("INK"),DL:ZF=TK("DLK"),127:(ZF=$C(127))!(ZF=$C(8)),RE:ZF=TK("CL")
ER W *7 G RD
LT G RD:L'>1 S L=L-1 W TK("L") G RD
RT G RD:L'<LNG W TK("RT") S L=L+1 G RD
127 G:L=1 RD S X=$E(X,1,L-2)_" "_$E(X,L,99),L=L-1 W *8," ",*8 G RD
FUN R A G:A'=1 ER
DN S RX=2 G CR
UP S RX=1 G CR
TB S RX=3
CR I $E(X)=" " S X=$E(X,2,99) G CR
 F L=0:0 S L=$F(X," ",L) Q:L'>0  I $E(X,L,99)?." " S X=$E(X,1,L-2) Q
 G OUT:X=""
OUT K LNG,CHR,L,C,B Q
DL W $E(X,L+1,99)," " S X=$E(X,1,L-1)_$E(X,L+1,99)_" " W @(TKP),$E(X,1,L-1) G RD
IN G:$E(X,LNG)'=" " ER W " ",$E(X,L,LNG-1) S X=$E(X,1,L-1)_" "_$E(X,L,LNG-1) W @(TKP),$E(X,1,L-1) G RD
RE S X=$E(X,0,L-1),CC=%C,%C=(%C+L)-1 W @(TKP),$J("",LNG-L),@(TKP) S %C=CC,L=$L(X) K CC G RD
 ;

