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

;%QULELC^INT^1^59547,73885^0
%QULELC ;;10:26 AM  11 Jun 1992;
 W !,"repertoire " R REP
 W !,"lien" R LIEN
 W !,"indiv" R IND
 W !,"config" R CONFIG
 W !,"titre" R TITRE1
 W !,"titre" R TITRE2
 
 N TABSEL S TABSEL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TB") K @(TABSEL)
 S DEFETU=REP_$C(0)_$C(0)_LIEN_$C(0)_$C(0)_IND_$C(0)_$C(0)_CONFIG_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)_$C(0)
 D SELEC(DEFETU,TABSEL,TITRE1,TITRE2)
 S IND="" F %I=1:1 S IND=$O(@TABSEL@(IND)) Q:IND=""  W !,IND
 Q
 
 
SELEC(DEFETU,TABSEL,TITRE1,TITRE2) 
 N TPX,DEJAFAIT,PILE,TABUTI
 N REPE,REP,LIEN,DIAL,CONFIG,EMPIL,GLOCONF,NREP,NLIEN
 N RAC,TEMP,GRAP,GRAC,UCONT,TGR,CONF,TRANSL,ORDO,LARA,TITRE
 N GLOET,CARETU
 S TPX=$$TEMP^%SGUTIL K @(TPX)
 S DEJAFAIT=$$CONCAS^%QZCHAD(TPX,"T"),PILE=$$CONCAS^%QZCHAD(TPX,"P")
 S TABUTI=$$CONCAS^%QZCHAD(TPX,"U")
 S CARETU=$$CONCAS^%QZCHAD(TPX,"CAR")
 D GETADR
 I $$LOAD^%QULELO3(DEFETU)'="" K @(TPX) Q
 
 D CLEPAG^%VVIDEO,^%VZEATT
 
 S REP=@CAR@("REP"),LIEN=@CAR@("LIEN"),ORDO=@CAR@("ORDO")
 D MAKEGRA^%QULELOM
 D MAKEUC,OFF^%VZEATT
 
 S TITRE=1_$C(0)_1_$C(0)_TITRE1_$C(0)_2_$C(0)_1_$C(0)_TITRE2
 S RESSTR=$$INIT^%QULELV(GRAP,GRAC,@CAR@("LARA"),3,UCONT,TITRE,1)
 S @RESUL@("P")="",@RESUL@("O")=$O(@GRAC@(""))
RUN D RUN^%QULELV1(RESSTR,@RESUL@("O"),@RESUL@("P"),1,0,RESUL)
 I @RESUL@("NUMUC")'=1 G STOP2
 
 S @TABSEL@(@RESUL@("O"))=""
 G RUN
 
 
STOP2 I @RESUL@("NUMUC")'="CTRLA" G STOP3
 D END^%QULELV(RESSTR)
 K @(TPX)
 Q
 
 
STOP3 K @TABSEL@(@RESUL@("O"))
 G RUN
 
 
GETADR S GRAP=$$CONCAS^%QZCHAD(CARETU,"G"),UCONT=$$CONCAS^%QZCHAD(CARETU,"U")
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S RESUL=$$CONCAS^%QZCHAD(CARETU,"RES"),GRAC=$$CONCAS^%QZCHAD(CARETU,"R")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),GLOCONF=$$CONCAS^%QZCHAD(CARETU,"GG")
 S CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 Q
 
 
 
MAKEUC 
 N %AA
 S %AA=1
 S @UCONT@("AUTRE",%AA)="SEL^%QULELC",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Selectionner"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Selection de l'individu courant"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="SEL^%QULELC",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Deselectionner"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Deselection de l'individu courant"),%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="CTRB^%QULELC",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Acces individu"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu"),@UCONT@("AUTRE",%AA,"CTR")="B",%AA=%AA+1
 S @UCONT@("AFF")="$$ABRV^%QULELC",@UCONT@("INFO")="$$INFO^%QULELC",@UCONT@("FULL")="$$FULL^%QULELC"
 I $D(@CONF@("POIDS")) S @UCONT@("TRI")="$$POIDS^%QULELC"
 Q
 
SEL(TP) 
 S SUPREM=1,FINEXE=1 Q
 
 
ABRV(RIVX,LG) N GAG
 S GAG=@RIVX Q $$S^%QAX(GAG)
VALEXAC(ADOBJ) 
 N OBJ
 S OBJ=$S(@ADOBJ="":"",ORDO:@TRANSL@("CV",@ADOBJ),1:@ADOBJ)
 Q OBJ
 
FULL(TP) 
 N GAG
 S GAG=$$VALEXAC("@TP@(""O"")") Q $$S^%QAX(GAG)_$S($D(@TABSEL@(GAG)):" (SELECTIONNE)",1:"")
 
 
 
 
 
 
INFO(TP) 
 N RES,%I,I,D,A,OBJP,OBJ,NIV
 S NIV=@TP@("N"),OBJ=@TP@("O"),OBJP=@TP@("P")
 S OBJ=$S(ORDO:@TRANSL@("CV",OBJ),1:OBJ)
 S RES=""
 S I="" F %I=1:1 S I=$O(@CONF@("COM",I)) Q:I=""  S RES=RES_@CONF@("COM",I)_$C(0)_I_$C(0)
 S I="" F %I=1:1 S I=$O(@CONF@("ATT",I)) Q:I=""  S RES=RES_@CONF@("ATT",I)_$C(0)_$$^%QSCALVA($$REPINT(NIV),OBJ,I)_$C(0)
 Q:OBJP="" RES
 S OBJP=$S(ORDO:@TRANSL@("CV",OBJP),1:OBJP)
 S D=$$NOML1^%QSGES20(OBJP,OBJ,LIEN,OBJ) Q:D="" RES
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D)) RES
 S I="" F %I=1:1 S I=$O(@CONF@("LIEN",I)) Q:I=""  S RES=RES_@CONF@("LIEN",I)_$C(0)_$$^%QSCALVA(A,D,I)_$C(0)
 Q RES
 
CTRB(TP) 
 N REPO,OBJ,NIV,PEROBJ
 S OBJ=$S(@TP@("O")="":"",ORDO:@TRANSL@("CV",@TP@("O")),1:@TP@("O"))
 S NIV=@TP@("N")
 S REPO=$S(NIV=2:$$REPD^%QSGEL2(REP,LIEN),1:REP)
 D MEMX^%QCAMEM
 D CLEPAG^%VVIDEO,^%QSATTRI(OBJ,REPO,5,2,70,18),CLEPAG^%VVIDEO
 D RVARX^%QCAMEM
 S MODG=0,OKU=1,SUPREM=1
 Q
 
 
REPINT(NIV) 
 Q:NIV=1 REP Q:$$TYPEL^%QSGES90(LIEN)>3 REP Q $$REPD^%QSGEL2(REP,LIEN)
 
 
 
 
 
POIDS(PER,FIL) 
 N REPI,RES,D
 Q:'($D(@CONF@("POIDS"))) 0 Q:'($D(@CONF@("ORDRE"))) 0 Q:'($D(@CONF@("LIEN"))) 0
 G:@CONF@("LIEN") PDSL
 S REPI=$$REPINT($S(PER="":1,1:2))
 S RES=$$^%QSCALIN(REPI,FIL,@CONF@("POIDS"),1)
 G PDSFI
PDSL I PER="" S RES="" G PDSFI
 S RES=$$^%QSCALIN($$LIENI^%QSGEL3,$$NOML1^%QSGES20(PER,FIL,LIEN,FIL),@CONF@("POIDS"),1)
PDSFI S:(RES+0)'=RES RES=-99999
 I @CONF@("ORDRE") S RES=-(RES)
 Q RES

