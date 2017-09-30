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

;TORQSL01^INT^1^59547,74875^0
TORQSL01 ;
 D INIT
DEB D ACT
FIN K ^LTREQU($J) Q
 
REQU K ^LTREQU($J) S ^LTREQU($J,"REQUETES")="" G DEB
 
GROU K ^LTREQU($J) S ^LTREQU($J,"GROUPAGE")="" G DEB
 
ALL D INIT G DEB
INIT K ^LTREQU($J) N I,%I S I=-1 F %I=0:0 S I=$N(^[QUI]QUERY2("L0","SOURCE",I)) Q:I=-1  S ^LTREQU($J,I)=""
 Q
 
ACT N TOTO,TATA,TOTO1,TATA1,ADRES,CONTR,LCOUR,FEN,UC
 D ^%QS3INIT
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I UC="VAX" S TOTO="TOTO1",TATA="TATA1",TUTU="TUTU1",TETE="TETE",FEN="FEN"
 I UC'="VAX" S TOTO=$$CONCAS^%QZCHAD(TEMP,"TOTO"),TATA=$$CONCAS^%QZCHAD(TEMP,"TATA"),TUTU=$$CONCAS^%QZCHAD(TEMP,"TUTU"),FEN=$$CONCAS^%QZCHAD(TEMP,"FEN"),TETE=$$CONCAS^%QZCHAD(TEMP,"TETE")
 K @(TOTO) S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE",@TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Lister")_"^INDIV",@TOTO@(2,"COM")=$$^%QZCHW("Lister les individus d'une liste")
 S @TOTO@(3)=$$^%QZCHW("Graphiques")_"^GRAPH",@TOTO@(3,"COM")=$$^%QZCHW("Representations graphiques")
 S @TOTO@(4)=$$^%QZCHW("Primitives")_"^PRIM",@TOTO@(4,"COM")=$$^%QZCHW("Primitives ensemblistes sur les listes")
 S @TOTO@(5)=$$^%QZCHW("Traiter")_"^TRAIT",@TOTO@(5,"COM")=$$^%QZCHW("Traitements sequentiels sur les listes")
 S @TOTO@(6)=$$^%QZCHW("Supprimer")_"^SUPPR",@TOTO@(6,"COM")=$$^%QZCHW("Supprimer des listes")
 S @TOTO@(7)="+^PLUS",@TOTO@(7,"EQU")="=",@TOTO@(7,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(8)="-^MOINS",@TOTO@(8,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(9)=$$^%QZCHW("Page")_"^PAGE",@TOTO@(9,"COM")=$$^%QZCHW("Changer de page")
 S @TOTO@(10)=$$^%QZCHW("Repere")_"^REPER",@TOTO@(10,"COM")=$$^%QZCHW("Afficher le repere des pages")
 S @TOTO@(11)=$$^%QZCHW("Identifiants")_".TOTEM^IDFT",@TOTO@(11,"COM")=$$^%QZCHW("Definition des identifiants TOTEM")
 S @TOTO@(12)=$$^%QZCHW("Etudes")_".TOTEM^ETUT",@TOTO@(12,"COM")=$$^%QZCHW("Lancement par lot d'etudes TOTEM")
 S @TOTO@(13)=$$^%QZCHW("Identifiants #&# etudes")_" TOTEM^IDTT",@TOTO@(13,"COM")=$$^%QZCHW("Identifiants + Lancement d'etudes TOTEM par lot")
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 
ACTS S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TOTO,.ADRES,.CONTR) G:CONTR="R" AFF2 G:(CONTR="A")!(CONTR="F") ENDACT G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM K @(TEMP) Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,"LISTES") Q
CADLL S LCOUR=WHOIS_" sur "_$I
 D CARSP^%VVIDEO(40,0,3,40,1) S DX=41,DY=1 X XY W $J("",38)
 S DX=60-($L(LCOUR)\2),DY=1 D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO Q
AFFLI G AFF2:R=2,AFF3:R=1,ACT2:1
IDFT S R=$$IDF^TORQSL02 G AFFLI
ETUT S R=$$ETU^TORQSL02 G AFFLI
IDTT S R=$$IET^TORQSL02 G AFFLI
ENTREE D GO^%QUAPAGM G ACT2
SUPPR S R=$$^%QS0SUPP G AFFLI
INDIV S R=$$^%QS0L G AFFLI
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
TRAIT S R=$$^%TLDIALO G AFFLI
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19,@FEN@("B")="L0",@FEN@("A")=$$LISTIND^%QSGEST6("L0"),@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QS0D"
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD",@FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=9,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE",@FEN@("C",4,"L")=23,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADR^TORQSL01",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 I $D(^DERLISTE($I)),^DERLISTE($I)'="",$$EX^%QS0(^DERLISTE($I)) D AFFP^%QUAPAGM(^DERLISTE($I))
 Q
AFFREQ(O,B) N S S S=$$^%QSCALVA(B,O,"SOURCE") G:S'="REQUETES" EF N R S R=$$^%QSCALVA(B,O,"AUTRE") G:R="" EF G:'($D(^[QUI]RQS1(R))) EF
 N VAR,CONT,BASE,COMM,NOLC,NOLV,REQ D INIT^%QS4(R),^%VZEAVT("") Q 2
EF D ^%VSQUEAK Q 0
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
PRIM 
 D TATA^%QS0DPG
ACTA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TATA,.ADRES,.CONTR)
 I CONTR="R" D REAFF G ACTA
 G:(CONTR="A")!(CONTR="F") ACT2 G:ADRES'="" @ADRES G ACTA
ATAFLI G ATA2:R=2,ATA3:R=1,ACTA:1
MANIP S R=$$^%QS0EDM(TETE) G ATAFLI
COMPL S R=$$^%QS0COMP G ATAFLI
INTER S R=$$^%QS0INTN G ATAFLI
UNION S R=$$^%QS0UNIN G ATAFLI
TRI S R=$$^%QS0TRIE G ATAFLI
VALE S R=$$^%QS0VALE G ATAFLI
DUPLI S R=$$^%QS0DUPL G ATAFLI
PART S R=$$^%QS0PART G ATAFLI
NETOY S R=$$^%QS0NTOY G ATAFLI
ATA2 D REAFF G ACTS
ATA3 G ACTS
 
GRAPH 
 D TUTU^%QS0DPG
ACTU S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TUTU,.ADRES,.CONTR)
 I CONTR="R" D REAFF G ACTU
 G:(CONTR="A")!(CONTR="F") ACT2 G:ADRES'="" @ADRES G ACTU
ATUFLI G ATU2:R=2,ATU3:R=1,ACTU:1
ATU2 D REAFF G GRAPH
ATU3 G GRAPH
ATU4 D REAFF
GRAPHI N HIS
 D CHOIX^%QS0DPG(.HIS,.CONTR) G:(CONTR="A")!(CONTR="F") AFF2
 I HIS'=1 D VISU^%HXIHIT2($$ADRHIS^%HXIHITU,HIS) G GRAPHI
GTITI D REAFF,TITI^%QS0DPG
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TITI,.ADRES,.CONTR)
 I CONTR="R" D REAFF G GRAPHI
 G:(CONTR="A")!(CONTR="F") ACT2 G:ADRES'="" @ADRES G GRAPHI
GRAPH1 S R=$$^%QS0G3 G ATUFLI
GRAPH2 S R=$$^%QS0G5 G ATUFLI
GRAPH3 S R=$$^%QS0G4 G ATUFLI
GRAPH4 D POCLEPA^%VVIDEO S DX=0,DY=23 X XY S REP=$$MES^%VZEOUI($$^%QZCHW("Necessite 1 ecran / 1 imprimante graphique. Continuons-nous ?"),"N") D POCLEPA^%VVIDEO G:(REP=-1)!(REP=0) ACTU
 S R=$$^%QS0G G ATUFLI
 ;
 ;

