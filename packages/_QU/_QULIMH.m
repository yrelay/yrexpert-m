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

;%QULIMH^INT^1^59547,73885^0
%QULIMH ;; ; 24 Jun 92 10:23 AM
 
 
TCHF 
 N %STOP,A,CH,I,REP,TP,LI
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("TOUCHES DE FONCTIONS"))
 S DY=6,DX=0 X XY
 S %STOP=0
 I DTM G BOUC0
BOUC F I=1:1 S A=$T(FUN+I) Q:$P(A,";;",2)=""  D:(I#17)=0 ALORS Q:%STOP=1  S CH=$$^%QZCHW($P(A,";;",2)) D ECR
 I %STOP=0 D ^%VZEAVT($$^%QZCHW("fin de liste"))
 Q
BOUC0 
 I MODTM G BOUC1
 F I=1:1 S A=$T(FUN1+I) Q:$P(A,";;",2)=""  D:(I#17)=0 ALORS Q:%STOP=1  S CH=$$^%QZCHW($P(A,";;",2)) D ECR
 I %STOP=0 D ^%VZEAVT($$^%QZCHW("fin de liste"))
 Q
BOUC1 
 F I=1:1 S A=$T(FUN2+I) Q:$P(A,";;",2)=""  D:(I#17)=0 ALORS Q:%STOP=1  S CH=$$^%QZCHW($P(A,";;",2)) D ECR
 I %STOP=0 D ^%VZEAVT($$^%QZCHW("fin de liste"))
 Q
 
ECR 
 I CH'["#" W CH,! Q
 F TP=1:1:3 S DX=$X,DY=$Y D:TP=2 BLD^%VVIDEO X XY W $P(CH,"#",TP) S DX=$X,DY=$Y D:TP=2 NORM^%VVIDEO X XY
 W ! Q
 
ALORS 
 D POCLEPA^%VVIDEO W $$L2^%SYSLIB3
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S:REP=1 %STOP=1 S DX=0,DY=6 D CLEBAS^%VVIDEO X XY
 Q
 
FUN 
 ;;        #Touches de fonction#
 ;; 
 ;;#CTRLA#               Fin
 ;;#CTRLD#               Deposer la ligne prise par CTRLP
 ;;#CTRLE#               Effacement a partir de la ligne juusqu'a la fin du texte
 ;;#CTRLF#               Fin
 ;;#CTRLG#               Suppression de la ligne
 ;;#CTRLH#               Help
 ;;#CTRLI#               modification du champ
 ;;#CTRLL#               Inserer une ligne
 ;;#CTRLP#               Prendre une ligne
 ;;#CTRLR#               Raffraichissement de la fenetre
 ;;#RETURN#              Fin de saisie de la ligne
 ;;              ----------------------------------
 ;;#fleche vers le haut# ligne precedente
 ;;#fleche vers le bas#  ligne suivante
 ;;
FUN1 
 ;;        #Touches de fonction#
 ;; 
 ;;#ESCP#                Fin
 ;;#CTRLD#               Deposer la ligne prise par CTRLP
 ;;#CTRLE#               Effacement a partir de la ligne juusqu'a la fin du texte
 ;;#CTRLF#               Fin
 ;;#CTRLG#               Suppression de la ligne
 ;;#CTRLH#               Help
 ;;#CTRLI#               modification du champ
 ;;#CTRLL#               Inserer une ligne
 ;;#CTRLP#               Prendre une ligne
 ;;#CTRLW#               Raffraichissement de la fenetre
 ;;#RETURN#              Fin de saisie de la ligne
 ;;              ----------------------------------
 ;;#fleche vers le haut# ligne precedente
 ;;#fleche vers le bas#  ligne suivante
 ;;
FUN2 
 ;;        #Touches de fonction#
 ;; 
 ;;#BREAK#               Fin
 ;;#CTRLD#               Deposer la ligne prise par CTRLP
 ;;#CTRLE#               Effacement a partir de la ligne juusqu'a la fin du texte
 ;;#CTRLF#               Fin
 ;;#CTRLG#               Suppression de la ligne
 ;;#CTRLH#               Help
 ;;#CTRLI#               modification du champ
 ;;#CTRLL#               Inserer une ligne
 ;;#CTRLP#               Prendre une ligne
 ;;#CTRLW#               Raffraichissement de la fenetre
 ;;#RETURN#              Fin de saisie de la ligne
 ;;              ----------------------------------
 ;;#fleche vers le haut# ligne precedente
 ;;#fleche vers le bas#  ligne suivante
 ;;

