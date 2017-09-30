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

;%AV8D^INT^1^59547,73867^0
%AV8D ;;10:30 AM  4 Nov 1993;
 
 
 
 
 
ALL(GEXP,VV,RR,TXT) 
 N ETU
 S ETU=$$INIT(GEXP)
 D RUN(ETU)
 
 D KILL(ETU)
 Q
 
INIT(GEXP) 
 N PILAND,PTR,PILTXT
 S ETU=$$TEMP^%SGUTIL
 
 S PILAND=$$TEMP^%SGUTIL D INIPILE^%AVUTI(PILAND)
 
 S PILTXT=$$TEMP^%SGUTIL D INIPILE^%AVUTI(PILTXT)
 S PTR=1
 F VAR="PILAND","PTR","PILTXT","GEXP" S @ETU@(VAR)=@VAR
 Q ETU
 
KILL(ETU) 
 K @(@ETU@("PILAND")),@(@ETU@("PILTXT"))
 K @(ETU)
 Q
 
UNEXP(GEXP,VV,RR,TXT) 
 N PILAND,PTR,PILTXT
 S PILAND=$$TEMP^%SGUTIL D INIPILE^%AVUTI(PILAND)
 S PILTXT=$$TEMP^%SGUTIL D INIPILE^%AVUTI(PILTXT)
 S (VV,RR,TXT)="",PTR=1
 G GO
 
UNEXP(ETU) 
 K @(@ETU@("PILAND")),@(@ETU@("PILTXT"))
 K @(ETU)
 Q
 
RUN(ETU) 
 S (VV,RR,TXT)=""
 F VAR="PILAND","PTR","PILTXT","GEXP" S @(VAR_"=@ETU@(VAR)")
 G GO
 
 
loop S PTR=PTR+1
GO G:'($D(@GEXP@(PTR))) FIN
 S TYPE=@GEXP@(PTR),VAL=@GEXP@(PTR,"VAL"),INFO=@GEXP@(PTR,"INFO")
 
 I TYPE["OPERATEUR" G OPERA
 I TYPE="VERBE" G VERBE
 I TYPE="AFFECTATION" G AFFECT
 
 D:EVAL PUSH^%AVUTI(PILAND,VAL,"")
 D:'(EVAL) PUSH^%AVUTI(PILAND,"","")
 D:EXPR PUSH^%AVUTI(PILTXT,$S(TYPE="CONSTANTE.CHAINE":""""_VAL_"""",1:VAL),"")
 G loop
 
 
OPERA S NB=$P(TYPE,".",2),NB=$S(NB="UNAIRE":1,NB="BINAIRE":2)
 
 K TV,TR
 F I=1:1:NB G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV((NB-I)+1)=TVV,TR((NB-I)+1)=TRR
 I EXPR F I=1:1:NB G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TMP) S TXT((NB-I)+1)=TXTL
 
 
 D:VAL="$indeval" indeval^%AV8C
 D:VAL="$subex" subex^%AV8C
 D:VAL="$indice" indice^%AV8C
 D:VAL="^" chap^%AV8C
 D:"=+-#_*<>"[VAL BINSTD^%AV8C
 D:VAL="'" NEGAT
 
 I EXPR D PUSH^%AVUTI(PILTXT,TXT,"EXPR")
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 
 D PUSH^%AVUTI(PILAND,TVV,TRR)
 G loop
 
VERBE 
 D ADDEXEC^%AMJAJ($$GET^%SGVAR("JRN"),"VERBE",VAL,VAL)
 I EXPR D AJEXPR^%AV8(VAL,"VERBE")
 I EVAL=2 D AJEVAL^%AV8(VAL,VAL)
 S NB=$P(INFO,"/",4)
 
 K TV,TR
 F I=NB:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 G:'(EXPR) EXEVRB
 
 F I=NB:-1:1 G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TEMP) S TXT(I)=TXTL
 S TXT=VAL S:NB>0 TXT=TXT_"(" F I=1:1:NB S TXT=TXT_$E(TXT(I),2,$L(TXT(I))-1)_";"
 S TXT=$E(TXT,1,$L(TXT)-1)_")" D AJEXPR^%AV8(TXT,"EXPR"),PUSH^%AVUTI(PILTXT,TXT,"")
 
EXEVRB 
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 K V
 S IREG=1,IARG=1
NXX G:'($D(TV(IARG))) CALLVRB
 I $D(^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",IARG)) S NATPAR=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",IARG)
 I '($D(^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",IARG))) S NATPAR=$ZP(^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE","")),NATPAR=$S(NATPAR="":"EXPR",1:^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",NATPAR))
 
 G:NATPAR="ATT" PARATT
 G:NATPAR="INDIVIDU" PARINDI
 G:NATPAR="ATTRIBUT" ATTRIB
 G:NATPAR="ENSEMBLE" ENSEMB
 G:NATPAR="REPERTOIRE" REPERT
 
 S V(IREG)=TV(IARG),IREG=IREG+1,IARG=IARG+1 G NXX
 
 
 
 
PARATT S V(IREG)=$P(TR(IARG),$C(0),3),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),4),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),1),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),2),IREG=IREG+1
 S V(IREG)=TV(IARG),IREG=IREG+1
 S IARG=IARG+1 G NXX
 
ENSEMB 
 S V(IREG)=$S($$NOMINT^%QSF(TV(IARG))'="":1,1:2),IREG=IREG+1
 S V(IREG)=$S(V(IREG-1)=1:$$NOMINT^%QSF(TV(IARG)),1:TV(IARG)),IREG=IREG+1
 
 S IARG=IARG+1 G NXX
 
ATTRIB 
 S V(IREG)=$E($P(TR(IARG),$C(0),3))="%",IREG=IREG+1 ;;1 ou zero si attribut ou attribut tempo
 S V(IREG)=$P(TR(IARG),$C(0),3),IREG=IREG+1 ;;attribut
 S V(IREG)=$P(TR(IARG),$C(0),4),IREG=IREG+1 ;;indice
 S V(IREG)=$P(TR(IARG),$C(0),1),IREG=IREG+1 ;;repert
 S V(IREG)=$P(TR(IARG),$C(0),2),IREG=IREG+1 ;;indiv
 S IARG=IARG+1 G NXX
 
 
 
 
PARINDI S VARTEMP=$P(TR(IARG),$C(0),3)
 S V(IREG)=CXT(VARTEMP,"BASE"),V(IREG+1)=CXT(VARTEMP,"OBJET")
 S IREG=IREG+2,IARG=IARG+1 G NXX
 
 
 
REPERT S V(IREG)=$$NOMINT^%QSF(TV(IARG))
 S IREG=IREG+1,IARG=IARG+1 G NXX
 
CALLVRB 
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 S ROUT=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"ADRESSE.DE.LA.ROUTINE",1)
 I ROUT="COMPILATION.SPECIFIQUE" G SPE
 S @("RES="_ROUT_"(1,"_(IREG-1)_")")
NORM S TVV=RES,TRR=""
 
 I EVAL D PUSH^%AVUTI(PILAND,TVV,TRR)
 I EVAL>1 D AJEVAL^%AV8(TVV,TVV)
 G loop
SPE S @("ROUT="_@GLOROUT@("VERBES SPECIAUX")_"(VAL)")
 S @("RES="_ROUT_"(1,"_(IREG-1)_")")
 I '(DEROUT) G NORM
 Q
 
 
FIN 
 
 I $$PILEVIDE^%AVUTI(PILAND) S ERROR=1 G ERROR
 D PULL^%AVUTI(PILAND,.VV,.RR)
 I '($$PILEVIDE^%AVUTI(PILAND)) S ERROR=1 G ERROR
 I EXPR D PULL^%AVUTI(PILTXT,.TXT,.TEMPO)
 Q
 
ERROR Q
 
 
 
 
 
 
 
 
 
 
 
 
AFFECT 
 K TV,TR
 F I=2:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 I EXPR F I=2:-1:1 G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TMP) S TXT(I)=TXTL
 I EXPR S TXT=TXT(1)_" <- "_TXT(2) D AJEXPR^%AV8(TXT,"EXPR"),PUSH^%AVUTI(PILTXT,TXT,"")
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 S ROUT=@GLOROUT@("ECRITURE BASE")
 S @("TVV="_ROUT_"(TR(1),TV(2))")
 S TRR=TR(1)_$C(0)_TR(2)
 I EVAL>1 D AJEVAL^%AV8(TVV,TVV)
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
NEGAT I EXPR S TXT="'"_TXT(1)
 I EVAL S TVV='(TV(1)),TRR=TR(1)
 Q

