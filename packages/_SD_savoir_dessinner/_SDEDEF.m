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

;%SDEDEF^INT^1^59547,73888^0
SDEDEF(OBJ,VERS,%PORT,%TERM,CONT) 
 
 
 
 
 
 N ADR,ADR2,CTR,MENEL,OK,PRES,MODE,NUM,LIB,TYPL,TAILLE,INCL,PLEIN,DERN
 N X1,X2,X3,Y1,Y2,Y3,SYNT
 
 N TEMP S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENEL=$$CONCAS^%QZCHAD(TEMP,"MENEL")
 S PRES=$$CONCAS^%QZCHAD(TEMP,"LISTE.POINT")
 S GLAFF=$$CONCAS^%QZCHAD(TEMP,"NEW.POINT")
 S NUM="",ADR2=""
 S MODE=0,SYNT=$$SYNT^%SDOCNT(OBJ,VERS)
 D MENU^%SDEDEF2(MENEL)
 D EFFBAS^%SDUMEN
DIAL K @(PRES) D AFF^%SDUMEN(0,50,MENEL)
 D SEL^%SDUMEN(MENEL,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 S OK=1 K @(GLAFF)
 S ADR=ADR_"(MODE,.NUM,SYNT,PRES,GLAFF,0)"
 D @ADR
 
RETOUR 
 I MODE=0,($P(ADR,"(")'="SYNTA")&($P(ADR,"(")'="SUPP") S ADR2=$P(ADR,"(")
 S MODE=0 G DIAL
FIN 
 K @(TEMP)
 Q
ALFA 
 D ^%PBPZALF,^%PBPZOFG,CLEPAG^%VVIDEO
 Q
 
GRAPH 
 D ^%PBPZALF,CLEPAG^%VVIDEO,^%PBPZONG,^%PBPZGRA
 Q
POINT(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 D ^%SDESPNT(.X1,.Y1,.OK,OBLI)
 I '(OK) Q
 D STOCK(1,X1,Y1,PRES)
 D ALFA S OK=$$^%SDESAIS(MODE,"POINT",PRES,CONT,GLAFF,.NUM,1) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFPOI
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="POINT" G POINT2
 D POINT^%SDOMAT(NUM,X1,Y1)
 S LIB=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),6)
 D ^%PBPZGRA,TEXTE^%PBMFN(X1+20,Y1+20,LIB,0,"H"),POINT^%SDEGEST(NUM,X1,Y1,LIB)
 I %TERM="VT-340" D VT340
 Q
 
POINT2 
 D EFFPOI
 G RESAIS^%SDEDEF2
EFFPOI 
 I %TERM="VT-340" D VT340 Q
 D EFF^%SDESPNT(X1,Y1) Q
 
DROIT(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 D ^%SDESDRO(.X1,.Y1,.X2,.Y2,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK(1,X1,Y1,PRES),STOCK(2,X2,Y2,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"DROITE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFDRO
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="DROITE" G DROIT2
 D DROITE^%SDOMAT(NUM,X1,Y1,X2,Y2)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,DROITE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL)
 I %TERM="VT-340" D VT340
 Q
DROIT2 
 D EFFDRO
 G RESAIS^%SDEDEF2
 
EFFDRO 
 I %TERM="VT-340" D VT340 Q
 D EFF^%SDESDRO(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
TEXTE(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 D ^%SDESTXT(.X1,.Y1,.OK)
 I '(OK) Q
 D STOCK(1,X1,Y1,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"TEXTE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) Q
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="TEXTE" G RESAIS^%SDEDEF2
 D TEXTE^%SDOMAT(NUM,X1,Y1)
 S TAILLE=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),2)
 S INCL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),6)
 S LIB=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),5)
 D ^%PBPZGRA,TEXTE^%PBMFN(X1,Y1,LIB,0,"H"),TEXTE^%SDEGEST(NUM,X1,Y1,LIB,INCL,TAILLE)
 I %TERM="VT-340" D VT340
 Q
 
ARC(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 D ^%SDESARC(.X1,.Y1,.X2,.Y2,.X3,.Y3,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK(1,X3,Y3,PRES),STOCK(2,X1,Y1,PRES),STOCK(3,X2,Y2,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"ARC",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFARC
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="ARC" G ARC2
 D ARC^%SDOMAT(NUM,X1,Y1,X2,Y2,X3,Y3)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,ARC^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL)
 I %TERM="VT-340" D VT340
 Q
 
ARC2 
 D EFFARC
 G RESAIS^%SDEDEF2
 
EFFARC 
 I %TERM="VT-340" D VT340 Q
 D EFF^%SDESARC(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
CERCL(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 D ^%SDESCER(.X1,.Y1,.X2,.Y2,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK(1,X1,Y1,PRES),STOCK(2,X2,Y2,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"CERCLE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFCER
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="CERCLE" G CERCL2
 D CERCLE^%SDOMAT(NUM,X1,Y1,X2,Y2)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,CERCLE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL)
 I %TERM="VT-340" D VT340
 Q
 
CERCL2 
 D EFFCER
 G RESAIS^%SDEDEF2
 
EFFCER 
 I %TERM="VT-340" D VT340 Q
 D EFF^%SDESCER(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
ELLIP(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G ELLIP^%SDEDEF1
 
DEMIE(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G DEMIE^%SDEDEF1
 
RECTA(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G RECTA^%SDEDEF1
 
FLECH(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G FLECH^%SDEDEF1
 
RACCO(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G RACCO^%SDEDEF1
 
SYNTA(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G SYNTA^%SDEDEF1
 
SUPP(MODE,NUM,SYNT,PRES,GLAFF,OBLI) 
 G SUPP^%SDEDEF1
 
 
STOCK(N,X,Y,PRES) 
 S @PRES@(N,"X")=$J(X*532E-4,1,1)
 S @PRES@(N,"Y")=$J(Y*532E-4,1,1)
 Q
 
TYPL(TL) 
 N T
 S T=$S(TL="INVISIBLE":"I",TL="MIXTE":"M",TL="POINT":"P",TL="COURT":"C",TL="LONG":"L",1:"F")
 Q T
VT340 
 D GRAPH,CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q

