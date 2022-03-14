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
;! Nomprog     : %QSGOREQ                                                     !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description : $REQUETE                                                     !
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

%QSGOREQ(REQ,BASE) 
 
 
 
 
 
 
 
 
DEB 
 N BID,ENTRE,ENTREEW,ERRCAL,I,%LIS,LISTRI,REP,STOPCALC,COMREQ
 S Y1="",RQSRESUL="" S:'($D(^DERLISTE($I))) ^DERLISTE($I)=""
 I $$NOMINT^%QSF(BASE)="" D ^%VZEAVT($$^%QZCHW("Le repertoire de la requete est inexistant")) G FIN
 S DPAR=1
L0 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Liste de depart : "))
 G:CTRLA FIN
 I (Y1="")&(^DERLISTE($I)="") D ^%VSQUEAK G L0
 I Y1="" S Y1=^DERLISTE($I) D BLD^%VVIDEO W ^DERLISTE($I) D NORM^%VVIDEO H 2 G S0
 I Y1="?" S %LIS=$$^%QS1CHLI($$NOMINT^%QSF(BASE)) D REAFF^%QSQUEST G:%LIS="" L0 S Y1=%LIS
S0 I $D(^[QUI]RQSNOLOG(Y1)) S ENTREEW=$$LISTIND^%QSGEST6($$NOMINT^%QSF(Y1)) G:Y1=BASE GO D ^%VZEAVT($$^%QZCHW("Cette liste ne contient pas des ")_BASE_$$^%QZCHW("s ")) G L0
 I '($$EX^%QSGEST7(Y1)) G S1
 I WHOIS("ETUDE")'=0 S ENTREEW=$$TEMP^%SGUTIL,ENTREE="" F RQSRESUL=0:0 S ENTREE=$$SUIVL^%QS0XG1(Y1,ENTREE) G:ENTREE="" S01 S @ENTREEW@(ENTREE)=""
 S ENTREEW=$$^%QSCALVA("L0",Y1,"ADRESSE")
 S:ENTREEW="" ENTREEW="^[QUI]RQS2("_""""_Y1_""",""OBJET"")"
S01 G:$$^%QSCALVA("L0",Y1,"BASE")=$$NOMINT^%QSF(BASE) GO
 D ^%VZEAVT($$^%QZCHW("Cette liste ne contient pas des ")_BASE_$$^%QZCHW("s ")) G L0
S1 D ^%VZEAVT($$^%QZCHW("Liste inexistante ")) G L0
GO S ENTREE=Y1,RQSRESUL=$$GEN^%QCAPOP("RQS")
 S COMREQ=REQ
 D:'($D(^[QUI]RQSNOLOG(ENTREE))) USE^%QS0(ENTREE)
 S (STOPCALC,ERRCAL)=0
 N CARD,TEMPOPAR,RPAR,ABORT
 S RPAR=1,ABORT=0
 ;HL2 S TEMPOPAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPOPAR)
 S TEMPOPAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPOPAR)
 I $D(^[QUI]RQS1(REQ,"PARAMETRES")) D MAJPARAM,MAJNREQ
 I ('(RPAR))!ABORT S RQSRESUL="",ERRCAL=1,STOPCAL=1 G FINCALC
 S ERRCAL=0,LISTRI=$$GEN^%QCAPOP("TRI")
 I '($D(CONT)),WHOIS("ETUDE")=0 D ^%QSRECOP G FINCALC
 I WHOIS("ETUDE")'=0 D CREERL^%QS0XG1(RQSRESUL,$$NOMINT^%QSF(BASE),"^[QUI]RQS2("""_RQSRESUL_""",""OBJET"")","REQUETE",REQ)
 
 I '($D(CONT)),WHOIS("ETUDE")'=0 S I="" F CARD=0:1 S I=$O(@ENTREEW@(I)) G:I="" FINCALC D AJOUT^%QS0XG1(RQSRESUL,I)
 I '($$^%QSCALCU(REQ,BASE,ENTREEW,RQSRESUL,LISTRI,.CARD)) S RQSRESUL="",ERRCAL=1,STOPCALC=1 G FINCALC
 S ^[QUI]RQS2(RQSRESUL,"CARD")=CARD,STOPCALC=0
FINCALC K @(TEMPOPAR)
 G:ERRCAL FIN G:STOPCALC BATCH
 S ^[QUI]RQS1(REQ,"ACTIVATIONS")=^[QUI]RQS1(REQ,"ACTIVATIONS")+1
 S ^[QUI]RQS1(REQ,"ACTIVATIONS",RQSRESUL)=""
 S ^[QUI]RQS2(RQSRESUL,"REQUETE")=REQ
 S ^[QUI]RQS2(RQSRESUL,"BASE")=BASE
 G:WHOIS("ETUDE")'=0 MAJRQS
 K I S I("TRIABLE",1)="OUI"
 S I("TRIEE",1)="^[QUI]ZLIGTRIE("""_LISTRI_""")"
 S I("ADRESSE",1)="^[QUI]RQS2("""_RQSRESUL_""",""OBJET"")"
 S I("AUTRE",1)=COMREQ
 S I("BASE",1)=$$NOMINT^%QSF(BASE)
 S I("SOURCE",1)="REQUETES"
 S I("CARD",1)=^[QUI]RQS2(RQSRESUL,"CARD")
 D ADD^%QS0(RQSRESUL,"I")
MAJRQS D PA^%QSGESTI("RQS",REQ,"ACTIVATIONS",^[QUI]RQS1(REQ,"ACTIVATIONS"),1)
 D PA^%QSGESTI("RQS",REQ,"DATE.DERNIERE.ACTIVATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("RQS",REQ,"HEURE.DERNIERE.ACTIVATION",$$HEURE^%QMDATE,1)
FIN Q
BATCH S RQSRESUL="" D ^%VZEAVT($$^%QZCHW("Vous avez interrompu volontairement le calcul "))
B0 D POCLEPA^%VVIDEO
 Q
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous calculer cette requete cette nuit ? : "),"O")=1 G 79
 D POCLEPA^%VVIDEO W $$^%QZCHW("Pas de calcul cette nuit ... OK") H 2 G FIN
79 D ADD^%QS3BATC(REQ),POCLEPA^%VVIDEO W $$^%QZCHW("Calcul cette nuit ... OK")
 
 H 2 G FIN
 Q
 
MAJPARAM 
 
 
 
 I DPAR=0 S RPAR=$$MAJPARA2(PARAM) Q
 N PAR,PAR2
 D POCLEPA^%VVIDEO,BLD^%VVIDEO
 W $$^%QZCHW("Veuillez donner la valeur des parametres suivants : ") D NORM^%VVIDEO H 2
 S I=""
 F %I=0:0 S I=$O(^[QUI]RQS1(REQ,"PARAMETRES",I)) Q:I=""  S PAR=^[QUI]RQS1(REQ,"PARAMETRES",I),PAR2=PAR_" : " D LECPAR Q:ABORT
 Q
LECPAR Q:$D(@TEMPOPAR@(PAR))
 N Y D POCLEPA^%VVIDEO S Y=$$^%VZAME1(PAR2)
 I CTRLA S ABORT=1 Q
 I Y="" D ^%VSQUEAK G LECPAR
 S @TEMPOPAR@(PAR)=Y
 Q
MAJPARA2(LPAR) 
 
 N PAR,I,%I,VAL,OK
 S I="",OK=1
 F %I=0:0 S I=$O(^[QUI]RQS1(REQ,"PARAMETRES",I)) Q:I=""  S PAR=^[QUI]RQS1(REQ,"PARAMETRES",I) S:$D(@LPAR@(PAR)) @TEMPOPAR@(PAR)=@LPAR@(PAR) I '($D(@LPAR@(PAR))) S OK=0 Q
 Q OK
MAJNREQ 
 
 N PAR,%I,VAL
 S PAR="",COMREQ=$TR(COMREQ,".","_")
 F %I=1:1 S PAR=$O(@TEMPOPAR@(PAR)) Q:PAR=""  S VAL=@TEMPOPAR@(PAR),COMREQ=$E(COMREQ_"/"_$TR(PAR,".","_")_"="_VAL,1,200)
 Q

