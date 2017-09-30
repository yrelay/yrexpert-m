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

;TKSCHEM2^INT^1^59547,74869^0
TKSCHEM2 ;
 
 
CLR S %R=3,%C=1,G="^TKSCHEMA" W @(TKP),TK("CS")
ENTER S %R=22,%C=10 W @(TKP),TK("LO"),"Enter Starting ",TK("HI"),"Code",TK("LO"),": ",TK("HI"),TK("CS") S %C=33,X="" X ^TKREAD
 S S=X G END:X=""
DISP S S1=S,%R=4,%C=10 W @(TKP),"Code      Description" S %C=58 W @(TKP),"Global Reference"
 S (T,K)=0,%R=6,%C=1 I $O(@G@(0))="" S %R=10,%C=26 W @(TKP),$$^%QZCHW("[ No Codes Found - Press RETURN ] ") R A#1 S S1="Q" G CLR
D1 W @(TKP),TK("CS") S A="Z="_TKP F %R=%R:1:20 S S1=$O(^(S1)) Q:S1=""  S K=K+1,%C=4,@(A),Y=Z,X=^(S1),%C=58,@(A),A(K)=Y_"      "_S1_$J("",10-$L(S1))_$P(X,"`")_Z_$P(X,"`",3)_Y,O(K)=S1 W TK("LO"),A(K),TK("HI"),"   ",K
 I $D(A)<10 S S=0 G DISP
DIS1 S M=S1 S:$O(@G@(M))="" M="" D SEL G:J="B" DISP I J="M" S T=T+1,%R=6,K=0,%C=1 K A G D1
 G ENTER:J="N"
 I J S S1=O(J) G END
 S S1=J
END K X,G,N,I,A,E,O,S,T,Y,F,C,J,K,H,M Q
SEL S %R=22,%C=10,I="",N="NQ" W @(TKP),TK("LO"),"Type ",TK("HI") I M'="" W "M",TK("LO")," for more, " S N=N_"M"
 I T W "B",TK("LO")," for Beginning, " S N=N_"B"
 W TK("HI"),"N",TK("LO")," for a New Starting Point, ",TK("HI"),"Q",TK("LO")," to Quit" S %R=24,%C=10 W @(TKP),TK("LO"),"[ To Edit Code: Type ",TK("HI"),"NUMBER",TK("LO")," or Move selector and Press ",TK("HI"),"RETURN ]" S %C=1,%R=7 W @(TKP),*13
 S J=1,%C=25 X ^TK("ECHO-OFF")
A1 S %R=4+J,X=A(J) W TK("HI"),X,"==>",J
A2 R C#1 X TK("T") I C'="" S:A?1L A=$C($A(A)-32) I N[C S J=C G DONE
 I ZF=TK("UK") W TK("LO"),X,TK("HI"),"   ",J,*-1 S J=$S(J>1:J-1,1:K) G A1
 I (C=" ")!(ZF=TK("DK")) W TK("LO"),X,"   ",TK("HI"),J,*-1 S J=$S(J<K:J+1,1:1) G A1
 Q:ZF=$C(13)  I C'?1NA W *7 G A2
 I $D(A(I_C))=0 S I="" G A2:$D(A(C))=0
 W TK("LO"),X,"   ",TK("HI"),J S (J,I)=I_C G A1
DONE X ^TK("ECHO-ON") Q
 
FIXUP Q:$D(^TKSCHEMA(0,S1))=0  S (%R,%C)=3 W @(TKP),TK("CS"),TK("F"),$$^%QZCHW("wait....updating screens that use this code"),! K (S1,TK,TKP) S SCRN=""
 F J=0:0 S SCRN=$O(^TKSCHEMA(0,S1,SCRN)) Q:SCRN=""  W TK("F"),?10,SCRN S SCR=$P(SCRN,"-"),SN=$P(SCRN,"-",2) D FIX1
 K SCRN,SCR,SN,A Q
FIX1 S A="^"_S1 I $D(^TKDISP(SCR,SN,A))=0 K ^TKSCHEMA(0,S1,SCRN) Q
 S ST=^(A),B=^TKSCHEMA(S1) D COPY
 S ^TKDISP(SCR,SN,A)=ST G COMPILE^TKSCHEMA
 
COPY F I=1:1:12 S $P(ST,"`",$P("2,4,5,6,16,10,15,21,9,25,17,12",",",I))=$P(B,"`",$P("3,4,7,8,9,10,11,5,13,14,15,16",",",I))
 Q

