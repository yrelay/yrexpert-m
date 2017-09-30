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

;%QMEA^INT^1^59547,73877^0
QMEA ;
 
 
 
 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP1,TEMP,N,GLOB,S,RETOUR
 S TEMP=$$TEMP^%INCOIN("TEMP1",$P($ZPOS,"^",2))
 S TOTO=$$CONCAS^%QZCHAD(TEMP,"TOTO")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 K @(TEMP)
 S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE"
 S @TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Creer")_"^CREAT"
 S @TOTO@(2,"COM")=$$^%QZCHW("Creation d'une saisie")
 S @TOTO@(3)=$$^%QZCHW("Consulter/Modifier")_"^MODIF"
 S @TOTO@(3,"COM")=$$^%QZCHW("Consultation, modification d'une saisie")
 S @TOTO@(4)=$$^%QZCHW("Supprimer")_"^SUPP"
 S @TOTO@(4,"COM")=$$^%QZCHW("Suppression d'une saisie")
 S @TOTO@(5)=$$^%QZCHW("Imprimer")_"^IMPRIM"
 S @TOTO@(5,"COM")=$$^%QZCHW("Impression de saisies")
 S @TOTO@(6)=$$^%QZCHW("Dupliquer")_"^DUPLI"
 S @TOTO@(6,"COM")=$$^%QZCHW("Duplication d'une saisie")
 S @TOTO@(7)="+^PLUS",@TOTO@(7,"EQU")="="
 S @TOTO@(7,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(8)="-^MOINS",@TOTO@(8,"EQU")="_"
 S @TOTO@(8,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(9)=$$^%QZCHW("Page")_"^PAGE"
 S @TOTO@(9,"COM")=$$^%QZCHW("Changer de page")
 S @TOTO@(10)=$$^%QZCHW("Repere")_"^REPER"
 S @TOTO@(10,"COM")=$$^%QZCHW("Voir le repere des pages")
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,TOTO,.ADRES,.CONTR)
 G:CONTR="R" AFF2 G:(CONTR="A")!(CONTR="F") ENDACT
 G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM
 K @(TEMP) Q
 
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("SAISIES")) Q
CADLL D CARSP^%VVIDEO(40,0,3,40,1)
 S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I,DX=41,DY=1 X XY
 W $J("",$S(IBMPC&MODTM:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 D REV^%VVIDEO X XY W LCOUR
 D NORM^%VVIDEO Q
 
ENTREE 
 D GO^%QUAPAGM G ACT2
 
CREAT 
 S RETOUR="CREAT2^%QMEA"
 G AJ^%QMEASA1
CREAT2 D REINIT
 G AFF2
 
MODIF 
 S S=$$UN^%QUAPAGM G:S="" AFF3
 S TEMPB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"QMMOD") K @(TEMPB)
 S TEMPO=$$CONCAS^%QZCHAD(TEMPB,"VARIABLES")
 D INIT^%ANGEPIL
 D EMPIL^%ANGEPIL("RETMOD^%QMEA") G ^%QMEAMOD
RETMOD 
 D EPIL^%ANGEPIL
 K @(TEMPB)
 G AFF2
 
DUPLI 
 S S=$$UN^%QUAPAGM G:S="" AFF2
 D:$$^%QMEADUP(S) REINIT
 G AFF2
 
IMPRIM 
 D ^%QMEAPRI G AFF3
 
SUPP 
 S GLOB=$$CONCAS^%QZCHAD(TEMP,"GLOB") K @(GLOB)
 D ENS^%QUAPAGM(GLOB) G:'($D(@GLOB)) AFF3
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 S S=""
BSUPP S S=$O(@GLOB@(S))
 I S="" K @(GLOB) D REINIT G AFF2
 W "."
 D ^%QMEASUP(S)
 G BSUPP
 
PLUS 
 D PLUS^%QUAPAGM G ACT2
MOINS 
 D MOINS^%QUAPAGM G ACT2
PAGE 
 D PAGE^%QUAPAGM G ACT2
REPER 
 D REPER^%QUAPAGM G ACT2
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="SAISIE.I",@FEN@("A")=$$LISTIND^%QSGEST6("SAISIE.I")
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QMEA"
 S @FEN@("C",1,"T")=$$^%QZCHW("1er attribut"),@FEN@("C",1,"L")=15,@FEN@("C",1,"C")="ATTRIBUT"
 S @FEN@("C",2,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",2,"L")=47,@FEN@("C",2,"C")="COMMENTAIRE"
 S @FEN@("ECRAN")="CADR^%QMEA"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM(FEN)
 Q
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
REINIT D END^%QUAPAGM
 D PFEN Q
 
 
BASE() 
 Q "SAISIE.I"
AIDE() 
 Q "AIDE"
 
LISTE(SAIS) 
 N FEN S FEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SAISIES") K @(FEN)
 D PFEN S @FEN@("AFF")="",@FEN@("ECRAN")="CADLIS^%QMEA"
 D CADLIS
 S SAIS=$$UN^%QUAPAGM
 D END^%QUAPAGM
 K @(FEN) Q
CADLIS D CLEPAG^%VVIDEO,AFFICH^%QUAPAGM Q

