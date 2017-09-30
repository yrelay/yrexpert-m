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

;%QS1CALC^INT^1^59547,73880^0
%QS1CALC ;
 
 
 
 
 
 
 
 
 
 
CALC(LDEP,ARBR,FOCA,BASE,IND) 
 N ARRET S ARRET=0 G GO
CALCSTOP(LDEP,ARBR,FOCA,BASE,IND) 
 
 N ARRET S ARRET=1 G GO
 
GO N CA,LRES,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 I $L(FOCA)>200 G TROPL
 I (($L($J)+$L(BASE))+$L(FOCA))>496 G TROPL
 S LRES="^[QUI]RQS3($J,"""_BASE_""","""_$$ZSUBST^%QZCHSUB(FOCA,"""","""""")_""""
 I $P(LDEP,",""OBJET"")")=LRES G ENDGO2
 K ^[QUI]RQS3($J,BASE,FOCA)
 N A,BID,CONT,HD,HF,I,%I,LA,N,NT,O,%O,OK,VAR,BEXT,ATDATE,ATJ
 
 S CA=$$ZSUBST^%QZCHSUB(LDEP,"OBJET","CARD")
 I $D(@CA)#10 S CA=@CA G SUIT
 S CA=$P(LDEP,"(",2),CA=$P(CA,")",1)
 S CA=$$^%QSCALVA("L0",CA,"CARD")
SUIT K ^NUPLET($J)
 
 S A=$$RECOP^%ANA(ARBR)
 S BEXT=$$NOMLOG^%QSF(BASE),ATDATE=0
 K LA S LA=$$RED^%ANA(ARBR,"LATT"),BID=0,HD=$H
 F I=1:1 Q:$P(LA,",",I)=""  S ATJ=$P(LA,",",I),LA(ATJ)="" I $$TYPE^%QSGESPE(ATJ_"/"_BEXT)="DATE" S ATDATE=1
 G:ATDATE=1 GO4
 G:(I-1)>1 GO2
 
 
 G:'($$^%QSSAMAT) GO2
 
 
 I (FOCA["=")&(('(FOCA["'="))&('($$CONTOP))),^TATINDB($J)<2 D ^%QSRQEG(ARBR,LDEP,BASE,FOCA,.NX) S N=NX G ENDGO
 
 D ^%QSNUPL2(ARBR,LDEP,BASE,"^NUPLET($J)")
 I '($$^%QSNUPV2(ARBR,LDEP,BASE,"^NUPLET($J)",.NX,.FOCA)) S N=0 K ^NUPLET($J) D:OKECR ^%VZEAVT($$^%QZCHW("Votre micro-requete est beaucoup trop longue... Veuillez la diviser en plusieurs micro-requetes ")) G ENDGO
 S N=NX K ^NUPLET($J)
 G ENDGO
REPERT D ^%QSNUPLE(ARBR,BASE,"^NUPLET($J)")
 
 
 I ^NUPLET($J)<($$CARD^%QSGEST5(BASE)/2) D ^%QSNUPEV(ARBR,LDEP,BASE,"^NUPLET($J)",.NX,FOCA) S N=NX K ^NUPLET($J) G ENDGO
 
 
 
GO2 
 G:^TATINDM($J) GO3
 
 K ^NUPLET($J) S VAR=$$RED^%ANA(ARBR,"VAR")
 S:VAR="" VAR="@" S CONT(VAR,"BASE")=BASE
 W:OKECR "."
 S N=0,NT=0,O="",STOPCALC=0
 F %O=0:0 S O=$O(@LDEP@(O)) Q:O=""  D TO Q:STOPCALC
 G ENDGO
GO3 
 K ^NUPLET($J)
 W:OKECR "."
 S N=0,NT=0,O="",STOPCALC=0
 F %O=0:0 S O=$O(@LDEP@(O)) Q:O=""  S OK=0,NT=NT+1 D ^%QS2CALC(O,FOCA,"!",1,.OK) D:(NT#10)=0 TRY I OK S N=N+1,^[QUI]RQS3($J,BASE,FOCA,"OBJET",O)=""
 G ENDGO
GO4 
 N GFOCA,IFC,%I,%U,%V,FC2,FC2S,COMP,P1,P2,VAL1,VAL2,IO,IOC,IND1,IND2,OK2
 N FIN,FCS,VAL,F1,F2,OPL,ATRETDA,FCA,RETEV,FC,OBJ
 S ATRETDA="GO4RET^%QS1CALC"
 K ^NUPLET($J)
 W:OKECR "."
 S N=0,NT=0,O="",STOPCALC=0
BGO4 S O=$O(@LDEP@(O))
 G:O="" ENDGO
 S OK=0,NT=NT+1
 S OBJ=O,FC=FOCA
 G DEB^%QSDAACT
GO4RET D:(NT#10)=0 TRY
 I OK S N=N+1,^[QUI]RQS3($J,BASE,FOCA,"OBJET",O)=""
 G BGO4
 
 
ENDGO S ^[QUI]RQS3($J,BASE,FOCA,"CARD")=N,HF=$H
 S ^[QUI]RQS3($J,BASE,FOCA,"DUREE")=$$DIFNO^%QMDATE(HF,HD)
 S I=-1 F %I=0:0 S I=$N(LA(I)) Q:I=-1  K ^[QUI]RQS4(BASE,I,FOCA) S ^[QUI]RQS4(BASE,I,FOCA,"FORME.CANONIQUE")=FOCA,^[QUI]RQS4(BASE,I,FOCA,"ARBRE")=A,O=-1 F %O=0:0 S O=$N(LA(O)) Q:O=-1  S ^[QUI]RQS4(BASE,I,FOCA,"ATTRIBUT",O)=""
ENDGO2 S ^[QUI]RQS3($J,BASE,FOCA,"CREATION")=$H
 S ^[QUI]RQS3($J,BASE,FOCA,"UTILISATION")=$H
 K ^TATINDB($J),^TATINDM($J)
 K:ARRET&STOPCALC ^[QUI]RQS3($J,BASE,FOCA)
 G @ADRREQ
 
TO S NT=NT+1 D:(NT#10)=0 TRY Q:STOPCALC  S CONT(VAR,"OBJET")=O
 S OK=$$SUBST^%ANARBR2(ARBR,.CONT,"",.P) Q:'(P)
 S:OK N=N+1,^[QUI]RQS3($J,BASE,FOCA,"OBJET",O)="" Q
 
USE(FOCA,BASE) S ^[QUI]RQS3($J,BASE,FOCA,"DERNIERE.UTILISATION")=$H Q
 
TRY W:OKECR "%"
 S STOPCALC=$$ISCTRLA^%SYSCLAV Q
 
TROPL D:OKECR ^%VZEAVT($$^%QZCHW("Votre micro-requete est trop longue..."))
 S N=0
 S ARRET=1,STOPCALC=1
 G @ADRREQ
 
CONTOP() 
 Q:FOCA["#" 1
 Q:FOCA["+" 1
 Q:FOCA["-" 1
 Q:FOCA["\" 1
 Q:FOCA["/" 1
 Q:FOCA["*" 1
 Q:FOCA["$" 1
 Q:FOCA["_" 1
 Q:FOCA["&" 1
 Q:FOCA["!" 1
 Q 0

