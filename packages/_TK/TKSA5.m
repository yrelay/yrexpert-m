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

;TKSA5^INT^1^59547,74869^0
TKSA5 ;
 
 
 D INIT
HEAD S %R=1,%C=2 W TK("F"),TK("LO"),@(TKP),ZID(98) S %R=1,%C=80-$L(ZID(97)) W @(TKP),ZID(97),*8,! S A=TK("HL"),A=A_A_A_A X "F I=1:1:20 W A" W TK("HI")
BEG S X=$P(TKM(+(ZID)),"\"),%R=1,%C=21,I=$L(X) W @(TKP),TK("HI") I I<18 S X=$J(X,($L(X)\2)+11)_$J("",((-($L(X)))\2)+10) F I=1:1:21 W $E(X,I)," "
 E  W $J(X,(38+I)/2),$J("",(38-I)/2)
 W !,!,TK("CS") S TR=4,TC=28,I=$P(TKM(+(ZID)),"\",9) S:I'="" TC=$P(I,",",2) S I="",O="\",%C=TC,%R=TR+2
 F K=2:1 S I=$O(TKM(+(ZID),I)) Q:I=""  S J=TKM(+(ZID),I),X=$P(J,"\",6),O=O_X_"\",OPT(K)=I,OP(K)=$P(J,"\") W @(TKP),TK("HI"),X,TK("LO"),OP(K) S %R=%R+1
 S O=O_"Q    ",OP(K)="Quit" W @(TKP),TK("HI"),"Q    ",TK("LO"),OP(K)
 
SELECT D ^TKSA6,SEL X ^TK("ECHO-ON") G BACK:J=K S X=TKM(+(ZID),OPT(J)),$P(ZID(1),",")=J,S=$P(X,"\",3) K OP,OPT,O
NEXT K K,N,I,O,OP,OPT I $P(X,"\",2)="" G BEG
NX S J=$P(X,"\",4),ZID=J_","_ZID,ZID(1)="2,"_ZID(1) G BEG
NA S (%R,%C)=3 W @(TKP),TK("CS") S %R=10,%C=25 W @(TKP),$$^%QZCHW("Option not currently available") H 2 G BEG
BACK I ZID["," S ZID=$P(ZID,",",2,99),ZID(1)=$P(ZID(1),",",2,99),S=$P(TKM(+(ZID)),"\",3) G BEG
EXIT W TK("F") K O,OP,OPT Q
 
INIT S ZID=1,ZID(1)=2,ZID(98)=$$^%QZCHW("Your Name Here")
DATE S K=$H+306,Y=((4*K)+3)\1461,D=((((K*4)+3)-(1461*Y))+4)\4,M=((5*D)-3)\153,D=((((5*D)-3)-(153*M))+5)\5,M=M+2,Y=((M\12)+Y)-60,M=(M#12)+1,ZID(97)=$P("January February March April May June July August September October November December"," ",M)_" "_D_", 19"_Y K K,Y,M,D
 S S=0,TKM(1)="SAMPLE MENU\NX\0\1",TKM(1,"A")="Heading Description\NX\\2\\H    \",TKM(1,"B")="Body of the Menu\NX\\3\\B    \",TKM(1,"C")="Methods of Selection\NX\\4\\M    \",TKM(1,"S")="Security Options\NX\\5\\S    \"
 S TKM(2)=TKM(1,"A"),TKM(2,"A")="Your Name\\1\\\Y    \",TKM(2,"B")="Menu Title\\2\\\M    \",TKM(2,"C")="Date\\3\\\D    \"
 S TKM(3)=TKM(1,"B"),TKM(3,"A")="Pointer System\\4\\\P    \",TKM(3,"B")="Option Letter\\5\\\O    \",TKM(3,"C")="Highlighting\\6\\\H    \"
 S TKM(4)=TKM(1,"C"),TKM(4,"A")="Arrows\\7\\\A    \",TKM(4,"B")="Letters\\8\\\L    \",TKM(4,"C")="Space Key\\9\\\S    \",TKM(4,"D")="Return Key\\10\\\R    \"
 S TKM(5)=TKM(1,"S"),TKM(5,"A")="Password Protection\\11\\\P    \",TKM(5,"B")="Access Code\\12\\\A    \",TKM(5,"C")="Device Security\\13\\\D    \"
 Q
SEL S I="\",%R=14,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("[ Type "),TK("HI"),$$^%QZCHW("LETTER"),TK("LO"),$$^%QZCHW(" or Move selector with "),TK("HI"),$$^%QZCHW("ARROWS"),TK("LO"),$$^%QZCHW(" and Press "),TK("HI"),$$^%QZCHW("RETURN "),TK("LO"),"]" S %C=1,%R=7 W @(TKP),*13
 S J=+(ZID(1)),%C=TC-4,N=K,B=$C(8,8,8,8)_"    "_TK("HI") X ^TK("ECHO-OFF")
A1 S %R=TR+J W @(TKP),TK("HI"),"==> ",$P(O,"\",J),OP(J),@(TKP),"==> "
A2 R C#1 X TK("T") S A=ZF I C'="",C'=" " S:C?1L C=$C($A(C)-32) G A4
 S I="\" I A=TK("UK") W B,$P(O,"\",J),TK("LO"),OP(J) S J=$S(J>2:J-1,1:N) G A1
 I (C=" ")!(A=TK("DK")) W B,$P(O,"\",J),TK("LO"),OP(J) S J=$S(J<N:J+1,1:2) G A1
 Q:A=$C(13)  W *7 G A2
A4 I O'[(I_C) W *7 S I="\" G A2
 S I=I_C,A=$L($E(O,1,$F(O,I)),"\") I $L(O,I)=2 S I="\"
 W B,$P(O,"\",J),TK("LO"),OP(J) S J=A G A1

