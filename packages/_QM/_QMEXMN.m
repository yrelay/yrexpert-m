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

;%QMEXMN^INT^1^59547,73878^0
%QMEXMN ;;08:23 AM  2 Aug 1993; ; 15 Jul 93  4:58 PM
 
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;EVALUATEUR INTERACTIF HEVEA
 ;;#Creation# d'un reseau semantique;;CREAT^%QMEXGES
 ;;#Modification# d'un reseau semantique;;CM^%QMEXGES
 ;;#Duplication# d'un reseau semantique;;DUP^%QMEXGES
 ;;#Suppression# d'un reseau;;SUPP^%QMEXGES
 ;;#Comprehension# de reseaux;;^%QMEXATN
 ;;#Activation# d'une etude;;ACTIV^%QMEXGES
 ;;Acces aux saisies #interactives#;;^%QMEA
 ;;Journaux et #explications#;;^%AMGAGES
 ;;
FUNC ;;Creation d'un nouveau reseau (acquisition des caracteristiques generales et saisie du graphe des etats)
 ;;Modification d'un reseau
 ;;
 ;;
 ;;
 ;;Verification de la validite de reseaux et construction d'une version executable
 ;;Activation d'un reseau Hevea
 ;;Consultations des historiques d'executions et aide a l'explication des affectations, creations, ..

