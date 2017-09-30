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

;%QUAPAHM^INT^1^59547,73884^0
QUAPAHM ;
 
 
 
 
 N C,CH,DH,DV,I,XG,YH
 S XG=^Z($J,Z,"X"),YH=^Z($J,Z,"Y"),DV=^Z($J,Z,"H"),DH=^Z($J,Z,"L")
 S DX=XG+2,DY=YH+1,I=1 D CLEAR
BI G:DY=((YH+DV)-1) PAG S CH=$T(FUN+I) G:CH="" END
 G:CH'["CTRLA" AFF
 G:'(IBMPC) AFF
 I MODTM S CH=$TR(CH,"CTRLA","ESCP ")
 E  S CH=$TR(CH,"CTRLA","BREAK")
AFF X XY S $X=0 W $E($P(CH,";;",2),1,DH-4)
 S DY=DY+1,I=I+1 G BI
END D ^%VZEAVT("") Q
PAG D POCLEPA^%VVIDEO W $$L2^%QSLIB
 R *C D POCLEPA^%VVIDEO
 D TOUCHE^%INCCLAV(C,.C) Q:C=1
 D CLEAR S DY=YH+1,DX=XG+2 G BI
CLEAR N DX,DY S DX=XG+1
 F DY=YH+1:1:(YH+DV)-2 X XY W $J("",DH-2)
 Q
FUN 
 ;;CTRLA Fin
 ;;CTRLF Fin
 ;;CTRLB Modifier le pas de balayage des colonnes (1 par defaut)
 ;;?     acces a la gestion des attributs des objets listes
 ;;P     changement de page
 ;;R     affichage des objets de debut et de fin de chaque page
 ;;A     gestion des attributs affiches dans la fenetre
 ;;<     voir les attributs caches a gauche
 ;;>     voir les attributs caches a droite
 ;;+     avancer d'une page
 ;;-     reculer d'une page
 ;

