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

;%DLAFIRD^INT^1^59547,73867^0
DLAFIRD ;
 
 
 
 
 
 N NL,ICD,IOD,TABC
 S TABC(1)="CALCUL",TABC(2)="AFFICHAGE",NL=""
 S DX=0,DY=20 D CLEBAS^%VVIDEO
 S DX=10,DY=23 X XY
 S CHX=$E($$^%VZECHO("TABC"),1,3) I (CHX=6)!(CHX=1) Q
 G @CHX
CAL 
 D CRLI(.NL)
 S IOD=$$CALO(NL,""),ICD=$$CALC(NL,"")
 
 S ^[QUI]RQSDON("JALON","IRD","IOD")=IOD
 S ^[QUI]RQSDON("JALON","IRD","ICD")=ICD
 S ^[QUI]RQSDON("JALON","IRD","LISTE")=NL
AFF 
 I '($D(^[QUI]RQSDON("JALON","IRD","LISTE"))) G CAL
 D AFFI(^[QUI]RQSDON("JALON","IRD","LISTE"),^[QUI]RQSDON("JALON","IRD","IOD"),^[QUI]RQSDON("JALON","IRD","ICD"),"")
 Q
 
CRLI(NL) 
 
 N ATT,CARD,L,OR,REPL,V
 S REPL=$$LAN^%DLCON2
 S NL=$$NOM^%QSGES11("JLX")
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste")_" "_NL)
 D CRETYP^%QSGES11(REPL,NL,"JLX",0,"JALONNEMENT",$$STO^%QSGES11(NL),$$^%QZCHW("LISTE.DE.LANCEMENTS.LANCES"),"INDIVIDU",$$STOTRI^%QSGES11)
 
 S ATT=$$DELNEC^%DLCON2
 S V=""
CRV S V=$$NXTRAV^%QSTRUC8(REPL,ATT,V) I V="" G FCR
 S OR=""
CRO S OR=$$NXTRAVO^%QSTRUC8(REPL,ATT,V,OR) I OR="" G CRV
 S L=""
CRI S L=$$NXTRAVOI^%QSTRUC8(REPL,ATT,V,OR,L) I L="" G CRO
 
 I $$^%QSCALVA(REPL,L,$$LIEN1^%QSGEL2(REPL,$$ART^%DLCON2,3))="" G CRI
 D STOCK^%QSGES11(NL,L)
 G CRI
FCR D CARDL^%QSGES11(NL,.CARD)
 Q
 
CALO(NL,ETU) 
 
 N %L,ADR,ATD,ATO,L,NBR,REPL,SOM
 
 S ATD=$$DELAI^%DLCON2,ATO=$$DELNEC^%DLCON2
 S REPL=$$LAN^%DLCON2
 S NBR=0,SOM=0,L=""
 S ADR=$$ADRLIS^%QSGEST7(NL) I (ADR="")!(ADR=0) Q SOM
 D MSG^%VZEATT($$^%QZCHW("Calcul de l'IOD"))
 
 F %L=0:0 S L=$O(@ADR@(L)) Q:L=""  D TEST
 I NBR'=0 S SOM=SOM/NBR
 S SOM=$J(SOM*100,1,2)
 I ETU'="" S ^[QUI]RQSDON("JALON","IRD","IOD",ETU)=SOM
 Q SOM
TEST 
 S NBR=NBR+1
 I $$^%QSCALVA(REPL,L,ATO)'>$$^%QSCALVA(REPL,L,ATD) S SOM=SOM+1
 Q
 
CALC(NL,ETU) 
 
 N %L,ADR,ATD,ATJ,ATO,ET,L,REPE,REPL,SOM,SAV,SAM,VALD
 
 S ATD=$$DELAI^%DLCON2,ATO=$$DELNEC^%DLCON2
 
 S ATJ=$$DATEJAL^%DLCON2
 S REPL=$$LAN^%DLCON2,REPE=$$REP^%DLETUDE
 S (SOM,SAV,SAM)=0
 S ADR=$$ADRLIS^%QSGEST7(NL) I (ADR="")!(ADR=0) Q SOM
 D MSG^%VZEATT($$^%QZCHW("Calcul de l'ICD"))
 S L=""
 
 F %L=0:0 S L=$O(@ADR@(L)) Q:L=""  D SOM
 I SOM'=0 S SOM=(SAV+SAM)/SOM
 S SOM=$J(SOM*100,1,2)
 I ETU'="" S ^[QUI]RQSDON("JALON","IRD","ICD",ETU)=SOM
 Q SOM
SOM 
 S ET=$$^%QSCALVA(REPL,L,"ETUDE")
 S VALD=$$^%QSCALVA(REPE,ET,"DATE.LIMITE.DEBUT") I VALD="" Q
 S VALD=$P(VALD,",")
 S SOM=SOM+($$^%QSCALVA(REPL,L,ATD)-VALD)
 I $$^%QSCALVA(REPE,ETU,"SENS.JALONNEMENT")="AVAL" S SAV=SAV+($$^%QSCALVA(REPL,L,ATO)-VALD) Q
 S SAM=SAM+($$^%QSCALVA(REPL,L,ATO)-$$^%QSCALVA(REPL,L,ATJ))
 Q
 
AFFI(NL,IOD,ICD,ETU) 
 N MENU
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU@(1)=$$^%QZCHW("Entree")_"^"_"ACCES^%DLAFIR2",@MENU@(1,"COM")=$$^%QZCHW("Acces a une colonne de la fenetre")
 D CLEPAG^%VVIDEO
 D ^%HXYPARA(0,2,80,18,"INIT^%DLAFIR2","AFFH^%DLAFIRD","IMP^%DLAFIRD","FCOL",MENU)
 K @(MENU) Q
 
AFFH 
 D ^%VZCDB($$^%QZCHW("Indices de realisation des delais pour")_" "_$S(ETU="":$$^%QZCHW("le carnet de commandes"),1:$$^%QZCHW("l'etude")_" "_ETU),0)
 S DX=15,DY=1 X XY D BLD^%VVIDEO,REV^%VVIDEO X XY W $$^%QZCHW("Obtention.delais")_" = "_IOD_" %   "_$$^%QZCHW("Consommation.delais")_" = "_ICD_" % " D NORM^%VVIDEO
 S DX=XG,DY=(YH+DV)-2 X XY D BLD^%VVIDEO X XY W $$DELNEC^%DLCON2
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W "UDC(D.OBT)"
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W "UDC(D.DMD)"
 D NORM^%VVIDEO Q
 
IMP(T) 
 I T="G" G IMPG
 
 S DX=15,DY=YH-2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Indices de realisation des delais pour")_" "_$S(ETU="":$$^%QZCHW("le carnet de commandes"),1:$$^%QZCHW("l'etude")_" "_ETU)
 S DX=20,DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Obtention.delais")_" = "_IOD_" %   "_$$^%QZCHW("Consommation.delais")_" = "_ICD_" %"
 S DX=0,DY=(DV+YH)-2 X XY S ^IMP($J,$Y,$X)=$E($$DELNEC^%DLCON2,1,LMARG-1)
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("UDC")_"(D.OBT)"
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("UDC")_"(D.DMD)"
 Q
IMPG 
 S @TXT@(YH+1,(XC+LMARG)+7)=$$^%QZCHW("Indices de realisation des delais pour")_" "_$S(ETU="":$$^%QZCHW("le carnet de commandes"),1:$$^%QZCHW("l'etude")_" "_ETU)
 S @TXT@(YH+2,(XC+LMARG)+12)=$$^%QZCHW("Obtention.delais")_" = "_IOD_" %   "_$$^%QZCHW("Consommation.delais")_" = "_ICD_" %"
 S DY=(HFHA+HHIST)+3,@TXT@(DY,XC)=$$DELNEC^%DLCON2
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("UDC")_"(D.OBT)"
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("UDC")_"(D.DMD)"
 Q

