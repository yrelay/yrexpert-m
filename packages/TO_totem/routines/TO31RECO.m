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

;TO31RECO^INT^1^59547,74869^0
TO31RECO ;
 
LOOP S IFLAG=0 D @ROUTI G CHAN:IFLAG'=0 D ^%VAFIGRI,^%VAFISCR S LIEN=$S(SCR="VALITOLE":RS,1:RESUL(1))
LOOP1 D POCLEPA^%VVIDEO W $$L22^%QSLIB2
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1)
 G FIN:X1=6,IMP:X1=13,FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=83:"S",X1=67:$$^%QZCHW("C"),X1=77:$$^%QZCHW("M"),X1=68:$$^%QZCHW("D"),1:"REFUS") D POCLEPA^%VVIDEO G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 S:'($D(IFLAG)) IFLAG=0 G LOOP:IFLAG'<0
 S PADMESSA=$$^%QZCHW("  non (re)trouve : verifiez son existence ") D PAD^%VZEATT S X1=1 G FIN
C D CLEPAG^%VVIDEO S PADMESSA=$$^%QZCHW("Recherche en cours...") D PAD^%VZEATT G CHAN
REFUS D ^%VSQUEAK G LOOP1
FIN U 0 Q
M D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0,CMS=0 D ^%VKMODIS G LOOP1:ABENDSCR=1 K @(OLDNOM) S FIMOD=1 D ^%VKAUST,CHIMP G LOOP1
D S (%PCOUR,%NBPVU)=1 D ACCOR G:'(ACCOR) LOOP1 S OAJCMS=$S($D(%AJCMS):%AJCMS,1:""),%AJCMS=$$^%QZCHW("Duplication"),ABENDSCR=0
 D POCLEPA^%VVIDEO W *7,$$^%QZCHW("N'oubliez pas de changer les champs cles") H 2 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,^%VKMODIS S %AJCMS=OAJCMS G LOOP1:ABENDSCR=1 S FIMOD=0 D ^%VKAUST,CHIMP
 S ^PRESCR($I,SCR,%NBPVU)=NOMTAB_"("_$P(NOM,"(",2,599),%PCOUR=%NBPVU,%NBPVU=%NBPVU+1 D NEWOLD G LOOP1
S D ACCOR G:'(ACCOR) LOOP1 D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT
 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G LOOP1:X1'=83 K @(OLDNOM)
 S GK=$S(SCR="DESOUT":"^[QUI]PEXPOUT(LIEN)",SCR="DESMACH":"^[QUI]PEXPMACH(LIEN)",1:"^[QUI]IMPTRIP(LIEN)") K @(GK) D CLEPAG^%VVIDEO G LOOP1
CHIMP D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^%QCAMEMS
 G:NOMTAB="^[QUI]VALITOLE" VALI I LIEN=RESUL(1) D ^%QCAMEMR Q
 S:'($D(FIMOD)) FIMOD=1 S TYSCR=$S(SCR="DESOUT":"OUT",1:"MACH"),(NMTB,NOMTAB)="^[QUI]PEXP"_TYSCR_"(LIEN",ADR="TRAIT2^TO31RECO" D ^%VTENR
 S NMTB=NMTB_")" K:FIMOD @(NMTB) D ^%QCAMEMR K FIMOD S LIEN=RESUL(1) G END
TRAIT2 I SCR="DESOUT" S ^[QUI]PEXPOUT(RESUL(1),B2)=RS G END
 S ^[QUI]PEXPMACH(RESUL(1),B2)=RS G END
VALI S:'($D(FIMOD)) FIMOD=1 S OLDTAB=NOMTAB,VALI="VALI"_RESUL(1) F UU=2:1:4 S VALI=VALI_"/"_RESUL(UU)
 S NOMTAB="^[QUI]IMPTRIP(LIEN",ADR="TRAIT^TO31RECO" D ^%VTENR K:FIMOD ^[QUI]IMPTRIP(LIEN) D ^%QCAMEMR K FIMOD S NOMTAB=OLDTAB,LIEN=VALI Q
TRAIT S ^[QUI]IMPTRIP(VALI,B2,B3)=RS Q
IMP 
 I SCR="VALITOLE" D PDLG,MEMX^%QCAMEM,^TO31CMSP,PDLG K  D RMEMX^%QCAMEM S ABENDSCR=0,DX=0,DY=10 G LOOP1
 
 I SCR="DESMACH" D PDLG,MEMX^%QCAMEM,^TOCMSPMA,PDLG K  D RMEMX^%QCAMEM S ABENDSCR=0,DX=0,DY=10 G LOOP1
 
 I SCR="DESOUT" D PDLG,MEMX^%QCAMEM,^TOCMSPOU,PDLG K  D RMEMX^%QCAMEM S ABENDSCR=0,DX=0,DY=10 G LOOP1
END Q
SAVHP K ^SAVRES($I) F UU=1:1 G:'($D(RESUL(UU))) END S ^SAVRES($I,UU)=RESUL(UU)
ACCOR S ACCOR=1 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
 G END
PDLG D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") Q
NEWOLD 
 S OLDFULL=NOM,OLDNOM=NOMTAB_"("_$P(NOM,"(",2,499) Q

