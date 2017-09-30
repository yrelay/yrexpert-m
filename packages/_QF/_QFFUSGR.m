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

;%QFFUSGR^INT^1^59547,73875^0
GRFUSGRO ;
 K @(@CUSTOM1@("LISTE")) D:ZOOM ZOFF^%QFZOOM
FGL D POCLEPA^%VVIDEO W %ngro," a fusionner ([RETURN] pour fin) : "
 S DX=$X X XY D ^%VLEC G:CTRLA!CTRLF FIN1 G:Y1="" FFG
 D TESTFUS G:TESTFUS=0 FGL
 S @@CUSTOM1@("LISTE")@(Y1)="" G FGL
FFG D ON^%VZEATT
 S GROFUS=$$SAIS^%QFFUSGR(@CUSTOM1@("FUSGR"),QUER,NUFA,"$$OKGR^%QFCREGR(NUFA,GR)",@CUSTOM1@("LISTE"))
 I GROFUS="" G FIN1
 G LFG1
 
FUSGR() 
 S GRO=-1 D POCLEPA^%VVIDEO W %ngro," resultant",%eg," : " S DX=$X X XY D ^%VLEC I (CTRLA!CTRLF)!(Y1="") Q ""
 S GRO=Y1,X=Y1,TAB="^[QUI]GROUPE(NUFA,1)" D ^%QFEXI G:EXI FFGNON
 G:'($$OKCRE(Y1)) FFGNON
 S GROFUS=Y1,^[QUI]GROUPE(NUFA,1,GROFUS)=""
 Q Y1
 
 
LFG1 S GRO=-1
LFG S GRO=$N(@@CUSTOM1@("LISTE")@(GRO)) G:GRO=-1 FFG2 D AFFU K ^[QUI]GROUPE(NUFA,1,GRO) G LFG
AFFU S OBJ=-1
LAFFU S OBJ=$N(^[QUI]GROUPE(NUFA,1,GRO,"OBJET",OBJ)) Q:OBJ=-1  S ^[QUI]GROUPE(NUFA,1,GROFUS,"OBJET",OBJ)="",^[QUI]GROAFF(NUFA,OBJ)=GROFUS G LAFFU
FFG2 K GROSEL,GROZOOM S SG=GROFUS,ATTR=^ATTR($J,"O",6) D SG^%QFEVASG,CREPAD^%QFPAG,APD^%QFPAG,APG^%QFPAG G FIN1
TESTFUS S GRO=-1,TESTFUS=0
LTFUS S GRO=$N(^[QUI]GROUPE(NUFA,1,GRO)) G:GRO=Y1 TFUS G:GRO'=-1 LTFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W %ngro," ",Y1," ??? " H 2 Q
TFUS S GRO=-1
LTFUS2 S GRO=$N(@@CUSTOM1@("LISTE")@(GRO)) G:GRO=-1 OKFUS G:GRO'=Y1 LTFUS2 D ^%VSQUEAK Q
OKFUS S TESTFUS=1 Q
FFGNON D POCLEPA^%VVIDEO,^%VSQUEAK W " ??? " G FFG
FIN0 S RETOUR=0 Q
FIN1 S RETOUR=1 Q
FIN2 S RETOUR=2 Q
OKCRE(NLISTE) 
 N A
 S @("A="_CREA1)
 Q A
 
 
 
 
 
 
 
 
 
SAIS(ADR,BASE,NUFA,UC,LISTE) 
 N A
 I ADR="" Q $$FUSGR
 S @("A="_ADR)
 Q A

