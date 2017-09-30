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

;%QFEVASG^INT^1^59547,73875^0
GREVASG ;
TOUT 
 S SG=-1 D MSG^%VZEATT("Evaluation..."),ATTR
LTOUT S SG=$N(^[QUI]GROUPE(NUFA,1,SG)) G:SG=-1 END D SG G LTOUT
SG S (^[QUI]GROUPE(NUFA,1,SG,"CARD"),^GRV($J,SG,"CARDINAL"))=0,OBJ=-1 I ATTR'="" S ^GRV($J,SG,"SOMME.DES."_ATTR)=0
LSG S OBJ=$N(^[QUI]GROUPE(NUFA,1,SG,"OBJET",OBJ)) Q:OBJ=-1  D OBJ G LSG
OBJ D ATTR I ATTR'="" S ^GRV($J,SG,"SOMME.DES."_ATTR)=^GRV($J,SG,"SOMME.DES."_ATTR)+$$^%QFCALVA(OBJ,ATTR)
 S ^[QUI]GROUPE(NUFA,1,SG,"CARD")=^[QUI]GROUPE(NUFA,1,SG,"CARD")+1,^GRV($J,SG,"CARDINAL")=^GRV($J,SG,"CARDINAL")+1 Q
END Q
SUPOBJ D ATTR I ATTR'="" S ^GRV($J,SG,"SOMME.DES."_ATTR)=^GRV($J,SG,"SOMME.DES."_ATTR)-$$^%QFCALVA(OBJ,ATTR)
 S ^[QUI]GROUPE(NUFA,1,SG,"CARD")=^[QUI]GROUPE(NUFA,1,SG,"CARD")-1,^GRV($J,SG,"CARDINAL")=^GRV($J,SG,"CARDINAL")-1 Q
ATTR S ATTR=^ATTR($J,"O",6) Q

