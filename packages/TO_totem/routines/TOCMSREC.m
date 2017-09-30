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

;TOCMSREC^INT^1^59547,74871^0
TOCMSREC ;
 S %AJCMS="Cons/Mod/Sup"
LOOP S IFLAG=0 D @ROUTI G CHAN:IFLAG'=0 D ^%VAFIGRI,BLD^%VVIDEO,^%VAFISCR,NORM^%VVIDEO
LOOP1 D POCLEPA^%VVIDEO W $$L22^%QSLIB2
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:(X1=6)!(X1=13),FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=83:$$^%QZCHW("S"),X1=67:$$^%QZCHW("C"),X1=77:$$^%QZCHW("M"),1:"REFUS") D POCLEPA^%VVIDEO G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
 S PADMESSA=$$^%QZCHW("  non (re)trouve : verifiez son existence ") D PAD^%VZEATT S X1=1 G FIN
C D CLEPAG^%VVIDEO S PADMESSA=$$^%QZCHW("Recherche en cours...") D PAD^%VZEATT G CHAN
REFUS D ^%VSQUEAK G LOOP1
FIN U 0 Q
M S OLDNOM=NOM,ABENDSCR=0 D ^%VKMODIS G LOOP1:ABENDSCR=1 K @(OLDNOM) D ^%VKAUST G LOOP1
S D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1 D TOUCHE^%INCCLAV(X1,.X1)
 G LOOP1:X1'=83 K @(NOM) D CLEPAG^%VVIDEO G LOOP1

