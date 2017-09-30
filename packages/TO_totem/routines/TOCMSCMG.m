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

;TOCMSCMG^INT^1^59547,74871^0
TOCMSCMG ;
 
LOOP1 S DX=1,DY=23 X XY W $$^%QZCHW("         (M)odifier, (S)upprimer   -   Fin = CTRL F ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:(X1=6)!(X1=18),FIN:X1<2
 S:X1>91 X1=X1-32 S ISN=$S(X1=77:"M",X1=83:"S",1:"REFUS"),DX=1,DY=23 D CLEBAS^%VVIDEO G @ISN
M S ABENDSCR=0,DX=0,DY=^%SCRE(SCR,1,3),SCR1=SCR_",COMMENT",DY1=23 S:$D(^%SCRE(SCR1,1,1)) DY1=^%SCRE(SCR1,1,3) S:DY1<DY DY=DY1
 D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,^%VAFISCR,^%VKMODIS G LOOP1:ABENDSCR=1 D RES S @NOMTAB@(NUFA,YB,NUC,NUAP,DELAI)=RS G LOOP1
S D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1 D TOUCHE^%INCCLAV(X1,.X1) G LOOP1:X1'=83
 K @NOMTAB@(NUFA,YB,NUC,NUAP,DELAI) D CLEPAG^%VVIDEO G LOOP1
REFUS D ^%VSQUEAK G LOOP1
FIN U 0 Q
RES S RS="" F IC=1:1:^%SCRE(SCR) S RS=RS_RESUL(IC)_"^"
 S @NOMTAB@(NUFA,YB,NUC,NUAP,DELAI)=RS Q

