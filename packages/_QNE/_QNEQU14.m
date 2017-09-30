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

;%QNEQU14^INT^1^59547,73879^0
QNEQU14 ;
 
 
AFFOBJ2(LISTIND,LMN,INDCOUR) 
 N INCOMPL,GROAFF,ADR,IND,INDAF
 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 S INCOMPL=@VT@("INCOMPL")
 I $D(@INCOMPL@(LMN,INDCOUR)) Q INDAF_" "_$$^%QZCHW("incompatible avec")_" "_$$AFGR^%QFGRACT(LMN)
 S GROAFF=@VT@("GRO")
 
 I $D(@GROAFF@(INDCOUR)) G AFFOBJ21
 
 S ADR=$$ADRLIS^%QSGEST7(LMN)
 S IND=$O(@ADR@(""))
 
 I IND="" Q ""
 
 I '($D(@GROAFF@(IND))) Q ""
 
 
 D ^%VZEAVT($$AFIN^%QFGRACT(LISTIND,IND)_" "_$$^%QZCHW("est deja affecte dans le poste")_" "_$$AFGR^%QFGRACT($O(@GROAFF@(IND,"")))_" "_$$^%QZCHW("vous risquez de separer des inseparables"))
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez vous cette nouvelle inseparabilite"),"N") ""
 Q $$^%QZCHW("affectation de")_" "_INDAF_" "_$$^%QZCHW("refusee")
AFFOBJ21 
 D ^%VZEAVT(INDAF_" "_$$^%QZCHW("est deja affecte dans le poste")_" "_$$AFGR^%QFGRACT($O(@GROAFF@(INDCOUR,"")))_" "_$$^%QZCHW("vous risquez de separer des inseparables"))
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez vous cette nouvelle inseparabilite"),"N") ""
 Q $$^%QZCHW("affectation de")_" "_INDAF_" "_$$^%QZCHW("refusee")

