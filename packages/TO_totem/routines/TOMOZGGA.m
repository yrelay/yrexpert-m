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

;TOMOZGGA^INT^1^59547,74873^0
TOMOZGGA ;
ETUD D DEB
ETUD1 D CH S DX=15,DY=20 X XY W $$^%QZCHW("Etude   : ") S DX=$X D ^%VLEC G FIN:Y1="" S CC=$E(Y1,$L(Y1)) I (CC="?")!(CC="*") G @("E"_$A(CC))
E42 S TB="^[QUI]TVPAR",PCH=$P(Y1,"*",1) D TAB^TOMOZGVU,T0 G ETUD
E63 S TB="^[QUI]TVPAR",PCH=$P(Y1,"?",1) D TAB^TOMOZGVU,^TOMOZGVE G ETUD
ART D DEB
ART1 D CH S DX=15,DY=18 X XY W $$^%QZCHW("Article : ") S DX=$X D ^%VLEC G FIN:Y1="" S PCH=Y1 D ^%LXABR G @CONCUR
0 D POCLEPA^%VVIDEO W $$^%QZCHW("Article "),PCH,$$^%QZCHW(" inconnu ! ") R *X:60 D POCLEPA^%VVIDEO G ART1
2 D POCLEPA^%VVIDEO W $$^%QZCHW("Article "),PCH,$$^%QZCHW(" ambigu ! ") R *X:60 D POCLEPA^%VVIDEO G ART1
1 S ART=Y1
11 S DX=15,DY=20 X XY W $$^%QZCHW("Etude   : ") S DX=$X D ^%VLEC G ART1:Y1="" S CC=$E(Y1,$L(Y1)) I (CC="?")!(CC="*") G @$A(CC)
 I '($D(^[QUI]ANTETUDE(ART,Y1))) D ^%VSQUEAK S DY=20 X XY W $J("",$L(Y1)+10) X XY G 11
 S PCH=Y1,TB="^[QUI]ANTETUDE(ART)",NU=0,CC=Y1,TW=-1,PG=1,LI=11 K ^TACOMPIL($J) D LTW^TOMOZGVU G T0
42 S TB="^[QUI]ANTETUDE(ART)",PCH=$P(Y1,"*",1) D TAB^TOMOZGVU,T0 G ART
63 S TB="^[QUI]ANTETUDE(ART)",PCH=$P(Y1,"?",1) D TAB^TOMOZGVU,^TOMOZGVU,DEB,CH S DX=15,DY=18 X XY W $$^%QZCHW("Article : "),ART G 11
DEB D CLEPAG^%VVIDEO,CUROF^%VVIDEO S DX=0 F DY=1:1:13 X XY D CAG^%VVIDEO
 S DY=2,MSG=$$^%QZCHW("Generation de gammes"),DX=20-($L(MSG)\2) X XY W MSG S DXG=12,DYH=7,LH=18,LV=4,BLD=1 D CARS^%VVIDEO,REV^%VVIDEO S DXG=13,DYH=8,MSG=$$^%QZCHW(" TOTEM - MOZART ") D BIG^%VVIDEO,NORM^%VVIDEO
 Q
CH S DX=0,DY=15 D CLEBAS^%VVIDEO S DXG=10,DYH=16,LH=60,LV=7 D CARS^%VVIDEO Q
T0 D POCLEPA^%VVIDEO W $$^%QZCHW("OK pour la generation de "),NU,$$^%QZCHW(" gamme"),$S(NU>1:"s",1:""),$$^%QZCHW(" (O/N) ? ") R *CC S CC=$C(CC) G:(CC'=$$^%QZCHW("O"))&(CC'=$$^%QZCHW("N")) T0 Q:CC=$$^%QZCHW("N")  S PG=-1
LPG S PG=$N(^TACOMPIL($J,PG)) Q:PG=-1  S %LI=-1
LLI S %LI=$N(^TACOMPIL($J,PG,%LI)) G:%LI=-1 LPG S LI=^TACOMPIL($J,PG,%LI),NUFA=$P(LI,"^",1),TWREF=$P(LI,"^",2) D POCLEPA^%VVIDEO W $$^%QZCHW("Etude : "),NUFA D ^TOMOZGAM,POCLEPA^%VVIDEO G LLI
FIN Q

