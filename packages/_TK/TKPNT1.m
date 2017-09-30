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

;TKPNT1^INT^1^59547,74869^0
TKPNT1 ;
 
 
STORE W TK("F"),$$^%QZCHW("Please wait - this may take a couple of minutes"),!,!,$$^%QZCHW("Storing drawing...."),TK("CL") S (A,B)=9E-1 F I=1:1 S B=$O(@TKG@(GR,B)) Q:B=""  K ^(B)
 S J=1 F I=0:1:15 S E(I)=J,D(I)="",J=J+20
 F I=1:1 S A=$O(@TKG@("~"_$I,A)) Q:A=""  S B="",AA=$C(A+31) W "." F J=1:1 S B=$O(@TKG@("~"_$I,A,B)) Q:B=""  S C=^(B),D=$P(C,"`"),E=$P(C,"`",2) D @(E#2)
 F I=0:1:15 I D(I)'="" S @TKG@(GR,E(I))=D(I)
 G 3
1 S D(E)=D(E)_AA_$C(B+31,D+32) I $L(D(E))>240 S @TKG@(GR,E(E))=D(E),E(E)=E(E)+1,D(E)=""
 Q
0 S D(E)=D(E)_AA_$C(B+31)_D I $L(D(E))>240 S @TKG@(GR,E(E))=D(E),E(E)=E(E)+1,D(E)=""
 Q
3 S T=""
CONV S T=$O(^TK(0,T)) G:T="" DONE
 D CONVERT G CONV
DONE D DATE^TKPAINT S $P(@TKG@(GR),"\",3)=DT
 S A=" I $D("_TKG_"("""_GR_""",0,^TK($I),1)) F I=1:1 Q:$D(^(I))=0  W ^(I)"
 W !,!,$$^%QZCHW("Your drawing has been stored in "),TKG,"(""",GR,""").  To use this",!,"drawing - Insert the following code in your routine with a ""ZI A"".",!,!,A,!,!,"Note:  This line is currently in the variable A.",!
EXIT X ^TK("ECHO-ON") K @TKG@("~"_$I),C,OC,R,T,TX,Y,YY,X,Z Q
 
CONVERT S D=1,%R=9E-1,NXT="",B=^TK(0,T,"SET") W !,$$^%QZCHW("Compiling "),T,"..." K @TKG@(GR,0,T)
 S X="Y="_^TK(0,T,"P") F I=1:1:11 S A=$P("TLC,HL,TRC,VL,BRC,BLC,X,TI,RI,BI,LI",",",I),C(I)=^(A)
 S E=^TK(0,T,"Z"),B=B_E S:E'[(^("HI")) E=E_(^("HI")),B=B_(^("HI")) F I=1:40:400 I $D(@TKG@(GR,I)) S A=$P(";LO;RON;LO,RON;UO;UO,LO;UO,RON;UO,LO,RON",";",(I\40)+1) D XX,TEXT S B=B_E
 F I=21:40:400 I $D(@TKG@(GR,I)) S A=$P(";LO;RON;LO,RON;UO;UO,LO;UO,RON;UO,LO,RON",";",(I\40)+1) D XX,LINE S B=B_E
 I B'="" S @TKG@(GR,0,T,D)=B K B,CT,D,Y,E,A Q
TEXT W "." F J=I:1:I+19 I $D(@TKG@(GR,J)) S M=^(J) F L=1:3:$L(M) S K=$E(M,L,L+2) D:$E(K,1,2)'=NXT XY S B=B_$E(K,3),NXT=$E(K)_$C($A(K,2)+1) I $L(B)>230 D CONT
 Q
LINE W "." F J=I:1:I+19 I $D(@TKG@(GR,J)) S M=^(J) F L=1:3:$L(M) S K=$E(M,L,L+2) D:$E(K,1,2)'=NXT XY S B=B_C($A(K,3)-32),NXT=$E(K)_$C($A(K,2)+1) I $L(B)>230 D CONT
 Q
CONT S @TKG@(GR,0,T,D)=B,B="",D=D+1 Q
XY S %R=$A(K)-31,%C=$A(K,2)-31,@(X),B=B_Y Q
XX S Y="" Q:A=""  F J=1:1:$L(A,",") S Y=Y_^TK(0,T,$P(A,",",J))
 S B=B_Y D:$L(B)>230 CONT Q

