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

;%PSSADO2^INT^1^59547,73874^0
%PSSADO2 ;;06:18 PM  11 Dec 1991;
 
 
 
 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP
 N LSEL,REP,OPCOMP,%O,DO,OP
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LSEL=$$CONCAS^%QZCHAD(TEMP,"LSEL")
 S TOTO="^REMANENCE(""MENU"",""_$P($ZPOS,"^",2)_"")" I '($D(@TOTO)) D MKMENU
 S LCOUR="" D PFEN
AFF2 D REAFF
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,TOTO,.ADRES,.CONTR) G:CONTR="R" AFF2
 G:(CONTR="A")!(CONTR="F") ENDACT
 G:ADRES'="" @ADRES G ACTS
 
ENDACT D END^%QUAPAGM
 K @(TEMP) Q
 
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("DOMAINE")) Q
CADLL S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I
 D CARSP^%VVIDEO(40,0,3,$S(TADTM=0:38,1:40),1)
 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY
 D REV^%VVIDEO W LCOUR D NORM^%VVIDEO Q
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("LR")=35
 S @FEN@("B")="DOMAINE",@FEN@("A")=$$LISTIND^%QSGEST6("DOMAINE")
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%PSSADO2"
 S @FEN@("MAN")=0
 S @FEN@("C",1,"T")=$$^%QZCHW("Axiome de base"),@FEN@("C",1,"L")=40,@FEN@("C",1,"C")="PREDICAT"
 
 
 
 
 S @FEN@("ECRAN")="CADR^%PSSADO2"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM(FEN)
 Q
 
 
 
 
ENTREE D GO^%QUAPAGM G ACT2
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
 
CREAT D POCLEPA^%VVIDEO S DO=$$^%VZAME1($$^%QZCHW("Nom du domaine : ")) D POCLEPA^%VVIDEO G:CTRLA!(DO="") AFF2
 I $$EXISTED^%PSOPGES(DO) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Domaine existant, creation impossible")) G CREAT
 D CREERD^%PSOPGES(DO)
 D SAPRED(DO)
 D INIT2^%QUAPAGM
 
 G AFF2
 
MODIF D ^%QUAPAD($$^%QZCHW("MODIFICATION D'UN DOMAINE"))
 S DO=$$UN^%QUAPAGM G:DO="" AFF2
 D SAPRED(DO)
 G AFF2
 
SUPPR D ^%QUAPAD($$^%QZCHW("SUPPRESSION D'OPERATEUR(S)"))
 K @(LSEL) D ENS^%QUAPAGM(LSEL) G:'($D(@LSEL)) AFF2
 S REP=0
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer ce(ces) domaine(s) (et les operateurs associes) ?")) G:REP'=1 ACT2
 S DO="" F %O=0:0 S DO=$O(@LSEL@(DO)) Q:DO=""  D SUPPD^%PSOPGES(DO)
 K @(LSEL)
 D INIT2^%QUAPAGM
 G AFF2
 
DUPLI D ^%QUAPAD($$^%QZCHW("DUPLICATION D'UN DOMAINE"))
 S DO1=$$UN^%QUAPAGM G:DO1="" AFF2
DUPL2 D POCLEPA^%VVIDEO S DO2=$$^%VZAME1($$^%QZCHW("Nom du domaine : ")) D POCLEPA^%VVIDEO G:CTRLA!(DO2="") AFF2
 I $$EXISTED^%PSOPGES(DO2) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Domaine existant, creation impossible")) G DUPL2
 D DUPLD^%PSOPGES(DO1,DO2)
 D INIT2^%QUAPAGM
 
 G AFF2
 
 
 
MKMENU N TOTO
 S TOTO="^REMANENCE(""MENU"",""_$P($ZPOS,"^",2)_"")"
 S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE"
 S @TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Creer")_"^CREAT"
 S @TOTO@(2,"COM")=$$^%QZCHW("Creation d'un operateur")
 S @TOTO@(3)=$$^%QZCHW("Modifier")_"^MODIF"
 S @TOTO@(3,"COM")=$$^%QZCHW("Modification d'un operateur")
 S @TOTO@(4)=$$^%QZCHW("Dupliquer")_"^DUPLI"
 S @TOTO@(4,"COM")=$$^%QZCHW("Duplication d'un operateur")
 S @TOTO@(5)=$$^%QZCHW("Supprimer")_"^SUPPR"
 S @TOTO@(5,"COM")=$$^%QZCHW("Suppression d'un operateur")
 S @TOTO@(6)="+^PLUS",@TOTO@(6,"EQU")="="
 S @TOTO@(6,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(7)="-^MOINS",@TOTO@(7,"EQU")="_"
 S @TOTO@(7,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(8)=$$^%QZCHW("Page")_"^PAGE"
 S @TOTO@(8,"COM")=$$^%QZCHW("Changement de page")
 S @TOTO@(9)=$$^%QZCHW("Repere")_"^REPER"
 S @TOTO@(9,"COM")=$$^%QZCHW("Voir le repere des pages")
 Q
 
 
SAPRED(DO) 
 N TAB,YG,YY1,YY2
 S YG=$$^%QZCHW("AXIOME DE BASE :")
SAPRED2 D POCLEPA^%VVIDEO
 S DX=2,DY=23 X XY W YG
 S TAB("%LDX")=76,TAB("%LGX")=36
 S TAB("PCX")=3+$L(YG),TAB("PCY")=23
 S YY1=$$^%QSCALIN("DOMAINE",DO,"PREDICAT",1)
 D ^%VLECFLD(YY1,"TAB",.CTR,.YY2)
 I YY2="?" S YY2=$$CHOIX^%PSPRSA
 I YY2="" Q
 I '($$EXIPRED^%PSPRGES(YY2)) D ^%VZEAVT($$^%QZCHW("predicat inconnu")) G SAPRED2
 D PA^%QSGESTI("DOMAINE",DO,"PREDICAT",YY2,1)
 Q
 
CHOIX() 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP
 N LSEL,REP,OPCOMP,%O,DO,OP
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LCOUR="" D PFEN
 D REAFF
 D ^%QUAPAD($$^%QZCHW("CHOIX D'UN DOMAINE"))
 S DO=$$UN^%QUAPAGM
 D END^%QUAPAGM
 K @(TEMP) Q DO

