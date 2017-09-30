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
;! Nomprog     : %LXMRT3                                                      !
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

%LXMRT3 ;

DATA
DEB ;;
 ;;MACHINE;Mot reserve cree par Yrelay.^^MOZART, TOTEM, JLX^^^^^
 ;;
 ;;JLX^MOZART^TOTEM
 ;;MACHINE.REMPLACEMENT;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une operation: apparait dans la^grille operation par defaut.^^^
 ;;
 ;;MOZART
 ;;MALUS.DELTA;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;MANIERE;Mot reserve cree par Yrelay.^^MOZART:^Domaine du vocabulaire des gammes. Attribut standard de^l'operation: apparait dans la grille Action par defaut.^^^
 ;;
 ;;EQX
 ;;MATERIEL;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard de la gamme: apparait dans la grille^de garde par defaut.^^^
 ;;
 ;;MOZART
 ;;MISE.EN.PRODUCTION;Mot reserve cree par Yrelay.^TXP:^Attribut multivalue affecte sur les ARTICLEs par une^planification, MISE.EN.PRODUCTION(periode)=quantite^a mettre en production.^^
 ;;
 ;;TXP^DKBMS
 ;;NOEUD.LOGIQUE;Mot reserve :^  Repertoire du schema de donnees^^^^^^
 ;;
 ;;
 ;;NOEUD.DE.PETRI;Mot reserve cree par Yrelay.^^HEVEA:^Indique si un noeud est de Petri.^^^^
 ;;
 ;;HEVEA
 ;;NOEUD.INITIAL;Mot reserve cree par Yrelay.^HEVEA:^prmier noeud du reseau semantique^^^^^
 ;;
 ;;HEVEA
 ;;NOEUD.FINAL;Mot reserve cree par Yrelay.^^HEVEA:^^^^^
 ;;
 ;;HEVEA
 ;;NOEUD.TERMINAL;Mot reserve cree par Yrelay.^^HEVEA:^^^^^
 ;;
 ;;HEVEA
 ;;NOM;Mot reserve cree par Yrelay.^^DKBMS:^Tout individu a au minimum un attribut: son nom.^^^^
 ;;
 ;;DKBMS
 ;;NOM.DE.FAMILLE;Mot reserve cree par Yrelay.^^GPX :^Nom de famille d'un operateur.^^^^
 ;;
 ;;GPX
 ;;NOM.GAMME;Mot reserve cree par Yrelay.^^JLX:^Dans la configuration a 4 repertoires, indique la gamme^qui doit etre jalonnee pour un lancement donne.^^^
 ;;
 ;;JLX
 ;;NOM.LIEN;Mot reserve cree par Yrelay.^^Chaque lien est nomine par le schema de donnees.^^^^^
 ;;
 ;;
 ;;NOM.LIEN.INVERSE;Mot reserve cree par Yrelay.^^Indique sur les individus TRAITEMENT de type lien^le nom du lien inverse.^^^^^
 ;;
 ;;
 ;;NOMBRE;Mot reserve cree par Yrelay.^^TOTEM:^^^^^
 ;;
 ;;TOTEM
 ;;NOMBRE.DE.PHRASES;Mot reserve cree par Yrelay.^^DKBMS:^Attribut d'un individu TRAITEMENT, indique le nombre de lignes^qu'il contient.^^^
 ;;
 ;;
 ;;NOMBRE.DE.REGLES;Mot reserve cree par Yrelay.^^DKBMS:^Attribut d'un individu TRAITEMENT, indique le nombre de regles^qu'il contient.^^^
 ;;
 ;;
 ;;NOMBRE.EXEMPLAIRES;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une operation: apparait dans la^grille Operation par defaut.^^^
 ;;
 ;;MOZART
 ;;NOMBRE.HEURES.JOURNALIERES;Mot reserve cree par Yrelay.^^MOZART, JLX, TOTEM^Attribut standard d'une machine. Le nombre d'heures de^disponibilite quotidienne.^^^
 ;;
 ;;JLX^MOZART^TOTEM
 ;;NOMBRE.HEURES.PLANIFIEES;Mot reserve cree par Yrelay.^^MOZART, JLX, TOTEM^Attribut standard d'une machine.^^^^
 ;;
 ;;JLX^MOZART^TOTEM
 ;;NOMBRE.INDIVIDUS;Mot reserve cree par Yrelay.^^DKBMS:^indique sur les individus TRAITEMENT de type repertoire^le nombre d'individus dans le repertoire.^^^^
 ;;
 ;;DKBMS
 ;;NOMBRE.OPERATIONS.AFFECTEES;Mot reserve cree par Yrelay.^^EQX:^Nombre d'individus (Operations) inseres dans un groupe.^^^^
 ;;
 ;;EQX
 ;;NOMBRE.OPERATIONS.GAMME;Mot reserve cree par Yrelay.^^EQX:^Nombre d'operations dans la liste d'entree^(LISTE.OPERATION.GAMME). Cardinal.^^^
 ;;
 ;;EQX
 ;;NOMENCLATURE;Mot reserve cree par Yrelay.^^TOTEM:^prend la valeur 1 si la nomenclature ^est rapatriee de TOTEM vers DKBMS^^
 ;;
 ;;TOTEM
 ;;NOMBRE.POSTES;Mot reserve cree par Yrelay.^^EQX:^Nombre de postes deduit par une etude d'equilibrage.^^^^
 ;;
 ;;EQX
 ;;NOMBRE.TOTAL.OPERATEURS;Mot reserve cree par Yrelay.^^EQX:^Somme du nombre d'operateurs par poste.^^^^
 ;;
 ;;EQX
 ;;NON.RESOLU;Mot reserve cree par Yrelay.^^DKBMS:^Attribut d'un individu traitement contenant le nom des^traitements qu'il appelle et qui n'existent pas^^^^
 ;;
 ;;DKBMS
 ;;NORME.INTERNE;Mot reserve cree par Yrelay.^^DKBMS, TOTEM:^Dans les abaques permet, pour un meme jeu de premisses^et de resultantes, d'utiliser differents jeux de valeurs.^^^
 ;;
 ;;DKBMS^TOTEM
 ;;NOTE;Attribut special^^^^^^^
 ;;
 ;;DKBMS
 ;;NOUVEAU.RELEVE;Mot reserve cree par Yrelay.^^GPX :^sur un releve, indique que celui-ci est en cours de^transfert depuis les Saisies.^^^
 ;;
 ;;GPX
 ;;NUMERO.ETUDE;Mot reserve cree par Yrelay.^^TOTEM:^Numero d'etude TOTEM.^^^^
 ;;
 ;;TOTEM
 ;;NUMERO.OPERATION;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une operation. Avec ACTION cet^attribut est necessaire a la definition d'une operation.^^^
 ;;
 ;;MOZART
 ;;NUMERO.POSTE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une machine ou poste de travail.^Indique son numero.^^^
 ;;
 ;;MOZART
 ;;OBJET;Mot reserve cree par Yrelay.^^MOZART:^Domaine du vocabulaire des gammes. Attribut standard de^l'operation: apparait dans la grille Action par defaut.^^^
 ;;
 ;;MOZART
 ;;OBJET.TOTEM;Mot reserve cree par Yrelay.^^TOTEM:^Sur un individu a etudier par TOTEM, indique la poche^de savoir-faire a evoquer.^^^
 ;;
 ;;TOTEM
 ;;OBSERVATION;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une gamme qui apparait dans la grille^de garde par defaut.^^^
 ;;
 ;;

