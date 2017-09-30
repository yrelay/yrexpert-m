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
;! Nomprog     : %QS                                                          !
;! Module      : QS (Requetes et listes)                                      !
;! But         : Menu REQUETE                                                 !
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
;! HL002 ! HL     ! 07/07/12 ! PB caractères parasites avec terminal-gnome    !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%QS() ; 
 
 
 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP1,TEMP,PPAS
 D ^%VZEATT
 S PPAS=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TOTO=$$CONCAS^%QZCHAD(TEMP,"TOTO")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE"
 S @TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Creer")_"^CREAT"
 S @TOTO@(2,"COM")=$$^%QZCHW("Creation d'une requete")
 S @TOTO@(3)=$$^%QZCHW("Modifier")_"^MODIF"
 S @TOTO@(3,"COM")=$$^%QZCHW("Modification d'une requete")
 S @TOTO@(4)=$$^%QZCHW("Consulter")_"^CONSU"
 S @TOTO@(4,"COM")=$$^%QZCHW("Consultation d'une requete")
 S @TOTO@(5)=$$^%QZCHW("Activer")_"^ACTIV"
 S @TOTO@(5,"COM")=$$^%QZCHW("Activation d'une requete")
 S @TOTO@(6)=$$^%QZCHW("Dupliquer")_"^DUPLI"
 S @TOTO@(6,"COM")=$$^%QZCHW("Duplication d'une requete")
 S @TOTO@(7)=$$^%QZCHW("Supprimer")_"^SUPPR"
 S @TOTO@(7,"COM")=$$^%QZCHW("Suppression d'une requete")
 S @TOTO@(8)=$$^%QZCHW("Imprimer")_"^IMPRIM"
 S @TOTO@(8,"COM")=$$^%QZCHW("Impression de requetes")
 S @TOTO@(9)="+^PLUS",@TOTO@(9,"EQU")="="
 S @TOTO@(9,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(10)="-^MOINS",@TOTO@(10,"EQU")="_"
 S @TOTO@(10,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(11)=$$^%QZCHW("Page")_"^PAGE"
 S @TOTO@(11,"COM")=$$^%QZCHW("Changement de page")
 S @TOTO@(12)=$$^%QZCHW("Repere")_"^REPER"
 S @TOTO@(12,"COM")=$$^%QZCHW("Voir le repere des pages")
 S @TOTO@(13)=$$^%QZCHW("Reanalyser")_"^"_"ANAL"
 
 S @TOTO@(13,"COM")=$$^%QZCHW("Reanalyser une requete")
 S @TOTO@(14)=$$^%QZCHW("Reactiver")_"^REAC"
 S @TOTO@(14,"COM")=$$^%QZCHW("Reactivation de toutes les requetes")
 S @TOTO@(15)=$$^%QZCHW("Listes")_"^LIST"
 S @TOTO@(15,"COM")=$$^%QZCHW("Acces aux listes")
 S @TOTO@(16)=$$^%QZCHW("Substituer")_"^SUBST"
 S @TOTO@(16,"COM")=$$^%QZCHW("Substitution dans une requete")
 S @TOTO@(17)=$$^%QZCHW("Rechercher")_"^RECH"
 S @TOTO@(17,"COM")=$$^%QZCHW("Recherche d'une chaine dans une requete")
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 K ^[QUI]RQS3($J) S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,TOTO,.ADRES,.CONTR) G:CONTR="R" AFF2
 G:(CONTR="A")!(CONTR="F") ENDACT
 G:ADRES'="" @ADRES G ACTS
 
ENDACT D END^%QUAPAGM
 K @(TEMP) Q PPAS
 
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("REQUETES")) Q
CADLL S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I
 D CARSP^%VVIDEO(40,0,3,$S(TADTM=0:38,1:40),1)
 ;HL002 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:38))
 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:35))
 S DX=60-($L(LCOUR)\2),DY=1 X XY
 ;HL002 D REV^%VVIDEO W LCOUR D NORM^%VVIDEO Q
 D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO Q
 
ENTREE D GO^%QUAPAGM G ACT2
ANAL S R=$$DAFF^%QS9 G AFF2:R=2,AFF3:R=1,ACT2:1
CREAT S R=$$DAFF^%QS2 G AFF2:R=2,AFF3:R=1,ACT2:1
ACTIV K ^[QUI]RQS3($J) S R=$$DAFF^%QS3 G AFF2:R=2,AFF3:R=1,ACT2:1
CONSU S R=$$AFFREQ G AFF2:R=2,AFF3:R=1,ACT2:1
MODIF S R=$$DAFF^%QS8 G AFF2:R=2,AFF3:R=1,ACT2:1
DUPLI S R=$$DAFF^%QS5 G AFF2:R=2,AFF3:R=1,ACT2:1
SUPPR S R=$$DAFF^%QS7 G AFF2:R=2,AFF3:R=1,ACT2:1
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
REAC D ALL^%QS3BATC G ACT2
IMPRIM S R=$$^%QSPRINT G AFF2:R=2,AFF3:1
RECH S R=$$RECH^%QSCHR G AFF2
SUBST S R=$$SUBST^%QSCHR G AFF2
 
LIST 
 S PPAS=2
 G ENDACT
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="RQS",@FEN@("A")=$$LISTIND^%QSGEST6("RQS")
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QS" D IFEN(FEN) Q

IFEN(FEN) 
 S @FEN@("C",1,"T")=$$^%QZCHW("Date"),@FEN@("C",1,"L")=8,@FEN@("C",1,"C")="DATE.CREATION"
 S @FEN@("C",2,"T")=$$^%QZCHW("Heure"),@FEN@("C",2,"L")=5,@FEN@("C",2,"C")="HEURE.CREATION"
 S @FEN@("C",3,"T")=$$^%QZCHW("Auteur"),@FEN@("C",3,"L")=6,@FEN@("C",3,"C")="AUTEUR"
 S @FEN@("C",4,"T")=$$^%QZCHW("Site"),@FEN@("C",4,"L")=5,@FEN@("C",4,"C")="SITE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",5,"L")=32,@FEN@("C",5,"C")="COMM"
 S @FEN@("ECRAN")="CADR^%QS0D"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM(FEN)
 Q
 
AFFREQ() D ^%QUAPAD($$^%QZCHW("CONSULTATION D'UNE REQUETE"))
 S R=$$UN^%QUAPAGM Q:R="" 1
 N VAR,CONT,BASE,COMM,NOLC,NOLV,REQ
 D INIT^%QS4(R),^%VZEAVT("") Q 2
 
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q

REAFI ;Affiche l'entête du menu REQUETE
 D CADL,CADLL Q

TESTATT N RQ,IRQ,CC,IC,GLA,VU,GET
 S GLA="^[QUI]RQSDON(""RQS"",""ATT"")"
 S RQ=""
BCLRQ S RQ=$O(^[QUI]RQS1(RQ)) G:RQ="" RES
 D REV^%VVIDEO W !,RQ D NORM^%VVIDEO
 S CC=""
BCLRQL S CC=$O(^[QUI]RQS1(RQ,"CONTRAINTES",CC)) G:CC="" BCLRQ
 W !,^[QUI]RQS1(RQ,"CONTRAINTES",CC),!," ->"
 I $D(^[QUI]RQS1(RQ,"CONTRAINTES",CC,"TABATT")) S TB=^[QUI]RQS1(RQ,"CONTRAINTES",CC,"TABATT"),GET(TB)="" I $D(@GLA@(TB)) K GET(TB) S VU(TB)="",IAT="" F  S IAT=$O(@GLA@(TB,IAT)) Q:IAT=""  W IAT,"  "
 G BCLRQL
RES W !,!,"NOEUD INCONNUS"
 S TABATT="" F  S TABATT=$O(GET(TABATT)) Q:TABATT=""  W !,TABATT
 W !,!,"NOEUDS NON REFERENCES"
 S TABATT="" F  S TABATT=$O(@GLA@(TABATT)) Q:TABATT=""  I '($D(VU(TABATT))) W !,TABATT
 Q

