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

;TO31COR^INT^1^59547,74869^0
TO31COR ;
 
 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0
 I ^TOZE($I,"FULL")=1 D ^%VTNAMFU S NOMTAB=$S(%NFU="":NOMTAB,1:%NFU)
LOOP K VALCLE S IFLAG=0,ADR="LOOP1^TO31COR",VALCLE(1)=LIEN
 F UU=1:1:2 S VALCLE(UU+1)=RESUL(UU)
 D ^%VKMULG G FIN:STOP=1,CHAN2
LOOP1 S RESUL(1)=B2,RESUL(3)=B3,RESUL(2)=%RS(1) F UU=2:1 Q:'($D(%RS(UU)))  S RESUL(UU+2)=%RS(UU)
 S DX=0,DY=10 D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,^%VAFISCR
LOOP11 D POCLEPA^%VVIDEO W $$^%QZCHW("(C)onsulter, (M)odifier, (S)upprimer, (A)jouter, (D)upliquer ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1)
 G FIN:X1=6,FIN:X1<2 S:X1>91 X1=X1-32 S ISN=$S(X1=77:$$^%QZCHW("M"),X1=83:"S",X1=67:$$^%QZCHW("C"),X1=65:"A",X1=68:$$^%QZCHW("D"),1:"REFUS")
 S PADMESSA="                                                                                " D PAD^%VZEATT G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
CHAN2 S PADMESSA=$$L16^%QSLIB1 D PAD^%VZEATT G LOOP2
D D ACCOR G:'(ACCOR) LOOP11 S ABENDSCR=0 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("N'oubliez pas de changer les champs cles") H 2 S DX=0,DY=10 D CONSEL,CLEBAS^%VVIDEO,^%VAFIGRI,^%VAFISCR,^%VKMODIS,RESTEL G LOOP1:ABENDSCR=1 D ^TO31STOC,NEWOLD G LOOP1
M D ACCOR G:'(ACCOR) LOOP11 S ABENDSCR=0 D ^%VKMODIS G LOOP1:ABENDSCR=1 K @(OLDNOM),@(OLDFULL) D ^TO31STOC,NEWOLD G LOOP11
S D ACCOR G:'(ACCOR) LOOP11 D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1
 D TOUCHE^%INCCLAV(X1,.X1) G LOOP11:X1'=83
 K @(OLDNOM),@(OLDFULL) S DX=0,DY=10 D CLEBAS^%VVIDEO G LOOP11
C D POCLEPA^%VVIDEO S PADMESSA=$$^%QZCHW("...RECHERCHE EN COURS...") X XY D PAD^%VZEATT Q
REFUS D ^%VSQUEAK G LOOP11
FIN S STOP=1 U 0 Q
A D ACCOR G:'(ACCOR) LOOP11 S CMS=0 D CONSEL,@NOMAJ,RESTEL G LOOP11
VERIF S ABENDSCR=0 I RESUL(1)'=$$^%QZCHW("TOUS") S:RESUL(1)'=WHOIS ABENDSCR=1
ACCOR S ACCOR=1 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
END Q
NEWOLD 
 S OLDFULL=NOM,OLDNOM=NOMTAB_"("_$P(NOM,"(",2,499) Q
CONSEL F RTT=1:1 Q:'($D(@($$^%QZCHW("L")_RTT)))  S TR=@($$^%QZCHW("L")_RTT),@("%z"_RTT_$$^%QZCHW("L"))=TR
 K RTT,TR Q
RESTEL F RTT=1:1 Q:'($D(@("%z"_RTT_$$^%QZCHW("L"))))  S TR=@("%z"_RTT_$$^%QZCHW("L")),@($$^%QZCHW("L")_RTT)=TR K @("%z"_RTT_$$^%QZCHW("L"))
 K RTT,TR Q

