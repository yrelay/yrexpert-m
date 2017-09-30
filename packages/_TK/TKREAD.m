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

;TKREAD^INT^1^59547,74869^0
TKREAD ;
 
 
 
 
 
 
 
 
SETUP K ^TKREAD S TK("OS")=^TK("OS"),^TKREAD=$P($T(READ)," ",2,99) X:TK("OS")="DTM" "S ^TKREAD=$XECUTE(^TKREAD)"
 F I=1:1 S A=$T(READ+I) Q:A=""  S ^TKREAD($P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 Q
TEST S %R=24,%C=5,LNG=5,X="",RX=0,PAT="X?1.20A" X ^TKREAD W !,X,"  RX = ",RX,!,! G TEST
READ X:$D(TK)=0 ^TK("INIT") X ^TKREAD(0) F %I=1:0:21 X ^TKREAD(%I)
0 S %L=1,ESC=0 X:$D(PROMPT) ^TKREAD(2) W @(TK("P")),TK("HI") X ^TK("TERM-ON"),^TK("WRAP-OFF"),^TK("ECHO-OFF") S:$D(LNG)=0 LNG=79-%C S:$D(CHR)=0 CHR="" S:$D(RX) RX=0 S X=X_$J("",LNG-$L(X))
1 S %I=3 F %J=1:1 R B#1 X TK("T") Q:B=""  Q:%L>LNG  S:CHR'="" %I=((CHR'[B)*4)+3 S:$D(TRM) ESC=TRM[B,%I=(ESC*10)+3 Q:%I>3  W B S X=$E(X,1,%L-1)_B_$E(X,%L+1,255),%L=%L+1
2 W @(TK("P")),TK("LO"),PROMPT,TK("HI"),X,TK("CL") S %C=%C+$L(PROMPT)
3 S %I=$S(ZF=TK("RK"):5,ZF=TK("LK"):6,ZF=TK("INK"):14,ZF=TK("DLK"):8,$A(ZF)=127:9,$A(ZF)=13:12,ZF=TK("CL"):11,$A(ZF)=8:9,$D(RX):15,1:7)
5 X $S(%L<LNG:"W TK(""RT"") S %L=%L+1,%I=1",$D(RX):"S RX=5,%I=13",1:"S %I=1")
6 X $S(%L>1:"S %L=%L-1,%I=1 W TK(""L"")",$D(RX):"S RX=4,%I=13",1:"S %I=1")
7 W *7 S %I=1
8 W $E(X,%L+1,256)," " S X=$E(X,1,%L-1)_$E(X,%L+1,256)_" ",%I=1 W @(TK("P")),$E(X,1,%L-1)
9 S %I=1 I %L>1 S X=$E(X,1,%L-2)_" "_$E(X,%L,256),%L=%L-1 W *8," ",*8
11 S X=$E(X,0,%L-1),CC=%C,%C=(%C+%L)-1,%I=1 W @(TK("P")),$J("",LNG-%L),@(TK("P")) S %C=CC,%L=$L(X) K CC
12 S %L=X,%I=13 I $E(X,$L(X))=" " F %J=0:0 S %J=$F(X," ",%J) Q:'(%J)  I $E(X,%J,255)?." " S X=$E(X,1,%J-2) Q
13 S:X="" %I=20 I X'="" X:$D(PAT) "I $L(PAT) S %I=19 I @PAT S %I=13" X:%I=13 "I $D(MAX),X>MAX S %I=19" X:%I=13 "I $D(MIN),X<MIN S %I=19" S:%I=13 %I=20
14 X $S($E(X,LNG)'=" ":"W *7",1:"W "" "",$E(X,%L,LNG-1) S X=$E(X,1,%L-1)_"" ""_$E(X,%L,LNG-1) W @TK(""P""),$E(X,1,%L-1)") S %I=1
15 X $S(ZF=TK("UK"):"S RX=1",^TKESCAPE[ZF:"S RX=6",ZF=TK("DK"):"S RX=2",$A(ZF)=9:"S RX=3",1:"") S %I=$S(RX:12,1:7)
19 S X=%L,%L=1,ESC=0,%I=1 S:$D(RX) RX=0 W *7,@(TK("P"))
20 X ^TK("ECHO-ON"),^TK("TERM-OFF"),^TK("WRAP-ON") K PROMPT,MAX,MIN,LNG,CHR,PAT,%L,TRM,ZF,%J S %I=99

