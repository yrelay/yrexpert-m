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

;%ANARB11^INT^1^59547,73866^0
%ANARB11 ;
 
 
 
 
 
 
MIN K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="IND",@TEMPO@(3)="NBA",@TEMPO@(4)="SA",@TEMPO@(5)="RES",@TEMPO@(6)="TXA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,I=0,RES=999999999,VAL="",ISNUM=1
MIN1 S I=I+1,A=$$RED(SA,I) G:A=0 MIN1F
 I $$RED(A,"TYPE")="ATTRIBUT" S TXA=$$RED($$RED(A,1),"TEXTE"),IND=$$RED(A,2) I ($E(TXA,1)'="%")&(IND=0) S VAL=$$MV(A,TXA) G:'(ISNUM) MIN1F S RES=$$FONC^%TLFNUMI("%TLCAMIN","MIN^%ANARB11/"_RES_VAL) G MIN1
 D EMPIL^%ANGEPIL("MIN11^%ANARB11") G INT^%ANARBR2
MIN11 I (POS=0)!(VAL="") S VAL="" G MIN1F
 G:'($$PARA^%QZNBN1(VAL)) MIN1F
 S RES=$$FONC^%TLFNUMI("%TLCAMIN","MIN^%ANARB11/"_RES_"/"_VAL)
 G MIN1
MIN1F I VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer arguments")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '(ISNUM) S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) G DEPIL^%ANGEPIL
 S VAL=RES G DEPIL^%ANGEPIL
 
 
MAX K @(TEMPO)
 S @TEMPO@(1)="IND",@TEMPO@(2)="I",@TEMPO@(3)="NBA",@TEMPO@(4)="SA",@TEMPO@(5)="RES",@TEMPO@(6)="TXA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,I=0,RES=-999999999,VAL="",ISNUM=1
MAX1 S I=I+1,A=$$RED(SA,I) G:A=0 MAX1F
 I $$RED(A,"TYPE")="ATTRIBUT" S TXA=$$RED($$RED(A,1),"TEXTE"),IND=$$RED(A,2) I ($E(TXA,1)'="%")&(IND=0) S VAL=$$MV(A,TXA) G:'(ISNUM) MAX1F S RES=$$FONC^%TLFNUMI("%TLCAMAX","MAX^%ANARB11/"_RES_VAL) G MAX1
 D EMPIL^%ANGEPIL("MAX11^%ANARB11") G INT^%ANARBR2
MAX11 I (POS=0)!(VAL="") S VAL="" G MAX1F
 G:'($$PARA^%QZNBN1(VAL)) MAX1F
 S RES=$$FONC^%TLFNUMI("%TLCAMAX","MAX^%ANARB11/"_RES_"/"_VAL)
 G MAX1
MAX1F I VAL="" S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer arguments")) G DEPIL^%ANGEPIL
 I '(ISNUM) S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) G DEPIL^%ANGEPIL
 S VAL=RES G DEPIL^%ANGEPIL
 
 
MINOR K @(TEMPO)
 S @TEMPO@(1)="IND",@TEMPO@(2)="I",@TEMPO@(3)="NBA",@TEMPO@(4)="SA",@TEMPO@(5)="RES",@TEMPO@(6)="TXA",@TEMPO@(7)="VREF"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("MINOR0^%ANARB11") G INT^%ANARBR2
MINOR0 I (POS=0)!(VAL="") S VAL="" G MINOR1F
 G:'($$PARA^%QZNBN1(VAL)) MINOR1F
 S VREF=VAL,I=1,ISNUM=1
MINOR1 S I=I+1,A=$$RED(SA,I) G:A=0 MINOR1C
 I $$RED(A,"TYPE")="ATTRIBUT" S TXA=$$RED($$RED(A,1),"TEXTE"),IND=$$RED(A,2) I ($E(TXA,1)'="%")&(IND=0) S VAL=$$MV(A,TXA) G:'(ISNUM) MINOR1F S VREF=VREF_VAL G MINOR1
 D EMPIL^%ANGEPIL("MINOR11^%ANARB11") G INT^%ANARBR2
MINOR11 I (POS=0)!(VAL="") S VAL="" G MINOR1F
 G:'($$PARA^%QZNBN1(VAL)) MINOR1F
 S VREF=VREF_"/"_VAL G MINOR1
MINOR1C S VAL=$$FONC^%TLFNUMI("%TLCAMIR","MINOR^%ANARB11/"_VREF)
MINOR1F I VAL="" S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer arguments")) G DEPIL^%ANGEPIL
 I '(ISNUM) S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique"))
 G DEPIL^%ANGEPIL
 
 
MAJOR K @(TEMPO)
 S @TEMPO@(1)="VREF",@TEMPO@(2)="I",@TEMPO@(3)="NBA",@TEMPO@(4)="SA",@TEMPO@(5)="RES",@TEMPO@(6)="TXA",@TEMPO@(7)="IND"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("MAJOR0^%ANARB11") G INT^%ANARBR2
MAJOR0 I (POS=0)!(VAL="") S VAL="" G MAJOR1F
 G:'($$PARA^%QZNBN1(VAL)) MAJOR1F
 S VREF=VAL,I=1,ISNUM=1
MAJOR1 S I=I+1,A=$$RED(SA,I) G:A=0 MAJOR1C
 I $$RED(A,"TYPE")="ATTRIBUT" S TXA=$$RED($$RED(A,1),"TEXTE"),IND=$$RED(A,2) I ($E(TXA,1)'="%")&(IND=0) S VAL=$$MV(A,TXA) G:'(ISNUM) MAJOR1F S VREF=VREF_VAL G MAJOR1
 D EMPIL^%ANGEPIL("MAJOR11^%ANARB11") G INT^%ANARBR2
MAJOR11 I (POS=0)!(VAL="") S VAL="" G MAJOR1F
 G:'($$PARA^%QZNBN1(VAL)) MAJOR1F
 S VREF=VREF_"/"_VAL G MAJOR1
MAJOR1C S VAL=$$FONC^%TLFNUMI("%TLCAMAR","MAJOR^%ANARB11/"_VREF)
MAJOR1F I VAL="" S VAL="",POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer arguments")) G DEPIL^%ANGEPIL
 I '(ISNUM) S POS=0,VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique"))
 G DEPIL^%ANGEPIL
 
MV(ND,AT) 
 N GL,V2,I,OB,BA,TYP,%I,REP
 S REP=$$RED(ND,3)
 I REP=0 S BA=CXT("@","BASE"),OB=CXT("@","OBJET") G CMV
 S REP=$$RED(REP,"TEXTE")
 I $E(REP,1)="%" S BA=$$^%QCAZG("CXT(REP,""BASE"")"),OB=$$^%QCAZG("CXT(REP,""OBJET"")") G CMV
 S BA=$$NOMINT^%QSF(REP)
 S OB=$$OBJPROX^%QSCALVU(REP,CXT("@","BASE"),CXT("@","OBJET"))
CMV S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GL)
 D MVG^%QSCALVA(BA,OB,AT,GL,.TYP)
 S V2="",I="",ISNUM=0
 F %I=0:0 S I=$O(@GL@(I)) Q:I=""  Q:'($$PARA^%QZNBN1(@GL@(I)))  S V2=V2_"/"_@GL@(I)
 K @(GL) Q V2
 
 
VARUSER 
 K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("VRU1^%ANARB11") G INT^%ANARBR2
VRU1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I (((VAL'=1)&(VAL'=2))&(VAL'=3))&(VAL'=4) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non valide")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$VARUSER^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

