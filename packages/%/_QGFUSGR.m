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

;%QGFUSGR^INT^1^59547,73876^0
%QGFUSGR ;
 K LISTE D:ZOOM ZOFF^%QGZOOM
FGL D POCLEPA^%VVIDEO W %ngro," a fusionner ([RETURN] pour fin) : " S DX=$X X XY D ^%VLEC G:CTRLA!CTRLF FIN1 G:Y1="" FFG D TESTFUS G:TESTFUS=0 FGL S LISTE(Y1)="" G FGL
FFG S GRO=-1 D POCLEPA^%VVIDEO W %ngro," resultant",%eg," : " S DX=$X X XY D ^%VLEC I (CTRLA!CTRLF)!(Y1="") G FIN1
 S GRO=Y1,X=Y1,TAB="@GROUPE@(1)" D ^%QGEXI G:EXI FFGNON
 G:'($$OKCRE(Y1)) FFGNON
 S GROFUS=Y1,@GROUPE@(1,GROFUS)="",GRO=-1
LFG S GRO=$N(LISTE(GRO)) G:GRO=-1 FFG2 D AFFU K @GROUPE@(1,GRO) G LFG
AFFU S OBJ=-1
LAFFU S OBJ=$N(@GROUPE@(1,GRO,"OBJET",OBJ)) Q:OBJ=-1  S @GROUPE@(1,GROFUS,"OBJET",OBJ)="",@GROAFF@(OBJ,GROFUS)=$S($D(@GROAFF@(OBJ,GROFUS)):@GROAFF@(OBJ,GROFUS)+@GROAFF@(OBJ,GRO),1:@GROAFF@(OBJ,GRO))
 
 K @GROAFF@(OBJ,GRO)
 G LAFFU
 
FFG2 K GROSEL,GROZOOM S SG=GROFUS,ATTR=^ATTR($J,"O",6) D SG^%QGEVASG,CREPAD^%QGPAG,APD^%QGPAG,APG^%QGPAG G FIN1
TESTFUS S GRO=-1,TESTFUS=0
LTFUS S GRO=$N(@GROUPE@(1,GRO)) G:GRO=Y1 TFUS G:GRO'=-1 LTFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W %ngro," ",Y1," ??? " H 2 Q
TFUS S GRO=-1
LTFUS2 S GRO=$N(LISTE(GRO)) G:GRO=-1 OKFUS G:GRO'=Y1 LTFUS2 D ^%VSQUEAK Q
OKFUS S TESTFUS=1 Q
FFGNON D POCLEPA^%VVIDEO,^%VSQUEAK W " ??? " G FFG
FIN0 S RETOUR=0 Q
FIN1 S RETOUR=1 Q
FIN2 S RETOUR=2 Q
OKCRE(NLISTE) 
 N A
 S @("A="_CREA1)
 Q A

