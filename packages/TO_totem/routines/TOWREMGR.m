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

;TOWREMGR^INT^1^59547,74876^0
TOWREMGR ;
 
 S STOP=0,PDX=DX,DX=10,DY=8 X XY
AJ D ^TOWCBLAN S %DUP=0,NXI=9,NXS=80,NYI=7,NYS=23,MPASX=1,MPASY=1,DX=10,DY=8 X XY
AJB D ^TOWMOVCU G:X1=1 FIN G:X1=22 PARA G:X1=7 DEL G:X1=5 ENDSH G:X1=2 BEGSH G:X1=6 PRPOS G:X1=4 DUP G:(X1=94)!(X1=64) PH G:X1=16 JEU G:X1=26 PAGES G:X1=18 RET D ^TOWOCGRI G:REFUSE=1 AJB G PRPOS
FIN D SUIT^TOWOCGRI,CLEPAG^%VVIDEO Q
PRPOS D SUIT^TOWOCGRI I (C="")!(C=CBLANC) S PX=$X,PY=$Y
 I X1=13 S DEV="ECR" D ^TOWRESPH
NEXDY I PY>PSEP S DY=DY+1 G:DY>20 NEXCOL G:'($D(^[QU]STRUCT(NOMG,2,DY))) NEXDY G:$L(^[QU]STRUCT(NOMG,2,DY))>9 NEXDY X XY G AJB
 I NVC=1 S DY=DY+1 S:(PY=(PSEP-1))!('($D(^[QU]STRUCT(NOMG,2,DY)))) DY=PSEP+1 G:DY>20 NEXCOL X XY G AJB
 S PPX=PX-9,ZON=(PPX\(ESPC+1))+1,CASE=PPX#(ESPC+1) I CASE'>LCHP S DX=((PX+LCHP)-CASE)+2 X XY G AJB
SUIDY S PPX=PX-9,CASE=PPX#(ESPC+1),DY=$S((NVC=2)&(PSEP>20):DY+1,1:PSEP+1),DX=(PX-CASE)+1 G:DY>20 NEXCOL G:$L(^[QU]STRUCT(NOMG,2,DY))>9 SUIDY X XY G AJB
 Q
NEXCOL S CCOL=($X-9)\(ESPC+1) G:CCOL'<(NBC-1) PB S DX=((CCOL+1)*(ESPC+1))+10,DY=8 X XY G AJB
JEU D SUIT^TOWOCGRI S CCOL=($X-9)\(ESPC+1),DXC=((ESPC+1)*CCOL)+10,DYC=$Y R *TYP D TOUCHE^%INCCLAV(TYP,.TYP) G:(TYP'=21)&(TYP'=16) AJB S DX=70,DY=1 D BLD^%VVIDEO,BLK^%VVIDEO X XY W $$^%QZCHW("Duplic.") D NORM^%VVIDEO
 G:TYP=16 PLUCOL
JEUQ K ^COLDUP($I) S DX=DXC,DY=DYC X XY
 S DYC=-1 F WW=0:0 S DYC=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,DYC)) Q:DYC=-1  S DXP=-1 F YY=0:0 S DXP=$N(^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,DYC,DXP)) Q:DXP=-1  S ^COLDUP($I,DYC,DXP)=^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,DYC,DXP)
 S DX=70,DY=1 X XY W "       " S DX=10,DY=8 X XY G AJB
DUP S CCOL=($X-9)\(ESPC+1),DXC=((ESPC+1)*CCOL)+10,DX=DXC,DYC=$Y R *TYP D TOUCHE^%INCCLAV(TYP,.TYP) G:(TYP'=21)&(TYP'=16) AJB
 G:TYP=16 DEPCOL
 I '($D(^COLDUP($I))) S ODX=DX,ODY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune valeur a dupliquer n'est connue ! [RETURN] ") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=ODX,DY=ODY X XY G AJB
 K ^GRPH($I) S DYC=-1,TDC="^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP)",CLP="^COLDUP($I)"
 F WW=0:0 S DYC=$N(@CLP@(DYC)) Q:DYC=-1  S DXP=-1 F YY=0:0 S DXP=$N(@CLP@(DYC,DXP)) Q:DXP=-1  I '($D(@TDC@(DYC,DXP))) S @TDC@(DYC,DXP)=@CLP@(DYC,DXP),DY=DYC,DX=DXP X XY W @CLP@(DYC,DXP) S:DYC'=8 ^GRPH($I,DXP,DYC)=@CLP@(DYC,DXP) D:DYC=8 DTL
 D ^TOWGETPH S DX=DXC,DY=8 X XY G AJB
DTL S C=@CLP@(DYC,DXP) D GETLIM Q
DEL S PX=$X,PY=$Y,POSC=$X-9,C=$E(C,1,POSC-1)_$E(CBLANC,POSC,299) D GETLIM S DX=10 X XY W C S DXD=PX-1
 F UU=0:0 S DXD=$N(^GRPH($I,DXD)) Q:DXD=-1  S DYD=-1 F VV=0:0 S DYD=$N(^GRPH($I,DXD,DYD)) Q:DYD=-1  S DX=DXD,DY=DYD X XY W " " K ^GRPH($I,DXD,DYD)
 S DX=PX,DY=PY X XY G AJB
PAGES D SUIT^TOWOCGRI
PAGE S ADR=$S(%DUP=1:"PLUMOV",1:"AJB") D READ^TOWGRPAG G @PGQ
ABPAG D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D PGE^TOWGRPAG,AFFICH^TOWGRPAG S DX=10,DY=8 X XY G @ADR
PGNUM S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) PAGE S PGE=Y1 D DP^TOWGRPAG,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR G PAGE
43 D MORE^%ABCALDP,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR,PGE^TOWGRPAG G PAGE
45 G:DP=^[QUW]OCGRIL(NOMG) PAGE D LESS^%ABCALDP,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR,PGE^TOWGRPAG G PAGE
PLUCOL K ^PLUCOL($I) S %DUP=1,^PLUCOL($I)=DP_"/"_DXC D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Saisie de plusieurs colonnes pour duplication") S DX=70,DY=1 X XY W $$^%QZCHW("Duplic.") D NORM^%VVIDEO S DX=DXC,DY=DYC X XY
PLUMOV D ^TOWMOVCU
 G:X1=20 PAGE
 I X1'=16 S DXC=$X,DYC=$Y,DX=70,DY=1 X XY W "       " D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Saisie avortee !! [RETURN]") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY S %DUP=0 K ^PLUCOL($I) G AJB
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

