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

;%VTENR^INT^1^59547,74036^0
GETENR ;
 
 
 S EXITAB=$P(NOMTAB,"(",1),EXK=$N(@EXITAB@(-1)) G:(EXK=-1)!((EXK="z")!(EXK="b")) FIN
 S STOP=0 D CLE I NBCLE'>0 S IFLAG=-2 G FIN
 S POSI=1,NVIRG=0,NAMTAB=$S(NOMTAB["(":NOMTAB_",",1:NOMTAB),DEB=1 F Z1=0:0 S POSI=$F(NAMTAB,",",POSI) Q:POSI=0  S NVIRG=NVIRG+1
 S DEB=NVIRG+1,APPAR=$P(NOMTAB,"(",2) F Z2=1:1:NVIRG S (@("B"_Z2),@("AB"_Z2))=$P(APPAR,",",Z2)
 S NOM=$S(NOMTAB["(":NOMTAB_",",1:NOMTAB_"("),IFLAG=0,AB="AB" F I=DEB:1:NBCLE S @("AB"_I)=-1
 K DD,NN,NEX,TAB,TABN,EXK,EXITAB,IFLAG,POSI,NAMTAB,APPAR,Z2
L F %RP=DEB:1:NBCLE S @("V="_AB_%RP),VP="V",C=NOM_VP_")",(E,@("B"_%RP))=$N(@C) G:@("B"_%RP)=-1 S S @("NOM"_%RP)=NOM,NOM=NOM_("B"_%RP)_","
 K V,VP,C,E S NOM=$E(NOM,1,$L(NOM)-1)_")" S:($D(@NOM)=1)!($D(@NOM)=11) RS=@NOM D ^%VMULN2:$D(@NOM)=10,^%VKMULC:$D(@NOM)'=10,@ADR G:STOP=1 FIN
 S NOM=@("NOM"_%RP),DEB=NBCLE,AB="B" G C3
S I %RP=(NVIRG+1) G FIN
 F %U=%RP:1:NBCLE S @("B"_%U)=@("AB"_%U)
 S:%RP'=1 %RP=%RP-1 S AB="B",DEB=%RP,NOM=@("NOM"_%RP) G L
 Q
C3 G L
FIN K %RS,%RP,%U,APPAR,B1,B2,B3,B4,B5,B6,B7,B8,B9,AB1,AB2,AB3,AB4,AB5,AB6,AB7,AB8,AB9,AC1,AC2,AC3,AC4,AC5,AC6,AC7,AC8,AC9,NOM1,NOM2,NOM3,NOM4,NOM5,NOM6,NOM7,NOM8,NOM9,C,DD,E,EXITAB,EXK,I,IFLAG,NAMTAB,NBCLE,NEX,NN,POSI,TAB,TABN,VP,Z1,Z2 Q
TEST W !,"Nom du global : " R NOMTAB Q:NOMTAB=""  S NOMTAB="^[QUI]"_NOMTAB,NAMTAB=$S(NOMTAB["(":NOMTAB_")",1:NOMTAB),ADR="ECRI" I '($D(@NAMTAB)) W " ???" G TEST
 D DEB^%VTIME,^%VTENR,AFF^%VTIME G TEST
CLE S TAB=$P(NOMTAB,"(",1)_"(",NEX=-1,NBCLE=0 I $P(NOMTAB,"(",1)="^[QUI]RDV" S NBCLE=6 G FINCLE
 F DD=0:0 S TABN=TAB_NEX_")",NN=$N(@TABN) Q:NN=-1  S TAB=TAB_""""_NN_""",",NBCLE=NBCLE+1
FINCLE Q
 S ADR="ECRI" D GETENR G TEST
ECRI W !,NOM Q
DEL W !,B1,!,NOM I $D(@NOM)=1 W "A TUER" K @(NOM)

