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

;%MZCONF2^INT^1^59547,73871^0
MOZCONF2 ;
 
 
 
 
 
STAND 
 N RP,UTIL
 S UTIL="TRAZOM",RP="STANDARD"
 I '($D(^[QUI]MOZPARA("GRILLE","TRAZOM"))) D ^%MZGAM4
 G DEB
SPEC 
 N LBASE,RP,UTIL
SPEC1 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("LISTE DES REPERTOIRES CONNECTES A  < MOZART >",0),NORM^%VVIDEO
 S LBASE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"1") K @(LBASE)
 S @LBASE=0
 S RP="" F I=0:0 S RP=$O(^TABIDENT(WHOIS,"MOZART",RP)) Q:RP=""  S @LBASE@(RP)="",@LBASE=@LBASE+1
 I @LBASE=0 D ^%VZEAVT("Il n'y a aucun repertoire connecte a MOZART pour l'utilisateur "_WHOIS),^%VZEAVT("seule la configuration standard est disponible.") Q
 D INIT^%QUCHOIP(LBASE,1,"",20,5,40,15)
 D AFF^%QUCHOIP
 S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP K @(LBASE)
 S UTIL=WHOIS
 
DEB N RESUL,IC,ICC,m,NOMTAB,TYP
 D CLEPAG^%VVIDEO,INITUC(.LISTE),ENTETE
 S CMS=0,ABENDSCR=0,NOMTAB="",TYP=0
 S SCR="MOZPARA" D ^%VAFIGRI
 S CPT=2
 I ($D(^[QUI]MOZPARA("GRILLE",UTIL,RP))#10)'=0 D INIT(1) G AFF
 S %U=1
BOUC 
 I '($D(^[QUI]MOZPARA("GRILLE",UTIL,RP,1,CPT))) D INIT(%U) G AFF
 G:CPT>18 AFF
 S INTER=^[QUI]MOZPARA("GRILLE",UTIL,RP,1,CPT),RESUL(%U)=$P(INTER,"^",4)
 S RESUL(%U+1)=$P(INTER,"^",1),RESUL(%U+1)=$TR(RESUL(%U+1),"!","^")
 S RESUL(%U+2)=$S($P(INTER,"^",2)'="":$P(INTER,"^",2),1:1)
 S RESUL(%U+3)=$P(INTER,"^",3)
 S CPT=CPT+1,%U=%U+4
 G BOUC
 
AFF D ^%VAFISCR
AFF2 D ^%VMODISC
 I ABENDSCR G EXIT
 K ^[QUI]MOZPARA("GRILLE",UTIL,RP,1)
 S ^[QUI]MOZPARA("GRILLE",UTIL,RP,1)="MOZGARDE"
 S ^[QUI]MOZPARA("GRILLE",UTIL,RP,1,1)="NOM^1^^Identificateur de la gamme"
 S CPT=1
 F %U=1:4:72 S CPT=CPT+1 Q:CPT>18  S:RESUL(%U)="" RESUL(%U)="." S ^[QUI]MOZPARA("GRILLE",UTIL,RP,1,CPT)=$TR(RESUL(%U+1),"^","!")_"^"_RESUL(%U+2)_"^"_RESUL(%U+3)_"^"_RESUL(%U)
 I '($D(^[QUI]MOZPARA("GRILLE",UTIL,RP,2))) S NOMTREE="^[QUI]MOZPARA(""GRILLE"",""TRAZOM"",""STAND"",2",%TREECOP="^[QUI]MOZPARA(""GRILLE"","""_UTIL_""","""_RP_""","_"2" D ^%QCAGLC
 G SPEC1:RP'="STAND"
FIN Q
 
EXIT D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Sortie sans sauvegarde. confirmation")_" : ") G FIN
 D POCLEPA^%VVIDEO S ABENDSCR=0
 G AFF2
 
INIT(D) 
 F %U=D:1:^%SCRE(SCR) S RESUL(%U)=""
 Q
SUP 
 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("SUPPRESSION DE CONFIGURATION",0)
 N GLO,RP,UTIL S UTIL=WHOIS
 S RP="" F %U=0:0 S RP=$O(^[QUI]MOZPARA("GRILLE",UTIL,RP)) Q:RP=""  S GLO(RP)=""
 K GLO("STAND")
 D INIT^%QUCHOIP("GLO",1,"",20,5,40,12)
 D AFF^%QUCHOIP
 S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP
 S DX=0,DY=23 X XY I $$CONFIRM^%VZEOUI("Suppression de "_RP_" ? ") K ^[QUI]MOZPARA("GRILLE",UTIL,RP)
 G SUP
ATTR 
 Q:RESUL(IC)=""
 N CHAMP,REPI,REP S CHAMP=RESUL(IC)
 I $L(RESUL(IC),"^")'=2 S REFUSE=$$LEX Q
 N ATT,REP,REPI
 S ATT=$P(RESUL(IC),"^",1),REP=$P(RESUL(IC),"^",2),RESUL(IC)=ATT
 I $$LEX Q
 S TAB(IC)=RESUL(IC)_"^"_REP D AFFI^%MZCONF
 Q
LEX() I RESUL(IC)="NOM" D ^%VZEAVT($$^%QZCHW("L'attribut NOM est interdit !!")) S REFUSE=1
 D FULL^%LXUC4
 Q REFUSE
INDICE 
 D INDICE^%MZCONF3(4)
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
 D END^%QUCHOIP,ENTETE,^%VAFIGRI,^%VAFISCR
 Q
INITUC(LIST) 
 S LIST(1,0)="1^%MZGAM2",LIST(1,1)="Existence de la valeur de l'attribut au LEXIQUE"
 S LIST(2,0)="2^%MZGAM2",LIST(2,1)="La valeur de l'attribut doit etre entiere et positive"
 S LIST(3,0)="3^%MZGAM2",LIST(3,1)="La valeur de l'attribut doit etre entiere"
 S LIST(4,0)="4^%MZGAM2",LIST(4,1)="La valeur de l'attribut doit etre numerique"
 S LIST(5,0)="5^%MZGAM2",LIST(5,1)="La valeur de l'attribut doit etre numerique et positive"
 S LIST(6,0)="6^%MZGAM2",LIST(6,1)="La valeur de l'attribut ne peut etre modifiee"
 S LIST(7,0)="MACH^%MZGAM2",LIST(7,1)="La valeur de l'attribut est une MACHINE"
 S LIST(8,0)="ITEM^%MZGAM2",LIST(8,1)="La valeur de l'attribut est un mot du vocabulaire de MOZART"
 S LIST(9,0)="UCONT^%VYDAT",LIST(9,1)="La valeur doit correspondre a une date"
 S LIST(10,0)="10^%MZGAM3",LIST(10,1)="La valeur est une valeur prevaluee de l'attribut"
 Q
HELP 
 N LIB
 D CLEPAG^%VVIDEO
 X XY D BLD^%VVIDEO,^%VZCDB("Liste des controles possibles",0),NORM^%VVIDEO S DX=4,DY=3 X XY
 S LIB="" F I=0:0 S LIB=$O(LISTE(LIB)) Q:LIB=""  S DX=4 X XY D BLD^%VVIDEO W LIB S DX=10 X XY D NORM^%VVIDEO W LISTE(LIB,1) S DY=DY+$S(DTM:2,1:1)
 S DX=0,DY=20 X XY W "Remarque : il est possible de combiner plusieurs controles en tapant par exemple               1,2  dans la zone de saisie."
 D ^%VZEAVT(""),ENTETE,^%VAFIGRI,^%VAFISCR S TAB(ICC)="       " D ^%VAFFICH S TAB(ICC)="" D ^%VAFFICH S REFUSE=2
 Q
ENTETE S:RP="STANDARD" RP="STAND"
 D BLD^%VVIDEO,^%VZCDB("DEFINITION DE LA GRILLE DE GARDE -----> "_$S(RP="STAND":"PAR DEFAUT",1:RP),0)
 S DX=20,DY=1 X XY D BLD^%VVIDEO W $$^%QZCHW("Champ no 1 : Identificateur de la gamme") D NORM^%VVIDEO
 D BLD^%VVIDEO,^%VZCDB($S(UTIL="TRAZOM":"PAR DEFAUT",1:UTIL),22)
 Q

