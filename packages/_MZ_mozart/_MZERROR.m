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

;%MZERROR^INT^1^59547,73871^0
MOZERROR ;
 
 S PROG=$P($ZE,">",2),PROG="^"_$P(PROG,"^",2),PAGE=1,LIH=14,LIC=14,LIB=20 K VALPOS,POSENR S VS=-1 F VT=1:1 S VS=$N(^EVERROR($I,VS)) Q:VS=-1  D TRAIT
 S NBP=$S($D(POSENR(PAGE)):PAGE,1:PAGE-1) G PAG
TRAIT I VS[" de " S VSA=$P(VS," de ",2),VSP=$P(VS," de ",1),VSQ=VSP_" de "_VSA G SUIT
 S VSQ=VS,VSP=VS,VSA=YA
SUIT S VALPOS(PAGE,LIC)="",POSENR(PAGE,LIC)=VSQ_"^"_VSA_"^"_VSP,LIC=LIC+1 I LIC>LIB S PAGE=PAGE+1,LIC=LIH
END Q
FIN S:$D(PROG) ADERROR="RETERR"_PROG K PROG,POSENR,VALPOS,DXG,DXD,DYH,DYB,GRAPH,MSG,REP,VS,VT,VSQ,VSA,VSV,VSP,LIC,NPG,PAGE,NBP,CTRLA,CTRLE,CTRLF,CTRLB,CTRLL,CTRLZ,CTRLH Q
PAG S PAGE=1 D AFF
QU D POCLEPA^%VVIDEO W $$L24^%QSLIB2,$$^%QZCHW(":abandon, CTRLE:saisie des valeurs, +, -, page") S DX=$X D ^%VLEC G FPAG:CTRLA,VAL:CTRLE,PL:Y1="+",MS:Y1="-",PL:Y1="=",QU:Y1="",QU:'($D(POSENR(Y1)))
 G QU:Y1=PAGE S PAGE=Y1 D AFF G QU
PL S NPG=PAGE+1 G:'($D(POSENR(NPG))) QU S PAGE=NPG D AFF G QU
MS S NPG=PAGE-1 G:'($D(POSENR(NPG))) QU S PAGE=NPG D AFF G QU
FPAG S PAGE=-1 F VT=0:0 S PAGE=$N(POSENR(PAGE)) Q:PAGE=-1  S LIC=-1 F VT=0:0 S LIC=$N(POSENR(PAGE,LIC)) Q:LIC=-1  S VSA=$P(POSENR(PAGE,LIC),"^",2),VSP=$P(POSENR(PAGE,LIC),"^",3),V(VSA,VSP)=$S($D(^v(VSA,VSP)):^v(VSA,VSP),1:VALPOS(PAGE,LIC)) D MAJQS
 G FIN
AFF S DXG=2,DXD=74,DYH=14,DYB=22 D LWIN^%VVIDEO S LIC=-1 F VT=1:1 S LIC=$N(POSENR(PAGE,LIC)) Q:LIC=-1  S DX=2,DY=LIC,VSA=$J($P(POSENR(PAGE,LIC),"^",1),40) X XY W VSA S DX=43 X XY W "="
 S DX=69,DY=21 X XY W "          " X XY W "Page ",PAGE,"/",NBP Q
VAL S MPASX=0,MPASY=1,NXI=44,NXS=47,NYI=13,NYS=21,(PY,DY)=14,DX=46 X XY
VALS S %FL=0,C=""
 D ECHOFF^%VVIDEO
LEC S C="" D ^%VZECUR G:X1=1 QU G:(X1=6)!(X1=13) FINV G:X1=7 GOMME S:C="" PX=$X,PY=$Y G:(C="")&('($D(POSENR(PAGE,PY)))) LEC W $C(X1)
 S YG=$C(X1)_$E(VALPOS(PAGE,PY),2,599),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC I (CTRLA=1)!(CTRLF=1) S C="" G FINV
 S C=Y1 G FINV1
FINV S PY=$Y G:'($D(POSENR(PAGE,PY))) ENDV
FINV1 S VALPOS(PAGE,PY)=C G ENDV
 Q
EFF S DX=50,DY=PY X XY W "                            " X XY Q
GOMME Q:'($D(POSENR(PAGE,$Y)))  S ADY=$Y,PY=$Y,PY=ADY,VALPOS(PAGE,PY)="" G EFF
ENDV K DE,FI,CHP,ADY,PARA,VPA,VPD,C,Y1,YG S DY=PY+1,DX=46 S:DY>20 DY=20 X XY G VALS
MAJQS 
 D PA^%QSGESTI(VSA,PGM,VSP,V(VSA,VSP)+0,1) Q

