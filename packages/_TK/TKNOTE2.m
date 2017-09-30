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

;TKNOTE2^INT^1^59547,74869^0
TKNOTE2 ;
 
 
SETUP F I=1:1 S A=$T(BEG+I) Q:A=""  S ^TKNOTE(0,$P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 Q
UND D INIT^TKDEV:'($D(^TK($I))),UND^TKDEV4:'($D(^TK(1E-1,TK,1))) Q:$D(^TK(1E-1,TK,1))=0  S X=$C(13)_"F"_$C(9)_"9"_$C(127)_"R" F I=1:1:4 S X=X_TK($P("UK,DK,RK,LK",",",I))_$E("ABCD",I)
 S B=^TK(1E-1,TK,2),E=^(5),Y="" F I=1:1:25 S:I=16 B=^(3),E=^(6) S D=$P(B,"`",I) I D'="" S A=$P("E2;E3;E6;U;N;I;J;E4;;E5;;;;;;;;;E1;W;;M;G;H;L",";",I) I A'="" S C="C=$C("_D_")",@(C),X=X_C_A,Y=Y_$P(E,"`",I)_"`"
 S ^TKNOTE("DEV",TK,1)=^TK(1E-1,TK,1),^TKNOTE("DEV",TK,4)=X_$C(8)_"R",^(3)=Y K Y,C,E,X Q
 
BEG 
D S CC=CC-1,TKU="D1" I CC'<1 W TK("L") S TKU="RD"
D1 S CC=RM,CR=CR-1,TKU="PREV" I CR'<TKSR S TKSB=+(@TKND@(TKSB)),TKU="240"
9 S CC=((CC+10)/10)*10,TKU="240" I CC>RM S TKU="F"
B S CR=CR+1,TKU="NEXT" I CR'>TKE S TKSB=$O(@TKND@(TKSB)),TKU="RD" W TK("D")
A S CR=CR-1,TKU="PREV" I CR'<TKSR S TKSB=+(@TKND@(TKSB)),TKU="RD" W TK("U")
C S CC=CC+1,TKU="F" I CC'>RM W TK("RT") S TKU="RD"
E S %=$P(@TKND@(TKSB),XF,4),E=$E(TKXX,$F(TKXX,ZF)+1),TKU=$P("END,NEXT,PREV,CEOL,HELP,FIRST,ERR,ERR,ERR",",",E)
R S TKU="RD" I CC>1 W *8,*32,*8 S %=$P(@TKND@(TKSB),XF,4),%=$E(%,1,CC-2)_" "_$E(%,CC,255),CC=CC-1,$P(^(TKSB),XF,4)=%
U S TKU="NEXT"
N S TKU="PREV"
DEL S B=BOT,BOT=$O(@TKND@(B)) S:BOT="" BOT=((B\10)*10)+10,^(BOT)=B_XFM
230 S %R=TKE+1,%C=(TKSC+RM)-1,TKU="240" S:TKSB="" TKSB=TOP,CR=TKSR W @(TKP),"    " W:$O(@TKND@(BOT))'="" @(TKP),"-->" S %C=TKSC+1,%R=TKSR-1 W @(TKP),"   " W:TKPN>1 @(TKP),"<--"
240 S %R=CR,%C=(TKSC+CC)+1,TKU="RD" W @(TKP)
J S A=+(@TKND@(TKSB)),B=BOT,BOT=$O(@TKND@(B)) S:BOT="" BOT=((B\10)*10)+10,^(BOT)=B_XFM K ^(TKSB) S TKSB=$O(@TKND@(TKSB)),$P(^(TKSB),XF)=A,TKU="240" S:CR=TKSR TOP=TKSB X @TKN@("CURR")
I S TKU="ERR" I CR<TKE S I=$O(@TKND@(TKSB)),B=I-TKSB,B=I-$S(B>10:10,B>1:1,B>1E-1:1E-1,B>1E-2:1E-2,B>1E-3:1E-3,B>1E-4:1E-4,B>1E-5:1E-5,1:1E-6),TKU="I1" S:TKSB=B TKU="REN"
I1 S I=$O(@TKND@(TKSB)),^(B)=TKSB_XFM_$P(^(TKSB),XF,4),$P(^(I),XF)=B,$P(^(TKSB),XF,4)="",BOT=+(^(BOT)) X @TKN@("CURR") S TKU="230"
PREV S TKU="FIRST" I TKPN>8 S TKPN=((TKPN+TKSR)-TKE)-1,TKSB="",BOT=+(@TKND@(TOP)),TKU=230 S:CR<TKSR TKSB=BOT,CR=TKE F %R=TKE:-1:TKSR S TOP=+(^(TOP)),B=$P(^(TOP),XF,4) W TKC(%R),B,$J("",RM-$L(B))
FIRST S TKU="240",CR=TKSR I TKPN'=1 S TKPN=1,TKU="230",CC=1,CR=TKSR,(TKSB,BOT)="",TOP=$O(@TKND@("")) F %R=TKSR:1:TKE S A=BOT,BOT=$O(@TKND@(BOT)) S:BOT="" BOT=(A+10)\1,^(BOT)=A_XFM S B=$P(^(BOT),XF,4) W TKC(%R),B,$J("",RM-$L(B))
NEXT S TKU="230",TKPN=((TKPN+TKE)-TKSR)+1,TKSB="" S:CR'>TKE CC=1 S CR=TKSR F %R=TKSR:1:TKE S A=BOT,BOT=$O(@TKND@(BOT)) S:BOT="" BOT=(A+10)\1,^(BOT)=A_XFM S:%R=TKSR TOP=BOT S B=$P(^(BOT),XF,4) W TKC(%R),B,$J("",RM-$L(B))
CURR S A=TKSB F %R=CR:1:TKE S B=$P(@TKND@(A),XF,4) W TKC(%R),B,$J("",RM-$L(B)) S A=$O(^(A))
END S TKU=2,J=9999,TKI=4

