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

;TOGMODPH^INT^1^59547,74872^0
TOGMODPH ;
 
 K RESUL D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S SCR="MODIFGAM",NOMTAB="",RESUL(1)=NO G @CO
A S RESUL(1)=NO F UU=2:1:24 S RESUL(UU)=""
 G MOD
S W $$^%QZCHW("Suppression en cours...") D SUP,132^%VVIDEO G END
SUP S %U0=^[QUI]PHAS(NUFA,TWREF,NO) K ^[QUI]PHAS(NUFA,TWREF,NO),^GDIM($I),^[QUI]RAISON(NUFA,TWREF,%U0) I $D(^[QUI]CONS(NUFA,TWREF,%U0)) S CONS=^[QUI]CONS(NUFA,TWREF,%U0) K ^[QUI]RAISON(NUFA,TWREF,CONS_"/"_NO)
 G:'($D(^[QUI]DIM(NUFA))) S2 S %U2=-1 F UU=1:1 S %U2=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U2)) Q:%U2=-1  S DIM=$P(^[QUI]DIM(NUFA,TWREF,%U0,%U2),"|",1) K ^[QUI]RAISON(NUFA,TWREF,DIM_"/"_NO)
S2 S REF="(NUFA,TWREF,%U0)" F TB="PHAS","SECT","COUT","DUREE","DIM","CONS" K @("^[QUI]"_TB_REF)
 Q
M K ^GDIM($I) S %U0=^[QUI]PHAS(NUFA,TWREF,NO),RESUL(2)=$S($D(^[QUI]SECT(NUFA,TWREF,%U0)):^[QUI]SECT(NUFA,TWREF,%U0),1:""),RESUL(3)=$P(%U0,"/",1),RESUL(5)=$S($D(^[QUI]DUREE(NUFA,TWREF,%U0)):^[QUI]DUREE(NUFA,TWREF,%U0),1:"")
 S RESUL(6)=$S($D(^[QUI]COUT(NUFA,TWREF,%U0)):^[QUI]COUT(NUFA,TWREF,%U0),1:""),RESUL(4)=$S($D(^[QUI]CONS(NUFA,TWREF,%U0)):^[QUI]CONS(NUFA,TWREF,%U0),1:"")
 S %U2=-1,%U3=7 F UU=1:1 S %U2=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U2)) Q:%U2=-1  S %U4=^[QUI]DIM(NUFA,TWREF,%U0,%U2),RESUL(%U3)=$P(%U4,"|",1),RESUL(%U3+1)=$P(%U4,"|",2),%U3=%U3+2,^GDIM($I,%U4)=1
 F UU=7:1:24 I '($D(RESUL(UU))) S RESUL(UU)=""
MOD K ^RESUL($I) F UU=1:1:24 S ^RESUL($I,UU)=RESUL(UU)
 D CLEPAG^%VVIDEO,80^%VVIDEO,^%VAFIGRI,^%VAFISCR
 K ^IGCURGRI($I,SCR),^GCURGRIL($I,SCR) F ICC=1:1:^%SCRE(SCR) S XX=^%SCRE(SCR,ICC,2),YY=^%SCRE(SCR,ICC,3),^GCURGRIL($I,SCR,YY,XX)=ICC,^IGCURGRI($I,SCR,-(YY),XX)=1
MOD1 S CMS=0 D ^%VKMODIS G:ABENDSCR=1 END D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 I (RESUL(1)="")!(RESUL(3)="") D POCLEPA^%VVIDEO W $$^%QZCHW("Information insuffisante...[RETURN] ") R *RET G MOD1
 I (RESUL(1)'=^RESUL($I,1))!(RESUL(3)'=^RESUL($I,3)) D:CO'="A" SUP F UU=1:1:24 S ^RESUL($I,UU)=""
 S NNO=RESUL(1),%U01=RESUL(3)_"/"_RESUL(1) G:$D(^[QUI]PHAS(NUFA,TWREF,RESUL(1))) DERIV S ^[QUI]PHAS(NUFA,TWREF,RESUL(1))=%U01,^[QUI]RAISON(NUFA,TWREF,RESUL(1))="PHASEMODIFICATION",^[QUI]RAISON(NUFA,TWREF,%U01)="PHASEMODIFICATON"
DERIV S NU=2,TB1="^[QUI]SECT(NUFA,TWREF," D GET S NU=4,TB1="^[QUI]CONS(NUFA,TWREF," D GET I OIT'=IT K ^[QUI]RAISON(NUFA,TWREF,OIT_"/"_NO) S:IT'="" ^[QUI]RAISON(NUFA,TWREF,IT_"/"_NNO)="OUTCONSMODIFICATION"
 S NU=5,TB="^[QUI]DUREE",TB1="^[QUI]DUREE(NUFA,TWREF," D GET S NU=6,TB="^[QUI]COUT",TB1="^[QUI]COUT(NUFA,TWREF," D GET
 K ^GDIM2($I) F UU=7:2:23 S:(RESUL(UU)'="")&(RESUL(UU+1)'="") ^GDIM2($I,RESUL(UU)_"|"_RESUL(UU+1))=1
 S %U4=-1 S:'($D(%U0)) %U0=0 F UU=1:1 S %U4=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U4)) Q:%U4=-1  S %U6=^[QUI]DIM(NUFA,TWREF,%U0,%U4) I '($D(^GDIM2($I,%U6))) S %U5=$P(%U6,"|",1) K ^[QUI]DIM(NUFA,TWREF,%U0,%U4),^[QUI]RAISON(NUFA,TWREF,%U5_"/"_NO)
 S (NB,NBD)=-1 F UU=1:1 S NB=$N(^[QUI]DIM(NUFA,TWREF,%U0,NB)) Q:NB=-1  S NBD=NB
 S NBD=$S(NBD=-1:1,1:NBD+1),%U4=-1 F UU=1:1 S %U4=$N(^GDIM2($I,%U4)) Q:%U4=-1  I '($D(^GDIM($I,%U4))) S %U5=$P(%U4,"|",1),^[QUI]DIM(NUFA,TWREF,%U01,NBD)=%U4,^[QUI]RAISON(NUFA,TWREF,%U5_"/"_NNO)="DIMOUTMODIFICATION",NBD=NBD+1
 G END
GET S IT=RESUL(NU),OIT=^RESUL($I,NU) G:IT=OIT FGET
 I OIT'="" K @(TB1_""""_%U0_""")")
 S:IT'="" @(TB1_""""_%U01_""")")=IT
FGET Q
UC S REFUSE=0 I $D(^POSENR($I,RESUL(IC))) S REFUSE=1
FIN Q
END D CLEPAG^%VVIDEO,132^%VVIDEO K RESUL,%U6,SCR,CO,UU,%U0,%U2,DIM,REF,TB,^GDIM($I),^GDIM2($I),%U3,%U4,%U5,^RESUL($I),RET,NNO,%U01,NU,TB,TB1,IT,OIT,NB,NBD Q

