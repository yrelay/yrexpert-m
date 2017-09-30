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

;%PBIMCRE^INT^1^59547,73873^0
PTICREAT(O,V) 
 
 
 
 
 
 
 
 
 
 N DEBUT,DIST D KILL^%PBSOV(O,V),NEW^%PBSOV(O,V) S DIST=1000,DEBUT=1
INT N ADRES,AXES,BID,CONTR,%FONC,I,MENU,MENUA,MENUE,MODE,PVISI,TYPL,VISIBL,X,Y
 S VISIBL=0,TYPL="F",MODE=0,PVISI=$$VIS^%PBSOV(O,V)
 D CLEPAG^%VVIDEO,INIT^%PBMFN(O,V),INIT^%PBIAXE,CREAT,FIN^%PBMFN Q
CREAT S MENU="23^0^79"
 S MENU(1)="Elements^ELEM"
 S MENU(2)="Bibliotheque^BIBL"
 S MENU(3)="Mesures^MESURE"
 S MENU(4)="Transformations^TRANS"
 S MENU(5)="Invisible^INVIS"
 S MENU(6)="Remonter^REMDE"
 S MENU(7)="Axes^AXES"
 G:'(DEBUT) REAF D ^%PBPZGRA,CLEAR^%PBP5EC,CADRE^%PBP5EC2,^%PBPZALF,INDIQ
 D DIST^%PBIMESU
L0 
 D POCLEPA^%VVIDEO,^%VQUIKMN(1,79,23,"MENU",.ADRES,.CONTR)
 G:ADRES'="" @ADRES I "AF"[CONTR G FIN
 I CONTR="H" D ^%PBIMHLP G L0
 I CONTR="R" D RR G L0
 D ^%VSQUEAK G L0
AXES S MENUA="23^0^79"
 S MENUA(1)="Placement d'un axe^AXE"
 S MENUA(2)="Effacement des axes^EFFAX"
LA 
 D POCLEPA^%VVIDEO,^%VQUIKMN(1,79,23,"MENUA",.ADRES,.CONTR)
 G:ADRES'="" @ADRES I "AF"[CONTR G L0
 I CONTR="R" D RR G LA
 I CONTR="H" D ^%PBIMHLP G LA
 D ^%VSQUEAK G LA
AXE D ^%PBIAXE G LA
EFFAX D INIT^%PBIAXE,RR G LA
ELEM S MENUE="23^0^79"
 S MENUE(1)="Mode^MODE"
 S MENUE(2)="Point^POI"
 S MENUE(3)="Droite^DRO"
 S MENUE(4)="Texte^TEX"
 S MENUE(5)="Arc^ARC"
 S MENUE(6)="Cercle^CER"
 S MENUE(7)="Ellipse^ELI"
 S MENUE(8)="Demie-ellipse^DEM"
 S MENUE(9)="Lignes^LIG"
L1 
 D POCLEPA^%VVIDEO,^%VQUIKMN(1,79,23,"MENUE",.ADRES,.CONTR)
 G:ADRES'="" @ADRES
 I "AF"[CONTR G L0
 I CONTR="H" D ^%PBIMHLP G L1
 I CONTR="R" D RR G L1
 D ^%VSQUEAK G L1
REMDE D ^%PBIMREM G L0
MESURE D ^%PBIMESU G L0
TRANS D ^%PBIMRAN G L0
INVIS S VISIBL='(VISIBL) D RR G L0
REAF D RR G L0
BIBL D ^%PBIABIB,INDIQ G L0
MESUR D ^%PBIMESU G L0
FIN D LECORIG^%PBP5EC2(.X,.Y),SET^%PBSOV(O,V,"XO",X),SET^%PBSOV(O,V,"YO",Y)
 D ^%PBPZGRA,CLEAR^%PBP5EC,^%PBPZALF Q
MODE S MODE='(MODE) D INDMOD G L1
RR D CLEPAG^%VVIDEO,^%PBPZGRA,CLEAR^%PBP5EC,CADRE^%PBP5EC2,MESUR^%PBP5EC2(DIST)
 D ^%PBISAGE(O,V,0,0,0,1,PVISI,VISIBL),AFF^%PBIAXE,^%PBPZALF,INDIQ Q
DEM D ^%PBIADEL G L1
ARC D ^%PBIAARC G L1
CER D ^%PBIACER G L1
DRO D ^%PBIADRO G L1
ELI D ^%PBIAELL G L1
LIG D ^%PBIALIG,INDLIG G L1
POI D ^%PBIAPOI G L1
TEX D ^%PBIATXT G L1
INDIQ D CLEPAG^%VVIDEO,INDMOD,INDLIG,INDINV Q
INDMOD S DX=2,DY=0 D REV^%VVIDEO X XY W " Mode : " D BLD^%VVIDEO
 S DX=DX+8 X XY W $J("",11) X XY W $S(MODE:" Textuel ",1:" Graphique ")
 D NORM^%VVIDEO Q
INDLIG S DX=22,DY=0 D REV^%VVIDEO X XY W " Lignes : " D BLD^%VVIDEO
 S DX=DX+10 X XY W $J("",15) X XY W $S(TYPL="F":" Normales ",TYPL="I":" Invisibles ",TYPL="P":" Pointilles ",TYPL="C":" Traits courts ",TYPL="L":" Traits longs ",TYPL="M":" Mixtes ") D NORM^%VVIDEO Q
INDINV S DX=48,DY=0 D REV^%VVIDEO X XY W " Invisibles : " D BLD^%VVIDEO
 S DX=DX+14 X XY W $J("",12)
 X XY W $S(VISIBL:" Decouverts ",1:" Caches ") D NORM^%VVIDEO
 Q
MODIF(O,V) N DEBUT,DIST S DEBUT=0,DIST=$$LEC^%PBSOV(O,V,"MESURE") G INT

