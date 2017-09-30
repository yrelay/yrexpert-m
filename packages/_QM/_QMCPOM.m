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

;%QMCPOM^INT^1^59547,73876^0
%QMCPOM ;
 
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;SAUVEGARDES ET RESTAURATIONS
 ;;sauvegarde d'#individus#;;^%SGPDOUT
 ;;restauration d'#individus#;;^%SGPDIN
 ;;archivage de #connaissance#;;^%SGPKOUT
 ;;restauration de #connaissance#;;^%SGPKIN
 ;;archivages #divers#;;^%SGPXOU
 ;;restaurations #diverses#;;^%SGPXIN
 ;;sauvegarde d'une etude d'#equilibrage#;;DIA^%QMCPAE
 ;;sauvegarde de #reseaux semantiques Hevea#;;^%QMEXARC
 ;;restauration de #reseaux semantiques Hevea#;;^%QMEXIN
 ;;restauration d'#anciens reseaux# Hevea;;^%QMEXTRF
FUNC ;;
 ;;sauvegarde dans un fichier d'une liste d'individus, des liens, et de leurs individus liees selon le mode d'archivage
 ;;restauration d'individus a partir d'un fichier, avec ou sans renomage des individus 
 ;;ecriture sur fichier de traitements, modeles, formats, requetes, passerelles a des fins d'archivage ou de transport
 ;;restauration de traitements, modeles, formats, requetes, passerelles stockes sur fichiers 
 ;;ecriture sur fichier de definition de schema de donnees
 ;;restauration de schema de donnees
 ;;sauvegarde d'une etude d'equilibrage avec les individus associes
 ;;sauvegarde sur fichiers d'un reseau semantique (et de tous les reseaux associes), du savoir-faire utilise et des saisies invoquees
 ;;restauration de reseaux Hevea (individus, savoir-faire et saisies) et recomprehension de ces reseaux
 ;;restauration des individus de reseau Hevea archives dans une version anterieure a V3.2 release 14

