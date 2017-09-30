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

;%ACHIDE4^INT^1^59547,73864^0
%ACHIDE4 ;
 
 
 
 
 
 
VIS 
 N TEMP,MEN,ADR,CTR,FEN,NL,NLR,LISTE,AFF,SLC,REQ
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S AFF=0
 S @MEN@(1)=$$^%QZCHW("Visualiser.groupe")_"^"_"VISM",@MEN@(1,"COM")=$$^%QZCHW("Activation d'une requete sur les modules et visu selective")
 S @MEN@(2)=$$^%QZCHW("Choix.liste")_"^"_"LIS",@MEN@(2,"COM")=$$^%QZCHW("Choix d'une liste et visu selective")
 S @MEN@(3)=$$^%QZCHW("Requetes")_"^"_"REQ",@MEN@(3,"COM")=$$^%QZCHW("Acces aux requetes")
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") D:AFF=1 AFF^%ACHIDEF K @(TEMP) Q
 G:ADR'="" @ADR G ACT
 
VISM 
 D INIF,INIR,AFFICH^%QUAPAGM
 
 S REQ=$$UN^%QUAPAGM I REQ="" S NL="" G ERR
 
 D MAJ^%ACHIDE5(1),CRELI(TEMPO,.NL)
 
 S NLR=$$ACTIVE^%QSINTER(REQ,NL)
 I NLR="" G ERR
 D SEL(NLR,STO)
 D AFF
FVIS D END^%QUAPAGM,DEL^%QSGES11(NL)
 G ACT
ERR S AFF=1 G FVIS
 
LIS 
 D INIF,INIL,AFFICH^%QUAPAGM
 
 S NL=$$UN^%QUAPAGM I NL="" S AFF=1 G FLIS
 D SEL(NL,STO)
 D AFF
FLIS D END^%QUAPAGM G ACT
 
REQ 
 S SLC=LC,CTR=$$^%QS
 S LC=SLC
 D AFF
 G ACT
 
AFF S AFF=0 D AFF^%ACHIDEF Q
 
INIF D ^%VZEATT
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 K @(FEN),@(LISTE)
 S @FEN@("X")=0,@FEN@("Y")=1,@FEN@("L")=80,@FEN@("H")=21
 S @FEN@("ECRAN")="CADR^%ACHIDE4",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 S @FEN@("A")=LISTE,@FEN@("ATT")=1,@FEN@("AFF")="TIT^%ACHIAFF"
 Q
INIL 
 D ^%QSGES13("L0","BASE",REPFI,1,LISTE)
 S @FEN@("B")="L0"
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Source"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="SOURCE"
 S @FEN@("C",3,"L")=20,@FEN@("C",3,"C")="AUTRE"
 S @FEN@("C",4,"T")=$$^%QZCHW("Creation"),@FEN@("C",4,"L")=8,@FEN@("C",4,"C")="DATE.CREATION"
 D INIT^%QUAPAGM(FEN)
 Q
CADR D TIT^%ACHIAFF,AFFICH^%QUAPAGM Q
 
INIR 
 D ^%QSGES13("RQS","OBJET",$$NOMLOG^%QSF(REPFI),1,LISTE)
 S @FEN@("B")="RQS"
 S @FEN@("C",1,"T")=$$^%QZCHW("Date"),@FEN@("C",1,"L")=8,@FEN@("C",1,"C")="DATE.CREATION"
 S @FEN@("C",2,"T")=$$^%QZCHW("Auteur"),@FEN@("C",2,"L")=6,@FEN@("C",2,"C")="AUTEUR"
 S @FEN@("C",3,"T")=$$^%QZCHW("Site"),@FEN@("C",3,"L")=6,@FEN@("C",3,"C")="SITE"
 S @FEN@("C",4,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",4,"L")=35,@FEN@("C",4,"C")="COMM"
 D INIT^%QUAPAGM(FEN)
 Q
 
SEL(L,STO) 
 N %I,IND,ADR,N,NI,X,Y
 S ADR=$$ADRLIS^%QSGEST7(L) Q:(ADR="")!(ADR=0)
 K @STO@("SEL")
 
 S IND=""
 F %I=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  S NI=$P(IND,",",$L(IND,",")),N=$S($D(@STO@("NUM",NI)):@STO@("NUM",NI),1:NI) I $D(@STO@("PLNUM",N)) S Y=$O(@STO@("PLNUM",N,"")),X=$O(@STO@("PLNUM",N,Y,"")),@STO@("SEL",N)=Y_"^"_X
 Q
 
CRELI(GLO,NL) 
 N %I,IND
 S NL=$$NOM^%QSGES11("TMP")
 D MSG^%VZEATT($$^%QZCHW("Creation d'une liste"))
 D CREER^%QSGES11(REPFI,NL,"TMP",0,"SEL.MODULES","","")
 S IND=""
 F %I=0:0 S IND=$O(@GLO@(IND)) Q:IND=""  D STOCK^%QSGES11(NL,SECT_","_IND)
 Q
 
 
TRT 
 N TEMP,MEN,ADR,CTR,GLO,NL,TRT,R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S @MEN@(1)=$$^%QZCHW("Constitution.groupe")_"^"_"EXE",@MEN@(1,"COM")=$$^%QZCHW("Selection de modules et execution d'un traitement")
 S @MEN@(2)=$$^%QZCHW("Groupe.selectionne")_"^"_"EXG",@MEN@(2,"COM")=$$^%QZCHW("Execution d'un traitement sur les modules selectionnes")
 S @MEN@(3)=$$^%QZCHW("Traitements")_"^"_"ACCT",@MEN@(3,"COM")=$$^%QZCHW("Acces traitements")
ACS S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MEN,.ADR,.CTR) I (CTR="A")!(CTR="F") K @(TEMP) Q
 G:ADR'="" @ADR G ACS
 
ACCT 
 D ^%TLMENUG,AFF^%ACHIDEF
 G ACS
 
EXG 
 S TRT=$$TRT^%ACHICMS I TRT="" G ACS
 S GLO=$$CONCAS^%QZCHAD(STO,"SEL")
 I '($D(@GLO)) G ACS
 G EXT
 
EXE S TRT=$$TRT^%ACHICMS I TRT="" G ACS
 S MEN2=$$CONCAS^%QZCHAD(TEMP,"MEN2")
 S @MEN2@(1)=$$^%QZCHW("Selection")_"^"_"SELM",@MEN2@(1,"COM")=$$^%QZCHW("Selection de modules")
 S @MEN2@(2)=$$^%QZCHW("Tous")_"^"_"ALL",@MEN2@(2,"COM")=$$^%QZCHW("Pour tous les modules")
ACC S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MEN2,.ADR,.CTR) I (CTR="A")!(CTR="F") G ACS
 G:ADR'="" @ADR G ACC
 
SELM 
 D SELM^%ACHIDE5(STO,SECT,0)
 S GLO=$$CONCAS^%QZCHAD(STO,"SEL")
 I '($D(@GLO)) G ACS
 D AFF^%ACHIDEF G EXT
 
ALL S GLO=$$CONCAS^%QZCHAD(STO,"PLNUM") G EXT
 
EXT 
 D MAJ^%ACHIDE5(1),CREL(GLO,.NL)
 S R=$$ACTIVL^%TLIACTI(TRT,NL,0,0)
 D MAJ^%ACHIDE5(0),DEL^%QSGES11(NL)
 G ACS
 
CREL(GLO,NL) 
 N %N,N,IND
 S NL=$$NOM^%QSGES11("TMP")
 D MSG^%VZEATT($$^%QZCHW("Creation d'une liste"))
 D CREER^%QSGES11(REPFI,NL,"TMP",0,"SEL.MODULES","","")
 S N=""
 F %N=0:0 S N=$O(@GLO@(N)) Q:N=""  S IND=SECT_","_$S($D(@STO@("CAR",N*1,"NOM")):@STO@("CAR",N*1,"NOM"),1:N*1) D STOCK^%QSGES11(NL,IND)
 Q

