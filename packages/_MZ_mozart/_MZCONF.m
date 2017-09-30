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

;%MZCONF^INT^1^59547,73871^0
%MZCONF ;;03:08 PM  20 Dec 1996;
 
 
 
 
 
STAND(TYP) 
 N PAGE,FOIS,MAX
 S MAX=160
 S FOIS=0
 Q:(TYP'=1)&(TYP'=2)
 D CLEPAG^%VVIDEO
 I '($D(^[QUI]MOZ("GRILLE","TRAZOM"))) D INIT^%MZGAM4
 N RP,UTIL S UTIL="TRAZOM",RP="STANDARD" G DEB
SPEC(TYP) 
 N PAGE,FOIS,MAX
 S MAX=160
 S FOIS=0
 Q:(TYP'=1)&(TYP'=2)
 N LBASE,RP,UTIL
SPEC1 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("LISTE DES REPERTOIRES CONNECTES A  < MOZART >",0),NORM^%VVIDEO
 S LBASE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"1") K @(LBASE)
 S @LBASE=0,RP="" F I=0:0 S RP=$O(^TABIDENT(WHOIS,"MOZART",RP)) Q:RP=""  S @LBASE@(RP)="",@LBASE=@LBASE+1
 I @LBASE=0 D ^%VZEAVT("Il n'y a aucun repertoire connecte a MOZART pour l'utilisateur "_WHOIS),^%VZEAVT("seule la configuration standard est disponible.") Q
 D INIT^%QUCHOIP(LBASE,1,"",20,5,40,15),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP K @(LBASE)
 S UTIL=WHOIS
 
DEB N RESUL,IC,ICC,m,NOMTAB,LISTE,LTRI,V,%V
 D CLEPAG^%VVIDEO
 D ENTETE,INITUC^%MZCONF2(.LISTE)
 S LTRI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"2") K @(LTRI)
 S CMS=0,ABENDSCR=0,NOMTAB=""
 S SCR=$S(TYP=1:"MOZCONF",2:"MZCONF2") 
 S CPT=$S(TYP=1:3,1:2)
 D INIT(1)
 I '($D(^[QUI]MOZ("GRILLE",UTIL,RP))) G AFF
 S %U=1
BOUC 
 I '($D(^[QUI]MOZ("GRILLE",UTIL,RP,TYP,CPT))) D INIT(%U) G AFF
 G:CPT>40 AFF
 S INTER=^[QUI]MOZ("GRILLE",UTIL,RP,TYP,CPT),RESUL(%U)=$P(INTER,"^",4),RESUL(%U+1)=$P(INTER,"^",1),RESUL(%U+2)=$S($P(INTER,"^",2)'="":$P(INTER,"^",2),1:1),RESUL(%U+3)=$P(INTER,"^",3),RESUL(%U+4)=$P(INTER,"^",5)
 S CPT=CPT+1,%U=%U+5
 G BOUC
 
AFF 
 I (CPT>10)&(CPT<21) S PAGE=2 G AF02
 I (CPT>20)&(CPT<31) S PAGE=3 G AF02
 I (CPT>31)&(CPT<41) S PAGE=4 G AF02
 I CPT<11 S PAGE=1 G AF01
 
 ;;S DX=30,DY=22 X XY W $$^%QZCHW("Page:") R PAGE W PAGE 
 
 ;;S PAGE=1
AF01 
 
 D ^%VAFIGRI 
 S DX=2,DY=22 X XY W $$^%QZCHW("Page:")_PAGE
 G AFF1
AF02 
 N Limite
 I SCR="MOZCONF" S Limite=10
 I SCR="MZCONF2" S Limite=8
 I (PAGE>1)&(CPT>Limite) D ^%VAFIGRI2(PAGE)
 I (PAGE>1)&((CPT<Limite)!(CPT=Limite)) S PAGE=1
 S DX=2,DY=22 X XY W $$^%QZCHW("Page:")_PAGE    
AFF1 
 D ^%VAFISCR2(PAGE)
AFF2 D ^%VMODISC2(PAGE)
 I ABENDSCR G EXIT
 S OK=$$VERIF^%MZCONF3 I '(OK) S ABENDSCR=0,CMS=0 G AFF
C1 K ^[QUI]MOZ("GRILLE",UTIL,RP,TYP)
 S ^[QUI]MOZ("GRILLE",UTIL,RP,TYP)="MOZLIGN"_TYP
 I TYP=1 S ^[QUI]MOZ("GRILLE",UTIL,RP,TYP,1)="NUMERO.OPERATION^^1^Numero d'operation^2",^[QUI]MOZ("GRILLE",UTIL,RP,TYP,2)="MACHINE^^7^Machine^7",CPT=2,MAXCP=40  ;;cao
 I TYP=2 S ^[QUI]MOZ("GRILLE",UTIL,RP,TYP,1)="ACTION^^5^Action^ACTION",CPT=1,MAXCP=39
 F %U=1:5:MAX S CPT=CPT+1 Q:CPT>MAXCP  I RESUL(%U)'="" S @LTRI@(RESUL(%U+3))=%U
 S CPT=$S(TYP=1:2,1:1),V=""
C2 F %V=0:0 S CPT=CPT+1,V=$O(@LTRI@(V)) Q:V=""  S %U=@LTRI@(V),^[QUI]MOZ("GRILLE",UTIL,RP,TYP,CPT)=RESUL(%U+1)_"^"_RESUL(%U+2)_"^"_RESUL(%U+3)_"^"_RESUL(%U)_"^"_RESUL(%U+4)
 K @(LTRI)
 I TYP=1,'($D(^[QUI]MOZ("GRILLE",UTIL,RP,2))) S NOMTREE="^[QUI]MOZ(""GRILLE"",""TRAZOM"",""STAND"",2",%TREECOP="^[QUI]MOZ(""GRILLE"","""_UTIL_""","""_RP_""","_"2" D ^%QCAGLC
 I TYP=2,'($D(^[QUI]MOZ("GRILLE",UTIL,RP,1))) S NOMTREE="^[QUI]MOZ(""GRILLE"",""TRAZOM"",""STAND"",1",%TREECOP="^[QUI]MOZ(""GRILLE"","""_UTIL_""","""_RP_""","_"1" D ^%QCAGLC
 G SPEC1:RP'="STAND"
FIN Q
 
EXIT 
 I FOIS=0 G EXIT2
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Sortie sans sauvegarde. confirmation")_" : ") G FIN
 S FOIS=0
 D POCLEPA^%VVIDEO S ABENDSCR=0
 G AFF2
EXIT2 
 S DX=2,DY=22 X XY W "            "
 S DX=2,DY=22 X XY W $$^%QZCHW("Page:") S DY=DY+$L("Page:") 
 d ^%VLEC 
 S PAGE=Y1 
 I PAGE=1 G AF01
 I (PAGE>1)&(PAGE<5) G AF02
 I PAGE="" S FOIS=1 G EXIT
 I PAGE>4 D ^%VSQUEAK G EXIT2
 I $A(PAGE)>57 D ^%VSQUEAK G EXIT2
INIT(D) 
 F %U=D:1:MAX S RESUL(%U)=""
 Q
SUP(TYP) 
SUP2 
 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("SUPPRESSION DE CONFIGURATION",0)
 N GLO,RP,UTIL S UTIL=WHOIS
 S RP="" F %U=0:0 S RP=$O(^[QUI]MOZ("GRILLE",UTIL,RP)) Q:RP=""  S:$D(^[QUI]MOZ("GRILLE",UTIL,RP,TYP)) GLO(RP)=""
 K GLO("STAND")
 D INIT^%QUCHOIP("GLO",1,"",20,5,40,12),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP
 S DX=0,DY=23 X XY I $$CONFIRM^%VZEOUI("Suppression de "_RP_" ? ") K ^[QUI]MOZ("GRILLE",UTIL,RP)
 G SUP2
 
ATTR 
 Q:RESUL(IC)=""
 I RESUL(IC)="NUMERO.OPERATION" D ^%VZEAVT("Cet attribut est interdit ...") S REFUSE=1 Q
 I TYP=1 F %U="ACTION","MANIERE","OBJET","OUTIL" S:RESUL(IC)=%U REFUSE=1
 I REFUSE D ^%VZEAVT("Cet attribut ne peut etre defini dans la ligne operation ...") S REFUSE=1 Q
 D FULL^%LXUC42
 Q
INDICE 
 D INDICE^%MZCONF3(5)
 Q
 
AFFI D ^%VAFFICH2 S REFUSE=0
 Q
POSI 
 I RESUL(IC)="" D ^%VZEAVT("Ce champ doit etre rempli ...") S REFUSE=1 Q
 S REFUSE='($$POSN^%QZNBN(RESUL(IC)))
 I REFUSE D ^%VZEAVT("Ce champ doit etre numerique ...") S REFUSE=1 Q
 I (RESUL(IC)<8)!(RESUL(IC)>160) D ^%VZEAVT("La valeur de ce champ doit etre comprise entre 7 et 160 ...") S REFUSE=1 Q
 S REFUSE=$$POS1^%MZCONF3 Q
LIB 
 
 S TAB(ICC)=$$MAJ^%VMINUSC($E(RESUL(IC),1))_$$MIN^%VMINUSC($E(RESUL(IC),2,999)) D ^%VAFFICH S REFUSE=0
 Q
CTR 
 S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 Q:RESUL(IC)=""
 S REFUSE=0
 I RESUL(IC)="?" G HELP
 G:RESUL(IC)=8 CTR2
 I RESUL(IC)'[",",(RESUL(IC)<1)!(RESUL(IC)>10) S:'($D(^[QUI]MOZITEM(RESUL(IC)))) REFUSE=1 Q
 N LG,OK S LG=$L(RESUL(IC),","),OK=1
 F I=1:1:LG S LIB=$P(RESUL(IC),",",I) S:((LIB="")!(LIB<1))!(LIB>10) OK=0 I (LG>1)&('($$NUM^%QZNBN(LIB))) S OK=0
 I '(OK) S REFUSE=1
 Q
CTR2 D INIT^%QUCHOIP("^[QUI]MOZITEM",1,"",20,5,40,15),AFF^%QUCHOIP
 S RESUL(IC)=$$UN^%QUCHOIP
 D END^%QUCHOIP,ENTETE,^%VAFIGRI,^%VAFISCR Q
HELP 
 N LIB
 D CLEPAG^%VVIDEO
 X XY D BLD^%VVIDEO,^%VZCDB("Liste des controles possibles",0),NORM^%VVIDEO S DX=4,DY=3 X XY
 S LIB="" F I=0:0 S LIB=$O(LISTE(LIB)) Q:LIB=""  S DX=4 X XY D BLD^%VVIDEO W LIB S DX=10 X XY D NORM^%VVIDEO W LISTE(LIB,1) S DY=DY+1
 S DX=0,DY=20 X XY W "Remarque : il est possible de combiner plusieurs controles en tapant par exemple, ""1,2"" dans la zone de saisie."
 D ^%VZEAVT(""),CLEPAG^%VVIDEO,ENTETE,^%VAFIGRI,^%VAFISCR S TAB(ICC)="       " D ^%VAFFICH S TAB(ICC)="" D ^%VAFFICH S REFUSE=2
 Q
ENTETE D BLD^%VVIDEO
 S:RP="STANDARD" RP="STAND"
 D:TYP=1 1
 D:TYP=2 2
 D BLD^%VVIDEO,^%VZCDB($S(UTIL="TRAZOM":"PAR DEFAUT",1:UTIL),22)
 Q
1 
 D ^%VZCDB("DEFINITION DE LA LIGNE OPERATION -----> "_$S(RP="STAND":"PAR DEFAUT",1:RP),0)
 S DX=5,DY=2 X XY D BLD^%VVIDEO W $$^%QZCHW("Champ no 1 : NUMERO.OPERATION") S DX=50 X XY W $$^%QZCHW("Champ no 2 : MACHINE") D NORM^%VVIDEO
 Q
2 
 D ^%VZCDB("DEFINITION DE LA LIGNE ACTION -----> "_$S(RP="STAND":"PAR DEFAUT",1:RP),0)
 S DX=5,DY=2 X XY D BLD^%VVIDEO W $$^%QZCHW("Champ no 1 : ACTION")
 
 D NORM^%VVIDEO
 Q

