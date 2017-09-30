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

;%VIMPSCO^INT^1^59547,74035^0
GEIMPSCO ;
 ;;Programme utilitaire
 D INIT
DES S GR=0 F DY=0:1:23 W ! I $D(^KASE($J,DY)) S DX=-1 D T3
 Q
T3 S DX=$N(^KASE($J,DY,DX)) G:DX=-1 FT3 S LIB=^KASE($J,DY,DX),KS=$P(LIB,"^",2),CHC=$P(LIB,"^",1) I KS="*" S CHC=$S(CHC="q":"-",CHC="x":"|",1:"+")
 
 
T31 W ?DX,CHC G T3
FT3 I GR=1 D G0OFF^%VVIDEO S GR=0
 Q
INIT K ^COMLIT($J),^KASE($J) S SCR1=SCR_",COMMENT",CHC=-1 F %U=1:1 S CHC=$N(^%SCRE(SCR1,CHC)) Q:CHC=-1  D T0
 S CHC=-1 F %U=1:1 S CHC=$N(^COMLIT($J,CHC)) Q:CHC=-1  S LIB=^COMLIT($J,CHC),DXG=^%SCRE(SCR1,CHC,2),DYH=^%SCRE(SCR1,CHC,3) D T1
 S CHC=-1,LIM=^%SCRE(SCR) F %U=1:1:LIM S CHC=$N(^%SCRE(SCR,CHC)) Q:CHC=-1  I '($D(^%SCRE(SCR,CHC,"INVISIBLE"))) S LIB=^%SCRE(SCR,CHC,1)_$S($D(RESUL(CHC)):RESUL(CHC),1:""),DXG=^%SCRE(SCR,CHC,2),DYH=^%SCRE(SCR,CHC,3) D T1
FIN Q
T1 F %V=1:1 S TL=$E(LIB,%V) Q:TL=""  S ^KASE($J,DYH,DXG)=TL_"^",DXG=DXG+1 I DXG>79 S DYH=DYH+1,DXG=0
 Q
T0 S LIB=^%SCRE(SCR1,CHC,1) I $E(LIB,1)'="~" S ^COMLIT($J,CHC)=LIB Q
 S KS=$P(LIB,"~",2) Q:KS="KL"  G @KS
K S DXG=^%SCRE(SCR1,CHC,2),DYH=^%SCRE(SCR1,CHC,3),LH=$P(LIB,"~",3),LV=$P(LIB,"~",4),DYB=(DYH+LV)-1,DXD=(DXG+LH)-1
 F %V=DXG,DXD F %W=DYH:1:DYB S ^KASE($J,%W,%V)="x^*"
 F %V=DYH,DYB F %W=DXG:1:DXD S ^KASE($J,%V,%W)="q^*"
 S ^KASE($J,DYH,DXG)="l^*",^KASE($J,DYH,DXD)="k^*",^KASE($J,DYB,DXG)="m^*",^KASE($J,DYB,DXD)="j^*" Q
L S TL=$P(LIB,"~",3),LO=$P(LIB,"~",4),DXG=^%SCRE(SCR1,CHC,2),DYH=^%SCRE(SCR1,CHC,3) G @TL
V S DYB=(DYH+LO)-1 F %V=DYH:1:DYB S ^KASE($J,%V,DXG)="x^*"
 Q
H S DXD=(DXG+LO)-1 F %V=DXG:1:DXD S ^KASE($J,DYH,%V)="q^*"
 Q
KSP S TB="^%SCRE(SCR1,CHC,4)",LI=-1 F %T=1:1 S LI=$N(@TB@(LI)) Q:LI=-1  S LIB=@TB@(LI),KS=$P(LIB,"~",2) D @(KS_"1")
 Q
L1 S TL=$P(LIB,"~",3),LO=$P(LIB,"~",4),DXG=$P(LIB,"~",5),DYH=$P(LIB,"~",6) D @TL Q
KS1 S TL=$P(LIB,"~",3),DXG=$P(LIB,"~",4),DYH=$P(LIB,"~",5),^KASE($J,DYH,DXG)=TL_"^*" Q
TEST W !,"Grille : " R SCR Q:SCR=""  I '($D(^%SCRE(SCR))) W "???" G TEST
 D CLEPAG^%VVIDEO,^%VIMPSCO,POCLEPA^%VVIDEO W "[RETURN] " R *RET G TEST

