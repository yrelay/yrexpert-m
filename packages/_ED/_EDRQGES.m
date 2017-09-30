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

;%EDRQGES^INT^1^59547,73869^0
EDRQGES ;
 
 
 
 
 
AJ N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MENU,REF,AD,CTR,RETOUR,REFUSE,LSTOCK
 D CLEPAG^%VVIDEO
 S (CMS,ABENDSCR)=0,SCR="RQSEQUI",%AJM="A",NOMTAB="",LSTOCK=$$^%QZCHW("Stockage")
 S RETOUR="FIN"
AJ2 D EFF
 
 K MENU
 S MENU(1)=$$^%QZCHW("Ajout")_"^AJ2"
 S MENU(2)=$$^%QZCHW("Fin")_"^"_RETOUR
AJ3 D ^%VMODISC
 I ABENDSCR G DIAL
 I $D(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Existe deja")_"..."),POCLEPA^%VVIDEO G DIAL
 D POCLEPA^%VVIDEO W LSTOCK H 1
 S ^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))=RESUL(5)_"^"
 D POCLEPA^%VVIDEO
 G AJ3
 
DIAL D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MENU",.AD,.CTR)
 I (CTR="A")!(CTR="F") G @RETOUR
 I CTR="R" D AFF
 G:AD'="" @AD
 G DIAL
FIN Q
 
 
CMS N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MENU,OR,REFUSE,RETOUR
 N REF,AD,CTR,U,GLO,REP,TABI,LSTOCK
 D CLEPAG^%VVIDEO,MENU("MENU")
 
 S (CMS,ABENDSCR)=0,SCR="RQSEQUI",%AJM="M",NOMTAB="",LSTOCK=$$^%QZCHW("Stockage")
CMS1 
 D EFF
 S PATOUCH(5)=1
 D ^%VMODISC
 I ABENDSCR G FIN
 I $$CHERCH=0 D RET G CMS1
 D AFF
DIAL2 D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MENU",.AD,.CTR)
 I CTR="F" G FIN
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
 F U=1:1:5 S OR(U)=RESUL(U)
 D ^%VMODISC
 K PATOUCH
 G:ABENDSCR MOD2
 I (((OR(1)'=RESUL(1))!(OR(2)'=RESUL(2)))!(OR(3)'=RESUL(3)))!(OR(4)'=RESUL(4)),$D(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Existe deja")_"..."),POCLEPA^%VVIDEO G MOD2
 K ^[QUI]RQQ(OR(1),OR(2),OR(3),OR(4))
 S ^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))=RESUL(5)_"^"
 G DIAL2
MOD2 F U=1:1:5 S RESUL(U)=OR(U)
 D AFF G DIAL2
 
 
SUP 
 D ^%VSQUEAK
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression")_" ?")'=1 G DIAL2
 K ^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))
 F U=1:1:5 S RESUL(U)=""
 D AFF G DIAL2
 
 
DUP 
 S %AJM="D"
 S DX=65,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW(" Duplication ")
 D NORM^%VVIDEO
 K PATOUCH
 F U=1:1:5 S OR(U)=RESUL(U)
DUP1 D ^%VMODISC
 I ABENDSCR S %AJM="M" D AFF G DIAL2
 I $D(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Existe deja")_"..."),POCLEPA^%VVIDEO G DUP2
 S ^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4))=RESUL(5)_"^"
 S %AJM="M"
 G DIAL2
DUP2 F U=1:1:5 S RESUL(U)=OR(U)
 D AFF G DUP1
 
AJ1 K PATOUCH
 F U=1:1:5 S OR(U)=RESUL(U)
 S %AJM="A",RETOUR="FINAJ"
 G AJ2
FINAJ S %AJM="M" F U=1:1:5 S RESUL(U)=OR(U)
 D AFF,MENU("MENU")
 G DIAL2
 
MENU(MN) 
 K @(MN)
 S @MN@(1)=$$^%QZCHW("+")_"^PLUS"
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 S @MN@(3)=$$^%QZCHW("Modif.")_"^MOD"
 S @MN@(4)=$$^%QZCHW("Suppression")_"^SUP"
 S @MN@(8)=$$^%QZCHW("Duplication")_"^DUP"
 S @MN@(9)=$$^%QZCHW("Ajout")_"^AJ1"
 Q
 
PL() 
 N L
 I RESUL(1)="" G CH0
 S L=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4)))
 I L'="" S RESUL(4)=L G CH1
 S L=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3)))
 I L'="" S RESUL(3)=L,RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),"")) G CH1
 S L=$O(^[QUI]RQQ(RESUL(1),RESUL(2)))
 I L'="" S RESUL(2)=L,RESUL(3)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),"")),RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),"")) G CH1
 S L=$O(^[QUI]RQQ(RESUL(1)))
 I L="" Q 0
 S RESUL(1)=L,RESUL(2)=$O(^[QUI]RQQ(RESUL(1),"")),RESUL(3)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),"")),RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),""))
 G CH1
 
MO() 
 N L
 I RESUL(1)="" Q 0
 S L=$ZP(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4)))
 I L'="" S RESUL(4)=L G CH1
 S L=$ZP(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3)))
 I L'="" S RESUL(3)=L,RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),"")) G CH1
 S L=$ZP(^[QUI]RQQ(RESUL(1),RESUL(2)))
 I L'="" S RESUL(2)=L,RESUL(3)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),"")),RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),"")) G CH1
 S L=$ZP(^[QUI]RQQ(RESUL(1)))
 I L="" Q 0
 S RESUL(1)=L,RESUL(2)=$O(^[QUI]RQQ(RESUL(1),"")),RESUL(3)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),"")),RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),""))
 G CH1
 
RET D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) Q
 
CHERCH() 
CH0 I RESUL(1)="" S RESUL(2)="",RESUL(1)=$O(^[QUI]RQQ("")) Q:RESUL(1)="" 0
 I RESUL(2)="" S RESUL(3)="",RESUL(2)=$O(^[QUI]RQQ(RESUL(1),"")) Q:RESUL(2)="" 0
 I RESUL(3)="" S RESUL(4)="",RESUL(3)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),"")) Q:RESUL(3)="" 0
 I RESUL(4)="" S RESUL(4)=$O(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),"")) Q:RESUL(2)="" 0
 I '($D(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4)))) Q 0
CH1 S RESUL(5)=$P(^[QUI]RQQ(RESUL(1),RESUL(2),RESUL(3),RESUL(4)),"^")
 Q 1
 
AFF 
 D ^%VAFIGRI,^%VAFISCR
 S DX=65,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW($S(%AJM="A":" Ajout ",%AJM="D":" Duplication ",1:" Modification "))
 D NORM^%VVIDEO Q
 
EFF F I=1:1:^%SCRE(SCR) S RESUL(I)=""
 D AFF
 Q

