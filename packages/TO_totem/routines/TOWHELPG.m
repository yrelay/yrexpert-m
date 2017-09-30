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

;TOWHELPG^INT^1^59547,74876^0
%ABHLPGR ;
 
 S WDX=DX,WDY=DY,WX=$X,WY=$Y D CLEPAG^%VVIDEO
 
 S DXG=0,DXD=30,DYH=0,DYB=4,TIT=$$^%QZCHW("DIVERSES FONCTIONS") D ^%AB3CADR
 
 S DX=15,DY=5,DX=$X-1 X XY W " ",! F I=1:1 S A=$T(FUN+I) Q:A=""  S POS=$S(I'<10:5,1:6),CHOI=$P(A,";;",2) F TP=1:1:3 D:TP=2 BLD^%VVIDEO W $P(CHOI,"#",TP) D:TP=2 NORM^%VVIDEO W:TP=3 !
 K RESUL S PI=-1 F %U=1:1 S PI=$N(^RESCRE($I,PI)) Q:PI=-1  S RESUL(PI)=^RESCRE($I,PI)
 D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer ") R *REP D CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=WDX,DY=WDY X XY
 K DXD,DXG,DYH,DYB,CHOI,PI,%U,WDX,WDY Q
FUN ;;
 ;;#CTRLA#    Abandon
 ;;#CTRLI#    Impression de l'image-ecran et de l'interpretation du schema
 ;;#CTRLF#    Page suivante
 ;;#CTRLR#    Retour a la page precedente
 ;;#CTRLB#    Begining ! Curseur en debut de schema
 ;;#CTRLE#    End ! Curseur en fin de schema
 ;;#CTRLP#    Prendre des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;                   jusqu'a la colonne sur laquelle vous referez #CTRLP#
 ;;#CTRLD#    Deposer des valeurs de colonnes pour dupliquer
 ;;              + #CTRLU# Une seule colonne : sur la colonne courante
 ;;           ou + #CTRLP# Plusieurs colonnes : depuis la colonne courante
 ;;#CTRLG#    Gomme: effacement de la position courante a l'extreme droite
 ;;#CTRLZ#    Tourner les pages
 ;;#RETURN#   Fin de saisie du schema ---> visualisation de la gamme

