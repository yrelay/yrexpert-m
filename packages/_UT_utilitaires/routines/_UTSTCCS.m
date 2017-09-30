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

;%UTSTCCS^INT^1^59547,74033^0
%UTSTCCS ;;02:53 PM  4 Sep 1996; 17 Dec 92 10:05 AM ; 18 Dec 92  1:24 PM
 
 
 
 N REP,CORREC,GLO,GDEF,REF,LREF,I,MOD,NGDEF,VAL
 W !,"visualisation (1) ou correction (2) "
 R REP Q:(REP'=1)&(REP'=2)
 S CORREC=REP=2
 S (NBG,NBGNOK,NBVNOK)=0
 ;; cao debug ^%Q
 F GLO="QUERY2","QUERY3","QUERY4","QUERYV" W !,GLO S GDEF="^[QUI]"_GLO,REF="^"_GLO,LREF=$L(REF) F %I=1:1 S GDEF=$$^%Q($Q(@GDEF)) Q:$E(GDEF,1,LREF)'=REF  S GDEF="^[QUI]"_$E(GDEF,2,$L(GDEF)) D TRT
 W !,"bilan"
 W !,NBGNOK," references incorrectes sur ",NBG
 W !,NBVNOK," valeurs incorrectes sur ",NBG
 Q
TRT G:CORREC MODIF
 S NBG=NBG+1,MOD=0
 F I=1:1:31 I $F(GDEF,$C(I)) W !,*7,"probleme sur ",GDEF S MOD=1
 F I=127:1:255 I $F(GDEF,$C(I)) W !,*7,"probleme sur ",GDEF S MOD=1
 I MOD S NBGNOK=NBGNOK+1,MOD=0
 S VAL=@GDEF
 F I=1:1:31 I $F(VAL,$C(I)) W !,*7,"probleme sur ",VAL S MOD=1
 F I=127:1:255 I $F(GDEF,$C(I)) W !,*7,"probleme sur ",GDEF S MOD=1
 I MOD S NBVNOK=NBVNOK+1,MOD=0
 Q
MODIF S MOD=0,NGDEF=GDEF
 F I=1:1:31 I $F(NGDEF,$C(I)) S NGDEF=$TR(NGDEF,$C(I),""),MOD=1
 F I=127:1:255 I $F(NGDEF,$C(I)) S NGDEF=$TR(NGDEF,$C(I),""),MOD=1
 S VAL=@GDEF
 F I=1:1:31 I $F(VAL,$C(I)) S VAL=$TR(VAL,$C(I),""),MOD=1
 F I=127:1:255 I $F(VAL,$C(I)) S VAL=$TR(VAL,$C(I),""),MOD=1
 I MOD W !,"probleme sur ",GDEF S @NGDEF=VAL
 Q
 
 
 
REPALL 
 S CORREC=1
 S (NBG,NBGNOK,NBVNOK)=0
 S GDEFX="^[QUI]A"
 ;; cao debug ^%Q
 F  S GLO=$O(@GDEFX) Q:GLO=""  W !,GLO S (GDEF,GDEFX)="^[QUI]"_GLO,REF="^"_GLO,LREF=$L(REF) F %I=1:1 S GDEF=$$^%Q($Q(@GDEF)) Q:$E(GDEF,1,LREF)'=REF  S GDEF="^[QUI]"_$E(GDEF,2,$L(GDEF)) D MODIF
 W !,"bilan"
 W !,NBGNOK," references incorrectes sur ",NBG
 W !,NBVNOK," valeurs incorrectes sur ",NBG
 Q
 
TST1 
 N REP,CORREC,GLO,GDEF,REF,LREF,I,MOD,NGDEF,VAL
 S (NBG,NBGNOK,NBVNOK)=0
 ;; cao debug ^%Q
 F GLO="QUERY4" W !,GLO S GDEF="^[QUI]"_GLO,REF="^"_GLO,LREF=$L(REF) F %I=1:1 S GDEF=$$^%Q($Q(@GDEF)) Q:$E(GDEF,1,LREF)'=REF  S GDEF="^[QUI]"_$E(GDEF,2,$L(GDEF)) D TST11
 W !,"bilan"
 W !,NBGNOK," references incorrectes sur ",NBG
 W !,NBVNOK," valeurs incorrectes sur ",NBG
 Q
TST11 
 
 S NGDEF=GDEF
 F I=1:1:31 I $F(NGDEF,$C(I)) S NGDEF=$TR(NGDEF,$C(I),""),MOD=1
 F I=127:1:255 I $F(NGDEF,$C(I)) S NGDEF=$TR(NGDEF,$C(I),""),MOD=1
 S VAL=@GDEF
 F I=1:1:31 I $F(VAL,$C(I)) S VAL=$TR(VAL,$C(I),""),MOD=1
 F I=127:1:255 I $F(VAL,$C(I)) S VAL=$TR(VAL,$C(I),""),MOD=1
 Q
TST2 
 N REP,CORREC,GLO,GDEF,REF,LREF,I,MOD,NGDEF,VAL
 S (NBG,NBGNOK,NBVNOK)=0
 F GLO="QUERY4" W !,GLO S GDEF="^[QUI]"_GLO,REF="^"_GLO,LREF=$L(REF) F %I=1:1 S GDEF=$$^%Q($Q(@GDEF)) Q:$E(GDEF,1,LREF)'=REF  S GDEF="^[QUI]"_$E(GDEF,2,$L(GDEF)) D TST22
 W !,"bilan"
 W !,NBGNOK," references incorrectes sur ",NBG
 W !,NBVNOK," valeurs incorrectes sur ",NBG
 Q
TST22 
 
 S NGDEF="",LD=$L(GDEF)
 F I=1:1:LD S CAR=$E(GDEF,I),NCAR=$A(CAR) I (NCAR>31)&(NCAR<127) S NGDEF=NGDEF_CAR
 S VAL=@GDEF
 S NVAL="",LD=$L(VAL)
 F I=1:1:LD S CAR=$E(VAL,I),NCAR=$A(CAR) I (NCAR>31)&(NCAR<127) S NVAL=NVAL_CAR
 Q (VAL=NVAL)&(GDEF=NGDEF)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PASSE1 N LPB,R,I,NXI,NL,%R,%I,REEL,DEV
 W !,"mode reel(1) ou simulation(2)" R REEL
 S REEL=REEL=1
 D INIDEV
 S LPB=$$TEMP^%SGUTIL
 S R=""
BCLR1 S R=$O(^[QUI]QUERYV(R)) G:R="" FPASSE1
 U 0 W !,"repertoire "_R,!,"----------------------"
 S I=""
BCLI1 S I=$O(^[QUI]QUERYV(R,I)) G:I="" BCLR1
 U 0 W !,I
 G:'($$PB(I,.NXI)) BCLI1
 U 0 W *7
 
 
 I NXI="" D:REEL SX^%QSGESTK(R,I) D AJCR("suppression de l'individu "_I_"du repertoire "_R) G BCLI1
 
 
 
 I $$IR^%QSGE5(R,NXI) S @LPB@(R,I)="" D AJCR("repertoire "_R_" : "_I_" et "_NXI_" existent -> insertion dans la liste") G BCLI1
 
 
 
 D:REEL RECOP^%QSGES25(R,I,NXI,"",1)
 D AJCR("repertoire "_R_" : copie de "_I_" dans "_NXI)
 
 D:REEL SX^%QSGESTK(R,I)
 D AJCR("suppression de l'individu "_I_"du repertoire "_R)
 G BCLI1
FPASSE1 
 S R="" F %R=0:0 S R=$O(@LPB@(R)) Q:R=""  S NL=$$GEN^%QCAPOP("PBM") D CREERL^%QS0XG1(NL,R,"^[QUI]ZLIGTRAI("""_NL_""")","PROGRAMME","NETTOYAGE") S I="" F %I=0:0 S I=$O(@LPB@(R,I)) Q:I=""  D AJOUT^%QS0XG1(NL,I)
 D FINDEV
 Q
 
INIDEV S DEV=10
 O DEV:(MODE="W":FILE="correct.txt") Q
AJCR(MESS) U DEV W MESS,! Q
FINDEV C 10 Q
 
PASSE2 
 N REEL,DEV,R,I,A,O,ERR1,ERR2,ERR3,NXI,NXA,NXO
 W !,"mode reel(1) ou simulation(2)" R REEL
 S REEL=REEL=1
 D INIDEV
 S R=""
BCLR2 S R=$O(^[QUI]QUERYV(R)) G:R="" FPASSE2
 U 0 W !,"repertoire "_R,!,"----------------------"
 S I=""
BCLI2 S I=$O(^[QUI]QUERYV(R,I)) G:I="" BCLR2
 U 0 W !,I
 G:$$PB(I,.NXI) BCLI2
 S A=""
BCLA2 S A=$O(^[QUI]QUERYV(R,I,A)) G:A="" BCLI2
 S ERR1=$$PB(A,.NXA),O=""
BCLO2 S O=$O(^[QUI]QUERYV(R,I,A,O)) G:O="" BCLA2
 S ERR2=$$PB(O,.NXO)
 S V=^[QUI]QUERYV(R,I,A,O)
 S ERR3=$$PB(V,.NXV)
 
 
 G:(('(ERR1))&('(ERR2)))&('(ERR3)) BCLO2
 
 
 D:REEL PS^%QSGESTI(R,I,A,V,O)
 I ((NXA="")!(NXO=""))!(NXV="") D AJCR("ind "_I_" : un elt inexploitable dans triplet "_A_" "_O_" "_V_" :suppression ") G BCLO2
 
 I (NXA'=A)!(NXO'=O),$$OAIR^%QSGE5(R,I,NXA,NXO) D AJCR("ind "_I_" : triplet "_A_" "_O_" "_V_" deja corrige : suppression ") G BCLO2
 
 D AJCR("ind "_I_" : triplet "_A_" "_O_" "_V_" : correction ")
 D:REEL PA^%QSGESTI(R,I,NXA,NXV,NXO)
 G BCLO2
 
FPASSE2 
 D FINDEV
 Q
 
PB(VAL,NXVAL) 
 N CAR,I,LD,NCAR
 S NXVAL="",LD=$L(VAL)
 F I=1:1:LD S CAR=$E(VAL,I),NCAR=$A(CAR) I (NCAR>31)&(NCAR<127) S NXVAL=NXVAL_CAR
 Q VAL'=NXVAL
 ;

