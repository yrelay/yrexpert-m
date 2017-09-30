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
;! HL002 ! HL     ! 20/07/12 ! Undefined local variable: ATTDI                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSQUES2^INT^1^59547,73883^0
%QSQUES2 ;
 
 
 
 
 I BASE="" D MES($$^%QZCHW("Veuillez definir Repertoire en premier")_" ...") Q
 D ^%QULIMO(0,12,80,11,"CONT",.NOLC,"UCA^%QSQUES2(1)","UCS^%QSQUES2")
 K ^SANAREQ($J)
 S DEJACONT=$D(CONT) D POCLEPA^%VVIDEO Q
 
UCA(BOOL) N P,I,J,L1,RESULT,L2,L3,LL1,POSIT,SAVY1,CH,SX,SY,T,NORES,%COMPIL
 N %PROVEN,NOCOMPIL,ATTD,APPD,%c,ATTDI,TEMPO,TABATT
 S %PROVEN="RQS",SAVY1=Y1,POSIT=1,SX=DX,SY=DY,CH=Y1,%COMPIL="BIDON POUR REQUETES"
 S NOCOMPIL=1,(ATTD,APPD)=0
 S ^SANAREQ($J)=1
 I BOOL D INIT^%AN7(SX,SY) S NORES=$$VAL^%QULIMO("TETE"),TABATT=$$VAL^%QULIMO("ATT") G SUIT
 D INIT2^%AN7(SX,SY) S NORES=CONT(P1C,"TETE"),TABATT=CONT(P1C,"TABATT")
SUIT G:NORES="" L0
 
 D KILLB^%ANA(NORES) K:TABATT'="" ^[QUI]RQSDON("RQS","ATT",TABATT)
 
L0 D INIT^%ANGEPIL S NORES=0,RESULT=1,CH=Y1,P=1
 I '($D(^[QUI]RQSGLO("RQS","NBATT"))) S ^[QUI]RQSGLO("RQS","NBATT")=0
 S (TABATT,^[QUI]RQSGLO("RQS","NBATT"))=^[QUI]RQSGLO("RQS","NBATT")+1
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO)
 S I=1
BOUC S C=$E(CH,I) I C=" " S I=I+1 G BOUC
 
 N LIB,LL
 S LIB=$$^%QZCHW("$EXISTE"),LL=$L(LIB)
 I ($E(CH,I,(I+LL)-1)=LIB)!(C="'") D EMPIL^%ANGEPIL("L2S^%QSQUES2") G CRIT^%AN4
 
 I $F(CH,"<<",1) D EMPIL^%ANGEPIL("L3^%QSQUES2") G PRECED^%AN4
 
 I (($F(CH,"[[",1)!$F(CH,"]]",1))!$F(CH,"[]",1))!$F(CH,"][",1) D EMPIL^%ANGEPIL("L4^%QSQUES2") G CRITERE^%AN5
 
 D EMPIL^%ANGEPIL("L2S^%QSQUES2") G CRITERE^%AN5
L2S I '(RESULT) G:'(ERRMES) ERRA D MES($$^%QZCHW("Erreur de syntaxe")_" ...") G ERRA
 S L3=0 D CVAR2(NORES) S L1=$N(L3(-1)),L1=$S(L1=-1:"@",1:L1)
 S I=-1 F J=0:0 S I=$N(L3(I)) Q:I=-1  I I'="@",'($D(LVAR(I))) G:'(ERRMES) ERRA D MES(I_" "_$$^%QZCHW("n'a pas ete defini")_" ...") G ERRA
 G ENDA
L3 
 I '(RESULT) G:'(ERRMES) ERRA D MES($$^%QZCHW("Erreur de syntaxe")_" ...") G ERRA
 S L1=$$RED^%ANA($$RED^%ANA(NORES,1),"TEXTE"),L2=$$RED^%ANA($$RED^%ANA(NORES,2),"TEXTE")
 I '($D(LVAR(L1))) G:'(ERRMES) ERRA D MES(L1_" "_$$^%QZCHW("n'a pas ete defini")_" ...") G ERRA
 I '($D(LVAR(L2))) G:'(ERRMES) ERRA D MES(L2_" "_$$^%QZCHW("n'a pas ete defini")_" ...") G ERRA
 I LVAR(L1)'=LVAR(L2) G:'(ERRMES) ERRA D MES($$^%QZCHW("Utilisez deux individus de meme nature S.V.P.")_" ...") G ERRA
 S L1=L1_","_L2 G ENDA
L4 
 I '(RESULT) G:'(ERRMES) ERRA D MES($$^%QZCHW("Erreur de syntaxe")_" ...") G ERRA
 S L3=0 D CVAR2(NORES) S L1=$N(L3(-1)),L1=$S(L1=-1:"@",1:L1)
 I (L1'="")&(L1'="@"),'($D(LVAR(L1))) G:'(ERRMES) ERRA D MES(L1_" "_$$^%QZCHW("n'a pas ete defini")_" ...") G ERRA
ENDA D CAR^%AN1 I C'="" D M^%AN1("Caracteres en trop a la fin de la requete ..."),M^%AN1("Erreur de syntaxe ... ") G ERRA
 D SET^%ANA(NORES,"BASE",$S((L1="")!(L1="@"):$$NOMINT^%QSF(BASE),1:LVAR($P(L1,",",1))))
 D CVAR(NORES) S L2="",I=-1 F %I=0:0 S I=$N(L2(I)) Q:I=-1  S L2=L2_I_","
 S:'($D(L3)) L3=0 D SET^%ANA(NORES,"MULTI",L3>1)
 D SET^%ANA(NORES,"LATT",L2)
 D SET^%ANA(NORES,"VAR",L1)
 F I=1:1 S J=$P(L1,",",I) Q:J=""  S UTIL(J,NORES)=""
 
 K ^[QUI]RQSDON("RQS","ATT",TABATT)
 
 ;%HL002 F I=1:1:ATTD S %c=$$LEX^%LXSTOCK(ATTD(I),.ATTDI) ATTDI="" I %c'>1 S ^[QUI]RQSDON("RQS","ATT",TABATT,ATTDI)=""
 F I=1:1:ATTD S %c=$$LEX^%LXSTOCK(ATTD(I),.ATTDI) S:'$D(ATTDI) ATTDI=0 I %c'>1 S ^[QUI]RQSDON("RQS","ATT",TABATT,ATTDI)=""
 I '(BOOL) S CONT(P1C,"TETE")=NORES,CONT(P1C,"TABATT")=TABATT G FINENDA
 D AFF^%QULIMO("TETE",NORES),AFF^%QULIMO("TABATT",TABATT)
FINENDA D END^%AN7 S OK=1,Y1=SAVY1 D EPIL^%ANGEPIL K @(TEMPO),^SANAREQ($J) Q
ERRA D END^%AN7,KILL^%ANA(NORES) K ^[QUI]RQSDON("RQS","ATT",TABATT)
 S OK=0,Y1=SAVY1,DX=SX,DY=SY D EPIL^%ANGEPIL K @(TEMPO),^SANAREQ($J) Q
 
UCS 
 N I,J,L1,TETE,ATTD,I,TABATT
 S TABATT=$$VAL^%QULIMO("TABATT") I TABATT'="" K ^[QUI]RQSDON("RQS","ATT",TABATT)
 S TETE=$$VAL^%QULIMO("TETE") G:TETE="" ENDS
 S L1=$$RED^%ANA(TETE,"VAR") F I=1:1 S J=$P(L1,",",I) Q:J=""  K UTIL(J,TETE)
ENDS S OK=1 Q
 
CVAR(T) 
 Q:T=0  G @$E($$RED^%ANA(T,"TYPE"),1,5)
COMPA D CVAR($$RED^%ANA(T,1)) Q:'(RESULT)  D CVAR($$RED^%ANA(T,2)) Q
OPERA D CVAR($$RED^%ANA(T,1)) Q:'(RESULT)  D CVAR($$RED^%ANA(T,2)) Q
ATTRI D CVAR($$RED^%ANA(T,1)) Q
VARIA Q
INDIC Q
NOM S L2($$RED^%ANA(T,"TEXTE"))="" Q
NOMBR Q
CHAIN Q
COUPL Q
NEGAT D CVAR($$RED^%ANA(T,1)) Q
FONCT N F S F=$$RED^%ANA(T,"TEXTE") G EXI:F="$EXISTE" Q
EXI D CVAR($$RED^%ANA(T,1)) Q
AFFEC D CVAR($$RED^%ANA(T,2)) Q
CVAR2(T) Q:T=0  G @($E($$RED^%ANA(T,"TYPE"),1,5)_2)
COMPA2 D CVAR2($$RED^%ANA(T,1)),CVAR2($$RED^%ANA(T,2)) Q
OPERA2 D CVAR2($$RED^%ANA(T,1)),CVAR2($$RED^%ANA(T,2)) Q
ATTRI2 N VA S VA=$$RED^%ANA(T,3)
 I VA=0,'($D(L3("@"))) S L3=L3+1,L3("@")="" Q
 D CVAR2(VA) Q
VARIA2 N NOM S NOM=$$RED^%ANA(T,"TEXTE")
VARIAS S:'($D(L3(NOM))) L3=L3+1,L3(NOM)="" Q
NOM2 N NOM S NOM=$$RED^%ANA(T,"TEXTE")
NOM2S S:'($D(L3(NOM))) L3=L3+1,L3(NOM)="" Q
NOMBR2 Q
CHAIN2 Q
COUPL2 Q
NEGAT2 D CVAR2($$RED^%ANA(T,1)) Q
FONCT2 N F S F=$$RED^%ANA(T,"TEXTE") G EXI2:F="$EXISTE" Q
EXI2 D CVAR2($$RED^%ANA(T,1)) Q
AFFEC2 D CVAR2($$RED^%ANA(T,2)) Q
 
CHERCHPAR 
 N IND K ^[QUI]RQS1(REQ,"PARAMETRES")
 S LC="",IND=1
 F %LC=0:0 S LC=$O(CONT(LC)) Q:LC=""  D MAJPAR(CONT(LC,"TETE"))
 Q
MAJPAR(TET) N TYP,%I,FI
 Q:(TET="")!(TET=0)
 S TYP=$$RED^%ANA(TET,"TYPE") Q:TYP=""
 I (TYP="FONCTION")&($$RED^%ANA(TET,"TEXTE")="$PARAM") G STOCPAR
 
 S %I=0
BMAJ S %I=%I+1
 S FI=$$RED^%ANA(TET,%I) Q:FI=0
 D MAJPAR(FI)
 G BMAJ
 
STOCPAR N PAR
 S PAR=$$RED^%ANA($$RED^%ANA(TET,1),"TEXTE")
 S @TEMPO@(IND)=PAR,IND=IND+1
 Q
 
MES(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 3 D POCLEPA^%VVIDEO Q

