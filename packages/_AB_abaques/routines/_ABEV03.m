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

;%ABEV03^INT^1^59547,73864^0
%ABEV03 ;
 K OK,PNUM S %NBZ=0,NPO=0,PARA=-1,REF="",TBI="^[QUW]TOCPBORN(NUGR,PARA,""I"")",TBS="^[QUW]TOCPBORN(NUGR,PARA,""S"")"
LP S NPO=NPO+1,PARA=$N(^GRIL($I,0,PARA)) G:PARA=-1 FP S VP=^GRIL($I,0,PARA),VP=$S($D(^[QUW]TOCPVPAR(NUGR,PARA,VP)):VP,1:"z"),%NBZ=%NBZ+(VP="z"),PNUM(NPO,VP)=1,REF=REF_","""_VP_"""" S:VP'="z" PNUM(NPO,"z")=1 G LP
FP S NPO=NPO-1
LN S NPO=NPO+1,PARA=$N(^GRIL($I,1,PARA)) G:PARA=-1 FN S VP=^GRIL($I,1,PARA)
 I VP="z" S VP(1)=VP G XX
 S VP(1)=$S($D(@TBI@(VP)):VP,1:$ZP(@TBI@(VP))) I VP(1)="" S VP(1)="z" G XX
 
 S VP(2)=$O(@TBS@(VP(1))) I VP(2)="" S VP(1)="z" G AFF
 I VP>VP(2) S VP(1)="z"
XX S %NBZ=%NBZ+(VP(1)="z"),PNUM(NPO,VP(1))=1 S:VP(1)'="z" PNUM(NPO,"z")=1 S REF=REF_","""_VP(1)_"""" G LN
FN S TBR="^[QUW]TOCPNUPL(NUGR"_REF_")",OK=$D(@TBR) I OK=1 S OK(1)=@TBR G FIN
 D ^%ABEV04 S OK=$D(^REFOK($J)) G FIN:'(OK) S VP=$O(^REFOK($J,"")),OK(1)=^REFOK($J,VP,1)
FIN K PNUM,VP,TBI,TBS,PARA Q

