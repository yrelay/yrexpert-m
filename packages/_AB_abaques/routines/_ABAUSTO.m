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

;%ABAUSTO^INT^1^59547,73864^0
%ABAUSTO ;
 
 Q:('($D(NOMTAB)))!('($D(SCR)))
 S %KN=0,INL=1,LLS=0 F I=1:1:^[QU]SCRC(SCR) S LLS=LLS+$L(RESUL(I))
 I LLS>450 D POCLEPA^%VVIDEO W $$^%QZCHW(" vos donnees sont un peu abondantes... un instant svp") G LONG
 S IN="",RS=""
 F IC=1:1 Q:'($D(RESUL(IC)))  S ISN=$S($D(^[QU]SCRC(SCR,IC))=11:"IND",1:"RES") D @ISN Q:ABENDSCR=1
 S NOM=NOMTAB_"("_IN_")" G LONG:$L(NOM)>122,REFINS:IN=""
 S %EXIS=0 I $D(@NOM) S %EXIS=1 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Creation refusee ! Cette grille existe deja ...[RETURN] ") R *RET S ABENDSCR=1 Q
 S @NOM=RS
 Q
RES S RS=RS_RESUL(IC)_"^" Q
IND I RESUL(IC)="" D REFUS Q
 S IN=IN_$S(IN="":""""_RESUL(IC)_"""",1:","_""""_RESUL(IC)_"""")
 Q
REFINS D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Informations insuffisantes ") H 2 S PADMESSA="                            " D PAD^%VZEATT Q
REFUL D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Informations trop abondantes : veuillez abreger les champs ") H 2
 S DY=24 X XY F ICC=1:1:^[QU]SCRC(SCR) I $D(^[QU]SCRC(SCR,ICC))=11 W "/",^[QU]SCRC(SCR,ICC,1)
 H 2 D ^%VAFIGRI,^%VAFISCR S IC=1,ABENDSCR=0 D ^%VKMODIS G AUTOSTO:ABENDSCR=0 Q
REFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Il faut obligatoirement une information dans  "),^[QU]SCRC(SCR,IC,1) H 2 D ^%ABAFIGR,^%ABAFSCR S ABENDSCR=0 D LOOP^%ABMODIG G %ABAUSTO:ABENDSCR=0 Q
LONG D ^%ABLONST Q

