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

;%ANARBR2^INT^1^59547,73866^0
%ANARBR2 ;
 
 
 
 
SUBST(A,CARBR1,AFF,POS) N TEMPO,VAL,RESULT,NORES,TYP
 D INIT^%ANGEPIL
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 D EMPIL^%ANGEPIL("SUBST1^%ANARBR2")
 I '($D(%ROUT99)) S %ROUT99=""
 G INT
SUBST1 K @(TEMPO),%ROUT99 D EPIL^%ANGEPIL
 Q VAL
 
INT S POS=1
 I A=0 S VAL="" G RET^%ANGEPIL
 S TYP=$$RED(A,"TYPE")
 G:TYP="NOM" STD G:TYP="ATTRIBUT" ATT G:TYP="CHAINE" STD G:TYP="NOMBRE" STD G:TYP="VARIABLE" VAR^%ANARB13 G:TYP="ENTIER" STD G:TYP="INDICE" STD
 G:TYP="OPERATEUR" OPE^%ANARB13 G:TYP="FONCTION" FON^%ANARBR4 G:TYP="COMPARATEUR.BINAIRE" CBI G:TYP="NEGATION" NEG
 G:TYP="COMPARATEUR.TERNAIRE" CTE G:TYP="COUPLE" CPL G:TYP="VALEUR.SPECIALE" VALSPE G:TYP="FONCTION.LOGIQUE" FLO^%ANARBR6
 G:TYP="OPERATEUR.LOGIQUE" OPL^%ANARB13 G:TYP="ALFANUM" ALF G:TYP="NIMP" STD G:TYP="CHAINEX" CHX
 
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Type de noeud inconnu. Veuillez reeffectuer una analyse ..."))
 S POS=0,VAL="" G RET^%ANGEPIL
 
 
 
 
STD S VAL=$$RED(A,"TEXTE") G RET^%ANGEPIL
 
 
CHX K @(TEMPO) S @TEMPO@(1)="ARB",@TEMPO@(2)="CHX",@TEMPO@(3)="SCHX",@TEMPO@(4)="A"
 D EMPV^%ANGEPIL(TEMPO) S CHX="",ARB=A
BCHX G:ARB=0 FCHX D EMPIL^%ANGEPIL("BCHX1^%ANARBR2") S A=$$RED(ARB,2) G INT
BCHX1 G:'(POS) DEPIL^%ANGEPIL S CHX=VAL_" "_CHX,ARB=$$RED(ARB,1) G BCHX
FCHX S VAL=$E(CHX,1,$L(CHX)-1) G DEPIL^%ANGEPIL
 
 
NEG S A=$$RED(A,1) D EMPIL^%ANGEPIL("NEG1^%ANARBR2") G INT
NEG1 I VAL="" S POS=0 G RET^%ANGEPIL
 S VAL='($$S(VAL)) G RET^%ANGEPIL
 
 
ATT K @(TEMPO)
 S @TEMPO@(1)="NOM",@TEMPO@(2)="ORDR",@TEMPO@(3)="OK",@TEMPO@(4)="VAR",@TEMPO@(5)="REP",@TEMPO@(6)="REPI",@TEMPO@(7)="OB",@TEMPO@(8)="NOM2",@TEMPO@(9)="ATS"
 D EMPV^%ANGEPIL(TEMPO)
 S NOM=$$RED($$RED(A,1),"TEXTE")
 S ORDR=$$RED(A,2) I ORDR=0 S ORDR="" G STALEC
 S VAR=$$RED(ORDR,"TYPE"),ORDR=$$RED(ORDR,"TEXTE")
 G:(VAR="CHAINE")!(VAR="NOMBRE") STALEC
 I $E(ORDR,1)'="%" S POS=0,VAL="" G DEPIL^%ANGEPIL
 
 S ORDR=$$^%QSCALIN(CARBR1("%","BASE"),CARBR1("%","OBJET"),ORDR,1)
 I ORDR="" S POS=0,VAL="" G DEPIL^%ANGEPIL
STALEC I $E(NOM)="%" S VAR="%" G SATT
 S VAR=$$RED(A,3) I VAR=0 S VAR="@" G SATT
 S VAR=$$RED(VAR,"TEXTE") I $E(VAR,1)="%" G SATT
 
 G:$D(CARBR1(VAR,"OBJET")) SATT
 I VAR'="LISTE" G PROX
 
 S OB=$S($D(LISTE):LISTE,1:"") I OB="" S POS=0,VAL="" G DEPIL^%ANGEPIL
 S REPI="L0" G SATT2
PROX 
 S OB=$$OBJPROX^%QSCALVU(VAR,CARBR1("@","BASE"),CARBR1("@","OBJET")),REPI=$$REPD^%QSGEL2(CARBR1("@","BASE"),VAR) G SATT2
SATT I ('($D(CARBR1(VAR,"BASE"))))!('($D(CARBR1(VAR,"OBJET")))) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S REPI=CARBR1(VAR,"BASE"),OB=CARBR1(VAR,"OBJET")
 I %ROUT99'="" G @%ROUT99
SATT2 I ORDR'="" S VAL=$$^%QSCALIN(REPI,OB,NOM,ORDR) G SATT3
 I $$OAIR^%QSGE5(REPI,OB,NOM,1) S VAL=$$^%QSCALIN(REPI,OB,NOM,1) G SATT3
 S VAL=$$^%QSCALVA(REPI,OB,NOM)
 
SATT3 I (REPI="")!(NOM="") S VAL="" G SATT4
 I '($D(^[QUI]RQSDON("REMATDAT",REPI,NOM))) D SETREM^%QMDAUC(REPI,NOM)
 I ^[QUI]RQSDON("REMATDAT",REPI,NOM) S VAL=$$AFFI^%QMDAUC(REPI,NOM,VAL)
 
SATT4 D:AFF'="" @(AFF_"("_$$S1^%QZCHAD(NOM)_","_$$S1^%QZCHAD(VAL)_")")
 S:VAL="" POS=0 G DEPIL^%ANGEPIL
 Q VAL
 
 
;INF S POS=0,VAL="" G RET^%ANGEPIL
 
; S E1=$S(C=0:1,1:$$INT(C)) Q:E1="" ""
; S E2=$$INT($$RED(A,2)) Q:E2="" ""
; Q "I "_E1_" "_E2
 
CBI K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="E2",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("CBI1^%ANARBR2") G INT
CBI1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E1=$$S(VAL),A=$$RED(SA,2) D EMPIL^%ANGEPIL("CBI2^%ANARBR2") G INT
CBI2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E2=$$S(VAL)
 S VAL="("_E1_$$RED(SA,"TEXTE")_E2_")"
 S @("VAL="_VAL) G DEPIL^%ANGEPIL
 
CTE K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="E2",@TEMPO@(3)="E3"
 S @TEMPO@(4)="OP",@TEMPO@(5)="SA",@TEMPO@(6)="NEG" D EMPV^%ANGEPIL(TEMPO)
 S OP=$$RED(A,"TEXTE"),SA=A,NEG=""
 I $E(OP)="'" S NEG="'",OP=$P(OP,"'",2)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("CTE1^%ANARBR2") G INT
CTE1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E1=$$S(VAL),A=$$RED(SA,2) D EMPIL^%ANGEPIL("CTE2^%ANARBR2") G INT
CTE2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E2=$$S(VAL),A=$$RED(SA,3) D EMPIL^%ANGEPIL("CTE3^%ANARBR2") G INT
CTE3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E3=$$S(VAL)
 S VAL=NEG_"(("_E1_$S($E(OP,1,1)="[":"'<",1:">")_E2_")&("_E1_$S($E(OP,2,2)="[":"<",1:"'>")_E3_"))"
 S @("VAL="_VAL) G DEPIL^%ANGEPIL
 
CPL K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("CPL1^%ANARBR2") G INT
CPL1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E1=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("CPL2^%ANARBR2") G INT
CPL2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=E1_"^"_VAL G DEPIL^%ANGEPIL
 
ALF S VAL=$$RED(A,"TEXTE") G RET^%ANGEPIL
 
VALSPE I '($D(^PILMOTRE($J))) S POS=0,VAL="" G RET^%ANGEPIL
 S VAL=$$RED(A,"TEXTE"),VAL=$$^%QCAZG("^PILMOTRE($J,^PILMOTRE($J),"""_VAL_""")")
 G RET^%ANGEPIL
 
S(E) Q:$$PARA^%QZNBN1(E) E Q """"_$$ZSUBST^%QZCHSUB(E,"""","""""")_""""
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

