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

;%QCAGTU^INT^1^59547,73875^0
%ZTREEWA ;
 
 K B,NOM S %IFLAG=0,STOP=0,POSI=1,NVIRG=0,NAMTAB=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE),%1DEB=1 F Z1=0:0 S POSI=$F(NAMTAB,",",POSI) Q:POSI=0  S NVIRG=NVIRG+1
 S AB="B",(%PR,%1DEB)=NVIRG+1,%PR=NVIRG
 S (%TREFC,%APAR)=$P(NOMTREE,"(",2) F Z2=1:1:NVIRG S B(Z2)=$P(%APAR,",",Z2)
 S NOM=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE) I ($D(@NOM)=1)!($D(@NOM)=11),$L(@NOM)'=0 D @ADR
 S %PR=%PR+1,NOM=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE_"(")
L S @AB@(%PR)=$S($D(@AB@(%PR)):@AB@(%PR),1:-1),V=@AB@(%PR),VP=""""_V_"""",C=NOM_VP_")",(E,@"B"@(%PR))=$N(@C) G:@"B"@(%PR)=-1 S S NOM(%PR)=NOM,NOM=NOM_""""_B(%PR)_""",",%TREFC=%TREFC_$S(%TREFC'="":",",1:"")_B(%PR)
FIRST S NOM=$E(NOM,1,$L(NOM)-1)_")"
 I ($D(@NOM)'=1)&($D(@NOM)'=11) G SUIV
 D @ADR G:STOP=1 FIN I STOP=0 S %PR=%PR+1,NOM=$E(NOM,1,$L(NOM)-1)_"," G C3
 I STOP="F" S NOM=NOM(%PR),STOP=0,%TREFC=$E(%TREFC,1,($L(%TREFC)-$L($P(%TREFC,",",%PR-1)))-1) G C3
 I STOP="O" S %PR=%PR-1 G:%PR'>NVIRG FIN G:'($D(NOM(%PR))) FIN S NOM=NOM(%PR),STOP=0,%TREFC=$E(%TREFC,1,(($L(%TREFC)-$L($P(%TREFC,",",%PR)))-$L($P(%TREFC,",",%PR-1)))-2) F UU=%PR+1:1 Q:'($D(B(UU)))  K B(UU)
 G C3
SUIV S %PR=%PR+1,NOM=$E(NOM,1,$L(NOM)-1)_"," G C3
S I %PR=(NVIRG+1) S %IFLAG=-2 G FIN
 F UU=%PR:1 Q:'($D(B(UU)))  K B(UU)
 S:%PR'=1 %PR=%PR-1 S AB="B",%1DEB=%PR,NOM=NOM(%PR),%TREFC=$E(%TREFC,1,($L(%TREFC)-$L($P(%TREFC,",",%PR)))-1) G L
 Q
C3 G L
FIN K %1DEB,%APAR,%IFLAG,%PR,%TREFC,C,NAMTAB,POSI,VP,Z1,Z2 Q
TEST W !,"nom du global : " R NOMTREE G:NOMTREE="" FIN S ADR="ECR^%QCAGTU" D ^%QCAGTU G TEST
ECR W !,%TREFC Q

