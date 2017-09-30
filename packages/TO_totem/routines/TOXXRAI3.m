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
;! Nomprog     : TOXXRAI3                                                     !
;! Module      : TOTEM                                                        !
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
;! HL002 ! HL     ! 22/06/08 ! Ajout du label PILV2                           !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOXXRAI3^INT^1^59547,74877^0
TOXXRAI3 ;
 K LIBVU S %LSEP=" :"",;^%_#+*-/\[]()&!<>=",PGE=-1,ADRG="FIN",ADRF="T0^TOXXRAI3" K PAGIN
 F %U=0:0 S PGE=$N(TBCOND(PGE)) Q:PGE=-1  S LIC=-1 F %U=0:0 S LIC=$N(TBCOND(PGE,LIC)) Q:LIC=-1  S XDP=TBCOND(PGE,LIC) D ^%ABVSQUL K LIBVU
 S NBPG=$ZP(TBCOND("")),PGE=1 D AFF
QU D CLEBA^TOXXRAIS S DX=1 X XY W $$^%QZCHW("Page "),PGE,"/",NBPG,$$^%QZCHW(" +,-,page,CTRLE,CTRLA ")
 S DX=$X D ^%VLEC G INFO:CTRLE,FT0:CTRLA,PL:Y1="=",PL:Y1="+",MS:Y1="-" S PCH=Y1 D TO^%QZNBN1 G QU:'(ISNUM),QU:Y1=PGE,QU:'($D(TBCOND(Y1))) S PGE=Y1 D AFF G QU
PL S NPG=PGE+1 G:'($D(TBCOND(NPG))) QU S PGE=NPG D AFF G QU
MS S NPG=PGE-1 G:'($D(TBCOND(NPG))) QU S PGE=NPG D AFF G QU
INFO S PX=2,PY=13,TBMOV="PAGIN(PGE)"
LEC S DX=PX,DY=PY D ^%VZEREVS G FT0:X1=1,FT0:X1=6 S PX=$X,PY=$Y G LEC:'($D(PAGIN(PGE,PY,PX))),NEW:X1=13,NEW:X1=63,LEC
NEW S TPL=^PILAVER($J)+1,^PILAVER($J)=TPL D ^TOXXRAI4,PILVU G FT0
PILVU S TPL=^PILVU($J),TPL(1)=$P(TPL,"/",1),TPL(2)=$P(TPL,"/",2),TPL(3)=$P(TPL,"/",3),LD=$P(TPL(1),",",1),LHA=$P(TPL(1),",",2),PGC=$P(TPL(2),",",1),LIGC=$P(TPL(2),",",2) S:PGC'>0 PGC=1,LIGC=LD
 G:$L(VAL)'>27 PILV1
 I LIGC<LHA S PGC=PGC+1,LIGC=LD D AFFV
 S PCH=VAL(2) D TO^%QZNBN1 I ISNUM&(PCH'[".") S VAL(2)=$J(VAL(2),1,2),VAL=VAL(1)_" = "_VAL(2) G:$L(VAL)'>27 PILV2
 S %TP="D",%LIB=VAL D ^TOABSPEC S VAL=%ABSP G:$L(VAL)'>27 PILV1 S VAL=$E(VAL,1,27)
PILV2 ;HL002
PILV1 O $I S DX=51,DY=LIGC X XY W VAL S ^PILVU($J,PGC,LIGC)=VAL,^PILVU($J)=TPL(1)_"/"_PGC_","_(LIGC-1)_"/"_(TPL(3)+1) Q
 
AFFV D CUROF^%VVIDEO S DX=51 F DY=LHA:1:LD X XY W $J("",27)
 S DY=-1 F %U=1:1 S DY=$N(^PILVU($J,PGC,DY)) Q:DY=-1  X XY W ^PILVU($J,PGC,DY)
 D CURON^%VVIDEO Q
AFF D CUROF^%VVIDEO S DX=2 F DY=13:1:19 X XY W $J("",46)
 S DX=2,DY=-1 F %U=1:1 S DY=$N(TBCOND(PGE,DY)) Q:DY=-1  X XY W TBCOND(PGE,DY)
 D CURON^%VVIDEO Q
T0 G FT0:PCH="" S VPOL(VI)=PCH,PCH=$$GETLBLAN^%VTLBLAN(PCH) G:$D(LIBVU(PCH)) FT0 D TO^%QZNBN1 G FT0:ISNUM S PAGIN(PGE,LIC,IK+1)=PCH
FT0 Q

