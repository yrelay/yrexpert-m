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

;%DLAFIR2^INT^1^59547,73867^0
DLAFIR2 ;
 
 
 
 
 
INIT 
 N %L,ADR,ATR,CPT,CUM,DEL,DELS,DMIN,GLO,L,MAX,REP
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO")
 K @(GLO),@(HISTO)
 
 S REP=$$LAN^%DLCON2
 S ADR=$$ADRLIS^%QSGEST7(NL)
 
 S ATR=$$DELNEC^%DLCON2
 S L="",MIN=10E10
 F %L=0:0 S L=$O(@ADR@(L)) Q:L=""  D INS
 
 S ATR=$$DELAI^%DLCON2
 S L=""
 F %L=0:0 S L=$O(@ADR@(L)) Q:L=""  D INSD
 S (MAX,CPT)=0,DEL=MIN
 F %L=0:0 D INSH Q:DEL>$ZP(@GLO@(""))
 S @HISTO@("MAX")=MAX,@HISTO=CPT
 S @HISTO@("TEXTE")=3
 K @(GLO)
 Q
INS 
 S DEL=$$^%QSCALVA(REP,L,ATR) Q:DEL=""
 S DELS=$$05^%QMDATE1($P(DEL,",",1)) S:DELS<MIN MIN=DELS
 S CUM=$S($D(@GLO@(DELS)):@GLO@(DELS),1:0)+1
 S @GLO@(DELS)=CUM
 S @GLO@(DELS,"IND",L)=DEL
 Q
INSD 
 S DEL=$$^%QSCALVA(REP,L,ATR) Q:DEL=""
 S DELS=$$05^%QMDATE1($P(DEL,",",1)) S:DELS<MIN MIN=DELS
 S CUM=$S($D(@GLO@(DELS,"FCOL")):@GLO@(DELS,"FCOL"),1:0)+1
 S @GLO@(DELS,"FCOL")=CUM
 S @GLO@(DELS,"FCOL",L)=DEL
 Q
INSH 
 S CPT=CPT+1
 I ($D(@GLO@(DEL))#10)=0 S @GLO@(DEL)=0
 I '($D(@GLO@(DEL,"FCOL"))) S @GLO@(DEL,"FCOL")=0
 S CUM=@GLO@(DEL),@HISTO@(CPT)=CUM,@HISTO@(CPT,"IND")=CUM
 S @HISTO@(CPT,"TEXT")=DEL
 S L=@GLO@(DEL,"FCOL"),@HISTO@(CPT,"FCOL")=L,@HISTO@(CPT,"TOTAL")=L
 S:CUM>MAX MAX=CUM
 S:L>MAX MAX=L
 S L=""
IND S L=$O(@GLO@(DEL,"IND",L)) G:L="" INO
 S @HISTO@(CPT,"IND",L)=1_"^"_@GLO@(DEL,"IND",L)
 G IND
INO S L=$O(@GLO@(DEL,"FCOL",L))
 
 I L="" S DEL=$$05^%QMDATE1($$50^%QMDATE1(DEL)+7) Q
 S @HISTO@(CPT,"FCOL",L)=@GLO@(DEL,"FCOL",L)
 G INO
 
ACCES 
 N CS,LS,SEL,TABC,TYP
 D POCLEPA^%VVIDEO
 S (CS,LS)=1
ACC S SEL=$$^%VZEMOV(LMARG,(HFHA+HHIST)+1,NBCOL,HTEXT,ECART+LARG,1,TEXT,.CS,.LS)
 I '(SEL) S DY=22,DX=0 D CLEBAS^%VVIDEO Q
 S CS=(CS+NOCOL)-1
 I '($D(@HISTO@(CS))) D ^%VSQUEAK G ACC
 I (@HISTO@(CS)=0)&(@HISTO@(CS,"FCOL")=0) D ^%VSQUEAK G ACC
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLOB=$$CONCAS^%QZCHAD(TEMP,"GLOB")
 S GLDM=$$CONCAS^%QZCHAD(TEMP,"GLDM")
 D CONS("IND",GLOB),CONS("FCOL",GLDM)
 D CLEPAG^%VVIDEO
 D INITAF($$CONCAS^%QZCHAD(TEMP,"FENO"),$$CONCAS^%QZCHAD(TEMP,"FEND"))
 
ACT S TABC(1)="OBTENUS",TABC(2)="DEMANDES"
 D POCLEPA^%VVIDEO S TYP=$E($$^%VZECHO("TABC"),1,3)
 G:(TYP=1)!(TYP=6) FIN
 K TABC
 G @TYP
 
FIN D CLOSE^%QUAPAGM("DLOBT"),CLOSE^%QUAPAGM("DLDMD")
 D CLEPAG^%VVIDEO,REAFF^%HXYPARA
 K @(TEMP) Q
 
OBT 
 D USE^%QUAPAGM("DLOBT")
 D GO^%QUAPAGM
 G ACT
 
DEM 
 D USE^%QUAPAGM("DLDMD")
 D GO^%QUAPAGM
 G ACT
 
CONS(ETI,GL) 
 N ADR
 S ADR=$$CONCAS^%QZCHAD($$CONCAT^%QZCHAD(HISTO,CS),ETI)
 D GLOCOP^%QCAGLC(ADR,GL)
 Q
 
INITAF(FENO,FEND) 
 D FOBT(FENO),OPEN^%QUAPAGM(FENO,"DLOBT")
 D FDMD(FEND),OPEN^%QUAPAGM(FEND,"DLDMD")
 D REAFF
 Q
FOBT(FEN) 
 S @FEN@("X")=0,@FEN@("Y")=2,@FEN@("L")=79,@FEN@("H")=9
 S @FEN@("AFF")="AFD^%DLAFIR2"
 S @FEN@("A")=GLOB,@FEN@("ATT")=1,@FEN@("B")=$$LAN^%DLCON2
 S @FEN@("C",1,"T")=$$DELNEC^%DLCON2
 S @FEN@("C",1,"C")=$$DELNEC^%DLCON2
 S @FEN@("C",1,"L")=15
 D COM(FEN,$$DELAI^%DLCON2)
 Q
 
FDMD(FEN) 
 S @FEN@("X")=0,@FEN@("Y")=12,@FEN@("L")=79,@FEN@("H")=10
 S @FEN@("AFF")="AFO^%DLAFIR2"
 S @FEN@("A")=GLDM,@FEN@("ATT")=1,@FEN@("B")=$$LAN^%DLCON2
 S @FEN@("C",1,"T")=$$DELAI^%DLCON2
 S @FEN@("C",1,"C")=$$DELAI^%DLCON2
 S @FEN@("C",1,"L")=15
 D COM(FEN,$$DELNEC^%DLCON2)
 Q
COM(FEN,AT) 
 S @FEN@("C",2,"T")="article"
 S @FEN@("C",2,"C")=$$LIEN1^%QSGEL2($$LAN^%DLCON2,$$ART^%DLCON2,3)
 S @FEN@("C",2,"L")=20
 S @FEN@("C",3,"T")="quantite"
 S @FEN@("C",3,"C")="QUANTITE"
 S @FEN@("C",3,"L")=8
 S @FEN@("C",4,"T")=$$MIN^%VMINUSC(AT)
 S @FEN@("C",4,"C")=AT
 S @FEN@("C",4,"L")=15
 Q
 
 
REAFF D TIT
 D AF1,AF2
 Q
 
AFO D TIT
AF1 S DX=5,DY=1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Lancements.obtenus") D NORM^%VVIDEO
 D USE^%QUAPAGM("DLOBT"),AFFICH^%QUAPAGM
 D USE^%QUAPAGM("DLDMD")
 Q
 
AFD D TIT
AF2 S DX=5,DY=11 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Lancements.demandes") D NORM^%VVIDEO
 D USE^%QUAPAGM("DLDMD"),AFFICH^%QUAPAGM
 D USE^%QUAPAGM("DLOBT")
 Q
TIT D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Semaine")_" : "_@HISTO@(CS,"TEXT"),0)
 Q

