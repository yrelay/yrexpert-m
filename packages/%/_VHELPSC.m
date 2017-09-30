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

;%VHELPSC^INT^1^59547,74035^0
HELPSCRE ;
 N A,CHOI,I,NU,POS,TP
 D CLEPAG^%VVIDEO
 S DX=0 F DY=0:1:4 X XY D CAG^%VVIDEO
 D ^%VZCD0($$^%QZCHW("DIVERSES FONCTIONS"))
 S DX=20,DY=5,DX=$X-1,NU=1 X XY W " ",!,!
 S DTM=^INCONNE("INCA3","TYPECR")="C-DTM"
 I DTM=0 F I=1:1 S A=$T(FR+I) Q:$E(A,1)'=" "  S CHOI=$P(A,";;",2),POS=$S(NU'<10:5,1:6) W:CHOI'="" ?POS,NU,")  " S:CHOI'="" NU=NU+1 F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $$^%QZCHW($P(CHOI,"#",TP)) D:TP=2 NORM^%VVIDEO W:TP=3 !
 I DTM F I=1:1 S A=$T(FR2+I) Q:$E(A,1)'=" "  S CHOI=$P(A,";;",2),POS=$S(NU'<10:5,1:6) W:CHOI'="" ?POS,NU,")  " S:CHOI'="" NU=NU+1 F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $$^%QZCHW($P(CHOI,"#",TP)) D:TP=2 NORM^%VVIDEO W:TP=3 !
 D ^%VZEAVT($$^%QZCHW("[RETURN] pour continuer "))
 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR Q
 
FR ;;
 ;;#CTRLA#  Abandon
 ;;#CTRLF#  Fin de saisie sur la grille
 ;;#CTRLE#  Effacement de tous les champs depuis le champ courant
 ;;#CTRLI#  Mode normal <--> Mode modification du champ
 ;;#CTRLG#  Effacement du curseur jusqu'a la fin du champ
 ;;#CTRLR#  Raffraichissement de l'image
 ;;#CTRLJ#  Impression de la grille courante sur imprimante
 ;;#CTRLP#  Prendre un champ
 ;;#CTRLD#  Deposer ou inserer le champ pris
 ;;#RETURN# Fin de saisie du champ
 ;;
 ;;fleche vers le #haut#     Premier champ de la ligne precedente
 ;;   "    "   "  #bas#      Premier champ de la ligne suivante
 ;;   "    "   la #gauche#   Champ precedent
 ;;   "    "   "  #droite#   Champ suivant
FR2 ;;
 ;;#ESCP#     Abandon
 ;;#FIN#      Fin de saisie sur la grille
 ;;#ALTE#     Effacement de tous les champs depuis le champ courant
 ;;#ALTF1#    Mode normal <--> Mode modification du champ
 ;;#ALTM#     Effacement du curseur jusqu'a la fin du champ
 ;;#CTRLPgUp# Raffraichissement de l'image
 ;;#ALTJ#     Impression de la grille courante sur imprimante
 ;;#ALTF9#    Prendre un champ
 ;;#ALTD#     Deposer ou inserer le champ pris
 ;;#RETURN#   Fin de saisie du champ
 ;;
 ;;fleche vers le #haut#     Premier champ de la ligne precedente
 ;;   "    "   "  #bas#      Premier champ de la ligne suivante
 ;;   "    "   la #gauche#   Champ precedent
 ;;   "    "   "  #droite#   Champ suivant

