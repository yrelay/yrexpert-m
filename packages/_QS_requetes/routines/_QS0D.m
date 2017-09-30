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

;%QS0D^INT^1^59547,73879^0
%QS0D ;
 D INIT
DEB D ACT
FIN K ^LTREQU($J) Q
 
REQU K ^LTREQU($J) S ^LTREQU($J,"REQUETES")="" G DEB
 
GROU K ^LTREQU($J) S ^LTREQU($J,"GROUPAGE")="" G DEB
 
ALL D INIT G DEB
INIT B
 K ^LTREQU($J) N I,%I S I="" F %I=0:0 S I=$$NXTRAV^%QSTRUC8("L0","SOURCE",I) Q:I=""  S ^LTREQU($J,I)=""
 Q
 
ACT N TABC,ADRES,CONTR,LCOUR,FEN,TATA,TOTO
 S TOTO="23^20^79"
 S TOTO(1)=$$^%QZCHW("Entrer")_"^ENTREE"
 S TOTO(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S TOTO(2)=$$^%QZCHW("Lister")_"^INDIV"
 S TOTO(2,"COM")=$$^%QZCHW("Lister ou imprimer les individus d'une liste")
 S TOTO(3)=$$^%QZCHW("Histogramme")_"^GRAPH"
 S TOTO(3,"COM")=$$^%QZCHW("Representations graphiques")
 S TOTO(4)=$$^%QZCHW("Primitives")_"^PRIM"
 S TOTO(4,"COM")=$$^%QZCHW("Primitives ensemblistes sur les listes")
 S TOTO(5)=$$^%QZCHW("Traiter")_"^TRAIT"
 S TOTO(5,"COM")=$$^%QZCHW("Traitements sequentiels sur les listes")
 S TOTO(6)=$$^%QZCHW("Supprimer")_"^SUPPR"
 S TOTO(6,"COM")=$$^%QZCHW("Supprimer des listes")
 S TOTO(7)="+^PLUS"
 S TOTO(7,"EQU")="="
 S TOTO(7,"COM")=$$^%QZCHW("Avancer d'une page")
 S TOTO(8)="-^MOINS"
 S TOTO(8,"COM")=$$^%QZCHW("Reculer d'une page")
 S TOTO(9)=$$^%QZCHW("Page")_"^PAGE"
 S TOTO(9,"COM")=$$^%QZCHW("Changer de page")
 S TOTO(10)=$$^%QZCHW("Repere")_"^REPER"
 S TOTO(10,"COM")=$$^%QZCHW("Afficher le repere des pages")
 S LCOUR="" D PFEN
AFF2 D REAFF
AFF3 
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(1,80,22,"TOTO",.ADRES,.CONTR) G:CONTR="R" AFF2 G:(CONTR="A")!(CONTR="F") ENDACT G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM Q
CADR 
 D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL S BIG=0,DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=0,MSG="LISTES" D 4^%VZCD Q
CADLL S LCOUR=WHOIS_" sur "_$I,DXG=40,DYH=0,LH=40,LV=3,BLD=1 D CARS^%VVIDEO S DX=41,DY=1 X XY W $J("",38) S DX=60-($L(LCOUR)\2),DY=1 D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO Q
ENTREE D GO^%QUAPAGM G ACT2
SUPPR S R=$$^%QS0SUPP G AFF2:R=2,AFF3:R=1,ACT2:1
ATTRI S R=$$^%QS0MEN2 G AFF2:R=2,AFF3:R=1,ACT2:1
INDIV S R=$$^%QS0L G AFF2:R=2,AFF3:R=1,ACT2:1
GRAPH S TABC(1)="STANDARD",TABC(2)="GRAPHIQUE"
 D POCLEPA^%VVIDEO S DX=$$MES^%VZECHO($$^%QZCHW("Histogramme ? :"),"TABC")
 S:DX=-1 DX=1
 F DY=1,6,13,"GRAPHIQUE","STANDARD" G:DX=DY @("GR"_DX)
 D ^%VSQUEAK G GRAPH
GR1 G AFF3
GR6 G AFF3
GR13 G GRSTANDARD
GRGRAPHIQUE S R=$$^%QS0G G AFF2:R=2,AFF3:R=1,ACT2:1
GRSTANDARD S R=$$^%QS0G3 G AFF2:R=2,AFF3:R=1,ACT2:1
 
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
TRAIT S R=$$^%TLDIALO G AFF2:R=2,AFF3:R=1,ACT2:1
PFEN S FEN("X")=0,FEN("Y")=3,FEN("L")=80,FEN("H")=19,FEN("B")="L0",FEN("A")=$$LISTIND^%QSGEST6("L0"),FEN("ATT")=1,FEN("AFF")="REAFI^%QS0D" D IFEN(.FEN) Q
IFEN(FEN) S FEN("C",1,"T")=$$^%QZCHW("Card."),FEN("C",1,"L")=6,FEN("C",1,"C")="CARD",FEN("C",2,"T")=$$^%QZCHW("Repertoire"),FEN("C",2,"L")=9,FEN("C",2,"C")="OBJET"
 S FEN("C",3,"T")=$$^%QZCHW("Source"),FEN("C",3,"L")=12,FEN("C",3,"C")="SOURCE",FEN("C",4,"L")=23,FEN("C",4,"C")="AUTRE",FEN("C",4,"?")="AFFREQ^%QS0D"
 S FEN("C",5,"T")=$$^%QZCHW("Creation"),FEN("C",5,"L")=8,FEN("C",5,"C")="DATE.CREATION",FEN("ECRAN")="CADR^%QS0D",FEN("PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM("FEN")
 I $D(^DERLISTE($I)),(^DERLISTE($I)'="")&$$EX^%QS0(^DERLISTE($I)) D AFFP^%QUAPAGM(^DERLISTE($I))
 Q
AFFREQ(O,B) N S S S=$$^%QSCALVA(B,O,"SOURCE") G:S'="REQUETES" EF N R S R=$$^%QSCALVA(B,O,"AUTRE") G:R="" EF G:'($D(^[QUI]RQS1(R))) EF
 N VAR,CONT,BASE,COMM,NOLC,NOLV,REQ D INIT^%QS4(R),POCLEPA^%VVIDEO W "[RETURN]" R *R D POCLEPA^%VVIDEO Q 2
EF D ^%VSQUEAK Q 0
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
PRIM 
 S TATA="23^10^79"
 S TATA(1)=$$^%QZCHW("Intersection")_"^INTER"
 S TATA(1,"COM")=$$^%QZCHW("Intersection de listes")
 S TATA(2)=$$^%QZCHW("Union")_"^UNION"
 S TATA(2,"COM")=$$^%QZCHW("Union de listes")
 S TATA(3)=$$^%QZCHW("Valeurs")_"^VALE"
 S TATA(3,"COM")=$$^%QZCHW("Extraction des valeurs d'un attribut")
 S TATA(4)=$$^%QZCHW("Ordonner")_"^TRI"
 S TATA(4,"COM")=$$^%QZCHW("Reclassement des individus")
 S TATA(5)=$$^%QZCHW("Duplication")_"^DUPLI"
 S TATA(5,"COM")=$$^%QZCHW("Duplication d'une liste sous un autre nom")
 S TATA(6)=$$^%QZCHW("Complementaire")_"^COMPL"
 S TATA(6,"COM")=$$^%QZCHW("Complementaire d'une liste par rapport a une autre liste")
 S TATA(7)=$$^%QZCHW("Manip")_"^MANIP"
 S TATA(7,"COM")=$$^%QZCHW("Gestion manuelle d'une liste")
 
ATATA S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"TATA",.ADRES,.CONTR)
 G:ADRES'="" @ADRES G:(CONTR="A")!(CONTR="F") ACT2
 I CONTR="R" D REAFF G ATATA
 D ^%VSQUEAK G ATATA
MANIP S R=$$^%QS0MANI G ATA2:R=2,ATA3:R=1,ATATA:1
COMPL S R=$$^%QS0COMP G ATA2:R=2,ATA3:R=1,ATATA:1
INTER S R=$$^%QS0INTN G ATA2:R=2,ATA3:R=1,ATATA:1
UNION S R=$$^%QS0UNIN G ATA2:R=2,ATA3:R=1,ATATA:1
TRI S R=$$^%QS0TRIE G ATA2:R=2,ATA3:R=1,ATATA:1
VALE S R=$$^%QS0VALE G ATA2:R=2,ATA3:R=1,ATATA:1
DUPLI S R=$$^%QS0DUPL G ATA2:R=2,ATA3:R=1,ATATA:1
ATA2 D REAFF G ATATA
ATA3 G ATATA

