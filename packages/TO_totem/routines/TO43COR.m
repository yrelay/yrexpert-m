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

;TO43COR^INT^1^59547,74871^0
TO43COR ;
 
 K ^PRESCR($I,SCR) S (%PCOUR,%NBPVU)=1 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0
 I ^TOZE($I,"FULL")=1 D ^%VTNAMFU S NOMTAB=$S(%NFU="":NOMTAB,1:%NFU)
LOOP S RESUL(1)=ARTI,IFLAG=0 D @ROUTI G CHAN:IFLAG'=0 D VERIF:SCR="MESSA" G FIN:ABENDSCR=1 D ^%VAFIGRI,^%VAFISCR
 S DY=0,DX=68 X XY W "          " X XY W $$^%QZCHW("Page : "),%NBPVU S ^PRESCR($I,SCR,%NBPVU)=%NOMC,%PCOUR=%NBPVU,%NBPVU=%NBPVU+1
LOOP1 D GNDH S ABENDSCR=0 D POCLEPA^%VVIDEO W $$^%QZCHW("(C)onsulter,(M)odifier,(S)upprimer,(A)jouter,(?),(+),(-),Page ")
LOOP2 S %AJCMS=$$^%QZCHW("Cons/Mod/Supp") D ^%VATYPA R *X1 D TOUCHE^%INCCLAV(X1,.X1)
 G IMPR:X1=10,FIN:X1=6,FIN:X1<2 S:X1>91 X1=X1-32
 S ISN=$S(X1=63:"PINT",X1=43:"PLUS",X1="61":"PLUS",X1=45:"MOINS",X1=77:"M",X1=83:"S",X1=67:"C",X1=65:"A",1:"REFUS")
 S PADMESSA="                                                                                " D:ISN'="REFUS" PAD^%VZEATT G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
 S PADMESSA=$$L16^%QSLIB1 D PAD^%VZEATT G LOOP2
D D ACCOR G:'(ACCOR) LOOP1 S OAJCMS=$S($D(%AJCMS):%AJCMS,1:""),%AJCMS=$$^%QZCHW("Duplication"),ABENDSCR=0
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("N'oubliez pas de changer les champs cles") H 2 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,^%VKMODIS S %AJCMS=OAJCMS G LOOP1:ABENDSCR=1 D ^%VKAUST S ^PRESCR($I,SCR,%NBPVU)=NOMTAB_"("_$P(NOM,"(",2,599),%PCOUR=%NBPVU,%NBPVU=%NBPVU+1 D NEWOLD G LOOP1
M D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0,%AJCMS=$$^%QZCHW("Modification") D ^%VATYPA,^%VKMODIS G LOOP1:ABENDSCR=1 K @(OLDNOM),@(OLDFULL) I NOMTAB="^[QUI]REFANTET" K ^[QUI]ANTETUDE(ARTI,NUFA,TWREF)
 D ^TO43STOC S ^PRESCR($I,SCR,%PCOUR)=NOMTAB_"("_$P(NOM,"(",2,599) D NEWOLD G LOOP1
S D ACCOR G:'(ACCOR) LOOP1 G:^TOZE($I,"FULL")=1 LOOP1
 D ^%VSQUEAK S PADMESSA=$$^%QZCHW("                          **** confirmer la suppression ****") D PAD^%VZEATT R *X1 D TOUCHE^%INCCLAV(X1,.X1) G LOOP1:X1'=83
 K @(OLDNOM),@(OLDFULL),^PRESCR($I,SCR,%PCOUR) I NOMTAB="^[QUI]REFANTET" K ^[QUI]ANTETUDE(ARTI,NUFA,TWREF)
 D CLEPAG^%VVIDEO G LOOP1
C S %PCOUR=%NBPVU-1 D POCLEPA^%VVIDEO S PADMESSA=$$^%QZCHW("...RECHERCHE EN COURS...") X XY D PAD^%VZEATT G CHAN
REFUS G:X1<27 REFUSE S YG=$C(X1),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) G REFUSE
 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) REFUSE G:'($D(^PRESCR($I,SCR,%PCH))) LOOP1 S %PCOUR=%PCH D ^%VNEWPA S %NOMC=$S(NOMTAB["REFANTET":NOMTAB_%FNOM,1:NOMTAB_"("_%NOMT_")") D GNDH G LOOP1
REFUSE D ^%VSQUEAK G LOOP1
FIN U 0 Q
A S YB=ARTI D CLEPAG^%VVIDEO,^TOAJREA1 G:%ABAND=1 A1 S ADTR="S11"_NOMAJ D @ADTR
A1 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR G LOOP1
VERIF S ABENDSCR=0 I RESUL(1)'=$$^%QZCHW("TOUS") S:RESUL(1)'=WHOIS ABENDSCR=1 Q
IMPR S ADX=$X,ADY=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...") D ^%VIMPSCR,POCLEPA^%VVIDEO S DX=ADX,DY=ADY X XY G LOOP1
PLUS S %PCOUR=%PCOUR+1 I '($D(^PRESCR($I,SCR,%PCOUR))) S:%PCOUR>%NBPVU %PCOUR=%NBPVU G LOOP1
 D ^%VNEWPA S %NOMC=$S(NOMTAB["REFANTET":NOMTAB_%FNOM,1:NOMTAB_"("_%NOMT_")") D GNDH G LOOP1
MOINS S %PCOUR=%PCOUR-1 I '($D(^PRESCR($I,SCR,%PCOUR))) S:%PCOUR<1 %PCOUR=1 G LOOP1
 D ^%VNEWPA S %NOMC=$S(NOMTAB["REFANTET":NOMTAB_%FNOM,1:NOMTAB_"("_%NOMT_")") D GNDH G LOOP1
ACCOR S ACCOR=1 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
END Q
NEWOLD 
 S OLDFULL=NOM,OLDNOM=NOMTAB_"("_$P(NOM,"(",2,499) Q
GNDH S NUFA=$N(@%NOMC@(-1)),TWREF=$N(@%NOMC@(NUFA,-1)),COM=$S($D(@%NOMC@(NUFA,TWREF)):@%NOMC@(NUFA,TWREF),($D(@%NOMC)#10)=1:@%NOMC,1:""),DAT=$P(COM,"^",1),HEU=$P(COM,"^",2),COM=$P(COM,"^",3)
 S DX=40-($L(NUFA)\2),DY=0 D REV^%VVIDEO,BLD^%VVIDEO X XY W:NUFA'=-1 NUFA D NORM^%VVIDEO Q
PINT D ^TO43COME G LOOP1

