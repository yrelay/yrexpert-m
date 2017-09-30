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

;%QUCHOI6^INT^1^59547,73884^0
ZCHOSUP6 ;
INIT(GL,MOD,DEB,XG,YH,DH,DV) N LECR S LECR=80 G INITOK
 
 
 
 
 
 
 
 
 
INIT2(GL,MOD,DEB,XG,YH,DH,DV,LECR) G INITOK
 
 
 
 
 
INITOK S:'($D(^QX($J))) ^QX($J)=0
 N Z,VIDE S (Z,^QX($J))=^QX($J)+1
 S:(XG+DH)>79 DH=79-XG
 N V F V="GL","MOD","DEB","XG","YH","DH","DV","LECR" S @("^QX($J,Z,V)="_V)
 S (^QX($J,Z,"S"),^QX($J,Z,"C"))=$S(MOD=1:$O(@GL@("")),1:$O(@GL@($ZP(@GL@(DEB))))),^QX($J,Z,"PX")=^QX($J,Z,"XG")+2,^QX($J,Z,"PY")=YH+1,^QX($J,Z,"P")=1,^QX($J,Z,"P",1)=^QX($J,Z,"C")
 Q
 
 
 
AFF N Z S Z=^QX($J) D REAFF2^%QUCHOI2 Q
 
 
 
END N Z S Z=^QX($J) K ^QX($J,Z) S (Z,^QX($J))=Z-1 K:Z=0 ^QX($J) Q
 
 
 
UN() N %F,CONT,I,RET,X1,Z S Z=^QX($J)
HE D HELP2^%QUCHOI2
L0 D ECHOFF^%VVIDEO,POS,AFF2,POS1,PROMPT,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F F I=1,6,10,13,18,43,45,61,63,80,95 G:I=X1 @I
 D ^%VSQUEAK G L0
1 Q ""
6 Q ""
10 S INT=1 D IMPROBJ^%QUCHOI2 G HE
13 Q ^QX($J,Z,"S")
18 D REAFF2^%QUCHOI2 G L0
43 S I=$$D43 G L0
D43() I ^QX($J,Z,"FIN")="" D ^%VSQUEAK Q 0
 I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK Q 0
 D PAGP,REAFF2^%QUCHOI2 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1 Q 1
45 S I=$$D45 G L0
D45() I ^QX($J,Z,"P")=1 D ^%VSQUEAK Q 0
 S ^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"P",^QX($J,Z,"P")))),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 D PAGM,REAFF2^%QUCHOI2 Q 1
61 G 43
63 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Nom : ") I CTRLA!(Y1="") D POCLEPA^%VVIDEO G L0
 G:"*?"[$E(Y1,$L(Y1)) MODSUP
 I '($D(@^QX($J,Z,"GL")@($$M^%QAX(Y1)))) D ^%VZEAVT($$^%QZCHW("Inconnu ")) G 63
 D POCLEPA^%VVIDEO S Y1=$$M^%QAX(Y1)_"?"
MODSUP D POCLEPA^%VVIDEO,INIT^%QUCHOI6(^QX($J,Z,"GL"),$S($E(Y1,$L(Y1))="?":2,1:3),$E(Y1,1,$L(Y1)-1),^QX($J,Z,"XG"),^QX($J,Z,"YH"),^QX($J,Z,"DH"),^QX($J,Z,"DV"))
 D AFF^%QUCHOI6 S Y1=$$UN^%QUCHOI6 D END^%QUCHOI6 I Y1="" D AFF G L0
 Q Y1
80 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Page : ") D POCLEPA^%VVIDEO
 G:CTRLA!(Y1="") L0 I Y1'?.N D ^%VSQUEAK G L0
 G:Y1<^QX($J,Z,"P") MOINS
PLUS F I=1:1:Y1-^QX($J,Z,"P") Q:'($$D43)
 G L0
MOINS F I=1:1:^QX($J,Z,"P")-Y1 Q:'($$D45)
 G L0
95 G 45
H G:^QX($J,Z,"PY")'=(^QX($J,Z,"YH")+1) HOK I ^QX($J,Z,"P")=1 D ^%VSQUEAK G L0
 D PAGM,REAFF2^%QUCHOI2 S ^QX($J,Z,"S")=^QX($J,Z,"FIN"),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 G L0
HOK D POS,NET,POS1 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")-1,^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) G L0
B S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I (I="")!(I="z") D ^%VSQUEAK G L0
 G:^QX($J,Z,"PY")'=((^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2) BOK I ^QX($J,Z,"FIN")="" D ^%VSQUEAK G L0
 D PAGP,REAFF2^%QUCHOI2 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1 G L0
BOK I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK G L0
 D POS,NET,POS1 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")+1,^QX($J,Z,"S")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) G L0
G G L0
D G L0
AFF2 S CONT=$$S^%QAX(^QX($J,Z,"S")) D BLD^%VVIDEO,REV^%VVIDEO X XY W $S($L(CONT)<(^QX($J,Z,"DH")-4):CONT,1:$$^%QZCHEV(CONT,^QX($J,Z,"DH")-4,"P")) D NORM^%VVIDEO Q
NET S CONT=$$S^%QAX(^QX($J,Z,"S")) X XY W $S($L(CONT)<(^QX($J,Z,"DH")-4):CONT,1:$$^%QZCHEV(CONT,^QX($J,Z,"DH")-4,"P")) Q
POS S DX=^QX($J,Z,"PX"),DY=^QX($J,Z,"PY") X XY Q
POS1 S DX=^QX($J,Z,"PX")-1,DY=^QX($J,Z,"PY") X XY Q
PAGP S ^QX($J,Z,"P")=^QX($J,Z,"P")+1 I $D(^QX($J,Z,"P",^QX($J,Z,"P"))) S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")) Q
 S ^QX($J,Z,"C")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))),^QX($J,Z,"P",^QX($J,Z,"P"))=^QX($J,Z,"C") Q
PAGM S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")-1),^QX($J,Z,"P")=^QX($J,Z,"P")-1 Q
TEST D INIT^%QUCHOI6("^TOLISGLO",1,"",0,0,15,23)
 D AFF^%QUCHOI6 S X=$$UN^%QUCHOI6 Q
PROMPT 
 S VIDE="                                                        "
 S (SAVDX,DX)=^QX($J,Z,"PX"),SAVDY=^QX($J,Z,"PY")
 S CH=^QX($J,Z,"S")
 S CENTRAGE=40-($L(CH)\2)
 
 S DX=10,DY=22 X XY W VIDE S DX=CENTRAGE,DY=22 X XY
 D BLD^%VVIDEO,REV^%VVIDEO
 W CH
 
 D NORM^%VVIDEO
 S DX=SAVDX,DY=SAVDY
 X XY
 Q

