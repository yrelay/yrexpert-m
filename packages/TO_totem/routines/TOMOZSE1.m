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

;TOMOZSE1^INT^1^59547,74873^0
TOMOZSEL ;
 N LILA,LISTE
 D INIT^%MZCHREP
SU D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Transfert etudes TOTEM => MOZART"))
DEB S DX=0,DY=10 X XY W $$^%QZCHW("Liste a partir de [TOUT] : ") S DX=$X D ^%VLEC
 G:CTRLA ABORT S KEY=Y1 D ^TOSELETU
 G:$$^%QMLILL(.LILA) FINI
 G:'($D(^SELEC($J))) FINI G TRT
FINI G SU
TRT D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Transfert etudes TOTEM => MOZART"))
 D POCLEPA^%VVIDEO W $$^%QZCHW("OK pour le transfert des etudes selectionnees")," ? (",$E($$^%QZCHW("OUI")),"/",$E($$^%QZCHW("NON")),") " R *REP:^TOZE($I,"ATTENTE") G OK:REP=$A($E($$^%QZCHW("OUI"))),FINI:REP=$A($E($$^%QZCHW("NON"))),TRT
OK D CLEPAG^%VVIDEO,^%VZCD0("Transfert TOTEM => MOZART en cours...")
 D BLK^%VVIDEO S DX=0,DY=6 X XY W "Un instant, svp..." D NORM^%VVIDEO
 S NUET=""
 D LISTE(LILA,.LISTE)
LET S NUET=$O(^SELEC($J,NUET)) G FLET:NUET="" S TW=""
LTW S TW=$O(^SELEC($J,NUET,TW)) G LET:TW="" D POCLEPA^%VVIDEO W NUET,".",$TR(TW,",","") D ^TOMOZGAM(NUET,TW,.LISTE) G LTW
FLET K ^SELEC($J) G FINI
ABORT Q
LISTE(ZLILA,LISTE) 
 N ADR,I,ATT,OATT
 I (ZLILA="*")!(ZLILA="") S LISTE="*" Q
 S ADR=$$LIST^%QMLILA(ZLILA)
 I ADR="" S LISTE="*" Q
 S OATT=$O(@ADR@(""))
 F I=0:0 Q:(OATT="")!(OATT]"A")  S:@ADR@(OATT)'="" LISTE(@ADR@(OATT))="" S OATT=$O(@ADR@(OATT))
 Q

