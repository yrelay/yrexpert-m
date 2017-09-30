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

;TOWCOR^INT^1^59547,74876^0
TOWCOR ;
 
LOOP K VALCLE S IFLAG=0,ADR="LOOP1^TOWCOR",VALCLE(1)=NOMG
 S VALCLE(2)=RESUL(1),VALCLE(3)=RESUL(2),VALCLE(4)=RESUL(3)
 D ^%VKMULG G FIN:STOP=1,CHAN2
LOOP1 S (%ALL,RESUL(1))=B2,(%ETAT,RESUL(2))=B3,(%LARG,RESUL(3))=B4 F UU=1:1 Q:'($D(%RS(UU)))  S RESUL(UU+3)=%RS(UU)
 D CLEPAG^%VVIDEO,LOOP^%ABAFIGR,^%ABAFSCR
LOOP11 D POCLEPA^%VVIDEO W $$^%QZCHW("(C)onsulter, (M)odifier, (S)uppression, (CTRLF) Pour accord ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:X1=6,FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=77:"M",X1=67:"C",X1=83:"S",1:"REFUS"),PADMESSA="                                                                                " D PAD^%VZEATT G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
CHAN2 S PADMESSA=$$L16^%QSLIB1 D PAD^%VZEATT S ABENDSCR=1 G FIN
D S ABENDSCR=0 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("N'oubliez pas de changer les champs cles") H 2 S DX=0,DY=13 D CLEBAS^%VVIDEO,^%VAFIGRI,^%VAFISCR,^%VKMODIS G LOOP1:ABENDSCR=1 D ^TOWAUTST G LOOP1
M S ABENDSCR=0 D ^%ABMODIS G LOOP1:ABENDSCR=1
 K @(OLDNOM) D ^TOWAUTST G LOOP11
S D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1 G LOOP11:X1'=83
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant, supression en cours...") D ^TOWDELGR,CLEPAG^%VVIDEO G LOOP11
C D POCLEPA^%VVIDEO S PADMESSA=$$^%QZCHW("...RECHERCHE EN COURS...") X XY D PAD^%VZEATT Q
REFUS D ^%VSQUEAK G LOOP11
FIN S:X1<2 ABENDSCR=1 S STOP=1 U 0 Q
A S CMS=0 D @NOMAJ G LOOP11
VERIF S ABENDSCR=0 I RESUL(1)'=$$^%QZCHW("TOUS") S:RESUL(1)'=WHOIS ABENDSCR=1
OCGRI W *
 W *

