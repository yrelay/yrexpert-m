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

;%QS0G2^INT^1^59547,73879^0
ZLIGG2() 
 
 
 D ^%QUAPAD("HISTOGRAMME")
 S Y1=$$UN^%QUAPAGM Q:Y1="" 1 Q $$INT(Y1)
 
INT(LISTE) D CLEPAG^%VVIDEO
 S CMS=0,SCR="HISTOGRAM",NOMTAB="" D ^%VACTISC G:ABENDSCR FIN
TESTOK S OK=1 F I=1:1:^%SCRE(SCR) S OK=$D(RESUL(I)) Q:'(OK)
 I '(OK) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Veuillez saisir tous les champs ...") H 1 D CLEPAG^%VVIDEO,^%VCMS("HISTOGRAM") G:ABENDSCR FIN G TESTOK
 N DFG
 S ATTTOT=RESUL(1)
 S ATTLIS=RESUL(2)
 S NULIS=$D(INTERV)
 S BORNI=RESUL(4)
 S BORNS=RESUL(5)
 D ^%QS0DEHI,^%QS0INTE,^%VZCD0("HISTOGRAMME"),CUROF^%VVIDEO,VIDNORM
 D BLD^%VVIDEO S DX=0,DY=6 X XY W RESUL(1)
 D VIDNORM,POCLEPA^%VVIDEO W $$^%QZCHW("[Retour]")
 S DX=45,DY=22 D BLD^%VVIDEO X XY W $J(RESUL(2),30)
 R DFG D VIDNORM,CURON^%VVIDEO
 
FIN K ABENDSCR,ATTLIS,ATTTOT,BID,BLD,BORNI,BORNS,CMS,DESSIN,DXD,DXG,DYB,DYH,%FONC,GRAPH,I,INTERV,LH,LISTE,LV,MSG,NOMTAB,NULIS,%PORT,SCR,Y1 Q 2
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="GRAPHIQUES" D 4^%VZCD Q
PCAD S DXG=10,DYH=10,LH=60,LV=3,BLD=1 D CARS^%VVIDEO Q
VIDNORM D NORM^%VVIDEO,ECHON^%VVIDEO,80^%VVIDEO Q

