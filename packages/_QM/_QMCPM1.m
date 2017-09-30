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

;%QMCPM1^INT^1^59547,73876^0
QMCPM1 ;
 
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;COPIE DE CONNAISSANCE
 ;;copie de #traitements#;;TTL^%QMCPSF
 ;;copie d'#abaques#;;ABA^%QMCPSF;;~$$OKR^%INCOIN("QMCPTOAB")
 ;;copie de #formats de texte#;;EDF^%QMCPSF;;~$$OKR^%INCOIN("ED")
 ;;copie de #modeles de texte#;;EDM^%QMCPSF;;~$$OKR^%INCOIN("ED")
 ;;copie d' #attributs predefinis#;;ATPR^%QMCPSF
 ;;copie de #regles de jalonnement#;;EDM^%QMCPSF;;~$$OKR^%INCOIN("JAL")
 ;;copie de #Savoir-Dessiner#;;^%SDCOP;;~$$OKR^%INCOIN("SD")
 ;;copie de #domaines de Savoir-Comparer#;;SCX^%QMCPSF;;~$$OKR^%INCOIN("SCO")
 ;;
 ;;copie de #domaines du savoir-comparer#;;
 ;;copie d'#etudes d'equilibrage#;;DIA2^%QMCPAE;;~$$OKR^%INCOIN("QNEQ")
 ;;copie de #savoir-faire TOTEM#;;
FUNC ;;
 ;;copie de traitements d'un service a un autre
 ;;copie de la definition d'abaques d'un service a un autre
 ;;copie de formats de texte d'un service a un autre
 ;;copie de modeles de texte d'un service a un autre
 ;;copie d'attributs predefinis d'un service a un autre
 ;;copie de regles de jalonnement d'un service a un autre
 ;;copie de collections et d'objets d'un service a un autre
 ;;copie de domaines de Savoir-Comparer d'un service a un autre
 ;;
 ;;copie de domaine du savoir-comparer d'un service a un autre
 ;;copie d'etudes d'equilibrage d'un service a un autre
 ;;copie de poche du savoir-faire TOTEM
 ;;
 ;;
 ;

