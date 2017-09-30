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

;%AB1MENF^INT^1^59547,73863^0
AB1MENF ;;02:51 PM  30 Apr 1990; 25 Sep 89  3:00 PM ; 30 Mar 93 10:59 AM
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;ABAQUES
 ;;#CREATION/MODIFICATION# DE LA STRUCTURE D'ABAQUES;;^%ABSTRUT
 ;;#SAISIE/CONSULTATION# DES REGLES DANS LES ABAQUES;;^%ABMENGR;;MOD
 ;;#SUPPRESSION CONTENU SEULEMENT#;;^%ABDELG1;;MOD
 ;;#SUPPRESSION# CONTENU ET STRUCTURE;;^%ABDELG0;;MOD
 ;;#COMPREHENSION#;;^%ABCPG01
 ;;#CONSULTATION RAPIDE#;;^%ABEV01
 ;;#IMPRESSION#;;^%ABIMRAB;;EXEC
 ;;#RESULTATS COMPREHENSION#;;^%ABCPRE1
 ;;#CONSULTATION UNIQUEMENT#;;^%ABGRCNS
 ;;#DUPLICATION# D'ABAQUES;;^%ABCOPY
FUNC ;;
 ;;Creation de nouveaux abaques et modification de structure des abaques existants
 ;;Acces au contenu des abaques : consulter, modifier, ajouter de nouvelles regles
 ;;Suppression des regles : la structure reste
 ;;Elimination d'abaques : regles et structures
 ;;Interpretation obligatoire des abaques saisis et verification de leur coherence interne
 ;;Activation d'abaques en mode interactif
 ;;Formatage et sortie d'abaques sur imprimante
 ;;Acces aux informations issues de la comprehension d'abaques
 ;;Visualisation du contenu des abaques sans pouvoir le modifier
 ;;Duplication d'abaques (contenu et eventuellement structure)       

