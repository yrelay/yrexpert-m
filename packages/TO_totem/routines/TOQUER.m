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

;TOQUER^INT^1^59547,74874^0
TOQUER(X) 
 G @X
SU D CLEPAG^%VVIDEO,^%VZCD0("SUPPRESSION D'ETUDES TOTEM DU QUERY") S AD="SU" G DEB
AJ D CLEPAG^%VVIDEO,^%VZCD0("STOCKAGE D'ETUDES TOTEM AU QUERY") S AD="AJ" G DEB
DEB S DX=0,DY=10 X XY W "A partir de l'article [TOUS] : " S DX=$X D ^%VLEC
 G:CTRLA ABORT S KEY=Y1 D ^TOSELETU
 G:'($D(^SELEC($J))) FINI G TRT
FINI G @AD
TRT S DX=0,DY=21 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO,BLD^%VVIDEO W "Voulez-vous "_$S(AD="AJ":"stocker au",1:"supprimer du")_" query les etudes selectionnees ? (O/N) "
 R *REP D TOUCHE^%INCCLAV(REP,.REP) G OK:REP=79,FINI:REP=78,TRT
OK D CLEPAG^%VVIDEO,^%VZCD0("STOCKAGE D'ETUDES TOTEM AU QUERY")
 D BLK^%VVIDEO S DX=0,DY=6 X XY W "Un instant, svp..." D NORM^%VVIDEO
 S NUET=-1,DX=0,DY=8 X XY
LET S NUET=$N(^SELEC($J,NUET)) G FLET:NUET=-1
 S TAD=AD_"^TOTQUER(NUET)" D @TAD
 W NUET,$J("",16-$L(NUET))
 G LET
FLET D POCLEPA^%VVIDEO W "[RETURN]" R *RIEN
 K ^SELEC($J) G FINI
ABORT Q

