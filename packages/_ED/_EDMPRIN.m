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

;%EDMPRIN^INT^1^59547,73869^0
EDMPRINT ;
 
 
 
 
 
 
 
 
 N ADR,CTR,MENU,ENSEM
 S ENSEM="^ENSFOR($J)"
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Selection")_"^SELEC"
 S @MENU@(1,"COM")=$$^%QZCHW("Impression apres selection des modeles")
 S @MENU@(2)=$$^%QZCHW("Tous")_"^TOUS"
 S @MENU@(2,"COM")=$$^%QZCHW("Impression de tous les modeles")
ACTU D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("IMPRESSION DES TEXTES DES MODELES"))
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTU
 
END K @(MENU) Q
 
TOUS 
 D IMPRI("^[QUI]EDMOD")
 G ACTU
 
SELEC 
 K @(ENSEM)
 D INIT^%QUCHOIP("^[QUI]EDMOD",1,"",0,5,80,17)
 D AFF^%QUCHOIP
 D ^%QUCHOYP(ENSEM)
 D END^%QUCHOIP,IMPRI(ENSEM)
 G ACTU
 
 
 
IMPRI(LISTE) D POCLEPA^%VVIDEO
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez-vous l'impression ? "),"O")'=1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... ")
 N MOD S MOD=""
 F %I=0:0 S MOD=$O(@LISTE@(MOD)) Q:(MOD="")!(MOD="z")  D POCLEPA^%VVIDEO W MOD D ^%EDIMPRI(MOD)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression terminee ... ") H 3
 Q

