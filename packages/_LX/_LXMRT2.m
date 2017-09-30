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
;! Nomprog     : %LXMRT2                                                      !
;! Module      : LEXIQUE                                                      !
;! But         : Mots réservés                                                !
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

%LXMRT2 ;

DATA
DEB ;;
 ;;ERREUR;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;ETUDE;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;ETUDE.TOTEM;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;FAMILLE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;FAMILLE.POSTE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'un POSTE DE TRAVAIL ou d'une^MACHINE. Indique la section de machine.^^^
 ;;
 ;;MOZART
 ;;FAMILLE.TECHNOLOGIQUE;Mot reserve cree par Yrelay.^^JLX:^Les regles definissant les jalons sont regroupees par^famille technologique: ce sont des poches de connaissance^^^
 ;;
 ;;JLX
 ;;FAMMAT;Mot reserve cree par Yrelay.^^TOTEM:^Utilise par TOTEM dans les etudes matieres.^^^^
 ;;
 ;;TOTEM
 ;;HEURE.DEBUT;Mot reserve cree par Yrelay.^TOTEM^heure de debut d'etude^^^^^
 ;;
 ;;TOTEM
 ;;HEURE.EDITION;Mot reserve cree par Yrelay.^^GPX :^nbre d'heures d'un releve lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;HEURE.FIN;Mot reserve cree par Yrelay.^TOTEM^heure de fin d'etude^^^^^
 ;;
 ;;TOTEM
 ;;HEURE.PEREMPTION;Mot reserve cree par Yrelay.^^VARIABLES.ACTIVES:^Sur un individu historique, indique l'heure a laquelle^cet historique a ete cree.^^^
 ;;
 ;;VARIABLES.ACTIVES
 ;;HEURES.PASSEES;Mot reserve cree par Yrelay.^^GPX :^pour un releve, nbre d'heures passees sur une tache.^^^^
 ;;
 ;;GPX
 ;;HISTOGRAMME;Mot reserve cree par Yrelay.^^DKBMS^Attribut special permettant d'associer des histogrammes^aux individus^^^^^^^
 ;;
 ;;GPX
 ;;IDENTIFIANT.DKBMS;Mot reserve cree par Yrelay.^TOTEM:^Parametre indiquant, au retour TOTEM->DKBMS, le nom^d'un individu sur lequel il faut rapatrier les infos^produites ou connecter la nomenclature.^^^
 ;;
 ;;TOTEM
 ;;IDENTIFIANT.TOTEM;Mot reserve cree par Yrelay.^^TOTEM:^C'est un probleme pose a TOTEM depuis DKBMS: une poche de^Savoir-faire et un jeu de valeurs. (TOLE/1000/1.5/100/..)^^^
 ;;
 ;;TOTEM
 ;;IMPRESSION.AVEC.NOMENCLATURE;Mot reserve cree par Yrelay.^^EQX:^Le modele d'edition standard de EQX donne la possibilite^d'editer le resultat avec ou sans nomenclature.^^^
 ;;
 ;;EQX
 ;;IMPRESSION.AVEC.OUTILLAGE;Mot reserve cree par Yrelay.^^EQX:^L'edition standard de EQX permet d'imprimer avec ou^sans l'outillage.^^^
 ;;
 ;;EQX
 ;;INDICE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;INDICE.NOTE;Mot reserve cree par Yrelay.^^DKBMS:^Cracteristique d'un individu SAISIE^^^^
 ;;
 ;;DKBMS
 ;;INDIVIDU.RECEPTEUR;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;JOUR;Mot reserve cree par Yrelay.^^GPX :^Jour concernant un releve de production.^(les 2 prem. lettres : LU, MA, ME, ...)^^^
 ;;
 ;;GPX
 ;;JOUR.EDITION;Mot reserve cree par Yrelay.^^GPX :^les 2 premieres lettres du jour lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;LANCEMENT.ETUDE;Mot reserve cree par Yrelay.^TOTEM^^^^^^^
 ;;
 ;;TOTEM
 ;;LIBELLE.FORMAT;Mot reserve cree par Yrelay.^^DKBMS :^attribut des individus de type date du^repertoire ATTRIBUT.^^^^
 ;;
 ;;
 ;;LIEN;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;LIEN.QUALIFIE;Mot reserve cree par Yrelay.^^DKBMS :^indique si un individu de type lien (l.)^du repertoire TRAITEMENT est qualifie.^^^^
 ;;
 ;;
 ;;LISTE;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;LISTE.ATTRIBUTS.GROUPES;Mot reserve cree par Yrelay.^^EQX:^Indique la liste d'attributs utilisee a l'affichage^des groupes (Postes).^^^
 ;;
 ;;EQX
 ;;LISTE.ATTRIBUTS.INDIVIDUS;Mot reserve cree par Yrelay.^^EQX:^Liste d'attributs utilisee a l'affichage des^individus (operations de la gamme).^^^
 ;;
 ;;EQX
 ;;LISTE.GROUPES.INCOMPATIBLES;Mot reserve cree par Yrelay.^^EQX:^Liste des listes d'incompatibles creee quand on^choisie l'option "Incompatibles".^^^
 ;;
 ;;EQX
 ;;LISTE.GROUPES.INSEPARABLES;Mot reserve cree par Yrelay.^^EQX:^Liste des listes d'inseparables creee lorsqu'on^choisit l'option "Inseparables".^^^
 ;;
 ;;EQX
 ;;LISTE.OPERATIONS.GAMME;Mot reserve cree par Yrelay.^^EQX:^Liste d'entree contenant les individus a consituer en^postes (Operations de la gamme).^^^
 ;;
 ;;EQX
 ;;LISTE.POSTES;Mot reserve cree par Yrelay.^^EQX:^Liste des listes de sortie, contient les groupes^d'individus constitues (creees automatiquement).^^^
 ;;
 ;;EQX

