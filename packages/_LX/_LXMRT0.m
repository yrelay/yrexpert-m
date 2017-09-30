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
;! Nomprog     : %LXMRT0                                                      !
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

%LXMRT0 ;

DATA 
 ;;6
DEB ;;
 ;;%;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;%MACHINE;Mot reserve cree par Yrelay.^TOTEM:^Represente la machine courante dans les regles^de selection machine.^^^^
 ;;
 ;;TOTEM
 ;;ABSCISSE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;DKBMS
 ;;ACTION;Mot reserve cree par Yrelay.^MOZART:^C'est un domaine du vocabulaire de MOZART.^Represente ce qui est a faire sur un poste de travail.^Necessaire pour creer une operation dans MOZART.^^^
 ;;
 ;;MOZART
 ;;ACTIVITE.EDITION;Mot reserve cree par Yrelay.^^GPX :^Activite d'un releve lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;AIDE;Mot reserve cree par Yrelay.^^DKBMS :^Attribut d'une SAISIE indiquant la note d'aide associee^^^^
 ;;
 ;;DKBMS
 ;;ANALYSE.CORRECTE;Mot reserve :^  Attribut des individus TRAITEMENT^indiquant la validite de l'analyse,^prend pour valeurs 0 ou 1^^^^
 ;;
 ;;
 ;;APPELLE;Mot reserve :^  Lien entre les individus TRAITEMENT^^^^^^
 ;;
 ;;DKBMS
 ;;APPELE.PAR;Mot reserve :^  Lien entre les individus TRAITEMENT^^^^^^
 ;;
 ;;DKBMS
 ;;APPEL.CALCULE;Mot reserve :^  Attribut des individus TRAITEMENT^indique le nombre d'appels calcules^(invocations par $TRAITER ou $TRAITERL de traitements^dont le nom ne sera connu qu'a l'execution)^^^
 ;;
 ;;DKBMS
 ;;ATTRIBUT;Mot reserve :^  Repertoire obligatoire d'un schema de donnees^^^^^^
 ;;
 ;;
 ;;ATTRIBUT.CAPACITE;Mot reserve cree par Yrelay.^EQX:^C'est l'attribut qui indique le temps alloue a chaque^operation d'une gamme a equilibrer sur une ligne de^montage.^^^
 ;;
 ;;EQX
 ;;ATTRIBUT.TEMPORAIRE;Mot reserve cree par Yrelay.^DKBMS:^Attribut utilise pour gerer les individus TRAITEMENTs^Il contient les occurences des attributs dont le nom^commence par un %.^^^
 ;;
 ;;
 ;;ATTRIBUT.UTILISE;Mot reserve cree par Yrelay.^DKBMS:^Attribut utilise pour gerer les individus TRAITEMENTs^Il contient les occurences des attributs utilises^dans le traitement.^^^
 ;;
 ;;
 ;;AUTEUR;Mot reserve cree par Yrelay.^DKBMS:^Nom du service ayant cree la liste ou la requete.^^^^^
 ;;
 ;;DKBMS
 ;;BASE.AFFICHAGE;Attribut special^^^^^^^
 ;;
 ;;
 ;;BASE.MISE.A.JOUR;Attribut special^^^^^^^
 ;;
 ;;
 ;;BONUS.DELTA;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;BONUS.UTILISATEUR;Mot reserve cree par Yrelay.^Hevea:^Attribut a deposer sur les transitions^(le systeme teste les transitions ^par bonus decroissant).^^^
 ;;
 ;;
 ;;CARD;Mot reserve cree par Yrelay.^DKBMS:^Nombre d'individus dans une liste.^^^^^
 ;;
 ;;DKBMS
 ;;CARDINAL.TOTAL;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;CHARGE.MAXI;Mot reserve cree par Yrelay.^^JLX:^Duree du travail maximum pour une machine dans un^atelier.^^^
 ;;
 ;;JLX
 ;;CONTEXTE.D.ACTIVATION;Mot reserve cree par Yrelay.^^Hevea:^Caracterise l'ensemble^des individus sur lequel s'executent^les regles.^^^
 ;;
 ;;HEVEA
 ;;CODE.FAMILLE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard d'une gamme^^^^
 ;;
 ;;MOZART
 ;;COLLECTION;Mot reserve cree par Yrelay.^^SDX:^Attribut designant la collection graphique associee a un objet^^^^	;;
 ;;
 ;;SDX
 ;;COMMENTAIRE;Mot reserve cree par Yrelay.^^Permet de commenter une activite ou un projet (GPX)^C'est l'attribut des operations qui recueillent les^informations non structurees de MOZART.^^^
 ;;
 ;;GPX^MOZART
 ;;COMMENTAIRE.DERNIER.INDICE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard de la gamme^^^^
 ;;
 ;;MOZART
 ;;COMMENTAIRE.EPILOGUE;Mot reserve cree par Yrelay.^^HEVEA:^Commentaire affiche en epilogue a l'evaluation d'un^noeud logique.^^^
 ;;
 ;;
 ;;COMMENTAIRE.PROLOGUE;Mot reserve cree par Yrelay.^^HEVEA:^Commentaire affiche en prologue a l'evaluation d'un^noeud logique.^^^
 ;;
 ;;
 ;;COMPOSANTS.ETUDE;Mot reserve cree par Yrelay.^^TOTEM/DKBMS:^Attribut d'un individu du repertoire ETUDE.TOTEM^indiquant le nombre de composants inferes.^^^
 ;;
 ;;DKBMS^TOTEM
 ;;CONCESSION;Mot reserve cree par Yrelay.^^EQX:^Ecart de la charge affectee a un poste relativement^au cycle reel calcule par l'etude d'equilibrage.^^^
 ;;
 ;;EQX
 ;;CONCESSION.MAXIMUM;Mot reserve cree par Yrelay.^^EQX:^Le plus grand ecart relatif de la charge d'un poste^au cycle reel calcule par l'etude d'equilibrage.^^^
 ;;
 ;;EQX
 ;;CONDITION.TRANSITION;Mot reserve cree par Yrelay.^^HEVEA:^^^^^
 ;;
 ;;HEVEA
 ;;CONTEXTE.D.ACTIVATION;Mot reserve cree par Yrelay.^^HEVEA:^^^^^
 ;;
 ;;HEVEA
 ;;COUT.TOTEM;Mot reserve cree par Yrelay.^TOTEM:^(Temps preparation + Temps fabrication) * Taux Horaire^/ Quantite^^^^
 ;;
 ;;TOTEM

