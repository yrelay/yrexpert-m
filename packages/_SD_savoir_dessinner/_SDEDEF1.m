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

;%SDEDEF1^INT^1^59547,73888^0
SDEDEF1(OBJ,VERS,%PORT,%TERM,CONT) 
 
 
 
 
 
 
ALFA 
 D ALFA^%SDEDEF
 Q
 
GRAPH 
 D GRAPH^%SDEDEF
 Q
 
 
ELLIP 
 D ^%SDESELL(.X1,.Y1,.X2,.Y2,.X3,.Y3,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES),STOCK^%SDEDEF(3,X3,Y3,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"ELLIPSE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFELL
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="ELLIPSE" G ELLIP2
 D ELL^%SDOMAT(NUM,X1,Y1,X2,Y2,X3,Y3)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,ELLIPS^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL)
 I %TERM="VT-340" D VT340^%SDEDEF
 Q
 
ELLIP2 
 D EFFELL
 G RESAIS^%SDEDEF2
 
EFFELL 
 I %TERM="VT-340" D VT340^%SDEDEF Q
 D EFF^%SDESELL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
DEMIE 
 D ^%SDESDEL(.X1,.Y1,.X2,.Y2,.X3,.Y3,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES),STOCK^%SDEDEF(3,X3,Y3,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"DEMIE.ELLIPSE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFDEL
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="DEMIE.ELLIPSE" G DEMIE2
 D DEL^%SDOMAT(NUM,X1,Y1,X2,Y2,X3,Y3)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,DEMEL^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL)
 I %TERM="VT-340" D VT340^%SDEDEF
 Q
DEMIE2 
 D EFFDEL
 G RESAIS^%SDEDEF2
EFFDEL 
 I %TERM="VT-340" D VT340^%SDEDEF Q
 D EFF^%SDESDEL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
RECTA 
 D ^%SDESREC(.X1,.Y1,.X2,.Y2,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"RECTANGLE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFREC
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="RECTANGLE" G RECTA2
 D RECT^%SDOMAT(NUM,X1,Y1,X2,Y2)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 S PLEIN=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),10)
 D ^%PBPZGRA,RECT^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL,PLEIN)
 I %TERM="VT-340" D VT340^%SDEDEF
 Q
 
RECTA2 
 D EFFREC
 G RESAIS^%SDEDEF2
EFFREC 
 I %TERM="VT-340" D VT340^%SDEDEF Q
 D EFF^%SDESREC(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
FLECH 
 D ^%SDESFLE(.X1,.Y1,.X2,.Y2,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 I '(OK) Q
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"FLECHE",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFFLE
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="FLECHE" G FLECH2
 D FLECH^%SDOMAT(NUM,X1,Y1,X2,Y2)
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,FLECHE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL)
 D REAF^%SDESFLE(OBJ,VERS,NUM,X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 I %TERM="VT-340" D VT340^%SDEDEF
 Q
 
FLECH2 
 D EFFFLE
 G RESAIS^%SDEDEF2
 
EFFFLE 
 I %TERM="VT-340" D VT340^%SDEDEF Q
 D EFF^%SDESFLE(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS")) Q
 
RACCO 
 N P1,P2,EL1,EL2
 D ^%SDESRAC(.X1,.Y1,.X2,.Y2,.EL1,.EL2,.P1,.P2,@CONT@("TRAIT"),@CONT@("VIS"),.OK,OBLI)
 Q:'(OK)
 D STOCK2(1,EL1,PRES,"DROITE"),STOCK2(2,EL2,PRES,"DROITE")
 D STOCK2(1,P1,PRES,"PT"),STOCK2(2,P2,PRES,"PT")
 I MODE'=2 D ALFA S OK=$$^%SDESAIS(MODE,"RACCORDEMENT",PRES,CONT,GLAFF,.NUM,SYNT) D:%TERM'="VT-340" GRAPH
 I '(OK) G EFFRAC
 I $$TYPELEM^%SDEGEST(OBJ,VERS,NUM)'="RACCORDEMENT" G RACCO2
 D RACCO^%SDOMAT(NUM,X1,Y1,X2,Y2)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D ^%PBPZGRA,RACCO^%SDEGEST(NUM,X1,Y1,X2,Y2,EL1,EL2,TYPL)
 I %TERM="VT-340" D VT340^%SDEDEF
 Q
 
RACCO2 
 D EFFFLE
 G RESAIS^%SDEDEF2
 
EFFRAC 
 I %TERM="VT-340" D VT340^%SDEDEF Q
 D EFF^%SDESRAC(X1,Y1,X2,Y2,EL1,EL2,@CONT@("TRAIT"),@CONT@("VIS"))
 Q
SYNTA 
 I SYNT=0 G ERR
 S MODE=1
 I ADR2'="" D ^%SDEDEF2(.NUM,ADR2,MODE,CONT,GLAFF,SYNT) Q
 G ERR
SUPP 
 S MODE=2
 I ADR2'="" D ^%SDEDEF2(.NUM,ADR2,MODE,CONT,GLAFF,SYNT) Q
ERR D ^%VSQUEAK
 Q
STOCK2(N,EL,PRES,TYP) 
 S @PRES@(N,TYP)=EL
 Q

