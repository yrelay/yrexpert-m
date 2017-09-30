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

;TOWMOVCU^INT^1^59547,74876^0
TOWMOVCU ;
 
 S CNULS="",CNULI="" F UU=1:1:LCHP S CNULS=CNULS_" "
 F UU=1:1:ESPC S CNULI=CNULI_" "
LEC D ^TOWMMOVC G:$Y>8 PH G:X1=8 HELP G:X1=9 IMPR G:X1=26 FIN G:%DUP=1 FIN
 G:(X1=1)!((X1=6)!((X1=13)!((X1=7)!((X1=4)!((X1=94)!((X1=64)!((X1=18)!((X1=5)!((X1=2)!((X1=4)!((X1=16)!(X1=22)))))))))))) FIN S PX=$X,PY=$Y G:X1=127 DEL S TY="A" D:(X1=61)!((X1=45)!((X1=42)!(X1=32))) GETC G LEC
FIN Q
DEL S TY="S",LC=$L(C) G:LC=0 LEC D GETC G LEC
HELP D SUIT^TOWOCGRI,^TOWHELPG G LEC
GETC I TY="A",%DCAR'<%PLX D ^%VSQUEAK G FIN
 S:(C=CBLANC)&($C(X1)'=" ") %DCAR=$X-1 S DXC=$X,DYC=$Y,POSC=$X-9,EPS=$S($E(C,POSC)=" ":0,1:0),CG=$E(C,1,POSC-1),CD=$E(C,POSC+EPS,299) G:TY="S" GETCD
 I X1=32 S POSP=POSC-1,X1=$S($E(C,POSP)="":X1,1:$A($E(C,POSP)))
 S CCD=$C(X1)_CD,C=CG_CCD S:$L(C)>69 C=$E(C,1,69) D DECP S DX=DXC,DY=DYC X XY W CCD S %DD=$S(DX'>%DCAR:1,1:$S(X1=32:0,1:DX-%DCAR)),%DCAR=%DCAR+%DD,%TBL=%TBL-%DD,DX=DX+1 X XY G FIN
GETCD G:DXC=10 FIN D:$D(^GRPH($I,DXC)) KILL S CD=$E(C,POSC+1,299)_" ",CG=$E(C,1,POSC-1),%DD=$S(DXC>%DCAR:0,1:1),%DCAR=%DCAR-%DD,%TBL=%TBL+%DD,C=CG_CD D DECM S DX=DXC,DY=DYC X XY W CD S:C=CBLANC %DCAR=10 S DX=DX-1 X XY G FIN
PH S DXC=$X,DYC=$Y,POSC=$X-9,C=$E(C,1,POSC-1)_"*"_$E(C,POSC+1,299)
 S DX=DXC,DY=DYC X XY S REP=X1 I (REP'=1)&((REP'=7)&((REP'=94)&(REP'=64))) D ^%VSQUEAK G LEC
 S ADR=REP S:REP=94 ADR=64 G @ADR
1 D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY G LEC
7 D CUROF^%VVIDEO K ^GRPH($I,DXC,DYC) S DX=DXC,DY=DYC X XY W " " X XY S NYC=DYC F UU=0:0 S NYC=$N(^GRPH($I,DXC,NYC)) Q:NYC=-1  S DX=DXC,DY=NYC X XY W " " S DY=NYC-1 X XY W ^GRPH($I,DXC,NYC) S ^GRPH($I,DXC,DY)=^GRPH($I,DXC,NYC) K ^GRPH($I,DXC,NYC)
 
 D CURON^%VVIDEO S DX=DXC,DY=DYC X XY G LEC
64 D CUROF^%VVIDEO S NDY=DYC-1 K GRPH F UU=0:0 S NDY=$N(^GRPH($I,DXC,NDY)) Q:NDY=-1  S GRPH(NDY+1)=^GRPH($I,DXC,NDY) K ^GRPH($I,DXC,NDY)
 S ^GRPH($I,DXC,DYC)=$C(REP),NDY=-1,DX=DXC,DY=DYC X XY W $C(REP) F UU=0:0 S NDY=$N(GRPH(NDY)) Q:NDY=-1  S DY=NDY X XY W GRPH(NDY) S ^GRPH($I,DXC,NDY)=GRPH(NDY)
 D CURON^%VVIDEO S DX=DXC,DY=DYC X XY G LEC
DECP K ^GRPH2($I) S CX=DXC-1 F UU=1:1 S CX=$N(^GRPH($I,CX)) Q:CX=-1  S CY=-1 F VV=0:0 S CY=$N(^GRPH($I,CX,CY)) Q:CY=-1  S DX=CX,DY=CY X XY W " " S ^GRPH2($I,CX+1,CY)=^GRPH($I,CX,CY) K ^GRPH($I,CX,CY)
 S CX=-1 F UU=0:0 S CX=$N(^GRPH2($I,CX)) Q:CX=-1  S CY=-1 F VV=0:0 S CY=$N(^GRPH2($I,CX,CY)) Q:CY=-1  S DX=CX,DY=CY X XY W ^GRPH2($I,CX,CY) S ^GRPH($I,CX,CY)=^GRPH2($I,CX,CY)
 Q
DECM K ^GRPH2($I) S CX=DXC-1 F UU=1:1 S CX=$N(^GRPH($I,CX)) Q:CX=-1  S CY=-1 F VV=0:0 S CY=$N(^GRPH($I,CX,CY)) Q:CY=-1  S DX=CX,DY=CY X XY W " " S ^GRPH2($I,CX-1,CY)=^GRPH($I,CX,CY) K ^GRPH($I,CX,CY)
 S CX=-1 F UU=0:0 S CX=$N(^GRPH2($I,CX)) Q:CX=-1  S CY=-1 F VV=0:0 S CY=$N(^GRPH2($I,CX,CY)) Q:CY=-1  S DX=CX,DY=CY X XY W ^GRPH2($I,CX,CY) S ^GRPH($I,CX,CY)=^GRPH2($I,CX,CY)
 Q
KILL S CY=-1 F UU=0:0 S CY=$N(^GRPH($I,DXC,CY)) Q:CY=-1  S DX=DXC,DY=CY X XY W " "
 K ^GRPH($I,DXC) Q
IMPR S DXAI=$X,DYAI=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D SUIT^TOWOCGRI,^TOWIMPR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXAI,DY=DYAI X XY G LEC

