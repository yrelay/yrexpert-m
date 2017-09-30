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
;! Nomprog     : %QS0DP                                                       !
;! Module      : QS (Requetes et listes)                                      !
;! But         : Menu LISTE                                                   !
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

;%QS0DP^INT^1^59547,73879^0
ZLIGDP() 
 
 
 
 
 
 S ^TTLEXTER("DIALOGUE")="^%TLTRDIA|1"
 N PROT S PROT=0
1 D INIT
DEB N PPAS
 S PPAS=0
 G ACT
FIN K ^LTREQU($J)
 Q PPAS
 
REQU N PROT S PROT=0 K ^LTREQU($J) S ^LTREQU($J,"REQUETES")="" G DEB
 
GROU N PROT S PROT=0 K ^LTREQU($J) S ^LTREQU($J,"GROUPAGE")="" G DEB
 
ALL N PROT S PROT=0 D INIT G DEB
INIT 
 K ^LTREQU($J) N I,%I S I="" F %I=0:0 S I=$$NXTRAV^%QSTRUC8("L0","SOURCE",I) Q:I=""  S ^LTREQU($J,I)=""
 Q
 
ACT N ADRES,CONTR,LCOUR,FEN,TATA,TETE,TETE1,TOTO,TOTO1,UC,TEMP,TATA,TATA1,TUTU,TUTU1,FEN1,TITI,TITI1,MENUH
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I UC="VAX" S TOTO="TOTO1",TATA="TATA1",TUTU="TUTU1",FEN="FEN1",TITI="TITI1",TETE="TETE1"
 E  S TOTO=$$CONCAS^%QZCHAD(TEMP,"TOTO"),TATA=$$CONCAS^%QZCHAD(TEMP,"TATA"),TUTU=$$CONCAS^%QZCHAD(TEMP,"TUTU"),FEN=$$CONCAS^%QZCHAD(TEMP,"FEN"),TITI=$$CONCAS^%QZCHAD(TEMP,"TITI"),TETE=$$CONCAS^%QZCHAD(TEMP,"TETE")
 D ^%QS0DPM(TOTO)
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 
ACTS S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TOTO,.ADRES,.CONTR)
 G:CONTR="R" AFF2 G:(CONTR="A")!(CONTR="F") ENDACT
 I CONTR'="" D ^%VSQUEAK G ACTS
 G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM K @(TEMP) G FIN
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,"LISTES") Q
CADLL D CARSP^%VVIDEO(40,0,3,$S(SUB="C-IBM PC":38,1:40),1)
 S LCOUR=WHOIS_" sur "_$I
 ;HL002 S DX=41,DY=1 X XY W $J("",$S(SUB="C-IBM PC":35,1:38))
 S DX=41,DY=1 X XY W $J("",$S(SUB="C-IBM PC":35,1:35))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO Q
AFFLI G AFF2:R=2,AFF3:R=1,ACT2:1
 
ALREQ 
 S PPAS=1
 G ENDACT
 
ENTREE D GO^%QUAPAGM G ACT2
ATTRI S R=$$^%QS0MEN2 G AFF2:R=2,ACT2:1
INDIV S R=$$^%QS0L G AFFLI
GROUP D ^%QGOMA S R=2 G AFFLI
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
TRAIT I PROT D ^%INCUPA I B="???" D ^%VZEAVT("Vous n'avez pas acces aux traitements sur les listes") G ACT2
 S R=$$^%TLDIALO G AFFLI
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="L0",@FEN@("A")=$$LISTIND^%QSGEST6("L0"),@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QS0DP"
 S @FEN@("LR")=13
 D IFEN(FEN) Q
IFEN(FEN) 
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADR^%QS0DP",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 I $D(^DERLISTE($I)),(^DERLISTE($I)'="")&$$EX^%QS0(^DERLISTE($I)) D AFFP^%QUAPAGM(^DERLISTE($I))
 Q
 
AFFREQ(O,B) 
 N S S S=$$^%QSCALVA(B,O,"SOURCE") G:S'="REQUETES" EF N R S R=$$^%QSCALVA(B,O,"AUTRE") G:R="" EF G:'($D(^[QUI]RQS1(R))) EF
 N VAR,CONT,BASE,COMM,NOLC,NOLV,REQ
 D INIT^%QS4(R),^%VZEAVT(" ") Q 2
EF D ^%VSQUEAK Q 0
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI ;Affiche l'entête du menu LISTE
 D CADL,CADLL Q
 
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
ATA3 G ACT2
 
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
 
 
TRTPROT() 
 
 
 N PROT S PROT=1 G 1

