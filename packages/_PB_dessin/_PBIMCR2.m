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

;%PBIMCR2^INT^1^59547,73873^0
PTICREAT(O,V) 
 
 
 
 
 
 
 
 
 
 N DEBUT,DIST D KILL^%PBSOV(O,V),NEW^%PBSOV(O,V) S DIST=1000,DEBUT=1
INT N ADRES,AXES,BID,CONTR,%FONC,I,MENU,MENUA,MENUE,MODE,PVISI,TYPL,VISIBL,X,Y
 S VISIBL=0,TYPL="F",MODE=0,PVISI=$$VIS^%PBSOV(O,V)
 D CLEPAG^%VVIDEO,INIT^%PBMFN(O,V),INIT^%PBIAXE,CREAT,FIN^%PBMFN Q
CREAT 
 G:'(DEBUT) REAF D ^%PBPZGRA,CLEAR^%PBP5EC,CADRE^%PBP5EC2,INDIQ
 D DIST2^%PBIMESU
L0 
 D EFFBAS^%PBMEN
 S %9STR="" F I="(E)lements","(B)ibliotheque","(M)esures","(T)ransformations","(I)nvisible","(R)emonter","(A)xes" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,50,%9STR),CUROFF^%PBMEN
 R *ADRES:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 I (ADRES=1)!(ADRES=6) G FIN
 I ADRES=18 D RR G L0
 S ADRES=$C(ADRES)
 G:(ADRES="E")!(ADRES=1) ELEM
 G:(ADRES="B")!(ADRES=2) BIBL
 G:(ADRES="M")!(ADRES=3) MESURE
 G:(ADRES="T")!(ADRES=4) TRANS
 G:(ADRES="I")!(ADRES=5) INVIS
 G:(ADRES="R")!(ADRES=6) REMDE
 G:(ADRES="A")!(ADRES=7) AXES
 D ^%VSQUEAK G L0
AXES 
LA 
 D EFFBAS^%PBMEN
 S %9STR="" F I="(P)lacement d'un axe","(E)ffacement des axes" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,0,%9STR),CUROFF^%PBMEN
 R *ADRES:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 I (ADRES=1)!(ADRES=6) G L0
 I ADRES=8 D ^%PBIMHLP G LA
 S ADRES=$C(ADRES)
 G:(ADRES="P")!(ADRES=1) AXE
 G:(ADRES="E")!(ADRES=2) EFFAX
 D ^%VSQUEAK G LA
AXE D ^%PBIAXE G LA
EFFAX D INIT^%PBIAXE,RR G LA
ELEM 
L1 
 D EFFBAS^%PBMEN
 S %9STR="" F I="(M)ode","(P)oint","(D)roite","(T)exte","(A)rc","(C)ercle","(E)llipse","(D)emie-ellipse","(L)ignes" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,0,%9STR),CUROFF^%PBMEN
 R *ADRES:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 I (ADRES=1)!(ADRES=6) G L0
 I ADRES=8 D ^%PBIMHLP G L1
 I ADRES=18 D RR G L1
 S ADRES=$C(ADRES)
 G:(ADRES="M")!(ADRES=1) MODE
 G:(ADRES="P")!(ADRES=2) POI
 G:ADRES=3 DRO
 G:(ADRES="T")!(ADRES=4) TEX
 G:(ADRES="A")!(ADRES=5) ARC
 G:(ADRES="C")!(ADRES=6) CER
 G:(ADRES="E")!(ADRES=7) ELI
 G:ADRES=8 DEM
 G:(ADRES="L")!(ADRES=9) LIG
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
RR D ^%PBPZGRA,CLEAR^%PBP5EC,CADRE^%PBP5EC2,MESUR^%PBP5EC2(DIST)
 D ^%PBISAGE(O,V,0,0,0,1,PVISI,VISIBL),AFF^%PBIAXE,INDIQ Q
DEM D ^%PBIADEL G L1
ARC D ^%PBIAARC G L1
CER D ^%PBIACER G L1
DRO D ^%PBIADRO G L1
ELI D ^%PBIAELL G L1
LIG D ^%PBIALIG,INDLIG G L1
POI D ^%PBIAPOI G L1
TEX D ^%PBIATXT G L1
INDIQ I %TERM="PT-100G" D ^%PBPZALF,CLEPAG^%VVIDEO,INDMOD,INDLIG,INDINV Q
 S %9STR=" Mode : "_$S(MODE:" TEXTUEL ",1:" GRAPHIQUE ")_" Lignes : "_$S(TYPL="F":" NORMALES ",TYPL="I":" INVISIBLE ",TYPL="P":" POINTILLES ",TYPL="C":" TRAITS COURTS ",TYPL="L":" TRAITS LONGS ",TYPL="M":" MIXTES ")_" Invisibles : "
 S %9STR=%9STR_$S(VISIBL:" DECOUVERTS ",1:" CACHES ")
 S %9STR=%9STR_$J("",70-$L(%9STR))
 D AFF^%PBMEN(0,3120,%9STR)
 Q
INDMOD G:%TERM'="PT-100G" INDIQ
 D ^%PBPZALF
 S DX=2,DY=0 D REV^%VVIDEO X XY W " Mode : " D BLD^%VVIDEO
 S DX=DX+8 X XY W $J("",11) X XY W $S(MODE:" Textuel ",1:" Graphique ")
 D NORM^%VVIDEO
 D ^%PBPZGRA
 Q
INDLIG G:%TERM'="PT-100G" INDIQ
 D ^%PBPZALF
 S DX=22,DY=0 D REV^%VVIDEO X XY W " Lignes : " D BLD^%VVIDEO
 S DX=DX+10 X XY W $J("",15) X XY W $S(TYPL="F":" Normales ",TYPL="I":" Invisibles ",TYPL="P":" Pointilles ",TYPL="C":" Traits courts ",TYPL="L":" Traits longs ",TYPL="M":" Mixtes ") D NORM^%VVIDEO
 D ^%PBPZGRA
 Q
INDINV G:%TERM'="PT-100G" INDIQ
 D ^%PBPZALF
 S DX=48,DY=0 D REV^%VVIDEO X XY W " Invisibles : " D BLD^%VVIDEO
 S DX=DX+14 X XY W $J("",12)
 X XY W $S(VISIBL:" Decouverts ",1:" Caches ") D NORM^%VVIDEO
 D ^%PBPZGRA
 Q
MODIF(O,V) N DEBUT,DIST S DEBUT=0,DIST=$$LEC^%PBSOV(O,V,"MESURE") G INT

