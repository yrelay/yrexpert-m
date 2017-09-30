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

;%VKLONS^INT^1^59547,74035^0
LONSTO ;
 
 
 Q:('($D(NOMTAB)))!('($D(SCR)))
 S IN="",RS=""
BEG F IC=1:1 Q:'($D(RESUL(IC)))  S ISN="IND" D @ISN:$D(^%SCRE(SCR,IC))=11 Q:ABENDSCR=1
 S NOM=NOMTAB_"("_IN_")" G REFUL:$L(NOM)>250,REFINS:IN=""
 F IC=1:1 Q:'($D(RESUL(IC)))  S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC)),ISN="RES" D @ISN:$D(^%SCRE(SCR,IC))'=11 Q:ABENDSCR=1
 Q
RES S RS=RS_IC_"^"_RESUL(IC)_"^" G RES1:IC=^%SCRE(SCR) Q:$L(RS)<100
RES1 S @NOM@(INL)=RS,RS="",INL=INL+1
 Q
IND I RESUL(IC)="" D REFUS Q
 S IN=IN_$S(IN="":""""_RESUL(IC)_"""",1:","_""""_RESUL(IC)_"""")
 Q
REFINS D ^%VSQUEAK,POCLEPA^%VVIDEO W "Informations insuffisantes " H 2 D POCLEPA^%VVIDEO Q
REFUL D ^%VSQUEAK,POCLEPA^%VVIDEO W "Informations trop abondantes : veuillez abreger les champs " H 2
 S DY=24 X XY F ICC=1:1:^%SCRE(SCR) I $D(^%SCRE(SCR,ICC))=11 W "/",^%SCRE(SCR,ICC,1)
 H 2 D ^%VAFIGRI,^%VAFISCR S IC=1,ABENDSCR=0 D ^%VKMODIS G LONSTO:ABENDSCR=0 Q
REFUS D POCLEPA^%VVIDEO W "Il faut obligatoirement une information dans  ",^%SCRE(SCR,IC,1) H 2 D ^%VAFIGRI,^%VAFISCR S ABENDSCR=0 D LOOP^%VKMODIS G LONSTO:ABENDSCR=0 Q

