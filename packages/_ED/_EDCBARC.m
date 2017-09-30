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

;%EDCBARC^INT^1^59547,73868^0
EDCBARC(CH,TYP,TEXTE,ECHEL,EPAIS,%9X,%9Y) ;;11:10 AM  10 May 1996
 
 
 
 
 
 Q:CH=""
 Q:TYP=""
 I TEXTE="" S TEXTE=1
 I ECHEL="" S ECHEL=0
 
 ; Modification FLB pour CODE.BARRE rel2 (tient compte de l'epaisseur 
 ; des barres
 
 I EPAIS="" S EPAIS=1
 
 S COEF=0.0034
 
 S B1=6*COEF*EPAIS	
 S B2=12*COEF*EPAIS
 S B3=18*COEF*EPAIS
 S B4=24*COEF*EPAIS
 
 S E1=6*COEF*EPAIS
 S E2=12*COEF*EPAIS
 S E3=18*COEF*EPAIS
 S E4=24*COEF*EPAIS
 
 	; Fin des modifications de FLB
  
lb1 S TEXTE=$S(TEXTE:"Y",1:"N")
lb2 S CH=""""_CH_""""
 I (%9X'="")&(%9Y'="") S ^V($J,"%","%X",1)=%9X,^V($J,"%","%Y",1)=%9Y
 D COOR^%EDCENVL
 N %FONC
 S %FONC="MOUV" D ^%PBPZ
 S %FONC="CODE.BARRE" D ^%PBPZ
 Q

