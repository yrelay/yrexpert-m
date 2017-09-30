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

;%QUCHOI5^INT^1^59547,73884^0
QUCHOI5 ;
 
 
 
 
 
PAGE 
 N LOC
 S LOC=^QX($J,Z,"C"),DX=^QX($J,Z,"XG")+2
 F DY=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 X XY W $J("",^QX($J,Z,"DH")-3) D TLOC
 S ^QX($J,Z,"FIN")=$S(LOC="":"",1:$ZP(@^QX($J,Z,"GL")@(LOC)))
 Q
TLOC 
 G:^QX($J,Z,"MOD")=3 TL2
 I LOC'="" X XY W $S($L(LOC)<(^QX($J,Z,"DH")-3):LOC,1:$$^%QZCHEV(LOC,^QX($J,Z,"DH")-3,"P")) S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
 
TL2 I $F(LOC,^QX($J,Z,"DEB"),0)=($L(^QX($J,Z,"DEB"))+1) X XY W $S($L(LOC)<(^QX($J,Z,"DH")-3):LOC,1:$$^%QZCHEV(LOC,^QX($J,Z,"DH")-3,"P")) S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
 
NOPA S DX=^QX($J,Z,"XG"),DY=^QX($J,Z,"YH")+1 D BLD^%VVIDEO X XY S OOP=^QX($J,Z,"P") W OOP,$J("",2-$L(OOP))
 D NORM^%VVIDEO K OOP Q
 
AFF2 
 D REV^%VVIDEO,BLD^%VVIDEO X XY
 W $S($L(^QX($J,Z,"S"))<(^QX($J,Z,"DH")-^QX($J,Z,"LR")):^QX($J,Z,"S"),1:$$^%QZCHEV(^QX($J,Z,"S"),^QX($J,Z,"DH")-^QX($J,Z,"LR"),"P"))
 D NORM^%VVIDEO Q
 
 
 
PS() 
 I ^QX($J,Z,"FIN")="" Q 0
 I ^QX($J,Z,"MOD")=3 S I=$O(@^QX($J,Z,"GL")@(^QX($J,Z,"FIN"))) I $F(I,^QX($J,Z,"DEB"),0)'=($L(^QX($J,Z,"DEB"))+1) Q 0
 D PAGP^%QUCHOI4,FIN
 S ^QX($J,Z,"S")=^QX($J,Z,"C"),^QX($J,Z,"PY")=^QX($J,Z,"YH")+1
 Q 1
 
PP() 
 I ^QX($J,Z,"P")=1 Q 0
 S ^QX($J,Z,"S")=$ZP(@^QX($J,Z,"GL")@(^QX($J,Z,"P",^QX($J,Z,"P"))))
 S ^QX($J,Z,"PY")=(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2
 D PAGM^%QUCHOI4,FIN
 Q 1
 
FIN 
 N LOC,MOD,Y
 S LOC=^QX($J,Z,"C"),MOD=^QX($J,Z,"MOD")
 F Y=^QX($J,Z,"YH")+1:1:(^QX($J,Z,"YH")+^QX($J,Z,"DV"))-2 D LC
 S ^QX($J,Z,"FIN")=$S(LOC="":"",1:$ZP(@^QX($J,Z,"GL")@(LOC)))
 Q
LC G:MOD=3 LC2
 I LOC'="" S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
LC2 I $F(LOC,^QX($J,Z,"DEB"),0)=($L(^QX($J,Z,"DEB"))+1) S LOC=$O(@^QX($J,Z,"GL")@(LOC))
 Q
 
 
MSFI 
 N S,LIG,I
 S S=""
 S LIG=$O(^[QUI]QX($J,Z,"T",""))
 F I=1:1 Q:LIG=""  S S=$$P5("^[QUI]QX($J,Z,""T"",LIG)"),^[QUI]QX($J,Z,"R",S)=LIG,LIG=$O(^[QUI]QX($J,Z,"T",LIG))
 Q
 
P3 S COL=$O(^[QUI]QX($J,Z,"T",LIG,"")),S=""
 F J=1:1 Q:COL=""  D P4 S COL=$O(^[QUI]QX($J,Z,"T",LIG,COL))
 Q
 
P4 S S=S_^[QUI]QX($J,Z,"T",LIG,COL)
 S L=^[QUI]QX($J,Z,"LC",COL)-$L(^[QUI]QX($J,Z,"T",LIG,COL))
 F I=1:1:L S S=S_" "
 Q
 
P5(GLO) 
 N S,S1,COL,J,L
 S COL=$O(@GLO@("")),S=""
 F J=1:1 Q:COL=""  D P7 S COL=$O(@GLO@(COL))
 Q S
 
P6 S S=S_$E(@GLO@(COL),1,^[QUI]QX($J,Z,"LC",COL))
 S L=^[QUI]QX($J,Z,"LC",COL)-$L(@GLO@(COL))
 F I=1:1:L S S=S_" "
 Q
 
P7 I ^[QUI]QX($J,Z,"LC",COL)>2 G P8
 G P9
 
P8 N L1,L2
 S L1=$L(@GLO@(COL)),L2=^[QUI]QX($J,Z,"LC",COL)
 S S1=$E(@GLO@(COL),1,L2-1)
 S L=L2-$L(S1)
 S S=S_S1
 I L1>(L2-1) S S=S_" " Q
 F I=1:1:L S S=S_" "
 Q
 
P9 S S1=$E(@GLO@(COL),1,^[QUI]QX($J,Z,"LC",COL))
 S L=^[QUI]QX($J,Z,"LC",COL)-$L(S1)
 S S=S_S1
 F I=1:1:L S S=S_" "
 Q
 
 
TEST 
 D P1,PI
 Q
PI 
 S X=$$INI^%QUCHOI4(1,"",4,4,75,10,"",ZZ,1)
 D AFF^%QUCHOI4(ZZ) S:X=1 X=$$UN^%QUCHOI4(ZZ)
 D END^%QUCHOI4(-1)
 Q
 
P1 
 S ZZ=$ZP(^[QUI]QX($J,""))+1
 S ^[QUI]QX($J,ZZ,"LC",1)=10,^[QUI]QX($J,ZZ,"LC",2)=15,^[QUI]QX($J,ZZ,"LC",3)=4
 S ^[QUI]QX($J,ZZ,"TI",1)="TITRE1",^[QUI]QX($J,ZZ,"TI",2)="TITRE2",^[QUI]QX($J,ZZ,"TI",2)="TITRE2"
 S ^[QUI]QX($J,ZZ,"T",1,1)="TOTO",^[QUI]QX($J,ZZ,"T",1,2)="TATA"
 S ^[QUI]QX($J,ZZ,"T",2,1)="TITI",^[QUI]QX($J,ZZ,"T",2,2)="TUTU"
 S ^[QUI]QX($J,ZZ,"T",3,1)="TTTTTTTTTTTITI",^[QUI]QX($J,ZZ,"T",3,2)="TUTU",^[QUI]QX($J,ZZ,"T",3,3)="ARTHUR"
 S ^[QUI]QX($J,ZZ,"T",4,1)="TTTTTTITI",^[QUI]QX($J,ZZ,"T",4,2)="TUTU"
 Q

