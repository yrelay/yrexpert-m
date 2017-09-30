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
;! Nomprog     : %LXMRT4                                                      !
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

%LXMRT4 ;

DATA
DEB ;;
 ;;OPERATION.PROGRAMME.CONTROLE;Mot reserve cree par Yrelay.^^MOZART:^Attribut standard de la gamme qui apparait dans la grille^de garde par defaut.^^^
 ;;
 ;;MOZART
 ;;ORDONNEE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;ORDRE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PASSERELLE.SORTIE;Mot reserve cree par Yrelay.^Passerelles de sortie suite de valeurs ^^^^^^
 ;;
 ;;TOTEM
 ;;PLAN.DE.PRODUCTION.MIS.A.JOUR;Mot reserve cree par Yrelay.^TXP:^Attribut affecte sur les ARTICLEs et les STATION.DE.PRODUCTIONs^par une planification avec la valeur OUI on NON.^^^
 ;;
 ;;TXP^DKBMS
 ;;PERE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PLAN;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PLAN.COMPLEMENTAIRE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;POSITION;Mot reserve cree par Yrelay.^^GPX :^abscisse lors de l'edition.^^^^
 ;;
 ;;GPX
 ;;POSITION.EDITION;Mot reserve cree par Yrelay.^^GPX :^abscisses lors de l'edition de syntheses.^^^^
 ;;
 ;;GPX
 ;;POSTE;Mot reserve cree par Yrelay.^^GPX :^Poste occupe par un operateur.^^^^
 ;;
 ;;GPX
 ;;POSTE.MAIN;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PRECEDENCE.COMPOSANT;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PRENOM;Mot reserve cree par Yrelay.^^GPX :^Prenom d'un operateur.^^^^
 ;;
 ;;GPX
 ;;PRIME.RECONNAISSANCE;Mot cree par Yrelay^^CPX :^Bonus attribue a un individu quand il a ete^reconnu durant le transfert de nomenclature.^^^
 ;;
 ;;TOTEM
 ;;PRIX;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;PRODUCTION;Mot reserve cree par Yrelay.^TXP:^Attribut multivalue affecte sur les ARTICLEs par une^planification, PRODUCTION(periode)=quantite^a produire.^^^
 ;;
 ;;TXP^DKBMS
 ;;PRODUCTION.ACTIVITE;Mot reserve cree par Yrelay.^^GPX :^Pour un projet ou une semaine, nbre total d'heures^passees sur une activite.^^^
 ;;
 ;;GPX
 ;;PRODUCTION.OPERATEUR;Mot reserve cree par Yrelay.^^GPX :^Pour une semaine, nbre total d'heures depensees^par un operateur.^^^
 ;;
 ;;GPX
 ;;PRODUCTION.PROJET;Mot reserve cree par Yrelay.^^GPX :^Pour une semaine, nbre total d'heures passees^sur un projet.^^^
 ;;
 ;;GPX
 ;;PRODUCTION.SEMAINE;Mot reserve cree par Yrelay.^^GPX :^Pour une activite, un projet ou un operateur, nbre^d'heures utilisees pour une semaine particuliere.^^^
 ;;
 ;;GPX
 ;;PRODUCTION.TOTALE;Mot reserve cree par Yrelay.^^GPX :^Pour une semaine, nbre total d'heures depensees.^^^^
 ;;
 ;;GPX
 ;;PROJET.EDITION;Mot reserve cree par Yrelay.^^GPX :^identificateur de projet lors de l'edition de^syntheses.^^^
 ;;
 ;;GPX
 ;;QTE.MATIERE.EN.OEUVRE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;QTE.STOCK;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;QUANTITE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;QUANTITE.ATELIER;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;
 ;;REFERENCE;Mot reserve cree par Yrelay.^^^^^^^
 ;;
 ;;

