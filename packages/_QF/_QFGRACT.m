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

;%QFGRACT^INT^1^59547,73875^0
QFGRACT ;
 
 
 
 
 
 
 
 
 
CREGR(LLISTEN,BASE,UTIL) 
 N LMN
 D POCLEPA^%VVIDEO Q:'($$MES^%VZEOUI($$^%QZCHW("Confirmez vous la creation"),"N"))
 S LMN=$$CREGR1(LLISTEN,BASE,UTIL) Q:LMN=""
 
 D MODIF^%QUAPAGM(LMN)
 Q
 
 
 
 
 
 
CREGR1(LLISTEN,BASEL,UTIL) 
 N LMN,TYPE
 S TYPE=$S(UTIL="E":"EQL",UTIL="S":"EQS",UTIL="C":"EQC",1:"RQS")
 S LMN=$$NOM^%QSGES11(TYPE)
 D CRETYPV^%QSGES11(BASEL,LMN,TYPE,$S(UTIL="S":"EQX.INSEPARABLE",UTIL="C":"EQX.INCOMPATIBLES",UTIL="G":"GROUPAGE",1:"EQUILIBRAGE"),"","INDIVIDU")
 D STOCK^%QSGES11(LLISTEN,LMN)
 S DES=$$CARD^%QSGEST7(LLISTEN)
 D CHD(LLISTEN,.DES,UTIL),CRDES(LMN,DES,UTIL)
 
 D PA^%QSGESTI("L0",LMN,"EFFECTIF.POSTE",1,1)
 Q LMN
 
 
 
 
 
 
 
SUPGR(LLISTEN,GROAFF,CFEN,ZOOM,UTIL) 
 N LMN,A,CARD,XX
 
 S LMN=$$UN^%QUAPAGM I LMN="" Q
 S CARD=$$CARD^%QSGEST7(LMN)
 S A=$$SUPGR1(LLISTEN,.ZOOM,.XX,LMN,GROAFF,.CFEN,UTIL)
 I A=0 Q
 
 D USE^%QUAPAGM(CFEN("G")),MODIF^%QUAPAGM("")
 I (CARD'=0)!(XX=1) D AFFI1^%QFGRECR,USE^%QUAPAGM(CFEN("G"))
 Q
 
 
SUPGR1(LLISTEN,ZOOM,XX,LMN,GROAFF,CFEN,UTIL) 
 
 N ADR
 S XX=0,ADR=$$ADRLIS^%QSGEST7(LMN)
 I (ADR'=0)&(ADR'="") D SUPGR2
 D ELIMI^%QSGES11(LLISTEN,LMN),DEL^%QSGES11(LMN)
 
 I LMN=ZOOM S XX=CFEN("I")="QFGRZOOM" D CLOSE^%QUAPAGM("QFGRZOOM"),ZOOMOUT^%QFGRAC2(.CFEN,.ZOOM)
 Q 1
SUPGR2 N A,I
 S A=""
 F I=0:0 S A=$O(@ADR@(A)) Q:A=""  K @GROAFF@(A,LMN)
 Q
SUPLGR(LLISTEN,ZOOM,XX,LFUS,GROAFF,CFEN,UTIL) 
 N A,I,OFUS
 S OFUS=$O(@LFUS@(""))
 F I=0:0 Q:OFUS=""  D SUPLGR1 S OFUS=$O(@LFUS@(OFUS))
 Q
SUPLGR1 
 S A=$$SUPGR1(LLISTEN,.ZOOM,.XX,OFUS,GROAFF,.CFEN,UTIL)
 Q
 
 
 
 
 
 
CHDES(LLISTEN,CFEN) 
 N LMN,DES,CTR
 
 S LMN=$$UN^%QUAPAGM I LMN="" Q
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nouvelle designation")_" : ","",1,RM-1,DY+1,DY-1,"REAFF1^%QFGRDEC","$$UC^%QFGRACT",.CTR,.DES)
 I (CTR="A")!(DES="") Q
 D PA^%QSGESTI("L0",LMN,$$SYN,DES,1)
 
 D AFFICH^%QUAPAGM,USE^%QUAPAGM(CFEN("I")),AFFICH^%QUAPAGM
 Q
UC(YY1,REAF) 
 S REAF=0 Q:YY1="" 1
 N STOP
 S STOP=$$EXI(LLISTEN,YY1)
 I STOP=1 D ^%VZEAVT($$^%QZCHW("Cette designation existe deja pour un autre groupe")) Q 0
 
 Q 1
 
AF() Q "AFFECTATION.GROUPAGE"
COM() Q "AFFECTATION.INCOMPATIBLE"
SEP() Q "AFFECTATION.INSEPARABLE"
ATAF(UTIL) I UTIL="S" Q $$SEP
 I UTIL="C" Q $$COM
 Q $$AF
 
AFIN(L,IN) 
 N AFF,BASE
 S BASE=$$BASE^%QSGEST7(L) Q:BASE="" IN
 S AFF=$$^%QSCALVA(BASE,IN,"NOM")
 Q $S(AFF="":IN,1:AFF)
 
AFGR(GR) 
 N AFF
 S AFF=$$^%QSCALVA("L0",GR,$$SYN)
 Q $S(AFF="":GR,1:AFF)
 
SYN() 
 Q "DESIGNATION"
 
DES(UTIL) 
 Q:UTIL="S" "INSEP"
 Q:UTIL="C" "INCOMP"
 Q "POSTE"
 
CRDES(LMN,VAL,UTIL) 
 
 S VAL=$$DES(UTIL)_"."_$TR($J("",4-$L(VAL))," ",0)_VAL
 D PA^%QSGESTI("L0",LMN,$$SYN,VAL,1)
 Q
 
EXI(L,YY1) 
 N IND,ADR,ST,%I
 S ADR=$$ADRLIS^%QSGEST7(L),IND="",ST=0
 F %I=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  I $$^%QSCALVA("L0",IND,$$SYN)=YY1 S ST=1 Q
 Q ST
 
CHD(L,YY1,UTIL) 
 N A,%I,D
 S A=YY1,D=$$DES(UTIL)
 
 
 F %I=1:1 S A=D_"."_$TR($J("",4-$L(YY1))," ",0)_YY1 Q:'($$EXI(L,A))  S YY1=YY1+1
 Q

