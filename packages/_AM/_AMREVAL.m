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

;%AMREVAL^INT^1^59547,73865^0
%AMREVAL ;;09:17 AM  3 Aug 1993; 27 Jul 93  2:31 PM ; 27 Jul 93  4:13 PM
 
 
 
 
 
 
 
 
 
 
EVALEXPR(POLO,TOP) 
 S CXT("@","BASE")="ARTICLE",CXT("@","OBJET")="TEST"
 D EXPR(1)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PARCOURS(POLO,MKEX,EVAL,SSEXPR,SSEVAL) 
 I MKEX S @SSEXPR=0
 S EXEV=EVAL>1
 I EXEV S @SSEVAL=0
 S TOPOLO=$ZP(@POLO@(""))
 Q:TOPOLO="" 1
 D EXPR(1)
 Q:EVAL REG(1) Q 1
 
EXPR(I) 
 N TYPE,VAL,INFO,REP,IND
 D PULL(.TYPE,.VAL,.INFO)
 G:TYPE="+" EXOPB
 G:"+/_-*="[TYPE EXOPB
 G:TYPE="ATTRIBUT" EXPATD
 G:TYPE="ATTRIBUT.TEMPORAIRE" EXPATT
 G:TYPE="CONSTANTE.ALPHA" EXPCSA
 G:TYPE="CONSTANTE.NUMERIQUE" EXPCSN
 G:TYPE="VERBE" EXPVRB
 G:TYPE="chemin" EXPCHM
 G:TYPE="indice" EXPIND
 G:TYPE="AFFECT" AFFECT
 G ERR
EXOPB D EXPR(I),EXPR(I+1)
 I EVAL S REG(I)=$$TRTOPB(REG(I),REG(I+1),VAL) D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=PHRA(I)_VAL_PHRA(I+1) D MKEX(PHRA(I),"")
 Q
EXPATD 
 I EVAL S REG(I)=$$GETATT(VAL,1,"","") D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=VAL_"(1)" D MKEX(PHRA(I),TYPE)
 Q
EXPATT 
 I EVAL S REG(I)=$$GETAPCT(VAL,1) D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=VAL_"(1)" D MKEX(PHRA(I),TYPE)
 Q
EXPCSN 
 I EVAL S REG(I)=VAL D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=VAL D MKEX(PHRA(I),"")
 Q
EXPCSA 
 I EVAL S REG(I)=VAL D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=""""_VAL_"""" D MKEX(PHRA(I),"")
 Q
 
EXPVRB 
 S TAB=$$TEMP^%SGUTIL
 S J=0,REGCOUR=0
EXPVRBL S J=J+1 G:J>INFO EXPVRB2
 S NATPAR=^%RQSGLO("VERBE","OBJ",VAL,"NATURE.PARAMETRE",(1+INFO)-J)
 S @TAB@(J)=NATPAR,@TAB@(J,"D")=I+REGCOUR
 I NATPAR="EXPR" D EXPR(I+REGCOUR) S REGCOUR=REGCOUR+1
 I NATPAR="STRING" D EXPR(I+REGCOUR) S REGCOUR=REGCOUR+1
 I NATPAR="REPERTOIRE" D EXPR(I+REGCOUR) S REGCOUR=REGCOUR+1
 I NATPAR="NOMIND" D EXPR(I+REGCOUR) S REGCOUR=REGCOUR+1
 I NATPAR="LISTE" D EXPR(I+REGCOUR) S REGCOUR=REGCOUR+1
 I NATPAR="ATT" D ADR(I+REGCOUR) S REGCOUR=REGCOUR+4
 S @TAB@(J,"F")=(I+REGCOUR)-1
 
 G EXPVRBL
EXPVRB2 
 I EVAL S REG(I)=$$VRB(VAL,TAB) D:EXEV HISTO(REG(I))
 K @(TAB)
 Q:'(MKEX)
 I INFO=0 S PHRA(I)=VAL D MKEX(PHRA(I),"") Q
 S PH1=VAL_"("_PHRA((I+INFO)-1)
 F J=INFO-1:-1:1 S PH1=PH1_";"_PHRA((I+J)-1)
 S PHRA(I)=PH1_")"
 D MKEX(PHRA(I),"")
 Q
AFFECT D EXPR(I)
 D ADR(I+1)
 I EVAL S REG(I)=$$PA(REG(I+3),REG(I+4),REG(I+1),REG(I+2),REG(I)) D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)="affectation de l'attribut "_PHRA(I+1)_" ("_PHRA(I+2)_") de l' "_PHRA(I+4)_" du "_PHRA(I+3)_" avec la valeur "_PHRA(I) D MKEX(PHRA(I),"")
 Q
EXPCHM D ATTI(I+1)
 I EVAL S REG(I)=$$GETREP(REG(I+1),REG(I+2)) D:EXEV HISTO(REG(I))
 I MKEX S PH1="repertoire de "_PHRA(I+1)_"("_PHRA(I+2)_")" D MKEX(PH1,"")
 I EVAL S REG(I+1)=$$GETIND(REG(I+1),REG(I+2)) D:EXEV HISTO(REG(I+1))
 I MKEX S PH2="individu de "_PHRA(I+1)_"("_PHRA(I+2)_")" D MKEX(PH2,"")
 D ATTI(I+3)
 I EVAL S REG(I)=$$GETATT(REG(I+3),REG(I+4),REG(I),REG(I+1)) D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=PHRA(I+3)_"("_PHRA(I+4)_")^"_PHRA(I+1)_"("_PHRA(I+2)_")" D MKEX(PHRA(I),"")
 Q
EXPIND D EXPR(I+1)
 D ATT(I)
 I EVAL S REG(I)=$$GETATT(REG(I),REG(I+1),"","") D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=PHRA(I)_"("_PHRA(I+1)_")" D MKEX(PHRA(I),"")
 Q
 
ATTI(I) 
 N TYPE,VAL,INFO
 D PULL(.TYPE,.VAL,.INFO)
 I TYPE="indice" D EXPR(I+1),ATT(I) Q
 I EVAL S REG(I)=VAL,REG(I+1)=1 D:EXEV HISTO(REG(I)),HISTO(REG(I+1))
 I MKEX S PHRA(I)=VAL D MKEX(PHRA(I),"") S PHRA(I+1)=1 D MKEX(PHRA(I+1),"")
 Q
 
ATT(I) 
 N TYPE,VAL,INFO
 D PULL(.TYPE,.VAL,.INFO)
 I EVAL S REG(I)=VAL D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=VAL D MKEX(PHRA(I),"")
 Q
 
ADR(I) 
 N TYPE,VAL,INFO,REP,IND
 D PULL(.TYPE,.VAL,.INFO)
 G:TYPE="ATTRIBUT" ADRATD
 G:TYPE="ATTRIBUT.TEMPORAIRE" ADRATT
 G:TYPE="chemin" ADRCHM
 G:TYPE="indice" ADRIND
 G ERR
ADRATD 
 I EVAL S REG(I)=VAL,REG(I+1)=1,REG(I+2)=$$REPCOUR,REG(I+3)=$$INDCOUR D:EXEV HISTO(REG(I)),HISTO(REG(I+1)),HISTO(REG(I+2)),HISTO(REG(I+3))
 I MKEX S PHRA(I)=VAL,PHRA(I+1)=1,PHRA(I+2)="repertoire courant",PHRA(I+3)="individu courant" D MKEX(PHRA(I),""),MKEX(PHRA(I+1),""),MKEX(PHRA(I+2),""),MKEX(PHRA(I+3),"")
 Q
ADRATT 
 I EVAL S REG(I)=VAL,REG(I+1)=1,REG(I+2)=$$REPPCT,REG(I+3)=$$INDPCT D:EXEV HISTO(REG(I)),HISTO(REG(I+1)),HISTO(REG(I+2)),HISTO(REG(I+3))
 I MKEX S PHRA(I)=VAL,PHRA(I+1)=1,PHRA(I+2)="repertoire temporaire",PHRA(I+3)="individu temporaire" D MKEX(PHRA(I),""),MKEX(PHRA(I+1),""""),MKEX(PHRA(I+2),""),MKEX(PHRA(I+3),"")
 Q
ADRIND 
 D EXPR(I+1)
 D PULL(.TYPE,.VAL,.INFO)
 G:TYPE="ATTRIBUT" ADRI2
 G:TYPE="ATTRIBUT.TEMPORAIRE" ADRI3
 G ERR
ADRI2 
 I EVAL S REG(I)=VAL,REG(I+2)=$$REPCOUR,REG(I+3)=$$INDCOUR D:EXEV HISTO(REG(I)),HISTO(REG(I+1)),HISTO(REG(I+2)),HISTO(REG(I+3))
 I MKEX D MKEX(VAL),MKEX("repertoire courant",""),MKEX("individu courant","")
 Q
ADRI3 
 I EVAL S REG(I)=VAL,REG(I+2)=$$REPPCT,REG(I+3)=$$INDPCT D:EXEV HISTO(REG(I)),HISTO(REG(I+1)),HISTO(REG(I+2)),HISTO(REG(I+3))
 I MKEX D MKEX(VAL),MKEX("repertoire temporaire",""),MKEX("individu temporaire","")
 Q
 
ADRCHM 
 D ATTI(I+1)
 I EVAL S REG(I+2)=$$GETREP(REG(I+1),REG(I+2)) D:EXEV HISTO(REG(I))
 I MKEX S PH1="repertoire de "_PHRA(I+1)_"("_PHRA(I+2)_")" D MKEX(PH1,"")
 I EVAL S REG(I+3)=$$GETIND(REG(I+1),REG(I+2)) D:EXEV HISTO(REG(I+1))
 I MKEX S PH2="individu de "_PHRA(I+1)_"("_PHRA(I+2)_")" D MKEX(PH2,"")
 D PULL(.TYPE,.VAL,.INFO)
 I TYPE="indice" G ADRC1
 I TYPE="ATTRIBUT" G ADRC2
 G ERR
ADRC1 
 D EXPR(I+1)
 D PULL(.TYPE,.VAL,.INFO)
 G:TYPE'="ATTRIBUT" ERR
 I EVAL S REG(I)=VAL D:EXEV HISTO(REG(I))
 I MKEX S PHRA(I)=VAL D MKEX(PHRA(I),"")
 Q
ADRC2 
 I EVAL S REG(I)=VAL,REG(I+1)=1 D:EXEV HISTO(REG(I)),HISTO(REG(I+1))
 I MKEX S PHRA(I)=VAL,PHRA(I+1)=1 D MKEX(PHRA(I),""),MKEX(PHRA(I+1),"")
 Q
 
 
 
GETATT(ATT,ORD,REP,IND) 
 N RR,II
 S RR=$S(REP="":CXT("@","BASE"),1:REP)
 S II=$S(IND="":CXT("@","OBJET"),1:IND)
 Q $$^%QSCALIN(RR,II,ATT,ORD)
 
GETAPCT(ATT,ORD) 
 Q $$^%QSCALIN("%",$J,ATT,ORD)
 
TRTOPB(VAL1,VAL2,OPE) 
 S @("RES=VAL1"_OPE_"VAL2")
 Q RES
 
PA(REP,IND,ATT,ORD,VAL) 
 N JRN
 
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))) S JRN=$$GET^%SGVAR("JRN") I JRN'="" D:IND="NOM" ADDEXEC^%AMJAJ(JRN,"INDIVIDU",1,REP,IND,"","","","") D ADDEXEC^%AMJAJ(JRN,"ATTRIBUT",VAL,REP,IND,ATT,ORD,"","")
 D PA^%QSGESTI(REP,IND,ATT,VAL,ORD)
 Q 1
 
VRB(VRB,TAB) 
 N RES,D,X,NBREG,I,IPARA
 S D=0
 
 S IPARA=""
VRBL S IPARA=$ZP(@TAB@(IPARA)) G:IPARA="" VRB2
 F I=@TAB@(IPARA,"D"):1:@TAB@(IPARA,"F") S D=D+1,V(D)=REG(I)
 G VRBL
VRB2 
 S NBREG=D
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))) S JRN=$$GET^%SGVAR("JRN") I JRN'="" D ADDEXEC^%AMJAJ(JRN,"VERBE","",VRB,"","","","","") I $D(^%QUERYT("VERBE",VRB,1,1)) D AJJOURN^%AMJAJ(JRN,VRB_" : "_^%QUERYT("VERBE",VRB,1,1))
 S @("RES="_^%RQSGLO("VERBE","OBJ",VRB,"ADRESSE.DE.LA.ROUTINE",1)_"(1,NBREG)")
 Q RES
 
GETREP(ATT,INX) 
 N REP2
 S REP2=$$REPD^%QSGEL2(CXT("@","BASE"),ATT)
 Q REP2
GETIND(ATT,INX) 
 N REPS,INDS,TYPL,IND2
 S REPS=CXT("@","BASE"),INDS=CXT("@","OBJET")
 S IND2=$$^%QSCALIN(REPS,INDS,ATT,INX)
 S TYPL=$$TYPEL^%QSGES90(ATT)
 S:TYPL=2 IND2=INDS_","_IND2
 Q IND2
 
 
 
PULL(TYPE,VAL,INFO) 
 S TYPE=@POLO@(TOPOLO),VAL=@POLO@(TOPOLO,"VAL"),INFO=@POLO@(TOPOLO,"INFO")
 S TOPOLO=TOPOLO-1
 Q
 
HISTO(VAL) 
 S @SSEVAL=@SSEVAL+1
 S @SSEVAL@(@SSEVAL)=VAL
 Q:@SSEXPR@(@SSEVAL)=VAL
 I EVAL=3 W /WOPEN(10,10,50,10,"","","","","tc"),@SSEXPR@(@SSEVAL),"  ",VAL R *zzz W /WCLOSE
 Q
MKEX(PHRASE,TYPE) 
 S @SSEXPR=@SSEXPR+1
 S @SSEXPR@(@SSEXPR)=PHRASE
 S @SSEXPR@(@SSEXPR,"TYPE")=TYPE
 Q
ERR Q
 
REPCOUR() Q CXT("@","BASE")
INDCOUR() Q CXT("@","OBJET")
REPPCT() Q "%"
INDPCT() Q $J
 ;

