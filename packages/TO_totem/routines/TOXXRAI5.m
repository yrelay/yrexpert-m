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

;TOXXRAI5^INT^1^59547,74877^0
TOXXRAI5 ;
 
ART 
 S ART=$S($D(^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("ARTICLE"))):^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("ARTICLE")),1:"???"),MSG=ART D WART^TOXXVERI G FIN
 
MAT 
 S ART=$S($D(^[QUI]TVPAR(NUFA,TWREF,"FAMMAT")):^[QUI]TVPAR(NUFA,TWREF,"FAMMAT"),1:"???"),MSG=ART D WART^TOXXVERI
 S OSFA=ART,SEP=".",ISFA="" F %GG=1:1 S PSFA=$P(OSFA,SEP,%GG) Q:PSFA=""  S ART=ISFA_$S(ISFA="":"",1:SEP)_PSFA,ISFA=ART Q:$D(^[QUI]FULL(ART))
 G FIN
 
EDIT 
 S %ART=ART D CLEPAG^%VVIDEO,80^%VVIDEO,^TO3EDIRE,PAGE^TOXXVERI
 S ART=%ART,MSG=^[QUI]ANTETUDE(ART,NUFA,0),DAT=$P(MSG,"^",3),HEUR=$P($P(MSG,"^",4),"'",1)
 S DX=3,DY=4 X XY W $J("",45) X XY W NUFA,"  (",DAT,$$^%QZCHW("-"),HEUR,")" D WART^TOXXVERI G FIN
 
COMP 
 K COMPID,TBCOMP,COMPTB S PX=3,PGE=1,LI=12,LIM=19,LIC=12,NU=-1
LNU S NU=$N(^OBJORD($J,NU)) G:NU=-1 FNU K RS S RS=^OBJORD($J,NU) F %U=1:1:4 S RS(%U)=$P(RS,"^",%U)
 S PXI=$TR($J("",RS(3)),$$^%QZCHW(" "),"*"),COMPTB(PGE,LIC,(PX+$L(PXI))+1)=RS(1),TBCOMP(PGE,LIC,PX)=$E(PXI_$$^%QZCHW(" ")_RS(1),1,70),COMPID(PGE,LIC,(PX+$L(PXI))+1)=RS(1)_"^"_RS(2) D INCR
 S RS(4)=$P(RS(4),"/",2,500),RS="",PXI=PXI+2,LMX=74-PXI,%V=$L(RS(4),"/") F %U=1:1:%V S IT=$P(RS(4),"/",%U),LIT=$L(RS)+$L(IT) D:LIT>LMX INC0 S RS=RS_IT_"/"
 D:RS'="" INC0 G LNU
FNU S NPG=$ZP(TBCOMP("")),PGE=1 D AFF
QU D CLEBA^TOXXRAIS S DY=21,DX=2 X XY W " Page ",PGE,"/",NPG," "
 S DY=22,DX=1 X XY W $$L23^%QSLIB2("+,-,"_$$^%QZCHW("page, CTRLE acces composants"))
 S DX=$X D ^%VLEC G FCP:CTRLA,CP:CTRLE,PL:Y1="+",PL:Y1="=",MS:Y1=$$^%QZCHW("-"),QU:$A(Y1)<32,QU:'($D(TBCOMP(Y1))),QU:Y1=PGE
 S PGE=Y1 D AFF G QU
AFF D CUROF^%VVIDEO S DX=2 F DY=12:1:19 X XY W $J("",45)
 S DY=-1 F %U=0:0 S DY=$N(TBCOMP(PGE,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(TBCOMP(PGE,DY,DX)) Q:DX=-1  X XY W $E(TBCOMP(PGE,DY,DX),1,48-DX)
 D CURON^%VVIDEO Q
PL S NEW=PGE+1 G:'($D(TBCOMP(NEW))) QU S PGE=NEW D AFF G QU
MS S NEW=PGE-1 G:'($D(TBCOMP(NEW))) QU S PGE=NEW D AFF G QU
CP S PY=$O(COMPTB(PGE,"")),PX=$O(COMPTB(PGE,PY,"")),TBMOV="COMPTB(PGE)"
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G QU:X1=1,LEC:'($D(COMPID(PGE,PY,PX))),OK:X1=13,LEC
OK S RS=COMPID(PGE,PY,PX),ART=$P(RS,"^",1),TWREF=$P(RS,"^",2) D WART^TOXXVERI G FCP
FCP D CARSA^%VVIDEO(0,21,49,3)
 K COMPID,TBCOMP,COMPTB,RS Q
INC0 S TBCOMP(PGE,LIC,PXI)=RS,RS=""
INCR S LIC=LIC+1 I LIC>LIM S LIC=LI,PGE=PGE+1
 Q
FIN Q

