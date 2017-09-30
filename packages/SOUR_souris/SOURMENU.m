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

;SOURMENU^INT^1^59547,74869^0
SOURMENU ;; ; 03 Aug 89 10:16 AM
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;LA SOURIS ET LE FROMAGE
 ;;#REGLE# DU JEU;;^SOUREGLJ
 ;;#INTRODUCTION# DU SAVOIR-FAIRE;;^SOURMEN1
 ;;#COMPREHENSION# DU SAVOIR-FAIRE;;^SOURCPTI
 ;;#LABYRINTHE#;;^SOURFROM
 ;;ACCES AUX SAVOIR-FAIRE #EXISTANTS#;;^SOURKSCA
 ;;#STOCKAGE# DU SAVOIR-FAIRE COURANT;;^SOURKSTO
 ;;REMISE A #ZERO# DU SAVOIR-FAIRE COURANT;;^SOURCLK
 ;;CATALOGUE DES LABYRINTHES;;^SOURDELA
 ;;
FUNC ;;Retour au menu precedent
 ;;Comment utiliser ce jeu didactique, les mots reserves a utiliser
 ;;Ajout, consultation, et modification des regles du savoir faire courant ou du savoir faire provenant de la bibliotheque
 ;;Phase prealable de validation du savoir faire courant, le passage par ceci est indispensable pour que le savoir faire soit pris en compte
 ;;Debut du jeu (une comprehension prealable est necessaire)
 ;;Bibliotheque des poches de connaissance (savoir faire) deja ecrites    et precedement stockees
 ;;Stockage du savoir faire courant dans la bibliotheque
 ;;Suppression du savoir faire courant, veuillez verifier que celui-ci a bien ete stockes avant d'executer cette option, sinon il sera perdu
 ;;Visualisation ou supression des labyrinthes precedement stockes

