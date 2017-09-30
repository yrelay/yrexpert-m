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

;PKNOTE^INT^1^59547,74868^0
TKNOTE ;
 
 Q
SETUP D:'($D(TK)) INIT^TKDEV S TK("OS")=^TK("OS"),^TKNOTE=$P($T(BEG)," ",2,99) X:TK("OS")="DTM" "S ^TKNOTE=$ZEECUTE(^TKNOTE)"
 F I=1:1 S A=$T(BEG+I) Q:A=""  S ^TKNOTE($P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$ZEECUTE(^(A))"
 G ^TKNOTE1
 
BEG X:$D(TK)=0 ^TK("INIT") Q:$D(TK)=0  D:$D(^TKNOTE("DEV",TK,1))=0 UND^TKNOTE2 X ^TKNOTE("DEV",TK,1),^TKNOTE("PAD"),^TKNOTE("SET"),^TKNOTE("PROC"),^TKNOTE("EXIT") S %R=22 W @(TKP)
SET S %R=TKE+3,%C=TKSC+2 W @(TKP),$$^%QZCHW("Enter your identifier: ") S %C=%C+23,LNG=14,X="" X ^TKREAD S TKID=X I X]"" S TK("T")=^TK("TERMST"),XF=$C(1),XFM=$C(1,1,1),TKN="^TKNOTE(0)",TKND="^TKNOTE(""ZNOTE"",TKID,TKNB)",TKNB=$O(^TKNOTE("ZNOTE",TKID,"")),TKU=5
PROC X ^TK("TERM-ON"),^TK("WRAP-OFF") I TKID]"" F TKI=3:0:98 X ^TKNOTE(TKI)
EXIT S %C=TKSC,%R=TKSR K TKV,TKC,TKL,TKW,TKA,TKO,TKOP,TKSC,TKSR,TKLL,TKLV,TK1,TK2,TK3,TKK,TK4,TKD,TKI,TKJ,TKSB,TKXX X ^TK("TERM-OFF"),^TK("WRAP-ON") W TK("ROF") X "F %R=%R-4:1:TK(""R"") W @TKP,$J("""",42)"
PAD S TKSR=TK("R")-12,TKSC=TK("C")-45,RM=38 X ^TKNOTE(1),^(2) W TK("RI")
0 S TKU="M",TKPN=1 F J=0:1:9999 X @TKN@(TKU)
1 S %R=TKSR-4,%C=TKSC W TK("Z"),TK("LO") X "F %R=%R+1:1:%R+15 W @TKP,TK(""VL""),$J("""",40),TK(""VL"")" S %R=%R+1 W @(TKP),TK("BLC") X "F TKJ=1:1:40 W TK(""HL"")" W TK("BRC") S %R=TKSR-4 W @(TKP),TK("TLC") F TKJ=1:1:40 W TK("HL")
2 W TK("TRC") S TKE=TKSR+8,%R=TKSR+10 W @(TKP),TK("LI") X "F TKJ=1:1:40 W TK(""HL"")" W TK("RI") S %C=TKSC+34 W @(TKP),"TkNote" S %R=TKSR-2,%C=TKSC W @(TKP),TK("LI") F TKJ=1:1:40 W TK("HL")
3 S TKI=4 X:TKNB ^(8) X:'(TKNB) ^(9)
4 S %R=TKE+3,%C=TKSC+1,TKO=$$^%QZCHW("Create  Edit  Suppres   +   -   Quit  "),TKG="" W @(TKP),TK("LO")," ",TKO X ^TK("ECHO-OFF"),^TKNOTE(5),^TK("ECHO-ON") S TKI=$P("6,7,11,12,13,99",",",TKU)
5 F TKU=TKU:1:6 S %C=TKSC+$P("2,10,16,25,29,33",",",TKU) W @(TKP),TK("HI"),$P(TKO,"  ",TKU) R A#1 X TK("T") Q:ZF=$C(13)  W @(TKP),TK("LO"),$P(TKO,"  ",TKU) X ^("SEL1") S:ZF=TK("LK") TKU=TKU-2 S:TKU<0 TKU=5 Q:ZF=$C(13)  S:TKU=6 TKU=0
6 X ^(9) S %R=TKE+3,%C=TKSC+1 W @(TKP),TK("LO"),$$^%QZCHW("CREATE: Enter Title "),TK("HI"),TK("RON"),$J("",19) S X="",%C=TKSC+21,LNG=19,TKI=4 X ^TKREAD W TK("Z") S:X'="" TKI=10
7 S TKI=4 I TKNB S TKI=0,%C=TKSC+1,%R=TKE+3,WO="",TKXX=^TKNOTE("DEV",TK,4) W @(TKP),TK("LO"),$J("",39),@(TKP),$$^%QZCHW("EDIT:   Press "),$P(^TKNOTE("DEV",TK,3),"`",9),$$^%QZCHW(" key for Help"),TK("HI")
8 S %R=TKSR-3,%C=TKSC+2 W @(TKP),TK("LO"),@(TKND),TK("HI") S TOP=$O(@TKND@("")),BOT="" S:TOP="" TOP=10,^(10)=XFM F %R=%R+3:1:TKE S A=BOT,BOT=$O(^(BOT)),B="D="_TKP,@(B),TKC(%R)=D S:BOT="" BOT=(A+10)\1,^(BOT)=A_XFM S B=$P(^(BOT),XF,4) W D,B,$J("",38-$L(B))
9 S %R=TKSR-3,A=$J("",40),%C=TKSC+1 W @(TKP),TK("LO"),A,TK("HI") F %R=%R+3:1:TKE W @(TKP),A
10 X ^TKNOTE(0,"DATE") S TKNB=9000000000E-0-(($H*100000)+$P($H,",",2)),^TKNOTE("ZNOTE",TKID,TKNB)=X_$J(DT,37-$L(X)),TKI=7 X ^TKNOTE(8)
11 S %R=TKE+3,%C=TKSC+1,TKI=4 W @(TKP),$J("",39),@(TKP),TK("LO"),$$^%QZCHW("SUPPRES: Type ""Y"" to delete this note ") R X#1 I TKNB]"",X'="","YyOo"[X X ^TKNOTE(9) K @(TKND) S TKNB=$O(^TKNOTE("ZNOTE",TKID,"")),TKI=3
12 S TKO=TKNB,TKNB="",A=$D(^TKNOTE("ZNOTE",TKID,0)),TKI=3 F A=0:0 S A=$O(^(A)) Q:A=TKO  S TKNB=A Q:A=""
13 S TKNB=$O(^TKNOTE("ZNOTE",TKID,TKNB)),TKI=3
SEL1 S A=$F("CcEeSs+=--Qq",A)\2 I A S TKU=A,ZF=$C(13)

