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

;%QULIMO7^INT^1^59547,73885^0
QULIMO7 ;
 
 
 
 
 N C,CH,I,STOP,A
 S DX=XG+2,DY=YH+1,STOP=0
 G:IBMPC AIDE1
 F I=1:1 S CH=$T(FUN+I),A=$P(CH,";;",2) Q:A=""  X XY W $$FORMAT^%QULIMO3(A,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
 G FIN
AIDE1 G:'(MODTM) AIDE2
 F I=1:1 S CH=$T(FUN1+I),A=$P(CH,";;",2) Q:A=""  X XY W $$FORMAT^%QULIMO3(A,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
 G FIN
AIDE2 F I=1:1 S CH=$T(FUN2+I),A=$P(CH,";;",2) Q:A=""  X XY W $$FORMAT^%QULIMO3(A,DH-4) S DY=DY+1 D:DY=((YH+DV)-1) PAG Q:STOP=1
 
FIN I STOP=0 D ^%VZEAVT("")
 Q
 
PAG 
 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY W $$L2^%QSLIB
 R *C D POCLEPA^%VVIDEO
 D TOUCHE^%INCCLAV(C,.C)
 I C=1 S STOP=1 Q
 D REAFF^%QULIMO3(P1,1,"LLLLXXXX",XG,YC-1,DH,(DV-(YC-YH))+1)
 S DY=YH+1,DX=XG+2 Q
FUN 
 ;;CTRLA   Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacer a partir du curseur jusqu'a la fin du texte
 ;;CTRLI   Modifier une ligne
 ;;CTRLJ   Imprimer toutes les lignes
 ;;CTRLG   Supprimer la ligne
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer les lignes prises par CTRLP ou CTRLG ou CTRLE
 ;;CTRLL   Inserer une ligne
 ;;CTRLR   Raffraichir la fenetre
 ;;CTRLH   Aide
 ;;RETURN  Fin de saisie de la ligne
 ;;       --------------------------------------
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;
FUN1 
 ;;ESCP    Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacer a partir du curseur jusqu'a la fin du texte
 ;;CTRLI   Modifier une ligne
 ;;CTRLJ   Imprimer toutes les lignes
 ;;CTRLG   Supprimer la ligne
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer les lignes prises par CTRLP ou CTRLG ou CTRLE
 ;;CTRLL   Inserer une ligne
 ;;CTRLW   Raffraichir la fenetre
 ;;CTRLH   Aide
 ;;RETURN  Fin de saisie de la ligne
 ;;       --------------------------------------
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;
FUN2 
 ;;BREAK   Fin
 ;;CTRLF   Fin
 ;;CTRLE   Effacer a partir du curseur jusqu'a la fin du texte
 ;;CTRLI   Modifier une ligne
 ;;CTRLJ   Imprimer toutes les lignes
 ;;CTRLG   Supprimer la ligne
 ;;CTRLP   Prendre une ligne
 ;;CTRLD   Deposer les lignes prises par CTRLP ou CTRLG ou CTRLE
 ;;CTRLL   Inserer une ligne
 ;;CTRLW   Raffraichir la fenetre
 ;;CTRLH   Aide
 ;;RETURN  Fin de saisie de la ligne
 ;;       --------------------------------------
 ;;fleche vers le haut  ligne precedente
 ;;fleche vers le bas   ligne suivante
 ;;

