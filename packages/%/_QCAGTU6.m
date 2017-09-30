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

;%QCAGTU6^INT^1^59547,73875^0
TREEWAYT ;
 
 S %TWT="TREEWAY",STOP=0,%TWT("POSI")=1,%TWT("NVIRG")=0,%TWT("NAMTAB")=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE)
 S %TWT("%8DEB")=1 F Z1=0:0 S %TWT("POSI")=$F(%TWT("NAMTAB"),",",%TWT("POSI")) Q:%TWT("POSI")=0  S %TWT("NVIRG")=%TWT("NVIRG")+1
 S (%TWT("%PR"),%TWT("%8DEB"))=%TWT("NVIRG")+1,%TWT("%PR")=%TWT("NVIRG")
 S (%TWT("%TREFC"),%TWT("%APAR"))=$P(NOMTREE,"(",2) F Z2=1:1:%TWT("NVIRG") S %TWT("B",Z2)=$P(%TWT("%APAR"),",",Z2)
 S %TWT("NOM")=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE) I ($D(@%TWT("NOM"))=1)!($D(@%TWT("NOM"))=11),$L(@%TWT("NOM"))'=0 D @ADR
 S %TWT("%PR")=%TWT("%PR")+1,%TWT("NOM")=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE_"(") K %IFLAG,%TWT("%APAR"),%TWT("NAMTAB"),%TWT("POSI"),Z1,Z2
L S %TWT("B",%TWT("%PR"))=$S($D(%TWT("B",%TWT("%PR"))):%TWT("B",%TWT("%PR")),1:-1),%TWT("V")=%TWT("B",%TWT("%PR")),%TWT("VP")=""""_%TWT("V")_""""
 S %TWT("C")=%TWT("NOM")_%TWT("VP")_")",%TWT("B",%TWT("%PR"))=$N(@%TWT("C")) G:%TWT("B",%TWT("%PR"))=-1 S
 S %TWT("NOM",%TWT("%PR"))=%TWT("NOM"),%TWT("NOM")=%TWT("NOM")_""""_%TWT("B",%TWT("%PR"))_""",",%TWT("%TREFC")=%TWT("%TREFC")_$S(%TWT("%TREFC")'="":",",1:"")_%TWT("B",%TWT("%PR"))
FIRST S %TWT("NOM")=$E(%TWT("NOM"),1,$L(%TWT("NOM"))-1)_")"
 I ($D(@%TWT("NOM"))'=1)&($D(@%TWT("NOM"))'=11) G SUIV
 D @ADR G:STOP=1 FIN I STOP=0 S %TWT("%PR")=%TWT("%PR")+1,%TWT("NOM")=$E(%TWT("NOM"),1,$L(%TWT("NOM"))-1)_"," G C3
 I STOP="F" S %TWT("NOM")=%TWT("NOM",%TWT("%PR")),STOP=0,%TWT("%TREFC")=$E(%TWT("%TREFC"),1,($L(%TWT("%TREFC"))-$L($P(%TWT("%TREFC"),",",%TWT("%PR")-1)))-1) G C3
 G:STOP'="O" C3
 S %TWT("%PR")=%TWT("%PR")-1 G:%TWT("%PR")'>%TWT("NVIRG") FIN G:'($D(%TWT("NOM",%TWT("%PR")))) FIN
 S %TWT("NOM")=%TWT("NOM",%TWT("%PR")),STOP=0,%TWT("%TREFC")=$E(%TWT("%TREFC"),1,(($L(%TWT("%TREFC"))-$L($P(%TWT("%TREFC"),",",%TWT("%PR"))))-$L($P(%TWT("%TREFC"),",",%TWT("%PR")-1)))-2)
 F UU=%TWT("%PR")+1:1 Q:'($D(%TWT("B",UU)))  K %TWT("B",UU)
 G C3
SUIV S %TWT("%PR")=%TWT("%PR")+1,%TWT("NOM")=$E(%TWT("NOM"),1,$L(%TWT("NOM"))-1)_"," G C3
S I %TWT("%PR")=(%TWT("NVIRG")+1) S %IFLAG=-2 G FIN
 F UU=%TWT("%PR"):1 Q:'($D(B(UU)))  K B(UU)
 S:%TWT("%PR")'=1 %TWT("%PR")=%TWT("%PR")-1 S %TWT("%8DEB")=%TWT("%PR"),%TWT("NOM")=%TWT("NOM",%TWT("%PR")),%TWT("%TREFC")=$E(%TWT("%TREFC"),1,($L(%TWT("%TREFC"))-$L($P(%TWT("%TREFC"),",",%TWT("%PR"))))-1) G L
 Q
C3 G L
FIN K %TWT("%8DEB"),%TWT("%APAR"),%IFLAG,%TWT("%PR"),%TWT("%TREFC"),C,%TWT("NAMTAB"),%TWT("POSI"),VP,Z1,Z2 Q
TEST W !,"nom du global : " R NOMTREE G:NOMTREE="" FIN S ADR="ECR^%QCAGTU6" D DEB^%VTIME,^%QCAGTU6,AFF^%VTIME G TEST
ECR W !,%TWT("%TREFC") Q

