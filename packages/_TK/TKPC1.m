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

;TKPC1^INT^1^59547,74869^0
TKPC1 ;
 
SETUP F I=2:1 S A=$T(SETUP+I) Q:A=""  S ^TKPC($P(A," "))=$P(A," ",2,99) X:TK("OS")="DTM" "S A=$P(A,"" ""),^(A)=$XECUTE(^(A))"
 G ^TKPC2
CUBE F J=1:1:8,"FACE" X ^TKPC(J)
1 S %R=TKSR,%C=TKSC W @(TK("P")),TK("HI"),TK("TLC") F I=1:1:18 W TK("HL")
2 W TK("TRC"),"  " S %C=TKSC F %R=TKSR+1:1:TKSR+10 W @(TK("P")),TK("VL"),$J("",18),TK("VL"),"  "
3 S %R=%R+1,%C=TKSC W @(TK("P")),TK("BLC") F I=1:1:18 W TK("HL")
4 W TK("BRC"),TK("LO") S %R=TKSR-1,%C=TKSC+2 W @(TK("P")) F I=1:1:19 W TK("HL")
5 W TK("TRC") S %C=TKSC+21 F %R=TKSR:1:TKSR+9 W @(TK("P")),TK("VL")
6 S %R=TKSR+1,%C=TKSC+2 W @(TK("P")),TK("TLC") F I=1:1:14 W TK("HL")
7 S %R=%R+1 W TK("TRC"),@(TK("P")),TK("VL"),$J("",14),TK("VL") S %R=%R+1 W @(TK("P")),TK("BLC") F I=1:1:14 W TK("HL")
8 W TK("BRC")
FACE S %R=TKSR+3,%C=TKSC+2 F I=1:1:7 S %R=%R+1,J=$P($$^%QZCHW("M W M,,CTRLA   Quit,CTRLG   Clear,CTRLH   Help,F       Funct,M       Mode"),",",I) W @(TK("P")),J,$J("",16-$L(J))
FUNC S T=^TK("TERMST") X ^TKPC("F1"),^TKPC("F2") W TK("LO") X ^("FACE") W TK("HI"),TKK
F1 S %R=TKSR+3,%C=TKSC+2 F I=1:1:7 S %R=%R+1,J=$P($$^%QZCHW("SQRT,N.LOG,EXP,SINE,COS,DEG to RAD,RAD to DEG"),",",I) W @(TK("P")),J,$J("",16-$L(J))
F2 F J=2:1:8 S %R=(TKSR+2)+J,I=$P(",SQRT,LN,EXP,SIN,COS,DTR,RTD",",",J),A=TKV X ^(I) S:TKV>1E11 TKV=$$^%QZCHW(" overflow") S:$L(TKV)>12 TKV=$E(TKV,1,12) W TKQ,$J(TKV,12),@(TK("P")) R B#1 X TK("T") Q:ZF=$C(13)  S TKV=A S:ZF=TK("UK") J=J-2 I 80[J W TKQ,$J(TKV,12) Q
LN S %F=TKV,(%E,%D)=0 Q:TKV'>0  X "F I=1:1 Q:%F<1  S %F=.5*%F,%D=%D+1","F I=1:1 Q:%F'<.5  S %F=2*%F,%D=%D-1" S %F=(%F-707107E-6)/(%F+707107E-6),%E=%F*%F,TKV=$J((((((((598979E-6*%E)+961471E-6)*%E)+288539E-5)*%F)+%D)-5E-1)*693147E-6,1,6) K %E,%F,%D Q
EXP S %E=0,%B=((14427E-4*TKV)\1)+1 Q:%B>90  S %E=(693147E-6*%B)-TKV,%A=132988E-8-(141316E-9*%E),%A=((((%A*%E)-830136E-8)*%E)+416574E-7)*%E,%E=((((((%A-166665E-6)*%E)+5E-1)*%E)-1)*%E)+1,%A=2 S:%B'>0 %A=5E-1,%B=-(%B) X "F %I=1:1:%B S %E=%A*%E" S TKV=$J(%E,1,6) K %A,%B,%I,%E Q
SIN S %E=TKV X "F I=1:1 S:%E<-1.570796 %E=-3.14159265-%E Q:%E'>3.14159265  S %E=%E-6.2831853" S %D=%E,%Y=%E,%B=1,%A=-1 X "F %F=3:2:11 S %B=%B*(%F-1)*%F,%D=%D*%E*%E,%Y=%D/%B*%A+%Y,%A=-%A" S TKV=$J(%Y,1,5) K %E,%D,%F,%A,%B,%Y Q
COS S %E=TKV+1570796E-6 X "F I=1:1 S:%E<-1.570796 %E=-3.14159265-%E Q:%E'>3.14159265  S %E=%E-6.2831853" S %D=%E,%Y=%E,%B=1,%A=-1 X "F %F=3:2:11 S %B=%B*(%F-1)*%F,%D=%D*%E*%E,%Y=%D/%B*%A+%Y,%A=-%A" S TKV=$J(%Y,1,5) K %E,%D,%F,%A,%B,%Y Q
DTR S TKV=TKV/5729577951E-8 Q
RTD S TKV=TKV*5729577951E-8 Q
SQRT S %Y=0 Q:TKV'>0  S %Y=(TKV+1)/2 X "F I=1:1 S %F=%Y,%Y=TKV/%F+%F/2 Q:%Y'<%F" S TKV=%Y K %Y,%F Q

