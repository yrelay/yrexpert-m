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

;%ADMN^INT^1^59547,73865^0
ADMN ;
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;DEFINITION DES UTILISATEURS
 ;;#AJOUT# DE MENUS UTILISATEUR;;CLEPAG^%VVIDEO,AJ^%AD1
 ;;#C/M/S# DE MENUS UTILISATEUR;;CLEPAG^%VVIDEO,CMS^%AD1
 ;;#VERIFICATION# DES MENUS UTILISATEUR;;CLEPAG^%VVIDEO,VER^%AD1
 ;;#INSTALLATION# DES MENUS UTILISATEUR;;CLEPAG^%VVIDEO,INS^%AD2
 ;;#RESTAURATION# DU MN;;CLEPAG^%VVIDEO,RES^%AD2
 ;;#AJOUT# D'UN UTILISATEUR;;CLEPAG^%VVIDEO,^%VAJOUT("TABIDENT")
 ;;#C/M/S# D'UN UTILISATEUR;;CLEPAG^%VVIDEO,^%VCMS("TABIDENT")
 ;;DUPLICATION DE #CONNEXIONS#;;CLEPAG^%VVIDEO,INTER^%INCACO
FUNC ;;
 ;;Ajout de menus specifiques utilisateur
 ;;Consultation, modification ou suppression de menus specifiques utilisateur
 ;;Verification de la coherence des menus specifiques utilisateur
 ;;Installation des menus specifiques utilisateur
 ;;Restauration du menu RESERVE initial
 ;;Ajout d'utilisateurs
 ;;Consultation, modification, suppression d'utilisateurs
 ;;Interface de duplication de connexions a la definition d'un nouvel utilisateur

