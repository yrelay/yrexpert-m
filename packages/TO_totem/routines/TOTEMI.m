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

;TOTEMI^INT^1^59547,74876^0
TOTEMI ;; ; 25 Sep 89  2:40 PM
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;APPRENTISSAGE du SAVOIR-FAIRE
 ;;#PARAMETRES# du SAVOIR-FAIRE;;^TO1MENU1
 ;;#ABAQUES#;;^%AB1MENF
 ;;#COMPOSANTS#;;^TO1MENU2
 ;;#PHASES ET DERIVEES#;;^TO1MENU3;;~^TOZE($I,"PHASE")
 ;;#MACHINES#;;^TO1MENUB;;~^TOZE($I,"MACHINE")
 ;;#MATIERES#;;^TO1MENU4;;~^TOZE($I,"MATIERE")
 ;;#EDITION# SUR SAVOIR-FAIRE;;^TOEDISF
 ;;#LEXIQUE#;;^%LXMN
 ;;#MANIPULATIONS GENERALES# sur le SAVOIR-FAIRE;;^TO1MENU5
FUNC ;;
 ;;Definition des objets et deduction de leurs caracteristiques
 ;;Regles homogenes tabulees (numeriques et/ou symboliques)
 ;;Definition des nomenclatures; regles de selection des composants
 ;;Definition des differentes phases des gammes de fabrication; calcul des temps et couts; respects des consignes et dimensions a l'outil
 ;;Description des machines; ecriture de Savoir-Faire sur les machines; regles de selection des machines
 ;;Description des matieres; ecriture de Savoir-Faire sur les matieres; regles de selction des matieres
 ;;Edition dur imprimante des regles de Savoir-Faire
 ;;Defintion et gestion des mots utilises dans l'application; synonymie; unoites.
 ;;Gestion globale des objets; table des constantes; cas d'emploi des parametres
 ;
 ;

