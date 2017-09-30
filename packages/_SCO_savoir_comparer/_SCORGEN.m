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

;%SCORGEN^INT^1^59547,73888^0
SCORGEN ;
 
 
 
 
 
 
AJOUT 
 N ADR S ADR="AJ1^%SCORGEN" G INIT
AJ1 
 S MODE="AJOUT"
 D ENTETE
AJ2 D MENU
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" G AJ1
 G @AD
 G AJ2
 
CMS 
 N ADR S ADR="CMS1^%SCORGEN" G INIT
CMS1 
 S MODE="CMS"
 D ENTETE
CMS2 D MENU
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" G CMS1
 G @AD
 G CMS2
 
FIN 
 K @(TEMPO) Q
 
EGAL 
 
 
 I MODE="AJOUT" D AJ^%SCOREG1 G RETOUR
 D CMS^%SCOREG1 G RETOUR
 
QCQ 
 
 
 I MODE="AJOUT" D AJ^%SCOREG G RETOUR
 D CMS^%SCOREG G RETOUR
 
RETOUR 
 I MODE="AJOUT" G AJ1
 G CMS1
 Q
MENU 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,80,22,MN,.AD,.CTR)
 Q
ENTETE 
 D CLEPAG^%VVIDEO
 N MES S MES=$S(MODE="AJOUT":"AJOUT DE REGLES",1:"MODIFICATION DE REGLES")
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW(MES))
 Q
INIT 
 N TEMPO S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 N MN S MN=$$CONCAS^%QZCHAD(TEMPO,"MENU")
 S @MN@(1)=$$^%QZCHW("Regles quelconques")_"^"_"QCQ"
 S @MN@(2)=$$^%QZCHW("Regles d'egalite")_"^"_"EGAL"
 N MODE,AD,CTR
 G @ADR

