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

;TKDEV^INT^1^59547,74869^0
TKDEV ;
 
 K TK D:$D(^TK)=0 ^TKINIT
BEG W !,!,"PG&A Toolkit" S X=$$^%QZCHW("Device Definition Options") W ?79-$L(X),X,! X "F I=1:1:26 W ""===""" W "="
 W !,!,$$^%QZCHW("Do you want to - "),!,!,?5,$$^%QZCHW("1. Define a terminal type for a particular I/O line"),!,?5,$$^%QZCHW("2. Edit device parameters."),!,?5,$$^%QZCHW("3. Edit function key definitions."),!,!
WHICH W " ? " R A Q:A=""  I ((A'=1)&(A'=2))&(A'=3) W " ???",! G WHICH
 W ! G DEV:A=1 I A=3 D ^TKDEV3 W TK("F") G TKDEV
NAME W *13,$$^%QZCHW("Enter Device name (""*"" = wildcard, ? for List) > ") R DV G BEG:DV="",LIST:DV["?" I $L(DV)>15 W $$^%QZCHW("  15 character maximum"),*7 H 2 S I=$L(DV)+22 D ERASE G NAME
 I DV'["*" G NEW:$D(^TK(0,DV))=0,EDIT
 S DV=$P(DV,"*"),N=$O(^TK(0,DV)) I (N="")!($E(N,1,$L(DV))'=DV) W " ???" D ERASE G NAME
 I $E($O(^(N)),1,$L(DV))'=DV S DV=N G EDIT
 G LIST
NEW W $$^%QZCHW(" New Device? (No)> ") R *Y S I=$S(Y=89:"es",Y=78:"o",Y=13:"No",1:"  ???") W I I Y'=89 H 2 S I=($L(DV)+$L(I))+20 D ERASE G NAME
EDIT W !,!,"PG&A Toolkit" S X="*** "_DV_" ***" W ?(80-$L(X))/2,X S X=$$^%QZCHW("Device Definition") W ?79-$L(X),X,! X "F I=1:1:26 W ""===""" W "="
 S H="" S:$D(^TK(0,DV,"V")) H=^("V") W !,!,$$^%QZCHW("Is this device a Video terminal or a Printer? (V or P) > ") I H'="" S H=$E("PV",H+1) W "(",H,") "
SEQ1 R E#1 I ((H="")&((E="")!("PV"'[E)))!(((H'="")&(E'=""))&("PV"'[E)) W "  ???",*7 S I=6 H 2 D ERASE G SEQ1
 S H=$F("PV",$E(E_H))-2,^TK(0,DV,"V")=H
 W !,!,$$^%QZCHW("OUTPUT PARAMETERS       (control sequences from computer to terminal)"),!,!,$$^%QZCHW("Enter the decimal values of the ASCII characters that define the following"),!
 W $$^%QZCHW("functions.  Press RETURN to skip functions.  Functions with * require"),!
 W $$^%QZCHW("an executable MUMPS expression which will be an argument of the Write command"),! G ^TKDEV1
OK W !,!,?5,$$^%QZCHW("O.K.  (Yes)> ")
O1 R *X G EDIT:X=78 I (X=13)!(X=89) W !,! G NAME
 W "  ???",*7 H 2 S I=6 D ERASE G O1
EXIT K NC,CN,CT,C,XC,Q,D,O,SB,T,X,I,H,DV,D,C,A,B,E Q
ERASE X "F I=I:-1:1 W $C(8,32,8)" Q
 W ! Q
 
LIST W !,! S N="" F I=0:0 S N=$O(^TK(0,N)) Q:N=""  W N,$J("",20-$L(N))
 W !,! G NAME
 
INIT K TK G:$D(^TK($I)) INIT1 W !,!,$$^%QZCHW("Device not defined to the Toolkit - Calling ^TKDEV for definition"),!,! D ^TKINIT:$D(^TK)=0 S A=$O(^TK(0,"")) I $O(^(A))="" S ^TK($I)=A G INIT
 S A=$I D DEV1 G INIT
INIT1 S TK=^TK($I),TK("T")=^TK("TERMST"),TK(1)=0,TKP=^TK(0,TK,"P") F TKI=0:1:5 I $D(^(TKI)) X ^(TKI)
 K TKI W TK("SET") I ^TK("OS")="MSM",$I=1 X ^TK("8BIT")
 Q
 
DEV W $$^%QZCHW("Enter Device Number ( 0 for current device, ? to list defined devices ) > ") R A Q:A=""  G:A="?" DEVL I A'?1.3N W " ???",! G DEV
 S:A=0 A=$I I $D(^TK(A)) W !,!,$$^%QZCHW(" Currently Device "),A," = ",^TK(A)
 W !,!
DEV1 W $$^%QZCHW("Enter the device type ") W:A=$I $$^%QZCHW("of your device ") W $$^%QZCHW("from the following selection - "),!,! S B="" F I=1:1 S B=$O(^TK(0,B)) Q:B=""  W I,"-",B,"  " S I(I)=B
 W !
DEVT W !," ? " R B I B>0,B<I S ^TK(A)=I(B) W $$^%QZCHW("...defined as "),I(B),!,! Q
 I B'="" W " ???" G DEVT
 W ! G DEV
DEVL W !,! S A=0 I (+($O(^TK(A))))=0 W ?8,$$^%QZCHW("( nothing currently defined )"),!,! G DEV
 F I=1:1 S A=$O(^TK(A)) Q:A=""  Q:A<1  W A,?5,^(A),!
 W !,! G DEV

