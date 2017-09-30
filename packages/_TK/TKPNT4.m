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

;TKPNT4^INT^1^59547,74869^0
TKPNT4 ;
 
 
BEG I $D(TITLE) S %R=1,%C=20 W @(TKP),$J("",35) S %C=(80-$L(TITLE))\2 W @(TKP),TK("HI"),TITLE K TITLE
 S S=0 I $D(@TKG)=0 S %R=12,%C=20 W TK("F"),@(TKP),$$^%QZCHW("There are no Screens in this Directory"),!,! H 3 S GR="" G END
DISP S GR=S,%R=4,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("Set          Description") S %C=52 W @(TKP),$$^%QZCHW("Created    Last Modified")
 S (B,K)=0,%R=6,%C=1
D1 W @(TKP),TK("CS") S A=$D(@TKG@(0)),A="Z="_TKP
 F %R=%R:1:20 S GR=$O(^(GR)),X="" Q:GR=""  Q:GR["~"  S:$D(^(GR))#10 X=^(GR) S K=K+1,%C=6,@(A),Y=Z,%C=52,@(A),W=Z,%C=64,@(A),A(K)=Y_"   "_GR_$J("",11-$L(GR))_$P(X,"\")_W_$P(X,"\",2)_Z_$P(X,"\",3)_Y,O(K)=GR W TK("LO"),A(K),TK("HI")
DIS1 S M=GR S:$O(@TKG@(M))="" M="" D SEL G:J="B" DISP I J="M" S B=B+1,%R=6,K=0,%C=1 K A G D1
 I J S GR=O(J) G END
 I J="Q" S GR="" G END
 S GR=J
END K X,G,N,I,A,E,O,S,Y,F,C,J,K,H,M Q
SEL S %R=22,%C=10,I="",N="Q" W @(TKP),TK("LO"),"[ Type ",TK("HI") I M'="" W "M",TK("LO")," for more, " S N=N_"M"
 I B W "B",TK("LO")," for Beginning, " S N=N_"B"
 W TK("HI"),"Q",TK("LO")," to Quit ]" S %R=24,%C=20 W @(TKP),TK("HI"),"Select Drawing ",TK("LO"),"by moving arrow and Press ",TK("HI"),"RETURN" S %C=1,%R=7 W @(TKP),*13
 S J=1,%C=25 X ^TK("ECHO-OFF")
A1 S %C=6,%R=5+J,X=O(J) W @(TKP),TK("HI"),"==>",X,@(TKP)
A2 R C#1 X TK("T") I C'="",N[C S J=C Q
 I ZF=TK("UK") W TK("LO"),"   ",X S J=$S(J>1:J-1,1:K) G A1
 I (C=" ")!(ZF=TK("DK")) W TK("LO"),"   ",X S J=$S(J<K:J+1,1:1) G A1
 Q:ZF=$C(13)  I C'?1NA W *7 G A2
 I $D(A(I_C))=0 S I="" G A2:$D(A(C))=0
 W TK("LO"),"   ",X S (J,I)=I_C G A1
 
COPY S Y="5\BHL\1\COPY DRAWING OPTION\\copying "_GR_"*,*,New Drawing Name  - *       ",PAT="X?1.8UNP",X="",%R=6 D ^TKPOP G:X="" ^TKPAINT S NGR=X
 I $D(@TKG@(NGR)) S Y="12\BHL\1\\\Drawing is already defined - Press RETURN*",%R=6 D ^TKPOP G COPY
 S %R=4,%C=1 W @(TKP),TK("CS"),$$^%QZCHW("  wait while copying..") S (A,B,C,D,E)="",OLD=TKG_"(GR)",NEW=TKG_"(NGR)"
 I ($D(@OLD)#10)=1 W "." S @NEW=@OLD
B S A=$O(@OLD@(A)) G:A="" ^TKPAINT I ($D(^(A))#10)=1 W "." S @NEW@(A)=^(A)
C S B=$O(@OLD@(A,B)) G:B="" B I ($D(^(B))#10)=1 W "." S @NEW@(A,B)=^(B)
D S C=$O(@OLD@(A,B,C)) G:C="" C I ($D(^(C))#10)=1 W "." S @NEW@(A,B,C)=^(C)
E S D=$O(@OLD@(A,B,C,D)) G:D="" D I ($D(^(D))#10)=1 W "." S @NEW@(A,B,C,D)=^(D)
 G E

