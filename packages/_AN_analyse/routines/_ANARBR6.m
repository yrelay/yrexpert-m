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

;%ANARBR6^INT^1^59547,73866^0
%ANARBR6 ;
 
 
 
 
FLO S VAL=$$RED(A,"TEXTE")
 G:VAL="$EXISTE" FEXIS
 G:VAL="$APPARTIENT" FAPPART
 G:VAL="$POURCENT" FPOURC
 G:VAL="$CREER.SYNONYME" SYNO^%ANARB17
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("ANSARBR2 : fonction logique inconnue = ")_VAL)
 S VAL="",POS=0 G RET^%ANGEPIL
 
 
FEXIS K @(TEMPO) S @TEMPO@(1)="ATR",@TEMPO@(2)="CH",@TEMPO@(3)="SA"
 S @TEMPO@(4)="ATT",@TEMPO@(5)="ORD",@TEMPO@(6)="OBJ",@TEMPO@(7)="REP"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(SA,1),ORD=$$RED(A,2),CH=$$RED(SA,2)
 G:(ORD=0)&(CH'=0) FEXIS4
 
 D EMPIL^%ANGEPIL("FEXIS2^%ANARBR6") G INT^%ANARBR2
FEXIS2 I (VAL="")!(POS=0) S POS=1,VAL=0 G DEPIL^%ANGEPIL
 
 I CH=0 S POS=1,VAL=1 G DEPIL^%ANGEPIL
 
 S ATR=VAL,A=CH D EMPIL^%ANGEPIL("FEXIS3^%ANARBR6") G INT^%ANARBR2
FEXIS3 I (VAL="")!(POS=0) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S POS=1,VAL=ATR=VAL G DEPIL^%ANGEPIL
FEXIS4 
 S A=CH D EMPIL^%ANGEPIL("FEXIS5^%ANARBR6") G INT^%ANARBR2
FEXIS5 I (VAL="")!(POS=0) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$ATTR^%TLIACT4($$RED(SA,1),.ATT,.ORD,.OBJ,.REP)) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S POS=1,VAL=$$VAIR^%QSGE5(REP,OBJ,ATT,VAL)
 G DEPIL^%ANGEPIL
 
 
FAPPART K @(TEMPO) S @TEMPO@(1)="OK",@TEMPO@(2)="LIST",@TEMPO@(3)="ATT"
 S @TEMPO@(4)="IND",@TEMPO@(5)="I",@TEMPO@(6)="NOAT",@TEMPO@(7)="NAT"
 S @TEMPO@(8)="RRP",@TEMPO@(9)="SA",@TEMPO@(10)="RP"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 I A=0 S ATT=CARBR1("@","OBJET") G SAPP
 D EMPIL^%ANGEPIL("APPART1^%ANARBR6") G INT^%ANARBR2
APPART1 I POS=0 S VAL="" G DEPIL^%ANGEPIL
 S ATT=VAL
SAPP S A=$$RED(SA,2) G:$$RED(A,"TEXTE")="$ENUM" FENUM
 D EMPIL^%ANGEPIL("APPART2^%ANARBR6") G INT^%ANARBR2
APPART2 I (POS=0)!(VAL="") S POS=0,VAL="" G DEPIL^%ANGEPIL
 S LIST=VAL
 G:$$IR^%QSGEST5("L0",LIST) LIST
 S RP=$$NOMINT^%QSF(LIST)
 I RP="" D:MODAF ADD^%TLIFEN("LOG","  "_LIST_" "_$$^%QZCHW("n'est ni une liste, ni un repertoire")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$IR^%QSGEST5(RP,ATT)) S VAL=0 G DEPIL^%ANGEPIL
 S VAL=1 G DEPIL^%ANGEPIL
LIST 
 S VAL=$$EXI^%QSGES11(LIST,ATT)
 G DEPIL^%ANGEPIL
 
 
FENUM S NOAT=A,OK=0,I=0
FENUM2 S I=I+1,A=$$RED(NOAT,I)
 G:A=0 FENUMF
 D EMPIL^%ANGEPIL("FENUM3^%ANARBR6") G INT^%ANARBR2
FENUM3 I VAL=ATT S OK=1 G FENUMF
 G FENUM2
FENUMF S VAL=OK G DEPIL^%ANGEPIL
 
 
FONOM K @(TEMPO) S @TEMPO@(1)="OBJ",@TEMPO@(2)="OBJ2",@TEMPO@(3)="BA",@TEMPO@(4)="NOM"
 S @TEMPO@(5)="IND",@TEMPO@(6)="VALE",@TEMPO@(7)="VAR",@TEMPO@(8)="REP"
 S @TEMPO@(9)="REPI",@TEMPO@(10)="OB",@TEMPO@(11)="NOM2",@TEMPO@(12)="SA"
 S @TEMPO@(13)="OK"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,OBJ=$$RED(A,1)
 I OBJ=0 S VAL=CARBR1("@","OBJET") G DEPIL^%ANGEPIL
 
 S NOM=$$RED($$RED(OBJ,1),"TEXTE")
 I $E(NOM)="%" S VAL=$$^%QCAZG("CARBR1(NOM,""OBJET"")") G DEPIL^%ANGEPIL
 S REP=$$TYPE^%QSGEST9(NOM)
 I REP=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut non lien")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S IND=$$RED(OBJ,2) I IND=0 S IND="" G STALEC
 S VAR=$$RED(IND,"TYPE"),IND=$$RED(IND,"TEXTE")
 G:(VAR="CHAINE")!(VAR="NOMBRE") STALEC
 I $E(IND,1)'="%" S POS=0,VAL="" G DEPIL^%ANGEPIL
 S IND=$$^%QSCALVA(CARBR1("%","BASE"),CARBR1("%","OBJET"),IND)
 I IND="" S POS=0,VAL="" G DEPIL^%ANGEPIL
STALEC S VAR=$$RED(OBJ,3)
 I VAR=0 S VAR="@" G SATT
 S VAR=$$RED(VAR,"TEXTE")
 I $E(VAR,1)="%" G SATT
 
 S OB=$$OBJPROX^%QSCALVU(VAR,CARBR1("@","BASE"),CARBR1("@","OBJET")),REPI=$$REPD^%QSGEL2(CARBR1("@","BASE"),VAR) G SATT2
SATT I ('($D(CARBR1(VAR,"BASE"))))!('($D(CARBR1(VAR,"OBJET")))) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S REPI=CARBR1(VAR,"BASE"),OB=CARBR1(VAR,"OBJET")
SATT2 S VAL=$$^%QSCALIN(REPI,OB,NOM,IND)
 S LIEN=$$TYPE^%QSGEST9(REPI,NOM) I LIEN=2 S VAL=$$NOMFILS^%QSGES10(REPI,OB,$$REPD^%QSGEL2(REPI,NOM),VAL)
 D:AFF'="" @(AFF_"("_$$S1^%QZCHAD(NOM)_","_$$^%QZCHAD(VAL)_")")
 S:VAL="" POS=0 G DEPIL^%ANGEPIL
 
 
FPOURC 
 K @(TEMPO) S @TEMPO@(1)="ATT1",@TEMPO@(2)="ATT2",@TEMPO@(3)="TO"
 S @TEMPO@(4)="POS2",@TEMPO@(5)="SA",@TEMPO@(6)="GG" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FPOURC1^%ANARBR6") G INT^%ANARBR2
FPOURC1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S ATT1=VAL,A=$$RED(SA,2)
 I '($$NUM^%QZNBN(ATT1)) S POS=0 G DEPIL^%ANGEPIL
 I ATT1=0 S POS=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FPOURC2^%ANARBR6") G INT^%ANARBR2
FPOURC2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S ATT2=VAL,A=$$RED(SA,3)
 I '($$NUM^%QZNBN(ATT2)) S POS=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FPOURC3^%ANARBR6") G INT^%ANARBR2
FPOURC3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S TO=VAL I '($$NUM^%QZNBN(TO)) S POS=0 G DEPIL^%ANGEPIL
 S POS=1
 S GG=ATT1-ATT2 I GG<0 S GG=-(GG)
 I (GG/ATT1)'>TO S VAL=1 G DEPIL^%ANGEPIL
 S VAL=0 G DEPIL^%ANGEPIL
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

