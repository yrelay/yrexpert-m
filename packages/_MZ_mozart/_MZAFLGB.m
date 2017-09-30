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

;%MZAFLGB^INT^1^59547,73871^0
MOZAFLGB ;;12:15 PM  13 Apr 1989
 
 
 
 
 
 
 
 Q:'($D(^AFFPAG($J)))  S:'($D(TIT)) TIT="" S GAPBN=$S($D(^AFFPAG($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN D CLFEN^%VVIDEO(0,5,19,79) S DX=10,DY=6 X XY W TIT D AFF1
SUIT D CLFEN^%VVIDEO(0,23,0,79) S DX=0,DY=23 X XY W $$L4^%QSLIB
 S GAP=$$^%QZCHW("Page ")_EGAP_"/"_GAPBN
 D CLFEN^%VVIDEO(15,4,0,79) S DX=25-($L(GAP)\2),DY=4 X XY W GAP
 S DX=(($X-$L(GAPBN))-1)-$L(EGAP),DY=$Y R *REPO
 D TOUCHE^%INCCLAV(REPO,.REPO)
 G 1:REPO=1,6:REPO=6,OBJ:REPO=5,SUIT:REPO<32 S REPO=$C(REPO) G SUIT:REPO="",REP:REPO="?",61:(REPO="+")!(REPO="="),45:REPO="-"
SINON D CLFEN^%VVIDEO(0,23,1,79) S DX=5,DY=23 X XY W $$^%QZCHW("Page : ") S DX=$X D ^%VLEC G SUIT:CTRLA,SUIT:CTRLF,SINON:Y1="" S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) SINON S NGAP=Y1 D AFF G SUIT
1 G END
6 G END
OBJ S DX=2,DY=8 X XY S TBMOV="^AFFGAM($J,EGAP)" D ^%VZEREVS G CHOIX:X1=13 D AFF1 G SUIT
CHOIX S GAMCOUR=^AFFGAM($J,EGAP,DY,DX) G END
43 G 61
45 S NGAP=EGAP-1 D AFF G SUIT
61 S NGAP=EGAP+1 D AFF G SUIT
AFF I '($D(^AFFPAG($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP D CLFEN^%VVIDEO(0,7,17,79)
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^AFFPAG($J,EGAP,DY)) Q:DY=-1  S DX=2 X XY D ON
 Q
ON W ^AFFPAG($J,EGAP,DY) D NORM^%VVIDEO Q
END D CLFEN^%VVIDEO(0,5,19,79) K %PCH,%QY,GAP,EGAP,CTRLA,CTRLE,CTRLF,GAP,GAPBN,NGAP,PP,REP,REPO,TBMOV,TIT,Y1 Q
REP S REP="" D CLFEN^%VVIDEO(0,5,19,79) S DX=2,DY=5 X XY F PP=1:1 Q:'($D(^AFFREP($J,PP)))  W $$^%QZCHW("Page "),PP," : ",^AFFREP($J,PP),! D:(PP#17)=0 ALORS Q:(REP=1)!(REP=6)
 D CLFEN^%VVIDEO(0,23,0,79) I REP'=1 S DX=10,DY=23 X XY W $$^%QZCHW("[RETURN] ") R *REP
 D CLFEN^%VVIDEO(0,5,19,79) S DX=0,DY=6 X XY W TIT
 K REP D AFF1 G SUIT
ALORS D POCLEPA^%VVIDEO W $$L2^%QSLIB
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 
 D CLFEN^%VVIDEO(0,23,0,79) S DX=10,DY=23 X XY W $$L2^%QSLIB
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 D CLFEN^%VVIDEO(0,6,18,79) Q

