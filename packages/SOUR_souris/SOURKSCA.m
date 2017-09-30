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

;SOURKSCA^INT^1^59547,74869^0
NSOURKSC ;
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("BIBLIOTHEQUE DE SAVOIR FAIRE") D 4^%VZCD
 S CH=$T(MN) F I=1:1 S CHI=$P(CH,";;",I+1) Q:CHI=""  S MN(I)=CHI
MN ;;Abandon^ABORT;;Rappel d'un savoir-faire^RAP;;Suppression^SUP;;
 D ^%VGENMEN(1,78,23,"MN")
 D REAFF
MENU D SEL^%VGENMEN(.A,.C) Q:A=""  Q:A="ABORT"
 S END=0 D @A Q:END  G MENU
 
REAFF D INIT^%QUCHOIP("^[QUI]SOURKS","",1,0,7,79,15),AFF^%QUCHOIP Q
 
SUP S KSNAME=$$UN^%QUCHOIP G MENU:KSNAME=""
 D BLD^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW(" Etes-vous sur de vouloir supprimer "),KSNAME,$$^%QZCHW(" ? (O/N) ") R *REP I REP=79 K ^[QUI]SOURKS(KSNAME)
 D NORM^%VVIDEO,POCLEPA^%VVIDEO,REAFF
 Q
 
RAP S KSNAME=$$UN^%QUCHOIP G MENU:KSNAME="" D ^SOURKS
 D BLD^%VVIDEO,POCLEPA^%VVIDEO W "N'oubliez pas une COMPREHENSION avant de lacher la souris...[RETURN]" R *RET D NORM^%VVIDEO
 S END=1 Q

