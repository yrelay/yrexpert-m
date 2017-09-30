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

;TOP0CREC^INT^1^59547,74873^0
TOP0CREC ;
 
LOOP S IFLAG=0 D @ROUTI G CHAN:IFLAG'=0 D ^%VAFIGRI,^%VAFISCR S LIEN=RESUL(1)
LOOP1 D POCLEPA^%VVIDEO W $$^%QZCHW("(C)ontinuer,(V)isu. du cliche, "),$$L24^%QSLIB2,$$^%QZCHW(" recommencer,CTRLF finir,<RETURN> accord ")
LOOP2 R *X1 D TOUCHE^%INCCLAV(X1,.X1) G FIN:X1=6,FIN:X1<2 G:X1=13 BAS
 S:X1>91 X1=X1-32 S ISN=$S(X1=83:"S",X1=67:"C",X1=77:"M",X1=86:"V",X1=68:"D",1:"REFUS") D POCLEPA^%VVIDEO G @ISN
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI
 G LOOP:IFLAG'<0
 S PADMESSA="  non (re)trouve : verifiez son existence " D PAD^%VZEATT H 2 S X1=1 G FIN
V D POCLEPA^%VVIDEO W "(S) cliche S.D.B , (T) cliche TOTEM " R *TC
 D TOUCHE^%INCCLAV(TC,.TC) G:(TC=1)!(TC=6) LOOP1 S TC=$C(TC) G:(TC'="S")&(TC'="T") V
 S DA="V"_TC G @DA
VS I '($D(^[QUI]CLICHE(RESUL(1)))) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Ce cliche n'existe pas..." H 2 G LOOP1
 K ^GLOCLI($I) S ^GLOCLI($I,RESUL(1))=1,LILIM=20,IMPR=0,SUP="E" D BEG^TOP0AFFC,^%VAFIGRI,^%VAFISCR G LOOP1
VT S ARC=RESUL(1) I ('($D(^[QUI]PSRLFILI(ARC))))!('($D(^[QUI]PSRLRTES(ARC)))) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Ce cliche n'existe pas..." H 2 G LOOP1
 D CLEPAG^%VVIDEO,651^TOP0CLAE,^%VAFIGRI,^%VAFISCR G LOOP1
C D CLEPAG^%VVIDEO S PADMESSA="Recherche en cours..." D PAD^%VZEATT G CHAN
REFUS D ^%VSQUEAK G LOOP1
FIN U 0 Q
M S ABENDSCR=0 D ^%VKMODIS G LOOP1:ABENDSCR=1 K @(OLDNOM) S TLEX="M" D ^%QUERKILL,^%VKAUSTQ G LOOP1
D G LOOP1 S (%PCOUR,%NBPVU)=1 D ACCOR G:'(ACCOR) LOOP1 S OAJCMS=$S($D(%AJCMS):%AJCMS,1:""),%AJCMS="Duplication",ABENDSCR=0
 D POCLEPA^%VVIDEO,^%VSQUEAK W "N'oubliez pas de changer les champs cles" H 2 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,^%VKMODIS S %AJCMS=OAJCMS G LOOP1:ABENDSCR=1 D ^%QUERKILL,^%VKAUSTQ S FIMOD=0 D CHIMP
 S ^PRESCR($I,SCR,%NBPVU)=NOMTAB_"("_$P(NOM,"(",2,599),%PCOUR=%NBPVU,%NBPVU=%NBPVU+1 D NEWOLD G LOOP1
S D ^%VSQUEAK S PADMESSA="                          **** confirmer la suppression ****" D PAD^%VZEATT R *X1 D TOUCHE^%INCCLAV(X1,.X1) G LOOP1:X1'=83
 D OABRES^%VKMODIS,^%QUERKILL K ^[QUI]PSRLPARF(RESUL(1)),^[QUI]PSRLRTES(RESUL(1)),@(OLDNOM) S TLEX="S" D CLEPAG^%VVIDEO G LOOP1
BAS D PDLG,MEMX^%QCAMEM,LOOP0^TOP0RECC,PDLG K  D RMEMX^%QCAMEM G LOOP1
 
 
PDLG D POCLEPA^%VVIDEO W "Un instant..." Q
 
ACCOR S ACCOR=1 I ^TOZE($I,"FULL")=1 S ACCOR=0 Q
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 Q
 Q
 
NEWOLD S OLDFULL=NOM,OLDNOM=NOMTAB_"("_$P(NOM,"(",2,499) Q
 
CHIMP Q:LIEN=RESUL(1)
 D PDLG,MEMX^%QCAMEM
 S:'($D(FIMOD)) FIMOD=1 F BTMN="^[QUI]PSRLPARF","^[QUI]PSRLRTES" S (NMTB,NOMTAB)=BTMN_"(LIEN",ADR="TRAIT2^TOP0CREC" D ^%VTENR S NMTB=NMTB_")" K:FIMOD @(NMTB)
 D RMEMX^%QCAMEM K FIMOD S LIEN=RESUL(1) Q
TRAIT2 S @BTMN@(RESUL(1),B2)=RS Q

