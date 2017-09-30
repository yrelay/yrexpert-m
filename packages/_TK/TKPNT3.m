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

;TKPNT3^INT^1^59547,74869^0
TKPNT3 ;
 
 
BEG X ^TK("ECHO-OFF") S VD=0,ON=5,A=1,%R=RS,%C=CS,Y=0 D STATUS F J=1:0:99 S B=A R Z#1 D @$S(Z'="":"CHAR",1:"B") W CUR,%R," C",%C," ",@(TKP)
 W VIDOF K VIDON,VIDOF,VD,VM,ON,Y,Z,TC,ZF,XX,CT X ^TK("ECHO-ON") Q
 
B X TC S A=$E(XX,$F(XX,ZF)) G:A @(A+ON) S A=B G VIDEO:ZF=$C(22),FORCE:ZF=$C(1),ERASE:ZF=$C(5),VIDEO:ZF=$C(23) S:ZF=$C(24) J=100 S:ZF=$C(18) J=100 S:ZF=$C(13) %C=CS Q
1 S ON=5,VD=(VD\2)*2 D STATUS Q
2 S Y=$E(22253,B) D CHK S:%C>CS %C=%C-1 W CT(Y) Q
3 S Y=$E(22261,B) D CHK S:%C<CE %C=%C+1 W CT(Y) Q
4 S Y=$E(41344,B) D CHK S:%R<RE %R=%R+1 W CT(Y) Q
5 S Y=$E(46544,B) D CHK S:%R>RS %R=%R-1 W CT(Y) Q
 
6 S ON=0,VD=((VD\2)*2)+1 D STATUS Q
7 S:%C>CS %C=%C-1 Q
8 S:%C<CE %C=%C+1 Q
9 S:%R<RE %R=%R+1 Q
10 S:%R>RS %R=%R-1 Q
 
CHK I $D(@TKG@("~"_$I,%R,%C)),(+(^(%C)))'=Y,$P(^(%C),"`",2)#2 D F1 S ^(%C)=YY_VM,Y=YY,AA=%R_","_%C Q
 S ^(%C)=Y_VM D:$D(AA) F2 Q
F1 S C="" S:$D(@TKG@("~"_$I,%R-1,%C)) C=1 S:$D(@TKG@("~"_$I,%R+1,%C)) C=C_2 S:$D(@TKG@("~"_$I,%R,%C-1)) C=C_3 S:$D(^(%C+1)) C=C_4 S YY=$S(C=134:10,C=123:9,C=124:11,C=234:8,C=1234:7,C=13:5,C=14:6,C=23:3,C=12:4,C=34:2,1:1) Q
F2 S Z=%R_","_%C,%R=+(AA),%C=$P(AA,",",2) K AA D F1 W @(TKP),CT(YY) S ^(%C)=YY_VM,%R=+(Z),%C=$P(Z,",",2) W @(TKP) Q
CHAR S:Z="`" Z="'" W Z I Z=" ",VD<4 K @TKG@("~"_$I,%R,%C) S A=1 S:%C<CE %C=%C+1 Q
 S @TKG@("~"_$I,%R,%C)=Z_"`"_((VD\2)*2),A=1 S:%C<CE %C=%C+1 Q
 
STATUS S VM="`"_VD W VIDOF,TK("LO"),STL,$$^%QZCHW("Drawing: "),TK("HI"),GR,"   ",TK("LO"),$$^%QZCHW("Video Mode: "),TK("HI")
 S C=$S(VD#2:"LINE  ",1:"TEXT  ")_$S((VD\2)#2:"",1:"HIGH  ")_$S((VD\4)#2:"REVERSE  ",1:" ")_$S((VD\8)#2:"UNDERLINE",1:"") W C,$J("",40-$L(C)),@(TKP),VIDON Q
VIDEO X ^TK("ECHO-ON") W VIDOF,STL,$$^%QZCHW("Enter Video Attributes (R,H,U) ") S VD=(VD#2)+2 R C X ^TK("ECHO-OFF") F I=1:1:$L(C) S J=$E(C,I) S:J?1L J=$C($A(J)-32) S VD=VD+$S(J="R":4,J="H":-2,J="U":8,1:0)
 S VIDON=$S((VD\2)#2:TK("LO"),1:"")_$S((VD\4)#2:TK("RON"),1:"")_$S((VD\8)#2:TK("UO"),1:"") D STATUS Q
 
FORCE W *7 F I=1:1 R Z#1 X TC Q:$A(ZF)'=1  S Y=(I#11)+1 W CT(Y),@(TKP) S @TKG@("~"_$I,%R,%C)=Y_"`"_(((VD\2)*2)+1),B=""
 W *7 G B
ERASE Q:$D(@TKG@("~"_$I,%R,%C))=0  K B S Z=%R_","_%C,B(Z)="" F I=1:1:4 S C=$P("1,2,6,7,8,10,11;1,3,4,7,8,9,11;4,5,6,7,9,10,11;2,3,5,7,8,9,10",";",I) F J=1:1:7 S X(I,$P(C,",",J))=""
 D E1 S %R=+(Z),%C=$P(Z,",",2),B="" W @(TKP) K Z,X Q
E1 S B=$O(B("")) Q:B=""  S %R=+(B),%C=$P(B,",",2) W @(TKP)," " K B(B),@TKG@("~"_$I,%R,%C)
E2 S %R=%R-1,%C=%C-1 F I=1:1:4 S X=%R+$E(1021,I),Y=%C+$E("0112",I) I $D(@TKG@("~"_$I,X,Y)),$D(X(I,+(^(Y)))) S B(X_","_Y)=""
 G E1
 ;

