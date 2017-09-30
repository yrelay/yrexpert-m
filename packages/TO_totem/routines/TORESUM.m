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

;TORESUM^INT^1^59547,74875^0
TORESUM ;
 
 S YA=-1 F HH=1:1 S YA=$N(^[QUI]TVPAR(NUFA,YA)) Q:YA=-1  D:DEV="ECR" CLEPAG^%VVIDEO W !,!,?20,"Parametres de : ",!,!,?10,^[QUI]TIDENTO(NUFA,YA),!,!,!,! D EDIT W:DEV="IMPR" # I DEV="ECR" H:DEV="IMPR" 5 S DX=1,DY=24 X XY W "entrer RETURN pour continuer." R FR
 Q
EDIT S NEXT=-1,NG=$Y F I=1:1 S NEXT=$N(^[QUI]TVPAR(NUFA,YA,NEXT)) Q:NEXT=-1  W !,?5,NEXT,?40," = " S VL=^[QUI]TVPAR(NUFA,YA,NEXT) W VL S U="^[QUI]UNIT($P(^[QUI]TBNOM(NUFA,YA),""^"",1),NEXT)" D UNITES S NG=NG+1 I NG=20 D:$E(REP,1)="E" SUIEDI
 Q
SUIEDI D POCLEPA^%VVIDEO W "Frapper RETURN pour visualiser la suite des parametres" R FR G:FR["?" EDIT D CLEPAG^%VVIDEO W "Suite des parametres de ",^[QUI]TIDENTO(NUFA,YA),!,! S NG=$Y Q
UNITES Q:'($D(^[QUI]TBNOM(NUFA)))  W:$D(@U) ?60,U Q

