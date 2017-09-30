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

;TKNOTE1^INT^1^59547,74869^0
TKNOTE1 ;
 
 
SETUP F I=1:1 S A=$T(BEG+I) Q:A=""  S ^TKNOTE(0,$P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 G ^TKNOTE2
 
BEG 
L S CC=RM,%=$P(@TKND@(TKSB),XF,4),CC=$L(%),TKU="W"
W S %=$P(@TKND@(TKSB),XF,4),TKU="F" I $L(%)>CC S W=$F(%," ",CC) S:'(W) W=$L(%)+2 X:$E(%,W)=" " "F W=W:1 Q:$E(%,W)'="" """ S CC=W S:CC<RM TKU="240"
F W:E="C" *7 S CR=CR+1,CC=1,TKU="U" I CR'>TKE S TKSB=$O(@TKND@(TKSB)),TKU="240"
WRAP S B=$E(%_$J("",99),1,CC-1)_B,NX="",TKU="W1",L=$L($P(B," ",1,$L(B," ")-1))+2
W1 S TKU="W2" I WO="" S NX=$E(B,L,255),B=$E(B,1,L-2),%R=CR,%C=TKSC+L W @(TKP),$J("",(RM-L)+2)
W2 S $P(@TKND@(TKSB),XF,4)=B_$E(%,RM+1,255),TKU="W3" I WO S CC=RM F I=1:1 W *7 R B#1 W:B'="" *8," ",*8 X TK("T") I B="" S TKU="RD1" Q
W3 S CC=1+$L(NX),(%R,CR)=CR+1,B=$O(@TKND@(TKSB)) W:%R'>TKE TKC(%R),NX S:B %=$P(^(B),XF,4) S:'(B) B=((TKSB\10)*10)+10,%="",^(B)=TKSB_XFM S $P(^(B),XF,4)=$E(%_$J("",250-$L(%)),1,1-1)_NX_$E(%,CC,255),TKU="U" I %R'>TKE S TKSB=B,TKU="RD"
M S CR=TKSR,CC=1,TKSB=TOP,TKU="240"
G S %=$P(@TKND@(TKSB),XF,4),TKU="240" I $L(%)<RM S %=$E(%_$J("",99),1,CC-1)_" "_$E(%,CC,255),$P(^(TKSB),XF,4)=% W TKC(CR),%,$J("",RM-$L(%))
H S %=$P(@TKND@(TKSB),XF,4),%=$E(%,1,CC-1)_$E(%,CC+1,255),$P(^(TKSB),XF,4)=%,TKU="240" W TKC(CR),%," "
CEOL S %=$E(%,1,CC-1),$P(@TKND@(TKSB),XF,4)=%,TKU="RD" W TKC(CR),%,$J("",RM-$L(%)),TKC(CR),%
ERR W *7 S TKU="RD"
RD S TKU="RD0" R B#(RM-CC)+1 X TK("T") I B="" S E=$E(TKXX,$F(TKXX,ZF)),TKU="ERR" I E'="",$D(@TKN@(E)) S TKU=E
RD0 S %=$P(@TKND@(TKSB),XF,4),TKU="WRAP" I (CC+$L(B))'>RM S %=$E(%_$J("",99),1,CC-1)_B_$E(%,CC+$L(B),255),$P(^(TKSB),XF,4)=%,TKU="RD1",CC=CC+$L(B)
RD1 S E=$E(TKXX,$F(TKXX,ZF)),TKU="ERR" I E'="",$D(@TKN@(E)) S TKU=E
HELP S TKU="HELP1",B=0,%=^TKNOTE("DEV",TK,3) F %R=TKSR:1:TKE S B=B+1,W=$P($$^%QZCHW("Next Screen,Previous Screen,First Screen,Scroll Up,Scroll Down,Insert Line,Delete Line,Clear to End/Line,Help Screen"),",",B) W TKC(%R),W,$J($P(%,"`",B),RM-$L(W))
HELP1 X ^TK("ECHO-OFF") S TKU="HELP2",%R=TKE+3,%C=TKSC+1 W @(TKP),$J("",RM),@(TKP),$$^%QZCHW("EDIT KEY DEFINITIONS - Press RETURN") R W#1
HELP2 S TKU="HELP3" F %R=TKSR:1:TKE S B=B+1,W=$P($$^%QZCHW("Exit Edit Mode,Jump to Next Word,Home Cursor,Insert Char,Delete Char,Beginning of Line"),",",B-9) W TKC(%R),W,$J($P(%,"`",B),RM-$L(W))
HELP3 R B#1 X ^TKNOTE(7),^TK("ECHO-ON") S TKU="FIRST",TKPN=2
DATE S K=$H+306,Y=((4*K)+3)\1461,D=((((K*4)+3)-(1461*Y))+4)\4,M=((5*D)-3)\153,D=((((5*D)-3)-(153*M))+5)\5,M=M+2,Y=((M\12)+Y)-60,M=(M#12)+1,T=$P($H,",",2)/3600,TM=((((T\1)+11)#12)+1)_":"_$E($J((T#1)*6E-1,0,2),3,4)_$S(T>12:$$^%QZCHW(" PM"),1:$$^%QZCHW(" AM")) S:^TOZE($I,"LG")="FR" DT=D_"/"_M_"/"_Y_"  "_TM S:^TOZE($I,"LG")="GB" DT=M_"/"_D_"/"_Y_"  "_TM K K,Y,M,D,TM,T

