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

;TOXXRAI6^INT^1^59547,74877^0
TOXXRAI6 ;
 
 
DEB D CLEPAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Etudes")_"  "_KEY D TO4^%VZCD
 S DXG=0,DYH=6,LH=80,LV=15,IX=59,IY=20,BLD=1 D DAMIER^%VVIDEO
 D CARSP^%VVIDEO(0,21,3,80,1)
 K ^LISART($J),^COMPTB($J),^TBCOMP($J),^COMPID($J)
 S KD=$S(KEY="":"",1:$E(KEY,1,$L(KEY)-1)_$C($A($E(KEY,$L(KEY)))-1)_"z")
 F %U=1:1 S KD=$O(^[QUI]ANTETUDE(KD)) Q:KD=""  Q:$E(KD,1,$L(KEY))'=KEY  S ^LISART($J,KD)=1
 S NU=-1,TB="^[QUI]ANTETUDE(NU)",PGE=1,(LIC,LI)=7,LIM=19,PX1=3,PX2=62
LNU S NU=$N(^LISART($J,NU)) G:NU=-1 FNU S NUF=""
LNUF S NUF=$ZP(@TB@(NUF)) G:NUF="" LNU S TW=""
LTW S TW=$ZP(@TB@(NUF,TW)) G:TW="" LNUF R *STOP:0 D TOUCHE^%INCCLAV(STOP,.STOP) G:STOP=1 FNU
 K RS S RS=@TB@(NUF,TW) F %U=1:1:4 S RS(%U)=$P(RS,"^",%U)
 S ^COMPTB($J,PGE,LIC,PX1)=NU,^TBCOMP($J,PGE,LIC,PX1)=$E(NU,1,47),^COMPID($J,PGE,LIC,PX1)=NU_"^"_TW_"^"_NUF,^TBCOMP($J,PGE,LIC,PX2)=NUF
 D INCR
 S RS(1)=$P(RS(1),"/",2,500),RS="",LMX=PX2-10,%V=$L(RS(1),"/"),ID1=1 F %U=1:1:%V S IT=$P(RS(1),"/",%U),LIT=$L(RS)+$L(IT) D:LIT>LMX INC0 S RS=RS_IT_"/"
 D:RS'="" INC0 G LTW
FNU S NPG=$ZP(^TBCOMP($J,"")),PGE=1 D AFF
QU D CLEBA^TOXXRAIS W "Page ",PGE,"/",NPG,"  ",$$L23^%QSLIB2("+, -, "_$$^%QZCHW("page, CTRLE acces aux etudes"))," "
 S DX=$X D ^%VLEC G FCP:CTRLA,CP:CTRLE,PL:Y1="+",PL:Y1="=",MS:Y1="-",QU:$A(Y1)<32,QU:'($D(^TBCOMP($J,Y1))),QU:Y1=PGE
 S PGE=Y1 D AFF G QU
EFF S DX=2 F DY=LI:1:LIM X XY W $J("",58)
 S DX=61 F DY=LI:1:LIM X XY W $J("",17)
 Q
AFF D CUROF^%VVIDEO,EFF
 S DY=-1 F %U=0:0 S DY=$N(^TBCOMP($J,PGE,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(^TBCOMP($J,PGE,DY,DX)) Q:DX=-1  X XY W ^TBCOMP($J,PGE,DY,DX)
 D CURON^%VVIDEO Q
PL S NEW=PGE+1 G:'($D(^TBCOMP($J,NEW))) QU S PGE=NEW D AFF G QU
MS S NEW=PGE-1 G:'($D(^TBCOMP($J,NEW))) QU S PGE=NEW D AFF G QU
CP S PY=$O(^COMPTB($J,PGE,"")),PX=$O(^COMPTB($J,PGE,PY,"")),TBMOV="^COMPTB($J,PGE)"
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G QU:X1=1,LEC:'($D(^COMPID($J,PGE,PY,PX))),OK:X1=13,LEC
OK S RS=^COMPID($J,PGE,PY,PX),ART=$P(RS,"^",1),TWREF=$P(RS,"^",2),NUFA=$P(RS,"^",3) G FCP
FCP K ^COMPID($J),^TBCOMP($J),^COMPTB($J),RS G FIN
INC0 S ^TBCOMP($J,PGE,LIC,PX1+3)=RS,RS="" S:ID1 ^TBCOMP($J,PGE,LIC,PX2)=RS(3)_" "_$P(RS(4),"'",1),ID1=0
INCR S LIC=LIC+1 I LIC>LIM D EFF,AFF S LIC=LI,PGE=PGE+1
 Q
FIN K BLD Q
 
ADR(KEY) 
 G DEB

