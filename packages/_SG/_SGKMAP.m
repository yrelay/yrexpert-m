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
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SGKMAP^INT^1^59547,73890^0
%SGKMAP ;;08:18 PM  18 Jan 1996
 
 
 
 S Y1="DGIV"
 D CLEPAG^%VVIDEO
 D LIRE2^%VREAD("quelle est la partition ""noyau"" ? ",Y1,2,75,8,9,"","",.CTR,.KERN)
 %HL002 S $ZT="NEXIS^%SGKMAP" ZN KERN
 S $ZT="NEXIS^%SGKMAP" S ZN=$$ZGBLDIR^%GTM(KERN)
 S $ZT=""
 S PART=$$PCONF^%INCASTS("PROG")
 %HL002 ZN PART
 S ZN=$$ZGBLDIR^%GTM(PART)
 D ^%VZEAVT("cette partition est montee !!! => FIN ") Q
NEXIS S $ZT=""
 S DX=2,DY=12 X XY
 I $$CONFIRM^%VZEOUI("confirmez-vous la suppression sur "_QUI)'=1 Q
 D ON^%VZEATT
 
 
 K ^[QUI]TTL
 K ^[QUI]RQSDON("COMPTRT")
 K ^[QUI]RQSDON("COMPPRED")
 K ^[QUI]EDFORMAT
 K ^[QUI]EDMOD
 K ^[QUI]RQSDON("SR")
 K ^[QUI]RQSGLO("ATN")
 K ^[QUI]QUERYT("RESEAU")
 K ^[QUI]QUERYT("ETAT.RESEAU")
 F REP="RESEAU","ETAT.RESEAU","TRAITEMENT","RQS" K ^[QUI]QUERYV(REP),^[QUI]QUERY2(REP),^[QUI]QUERY3(REP),^[QUI]QUERY4(REP)
 K ^[QUI]RQS1
 K ^[QUI]ANSA
 K ^[QUI]RQSGLO("ANSA")
 K ^[QUI]RQSGLO("PRED")
 K ^[QUI]RQSGLO("SR")
 K ^[QUI]RQSGLO("RQS")
 D OFF^%VZEATT
 Q

