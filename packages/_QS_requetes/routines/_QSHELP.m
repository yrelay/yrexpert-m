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

;%QSHELP^INT^1^59547,73882^0
QSHELP ;
 
 
 
 
 N C,CH,I,R,SDX,SDY
 S DX=XG+2,DY=YH+1,I=1
 D CLEAR
 G:IBMPC BIPC
BI I DY=((YH+HA)-1) D PAG G:R=1 BI Q
 S CH=$T(FUN+I) G:CH["*" END
 X XY S $X=0 W $E($$^%QZCHW($P(CH,";;",2)),1,LA-4)
 S DY=DY+1,I=I+1 G BI
END 
 D ^%VZEAVT(""),CLEAR
 Q
 
PAG 
 D POCLEPA^%VVIDEO
 S R=$$MES^%VZEOUI($$^%QZCHW("Voulez vous continuer ? "),"O")
 D POCLEPA^%VVIDEO,CLEAR
 I R=1 S DY=YH+1,DX=XG+2
 Q
CLEAR 
 S SDX=DX,SDY=DY,DX=XG+1
 F DY=YH+1:1:(YH+HA)-2 X XY W $J("",LA-2)
 S DX=SDX,DY=SDY Q
 
FUN 
 ;;CTRLA Fin
 ;;
 ;;CTRLF Fin
 ;;
 ;;CTRLB 2 cas : . suivre un lien pour acceder aux attributs
 ;;                de l'individu designe par le lien
 ;;              . visualiser\modifier le contenu d'un attribut special
 ;;
 ;;CTRLV acceder aux attributs associes au lien sur lequel se trouve le
 ;;      curseur ( lien qualifie )
 ;;
 ;;CTRLN modifier la valeur d'un attribut special
 ;;
 ;;CTRL\ passage d'un mode a l'autre
 ;;      2 modes existent :
 ;;         - un mode ou l'on ne voit que les attributs de l'individu
 ;;         - un mode ou l'on voit tous les attributs des individus
 ;;           dans ce cas les attributs sans valeurs ont un (?)
 ;;      Dans le cas des dialogues, CTRL\ permet de changer d'indice
 ;;         ou de mode (un 3eme mode existe : mode ou l'on ne voit
 ;;         que les attributs du dialogue)
 ;;
 ;;CTRLJ imprimer
 ;;
 ;;CTRLH aide
 ;;
 ;;CTRLR reaffiche
 ;;
 ;;CTRLP acceder a une page donnee
 ;;
 ;;CTRLD changer de mode d'affichage (ordre selon les attributs ou
 ;;                                         selon les numeros d'ordre
 ;;
 ;;
 ;;      Colonne des attributs
 ;;
 ;;CTRLI interdit
 ;;CTRLG suppression de l'attribut et de sa valeur
 ;;CTRLL ajout d'un nouvel attribut
 ;;
 ;;
 ;;      Colonne des valeurs des attributs
 ;;
 ;;CTRLI modification de la valeur
 ;;CTRLG effacement de la valeur avant modification
 ;;RETURN recherche les attributs predefinis
 ;;
 ;;
 ;;fleche vers la droite  --> colonne de droite
 ;;fleche vers la gauche  --> colonne de gauche
 ;;fleche vers le haut    --> ligne precedente
 ;;fleche vers le bas     --> ligne suivante
 ;; + page suivante
 ;; - page precedente
 ;;
 
BIPC G:'(MODTM) BIPC2
 I DY=((YH+HA)-1) D PAG G:R=1 BIPC Q
 S CH=$T(FUN1+I) G:CH["*" END
 X XY S $X=0 W $E($$^%QZCHW($P(CH,";;",2)),1,LA-4)
 S DY=DY+1,I=I+1 G BIPC+1
FUN1 
 ;;ESCP  Fin
 ;;
 ;;CTRLF Fin
 ;;
 ;;CTRLB 2 cas : . suivre un lien pour acceder aux attributs
 ;;                de l'individu designe par le lien
 ;;              . visualiser\modifier le contenu d'un attribut special
 ;;
 ;;CTRLV acceder aux attributs associes au lien sur lequel se trouve le
 ;;      curseur ( lien qualifie )
 ;;
 ;;CTRLO modifier la valeur d'un attribut special
 ;;
 ;;CTRLT passage d'un mode a l'autre
 ;;      2 modes existent :
 ;;         - un mode ou l'on ne voit que les attributs de l'individu
 ;;         - un mode ou l'on voit tous les attributs des individus
 ;;           dans ce cas les attributs sans valeurs ont un (?)
 ;;      Dans le cas des dialogues, CTRLT permet de changer d'indice
 ;;         ou de mode (un 3eme mode existe : mode ou l'on ne voit
 ;;         que les attributs du dialogue)
 ;;
 ;;CTRLW reaffiche
 ;;
 ;;CTRLJ imprimer
 ;;
 ;;CTRLH aide
 ;;
 ;;CTRLP acceder a une page donnee
 ;;
 ;;CTRLD changer de mode d'affichage (ordre selon les attributs ou
 ;;                                         selon les numeros d'ordre
 ;;
 ;;
 ;;      Colonne des attributs
 ;;
 ;;CTRLI interdit
 ;;CTRLG suppression de l'attribut et de sa valeur
 ;;CTRLL ajout d'un nouvel attribut
 ;;
 ;;
 ;;      Colonne des valeurs des attributs
 ;;
 ;;CTRLI modification de la valeur
 ;;CTRLG effacement de la valeur avant modification
 ;;RETURN recherche les attributs predefinis
 ;;
 ;;
 ;;fleche vers la droite  --> colonne de droite
 ;;fleche vers la gauche  --> colonne de gauche
 ;;fleche vers le haut    --> ligne precedente
 ;;fleche vers le bas     --> ligne suivante
 ;; + page suivante
 ;; - page precedente
 ;;
 
BIPC2 I DY=((YH+HA)-1) D PAG G:R=1 BIPC2 Q
 S CH=$T(FUN2+I) G:CH["*" END
 X XY S $X=0 W $E($$^%QZCHW($P(CH,";;",2)),1,LA-4)
 S DY=DY+1,I=I+1 G BIPC2
FUN2 
 ;;BREAK Fin
 ;;
 ;;CTRLF Fin
 ;;
 ;;CTRLB 2 cas : . suivre un lien pour acceder aux attributs
 ;;                de l'individu designe par le lien
 ;;              . visualiser\modifier le contenu d'un attribut special
 ;;
 ;;CTRLV acceder aux attributs associes au lien sur lequel se trouve le
 ;;      curseur ( lien qualifie )
 ;;
 ;;CTRLO modifier la valeur d'un attribut special
 ;;
 ;;CTRLT passage d'un mode a l'autre
 ;;      2 modes existent :
 ;;         - un mode ou l'on ne voit que les attributs de l'individu
 ;;         - un mode ou l'on voit tous les attributs des individus
 ;;           dans ce cas les attributs sans valeurs ont un (?)
 ;;      Dans le cas des dialogues, CTRLT permet de changer d'indice
 ;;         ou de mode (un 3eme mode existe : mode ou l'on ne voit
 ;;         que les attributs du dialogue)
 ;;
 ;;CTRLW reaffiche
 ;;
 ;;CTRLJ imprimer
 ;;
 ;;CTRLH aide
 ;;
 ;;CTRLP acceder a une page donnee
 ;;
 ;;CTRLD changer de mode d'affichage (ordre selon les attributs ou
 ;;                                         selon les numeros d'ordre
 ;;
 ;;
 ;;      Colonne des attributs
 ;;
 ;;CTRLI interdit
 ;;CTRLG suppression de l'attribut et de sa valeur
 ;;CTRLL ajout d'un nouvel attribut
 ;;
 ;;
 ;;      Colonne des valeurs des attributs
 ;;
 ;;CTRLI modification de la valeur
 ;;CTRLG effacement de la valeur avant modification
 ;;RETURN recherche les attributs predefinis
 ;;
 ;;
 ;;fleche vers la droite  --> colonne de droite
 ;;fleche vers la gauche  --> colonne de gauche
 ;;fleche vers le haut    --> ligne precedente
 ;;fleche vers le bas     --> ligne suivante
 ;; + page suivante
 ;; - page precedente
 ;;
 ;

