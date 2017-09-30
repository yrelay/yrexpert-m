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

;TOWAUTST^INT^1^59547,74876^0
TOWAUTST ;
 
 Q:('($D(NOMTAB)))!('($D(SCR)))
 S %KN=0,INL=1,LLS=0 F I=1:1:^[QU]SCRC(SCR) S LLS=LLS+$L(RESUL(I))
 I LLS>150 D POCLEPA^%VVIDEO W $$^%QZCHW(" vos donnees sont un peu abondantes... un instant svp") G LONG
 S IN=""""_NOMG_"""",RS=""
 F IC=1:1 Q:'($D(RESUL(IC)))  S ISN=$S($D(^[QU]SCRC(SCR,IC))=11:"IND",1:"RES") D @ISN Q:ABENDSCR=1
 S NOM=NOMTAB_"("_IN_")" G LONG:$L(NOM)>122,REFINS:IN=""
 I $D(@NOM) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Creation refusee ! Cette grille existe deja ...[RETURN] ") R *RET S ABENDSCR=1 Q
 S @NOM=RS
 Q
RES S RS=RS_RESUL(IC)_"^" Q
IND I RESUL(IC)="" D REFUS Q
 S IN=IN_$S(IN="":""""_RESUL(IC)_"""",1:","_""""_RESUL(IC)_"""")
 Q
REFINS D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Informations insuffisantes ") H 2 S PADMESSA="                            " D PAD^%VZEATT Q
REFUL D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Informations trop abondantes : veuillez abreger les champs ") H 2
 S DY=24 X XY F ICC=1:1:^[QU]SCRC(SCR) I $D(^[QU]SCRC(SCR,ICC))=11 W "/",^[QU]SCRC(SCR,ICC,1)
 H 2 D ^%VAFIGRI,^%VAFISCR S IC=1,ABENDSCR=0 D ^%VKMODIS G AUTOSTO:ABENDSCR=0 Q
REFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Il faut obligatoirement une information dans  "),^[QU]SCRC(SCR,IC,1) H 2 D ^%ABAFIGR,^%ABAFSCR S ABENDSCR=0 D LOOP^%ABMODIG G TOWAUTST:ABENDSCR=0 Q
LONG D ^%ABLONST Q
S W *
 S CCOL=($X-9)\(ESPC+1),DYC=$Y,DXC=((ESPC+1)*CCOL)+10,DX=DXC,^PLUCOL($I)=^PLUCOL($I)_"^"_DP_"/"_DXC,%DUP=0,DX=70,DY=1 X XY W "       " D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY
 G AJB
DEPCOL I '($D(^PLUCOL($I))) S ODX=DX,ODY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune colonne a dupliquer n'est connue ! [RETURN] ") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=ODX,DY=ODY X XY G AJB
 D ^TOWDEPCO X XY G AJB
PB D MORE^%ABCALDP,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR,PGE^TOWGRPAG,AFFICH^TOWGRPAG S DX=10,DY=8 X XY G AJB
RET D SUIT^TOWOCGRI,^TOWGRETO G AJB
PH S DXC=$X,DYC=$Y,POSC=$X-9,C=$E(C,1,POSC-1)_"*"_$E(C,POSC+1,299) I '($D(^GRPH($I,DXC))) S DY=DYC+1,^GRPH($I,DXC,DY)=$C(X1) X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
 S NDY=-1,BDY=DYC+1 F TT=0:0 S NDY=$N(^GRPH($I,DXC,NDY)) Q:NDY=-1  S BDY=NDY
 S NDY=BDY+1,DY=NDY,^GRPH($I,DXC,DY)=$C(X1),DX=DXC X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
BEGSH S BL="" F UU=1:1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL'<69:10,1:LBL+10) X XY G AJB
GETLIM S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S %TBL=$L(BL),%DCAR=(79-%TBL)-1 Q
ENDSH S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL=0:79,1:79-LBL) X XY G AJB
PARA S DXC=$X,DYC=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D SUIT^TOWOCGRI,^TOWGPARA,CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU K RESUL D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY G AJB
 X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
 S NDY=-1,BDY=DYC+1 F TT=0:0 S NDY=$N(^GRPH($I,DXC,NDY)) Q:NDY=-1  S BDY=NDY
 S NDY=BDY+1,DY=NDY,^GRPH($I,DXC,DY)=$C(X1),DX=DXC X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
 S BL="" F UU=1:1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL'<69:10,1:LBL+10) X XY G AJB
 S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S %TBL=$L(BL),%DCAR=(79-%TBL)-1 Q
 S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL=0:79,1:79-LBL) X XY G AJB
 S DXC=$X,DYC=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D SUIT^TOWOCGRI,^TOWGPARA,CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU K RESUL D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY G AJB

