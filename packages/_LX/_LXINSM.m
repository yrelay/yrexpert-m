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

;%LXINSM^INT^1^59547,73870^0
LEXINSM(QUI) 
 
 
 
 
 G INSTAL2^%LXMRIN
 
 
 
 N M,MOTR,MM,LIGNE
 F M=1:1 S LIGNE=$P($T(TAB+M),";;",2) Q:LIGNE=""  F MM=1:1 S MOTR=$P(LIGNE,"/",MM) Q:MOTR=""  D AJMOTR^%LXUCRES(QUI,MOTR)
 Q
TAB ;;Liste des mots reserves a completer si besoin est
 ;;%MACHINE/NOM/MATIERE/ARTICLE/OBJET.TOTEM/FAMMAT/DATE/PERE/
 ;;IDENTIFIANT.TOTEM/QTE.MATIERE.EN.OEUVRE/INDIVIDU.RECEPTEUR/STATUS/
 ;;REPERTOIRE.RECEPTEUR/REPERTOIRE.RECEPTEUR.OPERATION/COMPOSANTS.ETUDE/
 ;;PRIX/QTE.STOCK/UNITE.STOCK/TAUX.HORAIRE/
 ;;QUANTITE/NORME.INTERNE/UNITE.DE.COMPTE/
 ;;GAMME/REPERE/ORDRE/INDICE/PLAN.COMPLEMENTAIRE/MATERIEL/PLAN/
 ;;DESIGNATION.PIECE/CODE.FAMILLE/DERNIER.INDICE/DATE.DERNIER.INDICE/
 ;;COMMENTAIRE.DERNIER.INDICE/VISA.PREPARATEUR/VISA.PREPARATEUR.DATE/
 ;;VISA.PREPARATEUR.HEURE/VISA.VERIFICATEUR/VISA.VERIFICATEUR.DATE/
 ;;VISA.VERIFICATEUR.HEURE/VISA.EMETTEUR/VISA.EMETTEUR.DATE/
 ;;VISA.EMETTEUR.HEURE/VISA.CONTROLEUR/VISA.CONTROLEUR.DATE/
 ;;VISA.CONTROLEUR.HEURE/OPERATION.MOZART/OPERATION.PROGRAMME.CONTROLE/
 ;;NUMERO.OPERATION/COMMENTAIRE/MACHINE/POSTE.MAIN/NOMBRE.EXEMPLAIRES/
 ;;OBJET/MANIERE/OUTIL/ACTION/TEMPS.FABRICATION/
 ;;TEMPS.PREPARATION/NOTE/CHARGE.MAXI/FAMILLE.POSTE/
 ;;NOMBRE.HEURES.JOURNALIERES/NOMBRE.HEURES.PLANIFIEES/
 ;;NUMERO.POSTE/REGIME.POSTE/UNITE.DE.CHARGE/FAMILLE/
 ;;OBSERVATION/QUANTITE.ATELIER/REFERENCE/
 ;;REMANENCE/REMANENCE.INITIALE/BONUS.DELTA/MALUS.DELTA/
 ;;DATE.PEREMPTION/HEURE.PEREMPTION/
 ;;COMMENTAIRE/TYPE.ETUDE/TYPE.EQUILIBRAGE/LISTE.OPERATIONS.GAMME/
 ;;ATTRIBUT.CAPACITE/NOM.GAMME/REPERTOIRE.GAMME/CYCLE/CYCLE.REEL/
 ;;TRAITEMENT.ACCEPTATION.LOCAL/TRAITEMENT.ACCEPTATION.GLOBAL/
 ;;LISTE.POSTES/LISTE.GROUPES.INSEPARABLES/LISTE.GROUPES.INCOMPATIBLES/
 ;;EQUILIBRE/EQUILIBRE.REEL/NOMBRE.POSTES/TEMPS.UNITAIRE/
 ;;NOMBRE.OPERATIONS.GAMME/NOMBRE.OPERATIONS.AFFECTEES/
 ;;CONCESSION.MAXIMUM/CONCESSION/ERREUR/DUREE/NOMBRE.TOTAL.OPERATEURS
 ;;EFFECTIF.POSTE/EFFECTIF.MAX.PAR.POSTE/TAUX.OPERATIONS.AFFECTEES/
 ;;DESIGNATION/TEMPS.PAR.OPERATEUR/DATE.CREATION/DATE.UTILISATION/
 ;;ENTREPRISE/IMPRESSION.AVEC.NOMENCLATURE/IMPRESSION.AVEC.OUTILLAGE
 ;;LISTE.ATTRIBUTS.GROUPES/LISTE.ATTRIBUTS.INDIVIDUS
 ;;DESSIN/VERSION/FAMILLE.TECHNOLOGIQUE/DUREE.INTEGRATION/
 ;;PRECEDENCE.COMPOSANT/DUREE.FABRICATION/TEMPS.FABRICATION
 ;;

