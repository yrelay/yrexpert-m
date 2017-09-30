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

;TOERTRIP^INT^1^59547,74872^0
TOERTRIP ;
 
 S:'($D(LLB)) LLB=0
 S MSG="" F TRIP=$$^%QZCHW("ALLIAGE"),$$^%QZCHW("ETAT"),$$^%QZCHW("NORME") G:'($D(^[QUI]TVPAR(NUFA,TWREF,TRIP))) FIN S @TRIP=^[QUI]TVPAR(NUFA,TWREF,TRIP),MSG=MSG_","_TRIP_"="""_@TRIP_""""
 I $D(^[QUI]VALITOLE(YA,ALLIAGE,ETAT,NORME)) W:LLB=0 !,!,?10,$$^%QZCHW("le triplet : ") D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W:LLB=0 MSG D NORM^%VVIDEO W:LLB=0 $$^%QZCHW(" est valide ") G FIN
 S MSG=$E(MSG,2,299) W:LLB=0 !,!,?10,$$^%QZCHW("le triplet : ") D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO W:LLB=0 MSG D NORM^%VVIDEO
 W:LLB=0 !,?10 W:LLB=0 $$^%QZCHW("est inconnu donc suppose ") D REV^%VVIDEO,BLK^%VVIDEO,BLD^%VVIDEO W:LLB=0 $$^%QZCHW("non-valide") D NORM^%VVIDEO
FIN Q

