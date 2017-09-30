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

;TKPC^INT^1^59547,74869^0
TKPC ;
 
 Q
SETUP K ^TKPC S ^TKPC=$P($T(BEG)," ",2,99),TK("OS")=^TK("OS") X:TK("OS")="DTM" "S ^TKPC=$XECUTE(^TKPC)"
 F I=1:1 S A=$T(BEG+I) Q:A=""  S ^TKPC($P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 G ^TKPC1
X X ^TKPC D NORM^%VVIDEO Q
 
BEG X:$D(TK)=0 ^TK("INIT") Q:'($D(TK))  X ^TK("TERM-ON"),^TK("ECHO-OFF"),^TK("WRAP-OFF") S TKSR=13,TKSC=55 X ^TKPC("CUBE"),^TKPC("SET"),^TKPC("PROC"),^TKPC("EXIT"),^TK("ECHO-ON"),^TK("TERM-OFF"),^TK("WRAP-ON") S %R=22 W @(TKP)
SET S %R=TKSR+2,%C=TKSC+4,TKPR=1,TKPC=1,TKQ="TKQ="_TKP,@(TKQ),%C=%C+12,TKK="TKK="_TKP,@(TKK),%R=TKSR+4,%C=TKSC+17,TKO="TKO="_TKP,@(TKO),(TKA,TKV)="0.",(TKLL,TKL,TKT)="",TKOP="+-/*Xx",TKD=0,TKJ="$J(TKA,12)" F I=1:1:4 S @("TK"_I)=0
PROC W TK("HI"),TKQ,@(TKJ) F TKI=1:0:2 R *A X ^TKPC($S($C(A)?1N:"N",A=46:"DEC","18770"[A:"EX",TKOP[$C(A):"OP",",="[$C(A):"EQ",A=37:"PERC",1:"ER"))
EXIT S %C=TKSC,%R=TKSR K TKV,TKC,TKL,TKW,TKO,TKOP,TKSC,TKSR,TKLL,TKLV,TKT,TK1,TK2,TK3,TKK,TK4,TKD,TKI,TKJ,TKPC,TKQ,TKPR X ^TK("ECHO-ON") F %R=%R-1:1:24 W @(TKP),$J("",22)
CL W TKQ,$J("0.",12) X $S(TKV="0.":"S TKA=0,(TKL,TKLL)="""" W TKO,*32,TKK X:TK1 ^(""DISP1"")",1:"S TKV=""0."",TKD=0")
DISP W TKQ,@(TKJ) I TK1 X:(TKPR_TKPC)=11 ^("ERASE") S %R=TKPR,%C=TKPC W @(TKP),@(TKJ) W:"=%"[A "  ",A S TKPR=TKPR+1 S:TKPR=25 TKPR=1,TKPC=TKPC+15 S:TKPC>45 TKPC=1 W TKQ,@(TKJ) Q
DISP1 X:(TKPR_TKPC)=11 ^("ERASE") S %R=TKPR,%C=TKPC W @(TKP),$J(TKV,12),"  ",TKL S TKPR=TKPR+1 S:TKPR=25 TKPR=1,TKPC=TKPC+15 S:TKPC>45 TKPC=1
ERASE S %C=1 F %R=1:1:24 W @(TKP),$J("",54)
N S A=$C(A) I $L(TKV)<11 S:TKD TKV=TKV_A S:'(TKD) TKV=((TKV*10)+A)_"." W TKQ,$J(TKV,12)
OP S A=$C(A) S:"Xx"[A A="*" W TKO,A,TKK X:+(TKV) ^("COMP") S TKL=A,TKLL=""
EQ S A=$C(A) S:A="," A="=" W TKO,A,TKK X $S(TKLL'="":"S TKL=TKLL,TKA=TKLV",1:"S TKLL=TKL,TKLV=TKA") X:TKL'="" ^("COMP") S TKL=""
PERC S A=$C(A),TKT="/100" S:"+-"[TKL TKT=TKT_"+TKA",TKL="*"_TKL X ^("EQ")
DEC S A=$C(A),TKD=1 W TKQ,$J(TKV,12)
COMP X:(TKL'="")&TK1 ^("DISP1") S:TKL="" TKL="+" S TKV="TKA="_(+(TKA))_TKL_(+(TKV))_TKT,TKT="" S:(TKL="/")&((+(TKA))=0) TKV="TKA=""error""" S @(TKV) S:TKA'["." TKA=TKA_"." X:$L(TKA)>12 ^("OVR") S:(TKL="/")&$L(TKA>12) TKJ="$J(TKA,1,$L(TKA\1)+10-$L(TKA\1))" X ^("DISP") S TKD=0,TKV="0.",TKJ="$J(TKA,12)"
CR S A="+" X ^("OP")
ER W *7
EX X ^TKPC($S(A=13:"CR",1=A:"EXT",70=A:"FUNC",7=A:"CL",77=A:"MODE",(A=8)&(^TOZE($I,"LG")="FR"):"HELPFR",A=8:"HELP",1:"ER"))
EXT S TKI=3
OVR S TKT=$L($P(TKA,".",2)),@($S(TKT:"TKA=$J(TKA,0,TKT-1)",1:"TKA=""Over flow"",TKL="""",TKV=TKA")),TKT=""
INIT K TK W:'($D(^TK($I))) !,!,$$^%QZCHW("Device not defined to the Toolkit - Use ^TKDEV"),!,! Q:'($D(^TK($I)))  S TK=^($I),TK(1)=0,TK("T")=^TK("TERMST"),TKP=^TK(0,TK,"P") X "F TKI=0:1:5 I $D(^(TKI)) X ^(TKI)" K TKI W TK("SET")

