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

;%SYSDRIM^INT^1^59547,73892^0
%SYSDRIM ;
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;ADMINISTRATEUR D'APPLICATION
 ;;Definition des #variables actives#;;^%QSVAR
 ;;#Coherence# interne DKBMS;;^%QSXCM
 ;;#Nettoyage# de la partition routines;;^%SGNETMZ
 ;;#Nettoyage# de la partition de donnees courante;;^%SGNETQI
 ;;#Lexique#;;^%LXMSYS
 ;;Definition des #utilisateurs#;;^%ADMN
 ;;#switches# sur application;;CLEPAG^%VVIDEO,^%VTOZED
 ;;#schemas# de donnees;;CLEPAG^%VVIDEO,^%QSMODME
FUNC ;;
 ;;Definition des situations et des actions des variables actives
 ;;Coherence du stockage des donnees
 ;;Suppression des globals temporaires de la partition des routines
 ;;Suppression des globals temporaires de la partition de donnees
 ;;Gestion des mots reserves et regeneration de l'ensemble du lexique
 ;;Gestion des menus utilisateur et des configurations
 ;;Gestion de parametres de controle de l'application : temps d'attente, mode d'affichage des menus, analyseur d'erreurs,...
 ;;Acces aux schemas de donnees: gestion, verification, installation, transferts.
 ;
 ;
 ;

