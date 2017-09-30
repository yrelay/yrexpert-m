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

;TONRPGO1^INT^1^59547,74873^0
%ZGODRIV ;
 
 W !,"Globals-driver output "
 W !,?10,"1                   MN,SCRE,NAMEFUL,TOLISGLO,ENV*"
 W !,?10,"2        1+         ROUTINE"
 W !,?10,"3        2+         TD"
 W !,?10,"4        3+         TABIDENT"
 W !,!,?10,"Votre choix : " R OPT Q:(OPT<1)!(OPT>4)
 D OUT^%IS
 W !,!,!,"Description succincte : " R HEAD W !
 D ^%SETF,GSET I '(%G) C IO Q
 D 6^%GO Q
GSET S %JO=$J,%G=0 K ^UTILITY(%JO)
 S LOPT=OPT+1 F Z=1:1 S TAB=$T(1+Z) Q:TAB=""  S NOPT=$P(TAB,";;",1),LIG=$P(TAB,";;",2) Q:NOPT[LOPT  F W=1:1 S GLO=$P(LIG,",",W) Q:GLO=""  S ^UTILITY(%JO,GLO)=1,%G=%G+1
 Q
TABLETOT ;; TABLES TOTEM
1 
 ;;MN,SCRE,NAMEFUL,TOLISGLO,ENVIRON,ENVCONF,ENVPAP
2 
 ;;ROUTINE
3 
 ;;TD
4 
 ;;TABIDENT

