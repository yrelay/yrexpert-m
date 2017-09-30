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

;%DLANCEM^INT^1^59547,73867^0
DLANCEM ;
 
 
 
 
AJ N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MENU,REF,AD,CTR,RETOUR,REFUSE,REPART
 I $$CONFINS^%DLCON1=0 Q
 D CLEPAG^%VVIDEO
 S (CMS,ABENDSCR)=0,SCR="DLANCEM",%AJM="A",NOMTAB=""
 S RETOUR="FIN"
AJ2 D EFF
 
 K MENU
 S MENU(1)=$$^%QZCHW("Ajout")_"^AJ2"
 S MENU(2)=$$^%QZCHW("Fin")_"^"_RETOUR
AJ3 D ^%VMODISC
 I ABENDSCR G DIAL
 D STO(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),.REF)
 G:REF AJ3
DIAL D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MENU",.AD,.CTR)
 I (CTR="A")!(CTR="F") G @RETOUR
 I CTR="R" D AFF
 G:AD'="" @AD
 G DIAL
FIN Q
 
 
CMS N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MENU,OR,REFUSE,RETOUR
 N REF,AD,CTR,U,GLO,REP,LIEN,TABI,MODEX,VISU,ART,REPART
 I $$CONFINS^%DLCON1=0 Q
 S MODEX=0,VISU=1
 D CLEPAG^%VVIDEO,MENU("MENU")
 
 S (CMS,ABENDSCR)=0,SCR="DLANCEM",%AJM="M",NOMTAB=""
 S REP=$$LAN^%DLCON2,GLO=$$LISTIND^%QSGEST6(REP)
 S LIEN=$$LIEN1^%QSGEL2(REP,$$ART^%DLCON2,3)
 S TABI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABI") K @(TABI)
CMS1 
 D EFF
 F U=2:1:6 S PATOUCH(U)=1
 D ^%VMODISC
 I ABENDSCR K @(TABI) G FIN
 I $$CHERCH=0 D RET G CMS1
 D AFF
DIAL2 D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MENU",.AD,.CTR)
 I CTR="F" K @(TABI) G FIN
 I CTR="A" G CMS1
 I CTR="R" D AFF
 G:AD'="" @AD
 G DIAL2
 
PLUS I $$PL D AFF G DIAL2
 D RET G DIAL2
 
MOINS I $$MO D AFF G DIAL2
 D RET G DIAL2
 
MOD 
 K PATOUCH
 F U=1,2 S PATOUCH(U)=1
 F U=1:1:7 S OR(U)=RESUL(U)
 D ^%VMODISC
 K PATOUCH
 I ABENDSCR=0 D CH(RESUL(1)) G DIAL2
 F U=1:1:7 S RESUL(U)=OR(U)
 D AFF G DIAL2
 
DATEFI 
 G DATEFI^%DLANCE3
 
RES 
 I RESUL(1)="" D ^%VSQUEAK G DIAL2
 D ^%DLANCE2(RESUL(1))
 D AFF G DIAL2
 
SUP 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression du lancement"))'=1 G DIAL2
 D SUPL(RESUL(1),RESUL(2))
 F U=1:1:7 S RESUL(U)=""
 D AFF G DIAL2
 
SUPCHA 
 I RESUL(1)="" D ^%VSQUEAK G DIAL2
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression des charges")_" ?")'=1 G DIAL2
 S ART=RESUL(2)
 D RETRAIT^%DLLANC2(REP,RESUL(1),"","")
 G DIAL2
 
DUP 
 S %AJM="D"
 S DX=65,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW(" Duplication ")
 D NORM^%VVIDEO
 K PATOUCH
 F U=1:1:7 S OR(U)=RESUL(U)
DUP1 D ^%VMODISC
 I ABENDSCR S %AJM="M" D AFF G DIAL2
 D STO(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),.REF)
 I '(REF) S %AJM="M" G DIAL2
 F U=1:1:7 S RESUL(U)=OR(U)
 D AFF G DUP1
 
AJ1 K PATOUCH
 F U=1:1:7 S OR(U)=RESUL(U)
 S %AJM="A",RETOUR="FINAJ"
 G AJ2
FINAJ S %AJM="M" F U=1:1:7 S RESUL(U)=OR(U)
 D AFF,MENU("MENU")
 G DIAL2
 
MENU(MN) 
 K @(MN)
 S @MN@(1)=$$^%QZCHW("+")_"^PLUS"
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 S @MN@(3)=$$^%QZCHW("Modif.")_"^MOD"
 S @MN@(4)=$$^%QZCHW("Dates.fixes")_"^DATEFI"
 S @MN@(5)=$$^%QZCHW("Resultats")_"^RES"
 S @MN@(6)=$$^%QZCHW("Suppr.")_"^SUP"
 S @MN@(7)=$$^%QZCHW("Suppr.charges")_"^SUPCHA"
 S @MN@(8)=$$^%QZCHW("Duplic.")_"^DUP"
 S @MN@(9)=$$^%QZCHW("Ajout")_"^AJ1"
 Q
 
PL() 
 N L
 S L=$O(@GLO@(RESUL(1))) I L="" Q 0
 S RESUL(1)=L
 G CH1
MO() 
 N L
 S L=$ZP(@GLO@(RESUL(1))) I L="" Q 0
 S RESUL(1)=L
 G CH1
 
RET D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) Q
 
CHERCH() 
 I RESUL(1)="" S RESUL(1)=$O(@GLO@("")) Q:RESUL(1)="" 0
 I '($D(@GLO@(RESUL(1)))) S RESUL(1)=$O(@GLO@(RESUL(1))) Q:RESUL(1)="" 0
CH1 K @(TABI)
 D MVG^%QSCALVA(REP,RESUL(1),LIEN,TABI,.TYP)
 S RESUL(2)=$O(@TABI@(""))
CH2 S RESUL(3)=$$^%QSCALVA(REP,RESUL(1),"GAMME")
 N ATR S ATR=$$DELAI^%DLCON2
 S RESUL(5)=$$AFFI^%QMDAUC(REP,ATR,$$^%QSCALVA(REP,RESUL(1),ATR))
 S RESUL(4)=$$^%QSCALVA(REP,RESUL(1),"QUANTITE")
 S RESUL(6)=$$^%QSCALVA(REP,RESUL(1),"STATUT")
 S RESUL(7)=$$^%QSCALVA(REP,RESUL(1),"STADE")
 Q 1
 
SUPL(L,ART) 
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 
 D RETRAIT^%DLLANC2(REP,L,"","")
 
SUPL2 D SX^%QSGESTK(REP,L)
 Q
 
CH(L) 
 N DEL,ATR
 D MSG^%VZEATT($$^%QZCHW("Modification des parametres"))
 D PA^%QSGESTI(REP,L,"GAMME",RESUL(3),1)
 D ST2(L,RESUL(5),RESUL(4),RESUL(6),RESUL(7))
 Q
 
AFF 
 D ^%VAFIGRI,^%VAFISCR
 S DX=65,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW($S(%AJM="A":" Ajout ",%AJM="D":" Duplication ",1:" Modification "))
 D NORM^%VVIDEO Q
 
STO(L,A,GAM,QTE,DEL,ST,STA,STOP) 
 N REPA,REP,REF,LIEN,MSG,REFUSE
 S:QTE="" QTE=1
 S STOP=1,REPA=$$ART^%DLCON2,REP=$$LAN^%DLCON2
 
 S LIEN=$$LIEN1^%QSGEL2(REP,REPA,3)
 I (L="")!(A="") D ^%VZEAVT($$^%QZCHW("Les 2 premiers champs doivent etre remplis")) Q
 D LAN^%DLANCUC(L) I REFUSE=1 Q
 I '($$IR^%QSGEST5(REPA,A)) D ^%VZEAVT($$NOMLOG^%QSF(REPA)_" "_A_" "_$$^%QZCHW("inexistant")) Q
 I $$EXILIEN^%QSGES21(L,LIEN,A) D ^%VZEAVT($$^%QZCHW("Ces individus sont deja lies")) Q
 I $$GAM^%DLANCUC(A,GAM)=0 Q
 I '($$IR^%QSGEST5(REP,L)) S REF=$$CREER^%QSGEIND(REP,L,"",1,.MSG) I REF=1 D ^%VZEAVT(MSG) Q
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde en cours"))
 D ADDS^%QSGEST3(REP,L,LIEN,REPA,A)
 D PA^%QSGESTI(REP,L,"GAMME",GAM,1)
 D ST2(L,DEL,QTE,ST,STA)
 S STOP=0 Q
 
ST2(L,DEL,QTE,ST,STA) 
 N REP,ATR
 S REP=$$LAN^%DLCON2,ATR=$$DELAI^%DLCON2
 S DEL=$$INTF^%QMDAUC(REP,ATR,DEL)
 D PA^%QSGESTI(REP,L,ATR,DEL,1)
 D PA^%QSGESTI(REP,L,"QUANTITE",QTE,1)
 D PA^%QSGESTI(REP,L,"STATUT",ST,1)
 D PA^%QSGESTI(REP,L,"STADE",STA,1)
 Q
 
EFF F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 D AFF
 Q

