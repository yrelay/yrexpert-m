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

;%ZGEIN^INT^1^59547,74037^0
%ZGEIN ;
S S %B0=X S:%HLP=EMP %HLP="W ""No help text""" G @%BF(1)
RD R *IN:%BF(5) S:'($T) IN=0 S:((IN>96)&(IN<127))&%BF(3) IN=IN-32 I (IN>%BF(6))&('($D(%C(IN)))) W:'(%BF(2)) $S(IN:$C(IN),1:"") Q
Q Q
E W *7 Q
FF W @(FF) Q:%BF(1)
STAT S DX=0,DY=20 X XY,XL W $E($P(%ED,U,2)_"  "_%SEP,1,RM-1) Q
POS S DX=((INX+INP)-1)#RM,DY=(((INX+INP)-1)\RM)+INY X XY Q
CTR S %="R"_%BF(1) W:'($D(%C(IN))) *7 X:$D(%C(IN)) %C(IN) G @%
0 S INX=$S($P(%Q,U,4)=EMP:$P(%Q,U,2)+$L($P(%Q,U,1)),1:$P(%Q,U,4))
 S INY=$S($P(%Q,U,5)=EMP:$S($P(%Q,U,3)=EMP:21,1:$P(%Q,U,3)),1:$P(%Q,U,5))
 S INL=$S($P(%Q,U,6)=EMP:255,1:$P(%Q,U,6))
 D:$P(%Q,U,7)=EMP RFSH S INP=1,%C=EMP D POS
R0 D:%SCRN'=$P(%Q,U,7) RFSH D RD G CTR:'($T) W $E(X,INP,999) S %C=0,X=$E($E(X,1,INP-1)_$S(IN:$C(IN),1:"")_$E(X,INP,999),1,INL) S:INP<INL INP=INP+1 D:$L(X)'<INP POS G R0
1 S %C=0 G BF:$L(%BF) D W1
R1 D RD G CTR:'($T) S %BF=%BF_$S(IN:$C(IN),1:"") G R1:$L(%BF)<255 W !,!,"?Line too long" S %BF=EMP D W1 G R1
BF F %=0:0 Q:$E(%BF)'=" "  S %BF=$E(%BF,2,999)
 S IN=$L(%BF)+2 S:$F(%BF,$C(%BF(4))) IN=$F(%BF,$C(%BF(4))) S X=$E(%BF,1,IN-2),%BF=$E(%BF,IN,999) S:X=EMP %C=EMP,X=%B0 S:X="@" X=EMP
X S:($E(X)="^")!($E(X)="~") %C=$S(($E(X,2)="^")!($E(X,1,2)="~"):2,1:1)_$E(X,1,80),X=%B0 I $E(X)="?" X %HLP S X=%B0 G @%BF(1)
 Q
W1 W !,$P(%Q,U,1) W:X'=EMP X,"// " W %BF Q
2 S %C=0 D W1
R2 R %BF:%BF(5) S IN=$S($T:$S($L(%BF):$A($E(%BF)),1:13),1:0) G CTR:(IN<32)!(IN>126),BF
RFSH S %SCRN=$P(%Q,U,7) G ^%ZGERFSH:($P(%Q,U,8)'=EMP)!($P(%Q,U,9)'=EMP) S DX=$P(%Q,U,2),DY=$S($P(%Q,U,3)=EMP:21,1:$P(%Q,U,3)) X XY X:DY>19 XL W $P(%Q,U,1) S INP=1 D POS W X Q
CR S:%B0'=X %C=0 S %="X" Q
PC Q:INP'>1  S INP=INP-1 D POS Q
NC Q:INP>$L(X)  S INP=INP+1 D POS Q
DPC Q:INP'>1  S X=$E(X,1,INP-2)_$E(X,INP,999),INP=INP-1
 D POS W $E(X,INP,999)," " D POS Q
DNC Q:INP>$L(X)  S X=$E(X,1,INP-1)_$E(X,INP+1,999)
 D POS W $E(X,INP,999)," " D POS Q
PW Q:INP'>1  F INP=INP:0 Q:$E(X,INP-1)'=" "  S INP=INP-1
 S INPP=$L($P(X," ",1,$L($E(X,1,INP-1)," ")-1))+1,INP=$L($P(X,",",1,$L($E(X,1,INP-1),",")-1))+1 S:(INPP>1)&(INPP>INP) INP=INPP S:(INP>1)&($E(X,INP)=" ") INP=INP+1 D POS Q
NW Q:INP>$L(X)  S INPP=(INP+$L($P($E(X,INP+1,999)," ",1)))+1,INP=(INP+$L($P($E(X,INP+1,999),",",1)))+1 S:INPP<INP INP=INPP F INP=INP:0 Q:$E(X,INP)'=" "  S INP=INP+1
 D POS Q
DPW Q:INP'>1  S ED=INP D PW S X=$E(X,1,INP-1)_$E(X,ED,999)
 D POS W $E(X,INP,999),$J(EMP,ED-INP) D POS Q
DNW Q:INP>$L(X)  S ED=INP D NW S X=$E(X,1,ED-1)_$E(X,INP,999),INPP=INP,INP=ED
 D POS W $E(X,INP,999),$J(EMP,INPP-ED) D POS Q
PL Q:INP<2  S INP=1 D POS Q
NL Q:INP>$L(X)  S INP=$L(X)+1 D POS Q
DPL Q:INP<2  S X=$E(X,INP,999),ED=INP,INP=1
 D POS W X,$J(EMP,ED-1) D POS Q
DNL Q:INP>$L(X)  W $J(EMP,($L(X)-INP)+1) D POS S X=$E(X,1,INP-1) Q

