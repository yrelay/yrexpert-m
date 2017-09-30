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

;%MZAFLGA^INT^1^59547,73871^0
MOZAFLGA ;
 
 
 
 
 
 K ^GAMAREC($J),^GAMASUP($J),^GAMAIMP($J) Q:'($D(^AFFPAG($J)))
 S:'($D(TIT)) TIT="" S GAPBN=$S($D(^AFFPAG($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=6 X XY W TIT D AFF1
SUIT D POCLEPA^%VVIDEO W $$L3^%QSLIB(%PGTR) S GAP="Page "_EGAP_"/"_GAPBN
 S DX=40-($L(GAP)\2),DY=5 X XY W GAP
 S DX=(($X-$L(GAPBN))-1)-$L(EGAP),DY=$Y R *RP D TOUCHE^%INCCLAV(RP,.RP)
 G 1:RP=1,6:RP=6,OBJ:RP=5,SUIT:RP<32 S RP=$C(RP) G REP:RP="?",61:(RP="+")!(RP="="),45:RP="-",PAGE:RP="P",SUIT
PAGE D POCLEPA^%VVIDEO X XY W " Page : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA!CTRLF SUIT G:Y1="" SUIT S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) SUIT S NGAP=Y1 D AFF G SUIT
1 G END
6 G END
OBJ G:%PGTR="" SUIT
 D ADR^%QCAGLC("^U("_$J,"^UU("_$J),@%PGTR,ADR^%QCAGLC("^UU("_$J,"^U("_$J) K ^UU($J) G SUIT
43 G 61
45 S NGAP=EGAP-1 D AFF G SUIT
61 S NGAP=EGAP+1 D AFF G SUIT
AFF I '($D(^AFFPAG($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 O 0 S DY=-1 F %QY=1:1 S DY=$N(^AFFPAG($J,EGAP,DY)) Q:DY=-1  S DX=0 X XY D ON
 Q
ON I $D(^GAMASUP($J,EGAP,DY)) D BLD^%VVIDEO,BLK^%VVIDEO X XY W "S " G AFLG
 I $D(^GAMAIMP($J,EGAP,DY)) D BLD^%VVIDEO,BLK^%VVIDEO X XY W "S " G AFLG
 I $D(^GAMAREC($J,EGAP,DY)) D BLD^%VVIDEO,BLK^%VVIDEO X XY W "R " G AFLG
 W "  "
AFLG W ^AFFPAG($J,EGAP,DY) D NORM^%VVIDEO Q
END D KILL S DX=0,DY=5 D CLEBAS^%VVIDEO
 K ^AFFPAG($J),^GAMASUP($J),^AFFREP($J),GAP,EGAP,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NGAP,%QY,TIT Q
REP S REP="",DX=0,DY=6 D CLEBAS^%VVIDEO F PP=1:1 Q:'($D(^AFFREP($J,PP)))  W "Page : ",PP," ",^AFFREP($J,PP),! D:(PP#17)=0 ALORS Q:(REP=1)!(REP=6)
 D POCLEPA^%VVIDEO I REP'=1 W "[RETURN] " R *REP
 S DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=6 X XY W TIT
 K REP D AFF1 G SUIT
ALORS D POCLEPA^%VVIDEO W $$L2^%QSLIB
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S DX=0,DY=6 D CLEBAS^%VVIDEO Q
KILL Q:'($D(^GAMASUP($J)))  S EDSL=0,%SEP="",%ED="",U="",XL=""
 S EGAP=-1 D ^%VZCD0("Suppression en cours...")
 F ZP=1:1 S EGAP=$N(^GAMASUP($J,EGAP)) Q:EGAP=-1  S ZLG=-1 F ZL=8:1 S ZLG=$N(^GAMASUP($J,EGAP,ZLG)) Q:ZLG=-1  S PGM=^GAMASUP($J,EGAP,ZLG) D POCLEPA^%VVIDEO W PGM D BIL
 K EDSL,%SEP,%ED,U,XL Q
BIL K ^[QUI]MOZVISA(PGM),^[QUI]MOZGARDE(PGM)
 D SX^%QSGESTK($$GI^%MZQS,PGM) Q

