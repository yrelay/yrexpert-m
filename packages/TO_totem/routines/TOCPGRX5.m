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

;TOCPGRX5^INT^1^59547,74871^0
%ABCPG05 ;
 S COL=-1,TB="^[QUW]TOCPNUPL(NUGR"
LCOL S COL=$N(^PARA($J,COL)) G:COL=-1 FCOL S REF="",PARA=-1
LA S PARA=$N(^PARA($J,COL,"A",PARA)) G:PARA=-1 FA S VP=^PARA($J,COL,"A",PARA),REF=REF_","""_VP_"""" G LA
FA I '($D(^PARA($J,COL,"N"))) S @(TB_REF_")")=COL G LCOL
 K ^PNUM($J)
LN S PARA=$N(^PARA($J,COL,"N",PARA)) G:PARA=-1 FN S VP=^PARA($J,COL,"N",PARA),BI=$P(VP,",",1),BS=$P(VP,",",2),^PNUM($J,PARA,BI)=1 F %U=1:1 S BI=$N(^[QUW]TOCPBORN(NUGR,PARA,"I",BI)) Q:BI=-1  Q:BI>BS  S ^PNUM($J,PARA,BI)=1
 G LN
FN K ^PILP1($J),^PILP2($J) S PARA=$N(^PNUM($J,PARA)) Q:PARA=-1  S BI=-1 F %U=1:1 S BI=$N(^PNUM($J,PARA,BI)) Q:BI=-1  S ^PILP1($J,%U)=""""_BI_""""
 S PS="^PILP1($J)",PB="^PILP2($J)"
LP S PARA=$N(^PNUM($J,PARA)) G:PARA=-1 FP S BI=-1,%V=1 K @(PB)
LBI S BI=$N(^PNUM($J,PARA,BI)) G:BI=-1 FBI S NU=-1
LNU S NU=$N(@PS@(NU)) G:NU=-1 LBI S RC=@PS@(NU),RC=RC_","""_BI_"""",@PB@(%V)=RC,%V=%V+1 W "." G LNU
FBI S %U=PS,PS=PB,PB=%U G LP
FP S NU=-1 F %U=1:1 S NU=$N(@PS@(NU)) Q:NU=-1  S RFC=REF_","_@PS@(NU),@(TB_RFC_")")=COL
 G LCOL
FCOL Q
Y S %DUP=0 K ^PLUCOL($I) G AJB
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

