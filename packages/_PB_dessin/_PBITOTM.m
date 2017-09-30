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

;%PBITOTM^INT^1^59547,73873^0
PTITOTEM ;
DIAL D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="REPRESENTATION GRAPHIQUE" D 4^%VZCD
L0 S DX=0,DY=5 X XY D CLEBAS^%VVIDEO
 S DX=10,DY=10 X XY W "Etude : " S DX=$X,DY=$Y D ^%VLEC
 Q:CTRLA!(Y1="")  S TWREF=""
 I Y1?.N S %NTO=Y1 D ^TONUMTOT S Y1=%NTO X XY W Y1
 G:"?"'[$E(Y1,$L(Y1)) TEST
 K NUFA S Y1=$E(Y1,1,$L(Y1)-1) D ADR^TOXXRAI6(Y1) G:'($D(NUFA)) DIAL
 S Y1=NUFA G TEST
 
TEST S ETUDE=Y1
 I '($D(^[QUI]TVPAR(Y1))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Cette etude est incunnue ... [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO G L0
L1 D POCLEPA^%VVIDEO W "Coefficient d'agrandissement [1] : "
 S DX=$X,DY=$Y D ^%VLEC Q:CTRLA  S:Y1="" Y1=1
 G:'($F(Y1,"/",0)) SL1
 S Y11=$P(Y1,"/",1),Y12=$P(Y1,"/",2)
 I Y11="" D ^%VSQUEAK G L1
 I Y12="" D ^%VSQUEAK G L1
 S PCH=Y11 D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L1
 S PCH=Y12 D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L1
 I (Y11=0)!(Y12=0) D ^%VSQUEAK G L1
 S Y1=Y11/Y12 G OK
SL1 S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L1
OK D INT(ETUDE,TWREF,Y1) G DIAL
 
INT(ETUDE,TWREF,T) N AD,CT,MENU
 D POCLEPA^%VVIDEO W "Representation "
 S MENU(1)="Totale^TOTAL"
 S MENU(2)="Partielle^PARTI"
 S MENU(3)="1-Composant^COMPOS"
 D ^%VGENMEN(20,79,23,"MENU"),SEL^%VGENMEN(.AD,.CT) G:AD'="" @AD
 Q:"AF"[CT  D ^%VSQUEAK G L1
TOTAL D ^%PBITOTL(ETUDE,T) Q
PARTI D COMPO^%PBITOTL(ETUDE,TWREF,T) Q
COMPOS D PARTI^%PBITOTL(ETUDE,TWREF,T) Q

