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

;%QUCHOYP^INT^1^59547,73884^0
ZCHOPLUS(LSEL) 
 
 
 
 
 
 
 
 
 
 
 N %F,EL,CONT,I,RET,X1,Z
 S Z=^QX($J)
HE D HELP^%QUCHOI2
L0 D ECHOFF^%VVIDEO,POS,AFF2,POS1,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,10,13,18,43,45,61,63,80,95 G:I=X1 @I
 D ^%VSQUEAK G L0
1 K @(LSEL) Q
6 Q
10 S INT=1 D IMPROBJ^%QUCHOI2 G HE
13 S EL=^QX($J,Z,"S") G:EL="" 1
 I $D(@LSEL@(EL)) K @LSEL@(EL) G B
 S @LSEL@(EL)="" G B
18 D REAFF^%QUCHOI2 G L0
43 S I=$$D43 G L0
D43() I ^QX($J,Z,"FIN")="" D ^%VSQUEAK Q 0
 I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK Q 0
 D PAGP,REAFF^%QUCHOI2
 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1
 Q 1
45 S I=$$D45 G L0
D45() I ^QX($J,Z,"P")=1 D ^%VSQUEAK Q 0
 S ^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"P",^QX($J,Z,"P")))),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2
 D PAGM,REAFF^%QUCHOI2
 Q 1
61 G 43
63 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Nom : ") I CTRLA!(Y1="") D POCLEPA^%VVIDEO G L0
 I "*?"[$E(Y1,$L(Y1)) S Y1=$O(@^QX($J,Z,"GL")@($E(Y1,1,$L(Y1)-1)_"!!!!!!!!!!!!!!!!!!!!!")) I Y1="" D ^%VSQUEAK G 63
 S SY1=$$M^%QAX(Y1)
 I '($D(@^QX($J,Z,"GL")@(SY1))) D ^%VZEAVT(Y1_" "_$$^%QZCHW("inconnu ")) G 63
 I $$SUIT^%QUCHOIP(^QX($J,Z,"S"),SY1) D HAU^%QUCHOIP G L0
BA I (SY1=^QX($J,Z,"FIN"))!$$SUIT^%QUCHOIP(^QX($J,Z,"FIN"),SY1) D HAUS2^%QUCHOIP G L0
 D PAGP,PCALC G BA
 
80 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Page : ") D POCLEPA^%VVIDEO
 G:CTRLA!(Y1="") L0 I Y1'?.N D ^%VSQUEAK G L0
 G:'($D(^QX($J,Z,"P",Y1))) PLUS
 S ^QX($J,Z,"P")=Y1,(^QX($J,Z,"S"),^QX($J,Z,"C"))=^QX($J,Z,"P",^QX($J,Z,"P")),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1 D PCALC,REAFF^%QUCHOI2 G L0
PLUS D ^%VZEATT
 S SY1=^QX($J,Z,"P")
 F I=1:1:Y1-SY1 Q:^QX($J,Z,"FIN")=""  S II=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))) Q:II=""  D PAGP,PCALC
 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1
 D POCLEPA^%VVIDEO
 D REAFF^%QUCHOI2
 G L0
95 G 45
H G:^QX($J,Z,"PY")'=(^QX($J,Z,"YH")+1) HOK
 I ^QX($J,Z,"P")=1 D ^%VSQUEAK G L0
 D PAGM,REAFF^%QUCHOI2
 S ^QX($J,Z,"S")=^QX($J,Z,"FIN"),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 G L0
HOK D POS,NET,POS1
 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")-1,^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) G L0
B S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I (I="")!(I="z") D ^%VSQUEAK G L0
 G:^QX($J,Z,"PY")'=((^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2) BOK
 I ^QX($J,Z,"FIN")="" D ^%VSQUEAK G L0
 D PAGP,REAFF^%QUCHOI2
 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1 G L0
BOK I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK G L0
 D POS,NET,POS1
 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")+1,^QX($J,Z,"S")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) G L0
G G L0
D G L0
 
AFF2 S CONT=$$S^%QAX(^QX($J,Z,"S")) D REV^%VVIDEO,BLD^%VVIDEO
 X XY W $S($L(CONT)<(^QX($J,Z,"DH")-3):CONT,1:$$CAR^%QZCHEV(CONT,^QX($J,Z,"DH")-3,"D",",")) D NORM^%VVIDEO
 Q
 
NET S CONT=$$S^%QAX(^QX($J,Z,"S")) D:$D(@LSEL@(CONT)) BLD^%VVIDEO
 X XY W $S($L(CONT)<(^QX($J,Z,"DH")-3):CONT,1:$$CAR^%QZCHEV(CONT,^QX($J,Z,"DH")-3,"D",",")) D NORM^%VVIDEO Q
 
POS S DX=^QX($J,Z,"PX"),DY=^QX($J,Z,"PY") X XY Q
POS1 S DX=^QX($J,Z,"PX")-1,DY=^QX($J,Z,"PY") X XY Q
 
PAGP S ^QX($J,Z,"P")=^QX($J,Z,"P")+1 I $D(^QX($J,Z,"P",^QX($J,Z,"P"))) S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")) Q
 S ^QX($J,Z,"C")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))),^QX($J,Z,"P",^QX($J,Z,"P"))=^QX($J,Z,"C") Q
 
PAGM S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")-1),^QX($J,Z,"P")=^QX($J,Z,"P")-1 Q
 
 
REAFF(LSEL) N Z
 S Z=^QX($J)
 G REAFF^%QUCHOI2
 
PCALC I $D(^QX($J,Z,"P",^QX($J,Z,"P")+1)) S ^QX($J,Z,"FIN")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"P",^QX($J,Z,"P")+1))) Q
 N LOC S LOC=^QX($J,Z,"C") F DY=1:1:^QX($J,Z,"DV")-2 S LOC=$O(@^QX($J,Z,"GL")@(LOC)) Q:LOC=""
 S ^QX($J,Z,"FIN")=$ZP(@^QX($J,Z,"GL")@(LOC)) Q

