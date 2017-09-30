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

;%DLCONMN^INT^1^59547,73867^0
DLCONMN ;
 
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;CONFIGURATIONS
 ;;#ajout# d'une configuration;;CLEPAG^%VVIDEO,^%VAJOUT("DLCON")
 ;;#cms# d'une configuration;;CLEPAG^%VVIDEO,^%VCMS("DLCON")
 ;;#verification# d'une configuration;;VERIF^%DLCON1
 ;;#installation# d'une configuration;;INSTAL^%DLCON1
 ;;#configuration courante#;;CONFX^%DLCON1
 ;;configuration #standard#;;^%DLCONST
 ;;#parametres de decalage# d'une etude;;^%DLPARAM("APP")/XXX
FUNC ;;
 ;;Definition d'une nouvelle configuration : repertoires et liens utilises, attributs mis a jour par le jalonnement
 ;;Consultation, modification et suppression d'une configuration
 ;;Verification d'une configuration (existence schema de donnees, repertoires, liens)
 ;;Prise en compte d'une configuration de jalonnement
 ;;Mise en place et Visualisation de la configuration courante : Option OBLIGATOIRE pour connecter une configuration
 ;;Generation automatique d'une configuration standard (a verifier et a installer)
 ;;Gestion des parametres de decalage accessibles a un utilisateur dans la definition d'une etude

