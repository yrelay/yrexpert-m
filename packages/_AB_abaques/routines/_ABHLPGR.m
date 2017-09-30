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

;%ABHLPGR^INT^1^59547,73864^0
%ABHLPGR ;
 
 S WDX=DX,WDY=DY,WX=$X,WY=$Y D CLEPAG^%VVIDEO
 S DXG=0,DXD=30,DYH=0,DYB=4,TIT=$$^%QZCHW("DIVERSES FONCTIONS")
 D TO3^%VZCD
 S %STOP=0,DX=15,DY=5,%FIN=0,DX=$X-1 X XY W " ",!
 G:DTM DTM1
 F I=1:1 S A=$T(FUN+I),CHOI=$P(A,";;",2) Q:CHOI=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
 G DTM3
DTM1 G:'(MODTM) DTM2
 F I=1:1 S A=$T(FUN1+I),CHOI=$P(A,";;",2) Q:CHOI=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
 G DTM3
DTM2 F I=1:1 S A=$T(FUN2+I),CHOI=$P(A,";;",2) Q:CHOI=""  D:(I#17)=0 ALORS Q:%STOP=1  S POS=$S(I'<10:5,1:6) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
DTM3 I %STOP'=1 S %FIN=1 D ALORS
 
 D CLEPAG^%VVIDEO S DE=5,FI=18 D ^%ABNETTO,^%ABAFGRI,^%ABEMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^%ABGRPAG S DX=WDX,DY=WDY X XY G FIN
ALORS D POCLEPA^%VVIDEO
 I %FIN=0 W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP) S:REP=1 %STOP=1 S DX=0,DY=6 D CLEBAS^%VVIDEO G FIN
 W $$^%QZCHW("Fin de liste. [RETURN] pour retour a la grille") R *RET
FIN Q
FUN ;;
 ;;#CTRLA#    Abandon
 ;;#CTRLI#    Impression de l'image-ecran
 ;;#CTRLJ#    Acces a l'ensemble des abaques
 ;;#CTRLF#    Champ suivant
 ;;#CTRLP#    Prendre des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;                   jusqu'a la colonne sur laquelle vous referez #CTRLP#
 ;;#CTRLD#    Deposer des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : sur la colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;#CTRLG#    Gomme : effacement du champ courant
 ;;#CTRLL#    Tourner les pages
 ;;#CTRLE#    En dessus <--> En dessous
 ;;#CTRLB#    Balayage des fenetres
 ;;#CTRLU#    visualisation des Unites
 ;;#CTRLZ#    Saisie de valeurs <--> Saisie de commentaires
 ;;#CTRLV#    Visualisation des premisses et resultantes
 ;;#RETURN#   Fin de saisie du champ
 ;;#"#        Duplication du champ precedent sur une meme ligne
 ;;#?#        Valeurs par default,legales
 ;;
FUN1 ;;
 ;;#ESCP#     Abandon
 ;;#CTRLI#    Impression de l'image-ecran
 ;;#CTRLJ#    Acces a l'ensemble des abaques
 ;;#CTRLF#    Champ suivant
 ;;#CTRLP#    Prendre des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;                   jusqu'a la colonne sur laquelle vous referez #CTRLP#
 ;;#CTRLD#    Deposer des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : sur la colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;#CTRLG#    Gomme : effacement du champ courant
 ;;#CTRLL#    Tourner les pages
 ;;#CTRLE#    En dessus <--> En dessous
 ;;#CTRLB#    Balayage des fenetres
 ;;#CTRLU#    visualisation des Unites
 ;;#CTRLZ#    Saisie de valeurs <--> Saisie de commentaires
 ;;#CTRLV#    Visualisation des premisses et resultantes
 ;;#RETURN#   Fin de saisie du champ
 ;;#"#        Duplication du champ precedent sur une meme ligne
 ;;#?#        Valeurs par default,legales
 ;;
FUN2 ;;
 ;;#BREAK#    Abandon
 ;;#CTRLI#    Impression de l'image-ecran
 ;;#CTRLJ#    Acces a l'ensemble des abaques
 ;;#CTRLF#    Champ suivant
 ;;#CTRLP#    Prendre des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;                   jusqu'a la colonne sur laquelle vous referez #CTRLP#
 ;;#CTRLD#    Deposer des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : sur la colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;#CTRLG#    Gomme : effacement du champ courant
 ;;#CTRLL#    Tourner les pages
 ;;#CTRLE#    En dessus <--> En dessous
 ;;#CTRLB#    Balayage des fenetres
 ;;#CTRLU#    visualisation des Unites
 ;;#CTRLZ#    Saisie de valeurs <--> Saisie de commentaires
 ;;#CTRLV#    Visualisation des premisses et resultantes
 ;;#RETURN#   Fin de saisie du champ
 ;;#"#        Duplication du champ precedent sur une meme ligne
 ;;#?#        Valeurs par default,legales
 ;;

