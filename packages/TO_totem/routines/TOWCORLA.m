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

;TOWCORLA^INT^1^59547,74876^0
TOWCORLA ;
 
LOOP K ^PRESCR($I,SCR),VALCLE S (%PCOUR,%NBPVU)=1,IFLAG=0,ADR="LOOP1^TOWCORLA",VALCLE(1)=LIEN
 S VALCLE(2)=RESUL(1)
 D ^%VKMULG G FIN:STOP=1,CHAN2
LOOP1 D GNOMC S ^PRESCR($I,SCR,%NBPVU)=NOMC,%PCOUR=%NBPVU,RESUL(1)=B2 F UU=2:1 Q:'($D(%RS(UU-1)))  S RESUL(UU)=%RS(UU-1)
 K RS,%RS S DX=0,DY=10 D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,^%VAFISCR S DY=11,DX=68 X XY W "          " X XY W $$^%QZCHW("Page : "),%NBPVU S %NBPVU=%NBPVU+1
LOOP11 D POCLEPA^%VVIDEO W $$^%QZCHW("(C)ons.,(M)od.,(S)up.,(A)jout.,(+),(-),page,CTRLF:Fin ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:X1=6,FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=43:"PLUS",X1=61:"PLUS",X1=45:"MOINS",X1=77:"M",X1=83:"S",X1=67:"C",X1=65:"A",1:"REFUS") D:ISN'="REFUS" POCLEPA^%VVIDEO G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
CHAN2 S PADMESSA=$$L16^%QSLIB1 D PAD^%VZEATT G LOOP2
M D ACCOR G:'(ACCOR) LOOP11 S ABENDSCR=0 D ^%VKMODIS G LOOP1:ABENDSCR=1
 K @(OLDNOM),@(OLDFULL) D ^TO31STOC S ^PRESCR($I,SCR,%PCOUR)=NOMTAB_"("_$P(NOM,"(",1,599) D NEWOLD G LOOP11
S D ACCOR G:'(ACCOR) LOOP11 D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1 G LOOP11:X1'=83
 K @(OLDNOM),@(OLDFULL),^PRESCR($I,SCR,%PCOUR) S DX=0,DY=10 D CLEBAS^%VVIDEO G LOOP11
C D POCLEPA^%VVIDEO S PADMESSA=$$^%QZCHW("...RECHERCHE EN COURS...") X XY D PAD^%VZEATT Q
REFUS G:X1<27 REFUSE S YG=$C(X1),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC I CTRLA!(CTRLF!(Y1="")) G REFUSE
 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) REFUSE G:'($D(^PRESCR($I,SCR,%PCH))) LOOP11 S %PCOUR=%PCH D ^TOWGBAP G LOOP11
REFUSE D ^%VSQUEAK G LOOP11
FIN S STOP=1 U 0 Q
A D ACCOR G:'(ACCOR) LOOP11 D ^%VKSAV S CMS=0 D @NOMAJ,REST^%VKSAV G LOOP11
VERIF S ABENDSCR=0 I RESUL(1)'=$$^%QZCHW("TOUS") S:RESUL(1)'=WHOIS ABENDSCR=1
ACCOR S ACCOR=1 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
END Q
NEWOLD 
 S OLDFULL=NOM,OLDNOM=NOMTAB_"("_$P(NOM,"(",2,499) Q
PLUS S %PCOUR=%PCOUR+1 I '($D(^PRESCR($I,SCR,%PCOUR))) S:%PCOUR>%NBPVU %PCOUR=%NBPVU G LOOP11
 D ^TOWGBAP G LOOP11
MOINS S %PCOUR=%PCOUR-1 I '($D(^PRESCR($I,SCR,%PCOUR))) S:%PCOUR<1 %PCOUR=1 G LOOP11
 D ^TOWGBAP G LOOP11
 
GNOMC S NOMC=NOMTAB_"("""_LIEN_"""" F %UU=2:1:NBCLE S NOMC=NOMC_","""_@("B"_%UU)_""""
 S NOMC=NOMC_")" Q

