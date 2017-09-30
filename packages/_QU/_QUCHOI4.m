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
;! HL002 ! HL     ! 07/09/12 ! Ne pas oublier le passage de parametre (Z)     !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QUCHOI4^INT^1^59547,73884^0
%QUCHOI4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INI(MOD,DEB,XG,YH,DH,DV,TIT,Z,MERR) 
 N R,V
 
 N GL
 S R=1
 I ($D(^[QUI]QX($J,Z,"T"))<9)&MERR D ^%VZEAVT($$^%QZCHW("Pas de donnees fenetre ")_Z)
 I $D(^[QUI]QX($J,Z,"T"))<9 S R=0
 S:'($D(^QX($J))) ^QX($J)=0 S ^QX($J)=Z
 S GL="^[QUI]QX($J,Z,""R"")"
 S:(TIT="")&($D(^[QUI]QX($J,Z,"TI"))'=0) TIT=$$P5^%QUCHOI5("^[QUI]QX($J,Z,""TI"")")
 D:R=1 MSFI^%QUCHOI5
 F V="GL","MOD","DEB","XG","YH","DH","DV","TIT" S @("^QX($J,Z,V)="_V)
 S ^QX($J,Z,"LR")=$S(SUB="C-IBM PC":9,1:3)
 S ^QX($J,Z,"LECR")=$S($D(^[QUI]QX($J,Z,"LECR")):^[QUI]QX($J,Z,"LECR"),1:80)
 S (^QX($J,Z,"S"),^QX($J,Z,"C"))=$S(MOD=1:$O(@GL@("")),1:$O(@GL@($ZP(@GL@(DEB))))),^QX($J,Z,"PX")=^QX($J,Z,"XG")+2,^QX($J,Z,"PY")=YH+1,^QX($J,Z,"P")=1,^QX($J,Z,"P",1)=^QX($J,Z,"C")
 Q R
 
 
AFF(Z) 
 D REAFF Q
 
 
END(Z) 
 I Z=-1 K ^QX($J) Q
 K ^QX($J,Z)
 S ^QX($J)=Z-1 Q
 
 
UN(Z) 
 N %F,I,X1
HE D HELP
L0 D ECHOFF^%VVIDEO,POS,AFF2^%QUCHOI5,POS1,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,13,18,43,45,61,80,95 G:I=X1 @I
 D ^%VSQUEAK G L0
1 Q ""
6 Q ""
13 Q ^QX($J,Z,"S")
18 D REAFF G L0
 
61 G 43
43 S I=$$D43 G L0
D43() I ^QX($J,Z,"FIN")="" D ^%VSQUEAK Q 0
 I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK Q 0
 D PAGP,REAFF S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1
 Q 1
 
95 G 45
45 S I=$$D45 G L0
D45() I ^QX($J,Z,"P")=1 D ^%VSQUEAK Q 0
 S ^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"P",^QX($J,Z,"P")))),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2
 D PAGM,REAFF
 Q 1
 
63 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("nom")_" : ") D POCLEPA^%VVIDEO G:Y1="" L0
 G:"*?"[$E(Y1,$L(Y1)) MODSUP
 I '($D(@^QX($J,Z,"GL")@(Y1))) D ^%VZEAVT($$^%QZCHW("Inconnu ...")) G 63
 D POCLEPA^%VVIDEO S Y1=Y1_"?"
MODSUP D INI^%QUCHOI4(^QX($J,Z,"GL"),$S($E(Y1,$L(Y1))="?":2,1:3),$E(Y1,1,$L(Y1)-1),^QX($J,Z,"XG"),^QX($J,Z,"YH"),^QX($J,Z,"DH"),^QX($J,Z,"DV"))
 ;HL002 D AFF^%QUCHOI4 S Y1=$$UN^%QUCHOI4 D END^%QUCHOI4 I Y1="" D AFF G L0
 D AFF^%QUCHOI4(Z) S Y1=$$UN^%QUCHOI4 D END^%QUCHOI4(Z) I Y1="" D AFF(Z) G L0
 Q Y1
 
80 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("page")_" : ") D POCLEPA^%VVIDEO G:Y1="" L0
 I Y1'?.N D ^%VSQUEAK G L0
 G:Y1<^QX($J,Z,"P") MOINS
PLUS F I=1:1:Y1-^QX($J,Z,"P") Q:'($$PS^%QUCHOI5)
 D REAFF
 G L0
MOINS F I=1:1:^QX($J,Z,"P")-Y1 Q:'($$PP^%QUCHOI5)
 D REAFF
 G L0
 
H G:^QX($J,Z,"PY")'=(^QX($J,Z,"YH")+1) HOK
 I ^QX($J,Z,"P")=1 D ^%VSQUEAK G L0
 D PAGM,REAFF
 S ^QX($J,Z,"S")=^QX($J,Z,"FIN"),^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2
 G L0
HOK D POS,NET,POS1
 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")-1,^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"S")))
 G L0
 
B S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I (I="")!(I="z") D ^%VSQUEAK G L0
 G:^QX($J,Z,"PY")'=((^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2) BOK
 I ^QX($J,Z,"FIN")="" D ^%VSQUEAK G L0
 D PAGP,REAFF
 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1
 G L0
BOK I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) D ^%VSQUEAK G L0
 D POS,NET,POS1
 S ^QX($J,Z,"PY")=^QX($J,Z,"PY")+1,^QX($J,Z,"S")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"S")))
 G L0
 
G G L0
D G L0
 
NET X XY W $S($L(^QX($J,Z,"S"))<(^QX($J,Z,"DH")-3):^QX($J,Z,"S"),1:$$^%QZCHEV(^QX($J,Z,"S"),^QX($J,Z,"DH")-3,"P"))
 Q
 
HELP S DX=^QX($J,Z,"XG")+1,DY=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-1 X XY W "(+),(-),(P)age"
 Q
 
REAFF N OL,OX,OY,ITI
 S OX=^QX($J,Z,"XG"),OY=^QX($J,Z,"YH"),OL=^QX($J,Z,"DH")
 D CARSP^%VVIDEO(OX,OY,^QX($J,Z,"DV"),OL,1)
 S DX=OX,DY=OY,ITI=^QX($J,Z,"TIT")
 ;HL002 I ITI'="" D REV^%VVIDEO X XY W $E(ITI,1,OL),$J("",OL-$L(ITI)) D NORM^%VVIDEO
 I ITI'="" D REV^%VVIDEO X XY W $E(ITI,1,OL),$J("",OL-$L(ITI)-1) D NORM^%VVIDEO
 S DX=OX+1
 F DY=OY+1:1:(OY+^QX($J,Z,"DV"))-2 X XY W $J("",OL-2)
 D HELP,PAGE^%QUCHOI5,NOPA^%QUCHOI5
 Q
 
POS S DX=^QX($J,Z,"PX"),DY=^QX($J,Z,"PY") X XY Q
 
POS1 S DX=^QX($J,Z,"PX")-1,DY=^QX($J,Z,"PY") X XY Q
 
PAGP S ^QX($J,Z,"P")=^QX($J,Z,"P")+1
 I $D(^QX($J,Z,"P",^QX($J,Z,"P"))) S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")) Q
 S ^QX($J,Z,"C")=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))),^QX($J,Z,"P",^QX($J,Z,"P"))=^QX($J,Z,"C") Q
 
PAGM S ^QX($J,Z,"C")=^QX($J,Z,"P",^QX($J,Z,"P")-1),^QX($J,Z,"P")=^QX($J,Z,"P")-1
 Q

