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

;SOUREGL2^INT^1^59762,64718^0
SOUREGLJ ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Regle du jeu") D TO4^%VZCD K ^PAGE($I) S PG=1,LIM=21,LI=8 F %U=0:1 S LIG=$P($T(REG+%U),";;",2) Q:LIG="*"  S ^PAGE($I,PG,LI)=LIG,LI=LI+1 I LI>LIM S PG=PG+1,LI=8
 S NBPG=$S($D(^PAGE($I,PG)):PG,1:PG-1),PG=1 D AFF
QU D POCLEPA^%VVIDEO W $$^%QZCHW("+,-,page,(CTRLA)Abandon ") S DX=$X D ^%VLEC G:CTRLA=1 END G:Y1="" QU G PL:Y1="+",PL:Y1="=",MS:Y1="-" G:'($D(^PAGE($I,Y1))) QU S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
END K ^PAGE($I),DXG,DXD,DYH,DYB,GRAPH,MSG,NPG,NBPG,PG,LI,LIM,%U,Y1 Q
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=6,MSG=$$^%QZCHW("Page ")_PG_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG S LI=-1 F %U=1:1 S LI=$N(^PAGE($I,PG,LI)) Q:LI=-1  S DY=LI,DX=5 X XY W ^PAGE($I,PG,LI)
 Q
REG ;;      La souris tres affamee doit trouver le chemin le plus court pour
 ;;s'offrir le fromage a son dejeuner.
 ;;      Ce rongeur est tres peu, voire, pas du tout intelligent. Il se
 ;;dirigera d'une facon totalement aleatoire pour devorer son mets. Face
 ;;a ce probleme et pour venir en aide a nos amis les betes, nous decida-
 ;;mes d'alleger sa peine en mettant a la disposition de cette espece un
 ;;outil performant dans le monde industriel: un systeme expert.
 ;;      A ce jour, la souris peut se deplacer intelligemment dans le la-
 ;;byrinthe. En fait, c'est grace a votre savoir-faire et a votre perspi-
 ;;cacite que se manifestera son agressivite intellectuelle.
 ;;
 ;;      Le fromage peut avoir un effet sur la souris. Sur votre decision
 ;;il acquerra une capacite odoriferante qui se propagera dans le labyrin-
 ;;the en s'attenuant. Les obstacles que rencontrera l'animal peuvent
 ;;plus ou moins attenuer cette propagation selon leur degre de capacite
 ;;de porosite. Plus ce degre est eleve, plus l'odeur traversera l'obsta-
 ;;cle. La souris peut avoir une dentition. Chaque fois qu'elle tentera
 ;;de traverser un obstacle elle perdra une dent. Les obstacles sont in-
 ;;franchissables lorsque ses machoires sont depourvues de dents.
 ;;
 ;;      Pour exprimer votre savoir-faire un certain nombre de mots,
 ;; que nous appelerons parametres, sont a votre disposition. Vous pour-
 ;;rez egalement creer de nouveaux parametres si l'expression de votre
 ;;savoir-faire les reclame.
 ;;      Ces parametres predefinis sont :
 ;;
 ;;          - DIRECTION.SOURIS              - PROCHAINE.DIRECTION
 ;;          - FLAIR.NORD                    - FLAIR.SUD
 ;;          - FLAIR.EST                     - FLAIR.OUEST
 ;;          - OBSTACLE.NORD                 - OBSTACLE.SUD
 ;;          - OBSTACLE.EST                  - OBSTACLE.OUEST
 ;;          - NOMBRES.DE.DENTS
 ;;
 ;;      Remarques :
 ;;
 ;;          - DIRECTION.SOURIS : La souris etant sur une case, si sa po-
 ;;siton precedente etait au SUD alors DIRECTION.SOURIS=NORD
 ;;
 ;;          - PROCHAINE.DIRECTION : Dans votre savoir-faire, c'est le pa
 ;;rametre qui indiquera a la souris la direction a prendre.
 ;;
 ;;          - FLAIR.NORD (ou SUD ou EST ou OUEST) : Ce sont les parame-
 ;;tres qui indiquent l'intensite de l'odeur du fromage venant du NORD
 ;;(ou SUD ou EST ou OUEST) que capte la souris a l'endroit ou elle se
 ;;trouve
 ;;
 ;;          A present a vous de jouer !
 ;;          Yrelay vous souhaite un bon divertissement et bon
 ;;appetit a la souris......Il est interdit au joueur de manger la souris.
 ;;*

