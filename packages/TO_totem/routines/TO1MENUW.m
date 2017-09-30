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

;TO1MENUW^INT^1^59547,74869^0
TO1MENUW ;;11:56 AM  31 Aug 1990; 17 Aug 90  3:02 PM
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;PARAMETRES EXPLICITES
 ;;#AJOUT# DE PARAMETRES EXPLICITES;;CLEPAG^%VVIDEO,^%VAJOUT("EXPLICI"),^TO3ORDEX
 ;;#CONS/MOD/SUP# DE PARAMETRES EXPLICITES;;CLEPAG^%VVIDEO,^%VCMS("EXPLICI"),^TO3ORDEX
 ;;#AJOUT DE LISTES# D'ATTRIBUTS A IMPORTER DEPUIS DKBMS;;CLEPAG^%VVIDEO,^%VAJOUT("TOIMPFOR")
 ;;#CONS/MOD/SUP DE LISTES# D'ATTRIBUTS A IMPORTER DEPUIS DKBMS;;CLEPAG^%VVIDEO,^%VCMS("TOIMPFOR")
 ;;#EDITION# DE PARAMETRES EXPLICITES;;^TOEDIEXP
FUNC ;;
 ;;Creation de caracteristique ou grandeur definissant un objet
 ;;Consultation, modification, suppression des fiches de parametres explicites
 ;;Ajout de listes d'attributs a importer depuis DKBMS vers les objets TOTEM
 ;;Consultation, modification, suppression des listes d'attributs a importer depuis DKBMS vers les objets TOTEM
 ;;Edition sur ecran ou imprimante des parametres explicites par objet

