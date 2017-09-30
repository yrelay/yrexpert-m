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

;%DLMENMA^INT^1^59547,73868^0
DLMENMA ;
 
 S %PROG=$T(+0) X ^TOLISRAM(1) Q
FUN ;;GESTION DES MACHINES
 ;;#Ajout# de machines;;CLEPAG^%VVIDEO,^%VAJOUT("DESMACH")
 ;;#Cons./Mod./Sup.# de machines;;CLEPAG^%VVIDEO,^%VCMS("DESMACH")
 ;;#Respect# selectif des capacites;;^%DLMACAP
 ;;#Transfert# des charges #des machines vers le repertoire#;;TRANS^%DLMACHI
 ;;#Epuration# des charges des machines;;EPUR^%DLMACHI
 ;;#Transfert# des charges depuis #le repertoire#;;TRANSQU^%DLMACH3
 ;;Mise a jour du repertoire des #ACTIVITES#;;^%DLMACH5
FUNC 
 ;;Description de nouvelles machines
 ;;Consultation, modification ou suppression de la description de machines
 ;;Selection des machines dont il faut respecter la capacite (machines "goulot")
 ;;Mise a jour du repertoire des machines a partir des charges etablies par le jalonnement
 ;;Destruction des charges pour certains jours (description des machines et repertoire) 
 ;;Mise a jour des charges de la description des machines a partir des valeurs stockees dans le repertoire
 ;;Stockage des resultats par machine et par jour dans le repertoire des ACTIVITEs

