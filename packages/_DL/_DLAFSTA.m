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

;%DLAFSTA^INT^1^59547,73867^0
DLAFSTA(ETU) 
 
 
 
 
 
 
 
 N MENU,TD
 S TD=0
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU@(1)=$$^%QZCHW("Entree")_"^"_"ACCES^%DLAFSTA",@MENU@(1,"COM")=$$^%QZCHW("Acces a une colonne de la fenetre")
 S @MENU@(2)=$$^%QZCHW("Pas.de.temps")_"^"_"JOUR^%DLAFSTA",@MENU@(2,"COM")=$$^%QZCHW("Passage de jour en semaine ou de semaine en jour")
 D CLEPAG^%VVIDEO
 D ^%HXYPARA(0,2,79,19,"INIT^%DLAFSTA(TD)","AFF^%DLAFSTA","IMP^%DLAFSTA","",MENU)
 D CLEPAG^%VVIDEO
 K @(MENU) Q
 
INIT(TD) 
 
 N %L,ADR,ATR,CPT,DAT,DAF,DAM,GL,LAN,MAX,NL,O,T
 K @(HISTO)
 
 S NL=$$^%QSCALVA($$REP^%DLETUDE,ETU,"LISTE.LANCEMENTS")
 S ADR=$$ADRLIS^%QSGEST7(NL)
 
 I (ADR=0)!(ADR="") S @HISTO=0,@HISTO@("MAX")=0 Q
 
 S REPL=$$LAN^%DLCON2
 
 S ATR=$$DATEJAL^%DLCON2
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GL") K @(GL)
 S GLS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLS") K @(GLS)
 S MIN=$S(TD=1:9952,1:"31/12/99")
 S DAM=$$10^%QMDATE1("01/01/88")
 S LAN=""
 F %L=0:0 S LAN=$O(@ADR@(LAN)) Q:LAN=""  D INS
 S (CPT,MAX)=0
 S DAM=$P(DAM,",",1),DAT=MIN
 F %L=0:0 D INSH Q:DAT=""
 S @HISTO@("MAX")=MAX,@HISTO=CPT
 S @HISTO@("TEXTE")=2
 K @(GL),@(GLS)
 S LARG=$S(TD=0:8,1:4)
 Q
INS 
 K @(GL)
 D MVG^%QSCALVA(REPL,LAN,ATR,GL,.T)
 S O=""
BCL S O=$O(@GL@(O)) Q:O=""
 S DAT=@GL@(O),DAF=$$AFFI^%QMDAUC(REPL,ATR,DAT)
 S:DAT>DAM DAM=DAT
 S DAT=$S(TD=0:$$01^%QMDATE1($P(DAT,",")),1:$$05^%QMDATE1($P(DAT,",")))
 S @GLS@(DAT)=$S($D(@GLS@(DAT)):@GLS@(DAT),1:0)+1
 S @GLS@(DAT,"IND",LAN,O)=DAT
 I TD=1 S:DAT<MIN MIN=DAT
 I TD=0 S DAF=$$10^%QMDATE1(DAT) S:$$10^%QMDATE1(MIN)>DAF MIN=DAT
 G BCL
 
INSH 
 S CPT=CPT+1
 I '($D(@GLS@(DAT))) S @GLS@(DAT)=0
 S CH=@GLS@(DAT),@HISTO@(CPT)=CH
 S @HISTO@(CPT,"TEXT")=DAT
 S:CH>MAX MAX=CH
 S LAN=""
INL S LAN=$O(@GLS@(DAT,"IND",LAN)) G:LAN="" FIN
 S O=""
 F %L=0:0 S O=$O(@GLS@(DAT,"IND",LAN,O)) Q:O=""  S @HISTO@(CPT,"IND",LAN,O)=@GLS@(DAT,"IND",LAN,O)
 G INL
FIN 
 I TD=1 S DAT=$$05^%QMDATE1($$50^%QMDATE1(DAT)+7) S:DAT>$ZP(@GLS@("")) DAT="" Q
 S DAF=$$10^%QMDATE1(DAT)+1
 S DAT=$$01^%QMDATE1(DAF)
 I DAF>DAM S DAT=""
 Q
 
AFF 
 D ^%VZCDB($$^%QZCHW("Etalement des stades pour l'etude")_" "_ETU,0)
 S DX=XG,DY=(YH+DV)-2 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Date.jal")
 S DY=DY+1 X XY D BLD^%VVIDEO X XY W $$^%QZCHW("Nbr.stade")
 D NORM^%VVIDEO Q
 
IMP(T) 
 I T="G" G IMPG
 
 S DX=15,DY=YH-1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Etalement des stades pour l'etude")_" "_ETU
 S DX=0,DY=(DV+YH)-2 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Dates.jal")
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Nbr.stade")
 Q
IMPG 
 S @TXT@(YH+1,(XC+LMARG)+10)=$$^%QZCHW("Etalement des stades pour l'etude")_" "_ETU
 S DY=(HFHA+HHIST)+3,@TXT@(DY,XC)=$$^%QZCHW("Date.jal")
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Nbr.stade")
 Q
 
JOUR 
 S TD='(TD)
 D ^%VZEATT,INIT^%HXYPARA,MKCOL^%HXYIST2,MKGRA^%HXYIST2,MKTEX^%HXYPARA
 D REAFF^%HXYPARA
 Q
 
ACCES 
 N COL,CS,LS,SEL
 D POCLEPA^%VVIDEO
 S (CS,LS)=1
ACC S SEL=$$^%VZEMOV(LMARG,(HFHA+HHIST)+1,NBCOL,HTEXT,ECART+LARG,1,TEXT,.CS,.LS)
 I '(SEL) S DY=22,DX=0 D CLEBAS^%VVIDEO Q
 S CS=(CS+NOCOL)-1
 I '($D(@HISTO@(CS))) D ^%VSQUEAK G ACC
 I @HISTO@(CS)=0 D ^%VSQUEAK G ACC
 D OPER(CS)
 D ^%QUKOLO K ^DESC($J)
 D CLEPAG^%VVIDEO,REAFF^%HXYPARA
 Q
OPER(NC) 
 N %I,I,J,L,N,OP,R,REP,T
 D ^%VZEATT
 K ^DESC($J)
 S COL="^DESC($J)"
 S ^DESC($J,"MSG")=$$^%QZCHW("Date")_" : "_@HISTO@(CS,"TEXT")_"  ("_@HISTO@(CS)_" "_$$^%QZCHW("stades")_")"
 S ^DESC($J,"TITC")=$$^%QZCHW("Lancement")
 S REP=$$LAN^%DLCON2
 S T="STADE",J="JOUR",R="ARTICLE/OPERATION"
 S L=0,I=""
 
 F %I=0:0 S I=$O(@HISTO@(NC,"IND",I)) Q:I=""  S N="" D TI
 S ^DESC($J,"LGC")=15
 S ^DESC($J,"COL",1)=$$^%QZCHW("Stade")_"^5^"_T
 S ^DESC($J,"COL",2)=$$^%QZCHW("Article/operation")_"^40^"_R
 S ^DESC($J,"COL",3)=$$^%QZCHW("Jour")_"^15^"_J
 Q
TI 
 S N=$O(@HISTO@(NC,"IND",I,N)) Q:N=""
 S L=L+1,^DESC($J,L)=I,^DESC($J,L,T)=N
 S OP=$$^%QSCALIN(REP,I,"OPERATION",N)
 I OP="" S OP=$$^%QSCALIN(REP,I,"ARTICLE.JALONNE",N)
 S ^DESC($J,L,R)=OP,^DESC($J,L,J)=@HISTO@(NC,"IND",I,N)
 G TI

