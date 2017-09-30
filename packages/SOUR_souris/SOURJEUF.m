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

;SOURJEUF^INT^1^59547,74869^0
SOURJEUF ;
 
 S %FRESH="PREDEF" D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("La souris et le fromage") D TO4^%VZCD K %JEU S DX=20,DY=8 X XY F %U=1:1 S LI=$P($T(JEU+%U),";;",2) Q:LI=""  W !,?20,$S(%U<10:" ",1:""),%U,"   ",LI S %JEU(%U)=1
QU D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix : (x? pour visualiser le cas x) ") S DX=$X D ^%VLEC G:Y1="" FIN I Y1["?" S %J=$P(Y1,"?",1) G:'($D(%JEU(%J))) QU D ^SOURJEU1 W " [RETURN] " R *RET G SOURJEUF
 G:'($D(%JEU(Y1))) QU S %J=Y1 K %JEU,DXD,DXG,DYH,DYB,GRAPH,MSG,LI,%U I '($D(^[QUI]PILE("JEU",0))) S ^[QUI]PILE("JEU",0)=$$^%QZCHW("LA SOURIS ET LE FROMAGE^")
 S JEU=^[QUI]PILE("JEU",0) K ^DEJAPASS($I),^STOP($I),^[QUI]PILE("JEU") S ^[QUI]PILE("JEU",0)=JEU D ^SOURJEU1,^SOURCHEM
 G SOURJEUF
FIN K %FRESH Q
JEU ;;
 ;;La pyramide
 ;;La chicane

