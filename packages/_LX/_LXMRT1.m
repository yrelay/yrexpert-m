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
;! Nomprog     : %LXMRT1                                                      !
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

%LXMRT1 ;

DATA
DEB ;;
 ;;CUMUL;Mot reserve cree par Yrelay.^^GPX :^Cumul d'heures passees lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;CYCLE;Mot reserve cree par Yrelay.^^EQX:^Nombre de pieces par unite de temps sortant d'une^ligne de montage.^^^
 ;;
 ;;EQX
 ;;CYCLE.REEL;Mot reserve cree par Yrelay.^^EQX:^C'est le cycle calcule par une etude d'equilibrage sur^la base d'une cycle vise et des autres contraintes.^^^
 ;;
 ;;EQX
 ;;DATE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;DATE.CREATION;Mot reserve cree par Yrelay.^^Date de creation d'Etudes, de Requetes, de listes,^de Variables actives,...^^^^
 ;;
 ;;DKBMS^LINK^MENTAILLE^VARIABLES.ACTIVES
 ;;DATE.DERNIER.INDICE;Mot reserve cree par Yrelay.^^MOZART^Attribut standard qui apparait dans la grille de garde^par defaut.^^^
 ;;
 ;;MOZART
 ;;DATE.DERNIERE.MODIFICATION;Mot reserve cree par Yrelay.^^Date de derniere modification d'un individu TRAITEMENT^^^^^
 ;;
 ;;DKBMS
 ;;DATE.ETUDE;Mot reserve cree par Yrelay.^TOTEM^^^^^^
 ;;
 ;;TOTEM
 ;;DATE.PEREMPTION;Mot reserve cree par Yrelay.^^VARIABLES ACTIVES:^Attribut d'un historique indiquant la date de^naissance de cet historique.^^^
 ;;
 ;;VARIABLES.ACTIVES
 ;;DATE.RECUPERATION.LINK;Mot cree par Yrelay^^LINK:^Date a laquelle le resultat d'une etude LINK est^transfere sur un individu de DKBMS^^^
 ;;
 ;;DKBMS
 ;;DATE.RECUPERATION.PASSERELLE;Mot cree par Yrelay^^DKBMS:^Date a laquelle un individu a ete cree ou ^modifie par l'activation d'une passerelle d'entree externe^^^
 ;;
 ;;DKBMS
 ;;DATE.RECUPERATION.TOTEM;Mot cree par Yrelay^^TOTEM:^Date a laquelle le resultat d'une etude TOTEM est^transfere sur un individu de DKBMS^^^
 ;;
 ;;TOTEM
 ;;DATE.UTILISATION;Mot reserve cree par Yrelay.^^DKBMS:^Attribut d'une liste remis a jour a chaque fois^que la liste est touchee (traitee, manipulee,...).^^^
 ;;
 ;;DKBMS
 ;;DERNIER.INDICE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une gamme. Apparait dans la grille^de garde par defaut.^^^
 ;;
 ;;MOZART
 ;;DERNIER.FORMAT.UTILISE;Mot reserve cree par Yrelay.^^DKBMS:^Attribut d'un individu date du ^repertoire ATTRIBUT.^^^^
 ;;
 ;;DKBMS
 ;;DESCRIPTION;Mot reserve cree par Yrelay.^^GPX :^pour un releve, description de la tache correspondante.^^^^
 ;;
 ;;GPX
 ;;DESCRIPTION.EDITION;Mot reserve cree par Yrelay.^^GPX :^description d'un releve lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;DESIGNATION;Mot reserve cree par Yrelay.^^^Libelle designant un projet ou une activite (GPX).^^^^
 ;;
 ;;GPX
 ;;DESIGNATION.PIECE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une gamme. Apparait dans la grille de^garde par defaut.^^^
 ;;
 ;;MOZART
 ;;DESSIN;Mot reserve cree par Yrelay.^^DKBMS/SDX^Attribut special: pointe vers un objet graphique^defini dans SDX.^^^
 ;;
 ;;DKBMS^GDX
 ;;DIMENSION.A.L.OUTIL;Mot reserve cree par Yrelay.^TOTEM:^Sur une phase, precise les cotes a visualiser,^les tolerances a respectier, ...^^^^
 ;;
 ;;TOTEM
 ;;DUREE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;DUREE.ETUDE;Mot reserve cree par Yrelay.^TOTEM:^duree de l'etude TOTEM^^^^^
 ;;
 ;;TOTEM
 ;;DUREE.FABRICATION;Mot reserve cree par Yrelay.^^JLX:^Sur un ARTICLE sans gamme, indique la duree de^fabrication (utilisation en nomenclature).^^^
 ;;
 ;;JLX
 ;;DUREE.INTEGRATION;Mot reserve cree par Yrelay.^^JLX:^Sur le lien inverse entre un article et son composant^indique la duree d'integration du second dans le premier.^^^
 ;;
 ;;JLX
 ;;EFFECTIF.MAX.PAR.POSTE;Mot reserve cree par Yrelay.^^EQX:^Dans une etude d'equilibrage indique le nombre^d'operateurs maximum sur un poste.^^^
 ;;
 ;;EQX
 ;;EFFECTIF.POSTE;Mot reserve cree par Yrelay.^^EQX:^Nombre d'operateurs affectes a un meme poste par une^etude d'equilibrage.^^^
 ;;
 ;;EQX
 ;;ENTETE;Mot reserve cree par Yrelay.^attribut multivalue des individus TRAITEMENT^contenant les lignes de commentaires associees^^^^^
 ;;
 ;;
 ;;ENTREPRISE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;EQUILIBRE;Mot reserve cree par Yrelay.^^Mesure relative du resultat d'un equilibrage (0 < EQ <1):^EQ = (Somme des Ti)/ (N*Cycle ) avec Ti = temps elemen-^-taires des operations et N=nombre de postes affectes^^^
 ;;
 ;;EQX
 ;;EQUILIBRE.REEL;Mot reserve cree par Yrelay.^^Voir EQUILIBRE mais ici c'est une mesure relative au^cycle reel calcule par l'etude d'equilibrage:^EQ.REEL = (Somme des Ti / N * Cycle reel).^^^
 ;;
 ;;EQX

