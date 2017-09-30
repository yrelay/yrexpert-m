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

;%SCODDOM^INT^1^59547,73888^0
SCODOM ;
 
 
 
 
AJ D CLEPAG^%VVIDEO
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MN1,MENU1,REFUS,DES,ACT,DOM,AD,CTR,GLO,PATOUCH
 
 S CMS=0,ABENDSCR=0,SCR="SCODOM",%AJM="A",GLO="^[QUI]SCOMDOM",NOMTAB=""
AJ2 
 S MN1="MENU1"
 D EFF^%SCODDO2,MENU1^%SCODDO2(MN1)
AJ3 D ^%VMODISC
 I ABENDSCR S RESUL(1)="" G DIAL
 I RESUL(1)="" S DOM="" G DIAL
 I $$EXIST(RESUL(1)) D ^%VZEAVT($$^%QZCHW("Domaine deja existant")) G AJ2
 S @GLO@(RESUL(1),"COMMENT")=RESUL(2),DOM=RESUL(1)
DIAL D ^%VQUIKMN(0,80,23,MN1,.AD,.CTR)
 I (CTR="A")!(CTR="F") G:$$VERIF FIN G DIAL
 I CTR="R" D REAFF^%SCODDO2
 G:AD'="" @AD
 G DIAL
FIN Q
 
CMS 
 D CLEPAG^%VVIDEO
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MN1,MENU1,REFUS,DES,ACT,DOM,NDOM,AD,CTR,GLO,PATOUCH
 S CMS=0,ABENDSCR=0,SCR="SCODOM",%AJM="M",GLO="^[QUI]SCOMDOM",NOMTAB=""
CMS1 
 D EFF^%SCODDO2 S PATOUCH(2)=1
 D ^%VMODISC
 I ABENDSCR G FIN
 I RESUL(1)="" S RESUL(1)=$O(@GLO@("")) I (RESUL(1)="")!(RESUL(1)="z") D ^%VZEAVT($$^%QZCHW("aucun domaine n'a ete defini")) G FIN
 I '($$EXIST(RESUL(1))) D ^%VZEAVT($$^%QZCHW("domaine inconnu")) G CMS1
 S DOM=RESUL(1)
CMS2 
 S RESUL(2)=@GLO@(RESUL(1),"COMMENT") D ^%VAFISCR
 
 D AFF2^%SCODDO2
 
 D AFF3^%SCODDO2
 S MN1="MENU1" D MENU2^%SCODDO2(MN1)
DIAL2 D POCLEPA^%VVIDEO S %AJM="M"
 D ^%VQUIKMN(0,80,23,MN1,.AD,.CTR)
 I CTR="F" G:$$VERIF FIN G DIAL2
 I CTR="A" G:$$VERIF CMS1 G DIAL2
 I CTR="R" D REAFF^%SCODDO2
 G:AD'="" @AD
 G DIAL2
 
PLUS 
 S NDOM=$O(@GLO@(DOM)) I (NDOM="")!(NDOM="z") D ^%VZEAVT($$^%QZCHW("Recherche epuisee")_" ...") G DIAL2
 G SUITE
MOINS 
 S NDOM=$ZP(@GLO@(DOM)) I (NDOM="")!(NDOM="z") D ^%VZEAVT($$^%QZCHW("Recherche epuisee")_" ...") G DIAL2
 
SUITE S (RESUL(1),DOM)=NDOM,RESUL(2)=@GLO@(RESUL(1),"COMMENT")
 D REAFF^%SCODDO2
 G DIAL2
MODIF 
 K PATOUCH
 S PATOUCH(1)=1,CMS=0,ABENDSCR=0
 D ^%VMODISC
 K PATOUCH
 I ABENDSCR S RESUL(2)=@GLO@(RESUL(1),"COMMENT") D ^%VAFISCR G DIAL2
 S @GLO@(RESUL(1),"COMMENT")=RESUL(2)
 G DIAL2
DUP 
 I ('($D(@GLO@(DOM,"REP.SOURCE"))))!('($D(@GLO@(DOM,"REP.CIBLE")))) D ^%VZEAVT($$^%QZCHW("Ce domaine ne peut etre duplique: Absence de repertoires references ou de repertoires cibles")) G DIAL2
 D POCLEPA^%VVIDEO S DUP=""
 D LIRE2^%VREAD($$^%QZCHW("Nom du domaine a creer")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.DUP)
 I (DUP="")!(CTR="A") G DIAL2
 I $$EXIST(DUP) D ^%VZEAVT($$^%QZCHW("Le domaine")_" "_DUP_" "_$$^%QZCHW("existe deja ...")) G DUP
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(GLO,DOM),$$CONCAS^%QZCHAD(GLO,DUP))
 S (DOM,RESUL(1))=DUP K DUP
 D ^%VAFISCR
 G DIAL2
SUPRES 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression du domaine ")_DOM_" ? ")'=1 G DIAL2
 K @GLO@(DOM)
 D EFF^%SCODDO2
 G DIAL2
SOURCE 
 D AFF2^%SCODDO2
 N GLOBAL S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP.SOURCE") K @(GLOBAL)
 S PLIG=1
 S REP="" F I=1:1 S REP=$O(@GLO@(DOM,"REP.SOURCE",REP)) Q:REP=""  S @GLOBAL@(I)=REP
 K @GLO@(DOM,"REP.SOURCE")
 D ZLISTE^%QULIMO(1,7,79,8,GLOBAL,.PLIG,"EXI^%SCODDOM","SUP^%SCODDOM")
 S LIG="" F I=1:1 S LIG=$O(@GLOBAL@(LIG)) Q:LIG=""  S REP=@GLOBAL@(LIG) S:REP'="" @GLO@(DOM,"REP.SOURCE",REP)=""
 K @(GLOBAL)
 I %AJM="A" G DIAL
 G DIAL2
 
CIBLE 
 D AFF3^%SCODDO2
 N GLOBAL S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP.CIBLE") K @(GLOBAL)
 S PLIG=1
 S REP="" F I=1:1 S REP=$O(@GLO@(DOM,"REP.CIBLE",REP)) Q:REP=""  S @GLOBAL@(I)=REP
 K @GLO@(DOM,"REP.CIBLE")
 D ZLISTE^%QULIMO(1,15,79,7,GLOBAL,.PLIG,"EXI^%SCODDOM","SUP^%SCODDOM")
 S LIG="" F I=1:1 S LIG=$O(@GLOBAL@(LIG)) Q:LIG=""  S REP=@GLOBAL@(LIG) S:REP'="" @GLO@(DOM,"REP.CIBLE",REP)=""
 K @(GLOBAL)
 I %AJM="A" G DIAL
 G DIAL2
 
EXI 
 I $$REPM^%QSGEST9(Y1)=0 D ^%VZEAVT(Y1_$$^%QZCHW(" n'est pas un repertoire")) S OK=0 Q
 S OK=1
 Q
SUP 
 S OK=1
 Q
VERIF() 
 I $$^%QCAZG("DOM")="" Q 1
 I '($D(^[QUI]SCOMDOM(DOM,"REP.SOURCE"))) D ^%VZEAVT($$^%QZCHW("Vous devez definir au moins un repertoire reference")) Q 0
 I '($D(^[QUI]SCOMDOM(DOM,"REP.CIBLE"))) D ^%VZEAVT($$^%QZCHW("Vous devez definir au moins un repertoire cible")) Q 0
 Q 1
 
ADR(DOM) 
 D CLEPAG^%VVIDEO
 N RESUL,SCR,m,NOMTAB,AFRESU,CMS,ABENDSCR,%AJM,MN1,MENU1,REFUS,DES,ACT,NDOM,AD,CTR,GLO
 S CMS=0,ABENDSCR=0,SCR="SCODOM",%AJM="M",GLO="^[QUI]SCOMDOM",NOMTAB=""
 D ^%VAFIGRI
 S RESUL(1)=DOM
 G CMS2
 
EXIST(D) 
 I '($D(^[QUI]SCOMDOM(D))) Q 0
 Q 1

