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

;TKMENE1^INT^1^59547,74869^0
TKMENE1 ;
 
INIT D:$D(TK)=0 INIT^TKDEV S P=TK("P") K O S OP="^TKMENU" G:$D(@OP) BEG S @OP="`",@OP@(1)="MAIN MENU\NX\",SB=1,col=1 G DISP
BEG D HEAD,PREFIX Q:SB=""
DISP S %R=1,%C=1 W TK("F"),@(TKP),TK("LO"),$$^%QZCHW("Prefix: "),TK("HI"),SB,TK("LO"),"   Column# ",TK("HI"),col
 S %R=3,%C=1 W @(TKP),TK("LO"),$$^%QZCHW("Subs  Code   Description                         Routine       Password DO Pause")
 S I=(col*100)-1E-3,%R=1,%C=40 W @(TKP),TK("HI"),$P(@OP@(SB),"\"),TK("CL") S %R=4,%C=1 W @(TKP),TK("HI"),TK("CS")
D1 S I=$O(@OP@(SB,I)) G D2:(I="")!($E(I)>col) S %R=%R+1,%C=1,X=^(I),O(I)=%R W @(TKP),TK("HI"),$J(I,3),TK("LO"),")   ",TK("HI"),$P(X,"\",6) F J=1,2,3,8 S %C=$P("14,50,65,,,,,73",",",J) W @(TKP),$P(X,"\",J)
 G D1
D2 S LR=%R+1
 
SELECT S %R=23,%C=1 W @(TKP),TK("LO"),"Selection (",TK("HI"),(col*100)+1,"-",((col+1)*100)-1,TK("LO"),") : ",TK("CL") S %C=50 W @(TKP),$$^%QZCHW("(Type ? for HELP with input)")
S1 S %R=TK("R")-1,%C=23,X="",LNG=3,CHR="?1234567890" X ^TKREAD I X="" D CENTER G BEG
 I X["?" D ^TKMENE2 G DISP
 I $S(X'?3N:1,((col*100)-1)'<X:1,1:((col+1)*100)'>X) W *7,$$^%QZCHW("  INVALID") H 2 W @(TKP),$J("",30) G S1
 I $D(O(X))=0 S O(X)=LR,%R=LR,%C=1 W @(TKP),$J(X,3),TK("LO"),")",TK("HI")
 S %R=O(X),S=X,STR="" S:$D(@OP@(SB,S)) STR=^(S)
 S RX=0 F J=1:1:6 S I=$E("612389",J),%C=$P("14,50,65,,,8,,73,76",",",I),X=$P(STR,"\",I),LNG=$P("35,30,8,,,3,,1,1",",",I) W @(TKP),$J("",$L(X)),@(TKP),X X ^TKREAD S:I=6 X=X_$J("",5-$L(X)) S $P(STR,"\",I)=X,J=$S(RX=4:J-2,1:J)
 I $P(STR,"\",4),$P(STR,"\",2)'="NX" K @OP@($P(STR,"\",4)) S $P(STR,"\",4)=""
 I $P(STR,"\",2)="NX",$P(STR,"\",4)="" D NEW S $P(STR,"\",4)=X,@OP@(X)=STR
 I STR'?.P S @OP@(SB,S)=STR S:%R=LR LR=LR+1 G SELECT
 K @OP@(SB,S),O(S) W *13,TK("CL") G SELECT
 
NEW F X=1:1 I $D(@OP@(X))=0 Q
 Q
PREFIX D:$P(@OP@(1),"\",10)="" CONV S %R=4,%C=20 W @(TKP),TK("LO"),"MENU GLOBAL: ",TK("HI"),OP,TK("LO"),!,!,?8,"  #      Description                          Reference",?70,$$^%QZCHW("# Columns"),TK("HI"),!,!
 K O S I=1,A=0,SB=""
PA S A=$O(@OP@(A)) I A'="" S A(I)=A W ?10,I,?15,$P(^(A(I)),"\"),?53,OP,"(",A,")",?75,$S($P(^(A(I)),"\",10):$P(^(A(I)),"\",10),1:1),! S I=I+1 G PA
 S I=I-1 S:'(I) I=1
 S %R=24,%C=5 W @(TKP),TK("LO"),$$^%QZCHW("Selection: (1 to "),I,") ",TK("HI")
 S %R=24,%C=45 W @(TKP),TK("LO"),$$^%QZCHW("Column# "),TK("HI"),1
PS S %R=24,%C=24+$L(I),X=SB,LNG=5,RX="" X ^TKREAD S SB=X I ("14"[RX)!(X="") S SB="" Q
 I $D(A(SB))=0 W *7 G PS
 S SB=A(X) I '($D(@OP@(SB))) S col=1
 E  S col=$P(^(SB),"\",10) S:'(col) col=0 S X=1,RX="",LNG=1,CHR=$E(123456789,1,col+1),%C=53 X ^TKREAD G:"14"[RX PS S col=X
 K O,I,A Q
 
CENTER 
 S (tot,totcol)=0,coltot=$P(@OP@(SB),"\",10) S:coltot<col coltot=col F coln=1:1:coltot D COL S tot=tot+J
 S $P(@OP@(SB),"\",9,10)=tot_"\"_coltot,S=(TK("C")-totcol)\(coltot+1),J=S F coln=1:1:coltot S $P(@OP@(SB),"\",10+coln)=J,J=(J+S(coln))+S
 K col,coln,coltot,tot,S,totcol Q
 
COL S I=(coln*100)-1,S=0 F J=0:1 S I=$O(@OP@(SB,I)) Q:(I="")!($E(I)'=coln)  S A=$L($P(^(I),"\")) S:A>S S=A
 S:coltot=coln J=J+1 S S=S+5,S(coln)=S,totcol=totcol+S Q
END K O,OP,SB,I,A,B,C,D,E,J,LR,Z Q
HEAD S A="TKMENU EDITOR" W TK("F"),TK("LO"),*13 S %R=1,%C=80-$L(A) W @(TK("P")),A,*8,! S A=TK("HL"),A=A_A_A_A X "F I=1:1:20 W A" W TK("HI")
 Q
CONV S %R=15,%C=20 W @(TKP),$$^%QZCHW("PLEASE WAIT - Updating ^TKMENU global")
 S (SB,B)="" K ^TKMENU1 S ^TKMENU1=^TKMENU
U1 S SB=$O(^TKMENU(SB)) G:SB="" T0 S ^TKMENU1(SB)=^TKMENU(SB),C=105
U2 S B=$O(^TKMENU(SB,B)) G:B="" U1 S ^TKMENU1(SB,C)=^(B),C=C+5 W "." G U2
T0 K ^TKMENU S (SB,B)="",^TKMENU=^TKMENU1
T1 S SB=$O(^TKMENU1(SB)) G:SB="" T4 S ^TKMENU(SB)=^TKMENU1(SB)
T2 S B=$O(^TKMENU1(SB,B)) I B'="" S ^TKMENU(SB,B)=^(B) W "." G T2
 S col=1 D CENTER G T1
T4 S %R=4 W @(TKP),TK("CS") Q

