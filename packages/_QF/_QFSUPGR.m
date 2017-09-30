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

;%QFSUPGR^INT^1^59547,73876^0
GRSUPGRO ;
 S LIS=$Y G:$D(^PAD($J,PAD,LIS))=0 END1 S GRO=^PAD($J,PAD,LIS) G:ZOOM=0 SG1 D:GROZOOM=GRO ZOFF^%QFZOOM
SG1 G:$$SAIS(@CUSTOM1@("SUPGR"),GRO)=0 FIN1
 
 S OBJ=-1
LSG S OBJ=$N(^[QUI]GROUPE(NUFA,1,GRO,"OBJET",OBJ)) G:OBJ=-1 FSG K ^[QUI]GROAFF(NUFA,OBJ) G LSG
FSG K ^[QUI]GROUPE(NUFA,1,GRO) I $D(GROSEL),GRO=GROSEL K GROSEL
 D CREPAD^%QFPAG G:AFFLIST FSG1 S AFFLIST=1 D ^%QFNONAF
FSG1 D APG^%QFPAG,APD^%QFPAG
FIN1 S RETOUR=1 Q
END1 D ^%VSQUEAK S RETOUR=2 Q
 
SAIS(ADR,GR) 
 N A
 I ADR="" Q $$SAIS0(GR)
 S @("A="_ADR)
 Q A
 
SAIS0(GR) 
 D POCLEPA^%VVIDEO
 Q $$CONFIRM^%VZEOUI($$^%QZCHW("OK pour detruire")_" "_GR_" ?")

