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

;%QFHELP^INT^1^59547,73875^0
GRHELP ;
 D CLEPAG^%VVIDEO S SCR="QGHELP" D ^%VAFIGRI,CUROF^%VVIDEO,POCLEPA^%VVIDEO W "[RETURN]",*-1 R *BIDON
 D CLEPAG^%VVIDEO,SMTHSCRL^%VVIDEO,TEXTE,POCLEPA^%VVIDEO W "[RETURN] pour continuer " R *BIDON D JMPSCRL^%VVIDEO,CURON^%VVIDEO,SCREESH^%QFECRAN S RETOUR=1 Q
 
TEXTE S DX=20,DY=20,DX=$X-1,NU=1 X XY W " ",!,! F I=1:1 S A=$T(FUN+I) Q:A=""  S CHOI=$P(A,";;",2) W !,CHOI
 Q
FUN ;;
 ;;GENERALITES
 ;;-----------
 ;;
 ;;       L'ecran precedent comprend une fenetre "individus", a gauche,
 ;;et une fenetre "groupe", a droite. L'utilisateur a acces tour a tour 
 ;;a l'une ou l'autre de ces fenetres, en se deplacant a l'aide des 
 ;;fleches.
 ;;       La fenetre dans laquelle il se trouve est signalee par son 
 ;;contour plus brillant.
 ;;       A chaque fenetre correspond un ensemble de fonctions.
 ;;
 ;;
 ;;FONCTIONS SUR LES INDIVIDUS
 ;;---------------------------
 ;;
 ;;COMMANDE       |    ACTION
 ;;-----------------------------------------------------------------------
 ;;[RETURN]       |    Affecter l'individu courant (indique par le curseur)       
 ;;               |  au groupe courant (en caracteres gras).
 ;;               |
 ;;    R          |    RAPPEL: Annuler l'affectation de l'individu courant.
 ;;               |
 ;;    A          |    Rotation de l'attribut affiche pour les individus.
 ;;               |
 ;;    P          |    Deplacement au prochain individu non encore affecte.
 ;;               |
 ;;23 [RETURN]    |    Acces a la page 23
 ;;    +          |          "         suivante
 ;;    -          |          "         precedente
 ;;               |
 ;;    ? ou !     |    Differents modes de visualisation des caracteris-
 ;;               |  tiques d'un individu
 ;;               |
 ;;    ->         |    Acces a la fenetre "groupes".
 ;;
 ;;
 ;;
 ;;FONCTIONS SUR LES GROUPES
 ;;-------------------------
 ;;
 ;;COMMANDE       |    ACTION
 ;;-----------------------------------------------------------------------
 ;;               |
 ;;[RETURN]       |    Selection du groupe courant (en vue de lui affecter
 ;;               |  des individus).
 ;;               |
 ;;       Z       |    ZOOM sur les individus du groupes (ils seront les 
 ;;               |  seuls affiches en fenetre de gauche).
 ;;               |    Egalement: annulation du ZOOM.
 ;;               |
 ;;       C       |    CREATION d'un nouveau groupe
 ;;               |
 ;;       F       |    FUSION de plusieurs groupes existant en un seul
 ;;               |
 ;;       S       |    SUPPRESSION d'un groupe
 ;;               |
 ;;    ? ou !     |    Differents modes de visualisation des caracteris-
 ;;               |  tiques d'un groupe
 ;;               |
 ;;      <-       |    Acces a la fenetre "individus".

