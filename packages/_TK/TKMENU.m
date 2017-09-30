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

;TKMENU^INT^1^59547,74869^0
TKMENU ;
 
 
CLR D:($D(ZID)=0)!($D(TK)=0) INIT
 
HEAD W TK("F"),TK("LO"),*13,ZID(98) S %R=1,%C=80-$L(ZID(97)) W @(TKP),ZID(97),*8,! S A=TK("HL"),A=A_A_A_A X "F I=1:1:20 W A" W TK("HI")
BEG S C=^TKMENU(+(ZID)),X=$P(C,"\"),%R=1,%C=21,I=$L(X) W @(TKP),TK("HI") I I<22 S X=$J(X,($L(X)\2)+11)_$J("",((-($L(X)))\2)+10) F I=1:1:21 W $E(X,I)," "
 E  W $J(X,(38+I)/2),$J("",(38-I)/2)
 W !,!,TK("CS")
 K TM S I=$D(^(+(ZID),0)),I="",Y="O(K)=A_"_TKP,A=TK("HI"),TR=4,TC=0,TM=2
 F K=2:1 S I=$O(^(I)) Q:I=""  S:$E(I)'=TC TC=TC+1,%R=TR,%C=$P(C,"\",TC+10),TM(K)=TM,TM=K S J=^(I),@(Y),OP(K)=$P(J,"\",6),OPT(K)=$P(J,"\"),OPTI($P(J,"\",6))=K_" "_I,%R=%R+1 W O(K),"    ",OP(K),TK("LO"),OPT(K)
 K TC,TR I K=2 S %R=8,%C=24 W @(TKP),$$^%QZCHW("No options are available at this time."),!,! H 2 G BACK
 S @(Y),OP(K)=A_"Q    ",OPT(K)="Quit",OPTI("Q  ")=K,TM(K+1)=TM W O(K),"    ",OP(K),TK("LO"),OPT(K)
 
SELECT D SEL G:ZF=$C(16) LCL^TKMENU1 X ^TK("ECHO-ON") G BACK:X=K S $P(ZID(1),",")=X,X=^TKMENU(+(ZID),$P(OPTI(J)," ",2)) K OP,OPT,O,OPTI
 G PW^TKMENU1:$P(X,"\",3)'=""
 
NEXT K PW,PWD,K,N,S,I,J,O,C,OP,OPT,TM,TG G:"G"[$P(X,"\",8) @$P(X,"\",2) S Y=$S($P(X,"\",8)="X":"X ",1:"D ")_$P(X,"\",2)
 I $P(X,"\",9)]"" S Y=Y_" "_$S($P(X,"\",9):"H "_$P(X,"\",9),1:"D PRESS")
 S %R=TK("R"),%C=1 W @(TKP),TK("CL") X Y
 D:'($D(ZID(98))) INIT1 G TKMENU
NX S J=$P(X,"\",4),ZID=J_","_ZID,ZID(1)="2,"_ZID(1) G BEG
NA S (%R,%C)=3 W @(TKP),TK("CS") S %R=10,%C=25 W @(TKP),$$^%QZCHW("Option not currently available") H 2 G BEG
BACK I ZID["," S ZID=$P(ZID,",",2,99),ZID(1)=$P(ZID(1),",",2,99) G BEG
EXIT W TK("F") X ^TK("TERM-OFF"),^TK("WRAP-ON") K O,OP,OPT Q
 
INIT G:$D(TK) INIT1 D:$D(^TK($I))=0 INIT^TKDEV S TK=^TK($I),TK("T")=^("TERMST"),TKP=^(0,TK,"P"),TK(1)=0 F TKI=0:1:5 I $D(^(TKI)) X ^(TKI)
 K TKI W TK("SET") X ^TK("TERM-ON"),^TK("WRAP-OFF")
INIT1 I '($D(ZID)) S ZID=1,ZID(1)=2,ZID(98)=$P(^TKMENU,"`") I $P(^TKMENU,"`",3)'="" X $P(^TKMENU,"`",3)
DATE S K=$H+306,Y=((4*K)+3)\1461,D=((((K*4)+3)-(1461*Y))+4)\4,M=((5*D)-3)\153,D=((((5*D)-3)-(153*M))+5)\5,M=M+2,Y=((M\12)+Y)-60,M=(M#12)+1,ZID(97)=$P("January February March April May June July August September October November December"," ",M)_" "_D_", 19"_Y K K,Y,M,D
 Q
 
SEL S I="\",%R=24,%C=10 W @(TKP),TK("LO"),"[ Type ",TK("HI"),$$^%QZCHW("LETTER"),TK("LO"),$$^%QZCHW(" or Move selector with "),TK("HI"),$$^%QZCHW("ARROWS"),TK("LO"),$$^%QZCHW(" and Press "),TK("HI"),$$^%QZCHW("RETURN "),TK("LO"),"]"
 S X=+(ZID(1)),A=TK("HI"),B=TK("LO"),TG="" X ^TK("ECHO-OFF")
S1 F X=X:0:K W O(X),"==> ",OP(X),A,OPT(X) R C#1 X TK("T") W O(X),"    ",OP(X),B,OPT(X) D:C?1NA S3 G:$C(13,16)[ZF S2 I C']" " S TG="",X=$S(ZF=TK("UK"):X-1,ZF=TK("LK"):"*"_X,ZF=TK("RK"):"*"_X,1:X+1) D:$E(X)="*" S4 I X<2 S X=K
 S X=2 G S1
S2 S J=OP(X) Q
S3 S:C?1L C=$C($A(C)-32) S TG=TG_C,J=$O(OPTI(TG)) I $E(J,1,$L(TG))=TG S X=+(OPTI(J)) S:'(^TK("MENU")) ZF=$C(13) Q
 I $L(TG)>1 S TG="" G S3
 S TG="" Q
S4 S X=$E(X,2,3),C=$O(TM(X)),J=X-TM(C) I ZF=TK("LK") S C=TM(C)
S5 I ZF=TK("LK") S:C=2 C=K+1,J=J-1 S:J<0 J=K S C=TM(C),X=C+J Q:X<$O(TM(C))  G S5
 S:C>K C=2,J=J+1 S X=C+J,C=$O(TM(C)) Q:X<C  S:J>K J=0,C=2 G S5
 
PRESS S %R=TK("R"),%C=60 W @(TKP),$$^%QZCHW("Press RETURN") R *X Q

