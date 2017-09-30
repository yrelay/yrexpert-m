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

;%QULYSTH^INT^1^59547,73886^0
ZLISTELP ;
 
 
 
 
 N C,CH,I,STOP,L
 S DX=XG+2,DY=YH+1,STOP=0
 G:DTM DTM
 F I=1:1 S CH=$T(FUN+I),L=$P(CH,";;",2) Q:L=""  X XY W $E(L,1,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
 G FIN
DTM G:MODTM MODTM
 F I=1:1 S CH=$T(FUN1+I),L=$P(CH,";;",2) Q:L=""  X XY W $E(L,1,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
 G FIN
MODTM F I=1:1 S CH=$T(FUN2+I),L=$P(CH,";;",2) Q:L=""  X XY W $E(L,1,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
FIN I STOP=0 D ^%VZEAVT("")
 Q
PAG 
 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY W $$L2^%QSLIB
 R *C D TOUCHE^%INCCLAV(C,.C),POCLEPA^%VVIDEO
 I C=1 S STOP=1 Q
 D REAF^%QULYSTE(P1,"ZZZZ") S DY=YH+1,DX=XG+2 Q
FUN 
 ;;CTRLA   Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacement a partir du curseur
 ;;CTRLI   --> Mode modification du champ
 ;;CTRLJ   impression de toutes les lignes
 ;;CTRLG   Suppression de la ligne
 ;;CTRLR   Raffraichissement de la fenetre
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer la ligne prise par CTRLP
 ;;CTRLL   Inserer une ligne
 ;;CTRLH   Help
 ;;RETURN  Fin de saisie de la ligne
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;
FUN1 
 ;;BREAK   Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacement a partir du curseur
 ;;CTRLI   --> Mode modification du champ
 ;;CTRLJ   impression de toutes les lignes
 ;;CTRLG   Suppression de la ligne
 ;;CTRLW   Raffraichissement de la fenetre
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer la ligne prise par CTRLP
 ;;CTRLL   Inserer une ligne
 ;;CTRLH   Help
 ;;RETURN  Fin de saisie de la ligne
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;
FUN2 
 ;;ESCP    Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacement a partir du curseur
 ;;CTRLI   --> Mode modification du champ
 ;;CTRLJ   impression de toutes les lignes
 ;;CTRLG   Suppression de la ligne
 ;;CTRLW   Raffraichissement de la fenetre
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer la ligne prise par CTRLP
 ;;CTRLL   Inserer une ligne
 ;;CTRLH   Help
 ;;RETURN  Fin de saisie de la ligne
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;

