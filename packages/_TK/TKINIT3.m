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

;TKINIT3^INT^1^59547,74869^0
TKINIT3 ;
 
 W !,!
BEG W !,!,"PG&A Toolkit" S X="Operating System Parameters" W ?79-$L(X),X,! X "F I=1:1:26 W ""===""" W "="
LIST W !,!,$$^%QZCHW("The following Operating Systems are already defined:"),!,! S J=0,X=5 F A=1:1 S N=$T(OS+A) Q:N=""  I $P(N," ")]"" S J=J+1,J(J)=$P(N," ") W ?X,J," - ",$P(N," ") S X=X+15 I X>70 W ! S X=5
 S J=J+1 W ?X,J,$$^%QZCHW(" - other"),!,!
LIST1 W $$^%QZCHW("Type the number of your Operating System or "),J,$$^%QZCHW(" if yours is not listed."),!,"  > " R N G EXIT:N="",EDIT:N=J I (N<1)!(N'<J) W "  ???",! G LIST1
 S (^TK("OS"),OS)=J(N) W !,!,$$^%QZCHW("Operating System defined as - "),OS,!,!
 
 S B=$P($T(OS)," ",2,999),E=0,N=$P($T(@OS)," ",2,999)
 F C=1:1 S A=$P(B,"|",C) Q:A=""  S D=$P(N,"|",C) S:D="_" E=E+1,N=$P($T(@OS+E)," ",2,999),C=C-1 I D'="_" S ^TK(A)=D I OS="DTM",D[" " X "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 G EXIT
EDIT W !,!,$$^%QZCHW("Enter the MUMPS code to implement these functions (press RETURN to skip) :"),!
 F C=1:1 S B=$P($T(FUNC+C),";",2,9) Q:B=""  S SB=$P(B,";",2),A=$P(B,";"),O=$S($D(^TK(SB)):^(SB),1:"") D ENTER
 G OK
ERASE X "F J=J:-1:1 W $C(8,32,8)" Q
 
ENTER W !,?5,SB,!,$P(B,";",3),"  " S X=O D DISP W "> "
E1 R E I E="" W $C(8,8,32) Q
 I E="-" W *8,$$^%QZCHW("Delete") K ^TK(SB) S J=$X-47,CG=1 D ERASE Q
 I E="?" W !,?20,$S($P(B,";",5)'="":$P(B,";",5),1:$$^%QZCHW("Enter the ASCII sequence in decimal separated by commas")) G ENTER
 S F=0,X="" I A'=2 F I=1:1 S J=$P(E,",",I) Q:J=""  S:'((J?1N.N)&(J<133)) F=1 S X=X_$C(J)
 I F W "  ???",*7 S J=$L(E)+6 H 2 D ERASE W " " G E1
SS S:"12"[A X=E S ^TK(SB)=X,J=$X-47 D ERASE,DISP Q
 
DISP W ?47 Q:X=""  I 12'[A W "$C(" X "F I=1:1:$L(X) S D=$E(X,I) W:I>1 "","" W $A(D)" W ")" Q
 I A=1 W "(",X,")" Q
 W X Q
 
FUNC 
 
 
 
 
 
 
 
 
 
 
OK W !,!,?5,$$^%QZCHW("O.K.  (Yes)> ")
O1 R *X G EDIT:X=78 I (X=13)!(X=89) W !,! G EXIT
 W "  ???",*7 H 2 S J=6 D ERASE G O1
EXIT K NC,CN,CT,C,XC,Q,D,SB,X,O,A,B,I,J,N,E,F Q
 
OS W *
PSM W *
DSM W *
 W *
 W *
M11 W *
CCSM W *
DTM W *
MSM W *
 W *
 W *

