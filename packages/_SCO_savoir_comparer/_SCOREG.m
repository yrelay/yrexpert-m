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

;%SCOREG^INT^1^59547,73888^0
SCOREG ;
 
 
 
 
 
AJ 
 D CLEPAG^%VVIDEO
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MN1,MENU1,REFUS,DES,ACT,ROUTREAF,DEJALU,TAB,Y1,LL,LI,REFUSE,SCR1,GLO,STOPUC,PS,Z,ZZ
 K RESUL
 
 S CMS=0,ABENDSCR=0,SCR="SCOREG1",%AJM="A",GLO=^%SCRE(SCR,"GLOSTOC"),NOMTAB="",ROUTREAF="REAFBIS^%SCOREG3"
AJ2 
 S MN1="MENU1"
 D EFF,MENU1(MN1)
AJ3 S DX=0,DY=11 D CLEBAS^%VVIDEO,^%VMODISC
 I ABENDSCR S DES(1)="",RESUL(1)="" G DIAL
 D MAJREG(.REFUS,1)
 G:REFUS AJ3
 D SAV
DIAL D POCLEPA^%VVIDEO,^%VQUIKMN(0,80,22,MN1,.AD,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D REAFF^%SCOREG3
 G:AD'="" @AD
 G DIAL
FIN 
 Q
 
CMS 
 D CLEPAG^%VVIDEO
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MN1,MENU1,REFUS,DES,ACT,ROUTREAF,DEJALU,TAB,Y1,LL,LI,REFUSE,SCR1,GLO,STOPUC,PS,Z,ZZ
 K RESUL
 S CMS=0,ABENDSCR=0,SCR="SCOREG1",GLO=^%SCRE(SCR,"GLOSTOC"),NOMTAB="",ROUTREAF="REAFBIS^%SCOREG3"
CMS1 
 S %AJM="C"
 D EFF,^%VMODISC
 I ABENDSCR G FIN
 S REFUS=0 F I=1:1:^%SCRE(SCR) S:RESUL(I)="" REFUS=1
 I '(REFUS) G CMS2
 I $$CHERCH^%SCOREG3 D AFF1^%SCOREG3 G CMS2
 D ^%VZEAVT($$^%QZCHW("Aucune regle n'a ete ecrite")) Q
CMS2 I '($D(@GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4)))) D ^%VZEAVT($$^%QZCHW("Fiche inexistante ")) G CMS1
 D SAV
 
 D AFF2^%SCOREG3
 
 D AFFACT,AFF3^%SCOREG3
 S MN1="MENU1" D MENU2(MN1)
DIAL2 S %AJM="C" D NORM^%VVIDEO,POCLEPA^%VVIDEO,^%VQUIKMN(0,80,22,MN1,.AD,.CTR)
 G:CTR="F" FIN
 I CTR="A" D CLEPAG^%VVIDEO G CMS1
 D:CTR="R" REAFF^%SCOREG3
 G:AD'="" @AD
 G DIAL2
 
PLUS 
 G PLUS^%SCOREG3
 
MOINS 
 G MOINS^%SCOREG3
 
DES 
 I DES(1)="" G DIAL2
 S %AJM="M" D AFF11^%SCOREG3 S %AJM="A" D RES
DES1 D ^%VMODISC S %AJM="C"
 I ABENDSCR D RES,AFF1^%SCOREG3 G DIAL2
 D MAJREG(.REFUS,0) I REFUS G DES
 I '($$COP) G DES
 K @GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5)) D SAV
 S @GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4),RESUL(5))=""
 S @GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4),RESUL(5),"MALUS")=0
 D AFF11^%SCOREG3 G DIAL2
COND 
 I DES(1)="" G FCOND
 D AFF2^%SCOREG3
 S GLOBAL="^[QUI]SCOMPREG"
 F I=DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5) S GLOBAL=$$CONCAS^%QZCHAD(GLOBAL,I)
 S GLOBAL=$$CONCAS^%QZCHAD(GLOBAL,"COND"),PLIG=1,%PROVEN="RQS",SAJM=%AJM
 D ZLISTE^%QULIMO(0,11,80,8,GLOBAL,.PLIG,"ADD^%SCOREG","SUP^%SCOREG")
 S %AJM=SAJM K SAJM
FCOND G:%AJM="A" DIAL
 G DIAL2
ADD 
 S BOOL=1
 D UCA^%SCOREG2(BOOL)
 Q
SUP 
 N RA
 S RA=$$VAL^%QULIMO("TETE")
 D:RA'="" KILL^%ANA(RA)
 S OK=1
 Q
ACT 
 I DES(1)="" G FACT
 K ACT D ACT1
FACT G:%AJM="A" DIAL
 G DIAL2
ACT1 
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM
 S SCR="SCOREG2",CMS=0,%AJM="M"
 D AFFACT
ACT3 D AFF3^%SCOREG3,^%VMODISC
 I ABENDSCR Q
 K @GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),"ACTION")
 I RESUL(1)="" Q
 S @GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),"ACTION",RESUL(1))=RESUL(2)
 Q
AFFACT 
 I '($D(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),"ACTION"))) S RESUL(1)="",RESUL(2)="" Q
 S RESUL(1)=$O(@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),"ACTION",""))
 S RESUL(2)=@GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),"ACTION",RESUL(1))
 Q
 
SUPRES 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de la regle")_" ?")'=1 G DIAL2
 K @GLO@(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5))
 G PLUS
 
DUP 
 S %AJM="D" D AFF11^%SCOREG3,RES
DUP1 D ^%VMODISC I '(ABENDSCR) G DUP2
 S %AJM="C" D RES,AFF1^%SCOREG3
 G DIAL2
DUP2 
 D MAJREG(.REFUS,0) I REFUS G DUP1
 I '($$COP) G DUP1
 D SAV,MAJREG(.REFUS,1)
 S %AJM="C" D AFF11^%SCOREG3 G DIAL2
 
REA 
 I DES(1)="" G FREA
 D POCLEPA^%VVIDEO,MSG^%VZEATT("reanalyse en cours")
 S I=$$REGLE^%SCOREAN(DES(1),DES(2),DES(3),DES(4),DES(5),0,0)
FREA G:%AJM="A" DIAL
 G DIAL2
IMP 
 D MSG^%VZEATT($$^%QZCHW("Impression en cours")_" ..."),UN^%SCORIMP(DES(1),"NON.EGALITE",DES(2),DES(3),DES(4),DES(5),GLO)
 G DIAL2
MAJREG(REP,AJ) 
 
 S REP=0,GLO=^%SCRE(SCR,"GLOSTOC")
 I ((((RESUL(1)="")!(RESUL(2)=""))!(RESUL(3)=""))!(RESUL(4)=""))!(RESUL(5)="") S REP=1 D ^%VZEAVT($$^%QZCHW("Tous les champs doivent etre remplis ")) Q
 I '(AJ) Q
 I $D(@GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4),RESUL(5))) D ^%VZEAVT($$^%QZCHW("Fiche deja existante ")),EFF Q
 S @GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4),RESUL(5))=""
 S @GLO@(RESUL(1),"NON.EGALITE",RESUL(2),RESUL(3),RESUL(4),RESUL(5),"MALUS")=0
 Q
EFF 
 F I=1:1:^%SCRE("SCOREG1") S RESUL(I)="",DES(I)=""
 D AFF1^%SCOREG3
 Q
 
MENU1(MN) 
 
 S @MN@(1)=$$^%QZCHW("Ajouter")_"^AJ3"
 S @MN@(2)=$$^%QZCHW("Conditions")_"^COND"
 S @MN@(3)=$$^%QZCHW("Action")_"^ACT"
 Q
MENU2(MN) 
 
 S @MN@(1)=$$^%QZCHW("+")_"^PLUS"
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 S @MN@(3)=$$^%QZCHW("description")_"^DES"
 S @MN@(4)=$$^%QZCHW("Conditions")_"^COND"
 S @MN@(5)=$$^%QZCHW("Action")_"^ACT"
 S @MN@(6)=$$^%QZCHW("Suppression")_"^SUPRES"
 S @MN@(7)=$$^%QZCHW("Duplication")_"^DUP"
 S @MN@(8)=$$^%QZCHW("Reanalyse")_"^REA"
 S @MN@(9)=$$^%QZCHW("Impression")_"^IMP"
 Q
 
COP() 
 S E="^["""_QUI_"""]SCOMPREG("""_DES(1)_""","""_DES(2)_""","_$S((DES(3)+0)=0:""""_DES(3)_"""",1:DES(3))_","""_DES(4)_""","""_DES(5)_""")"
 S R="^["""_QUI_"""]SCOMPREG("""_RESUL(1)_""","""_RESUL(2)_""","_$S((RESUL(3)+0)=0:""""_RESUL(3)_"""",1:RESUL(3))_","""_RESUL(4)_""","""_RESUL(5)_""")"
 I $D(@R) D ^%VZEAVT($$^%QZCHW("Cette fiche existe deja")_" !!") Q 0
 D ^%VZEATT,GLOCOP^%QCAGLC(E,R),POCLEPA^%VVIDEO
 Q 1
 
RES 
 F I=1:1:^%SCRE("SCOREG1") S RESUL(I)=DES(I)
 Q
SAV 
 F I=1:1:^%SCRE("SCOREG1") S DES(I)=RESUL(I)
 Q

