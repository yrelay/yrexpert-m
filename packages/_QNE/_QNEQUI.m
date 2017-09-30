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

;%QNEQUi^INT^1^59547,73879^0
%QNEQUi(LISTIND,L,TEMPS,INCOMP,INCOMPG,INCOMPL,INSEP,INSEPI,C,TAL,TAG,INFO,ADR,DEL,LLISTEN,LLISTE,VT,MODAF,DMULT,NAFF,ABANDON,MSG) ;;12:34 PM  19 Nov 1991
 
 
 
 
 N TEMP,LIGN,M,LM,LMN,P,CARDP,I,INDCOUR,ICOUR,A,CLM,CINSIND,IMPLAC,CARDL
 N LIND,LINDS,LH,LHS,LG,LGS,INSEPL,INSEPLS,CARDLM,ERREUR,SF,MULT,%Z
 N PRECEDE,LISSUC,LISSUCP,LISSUPP,AD1,AD2,AD2REV
 
 D INIT^%QNEQUY
 
 D REINIT^%QNEQUY
 
 
 S UTIL="E",GROAFF=@VT@("GRO")
 D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,UTIL,.GROAFF)
 S INDCOUR=""
 F %Z=1:1 S INDCOUR=$O(@GROAFF@(INDCOUR)) Q:INDCOUR=""  S %Z1=$O(@GROAFF@(INDCOUR,"")) Q:%Z1=""  S @P@(INDCOUR)=%Z1
 
 
LOOP 
 S ICOUR=$O(@L@("")),PASSEVIDE=1
 I ICOUR="" G EPILOG
LOOP1 
 I ICOUR'="" S INDCOUR=@L@(ICOUR) I $$EXA G MAIN
LOOP11 S ICOUR=$O(@L@(ICOUR)),PASSEVIDE=1 I ICOUR'="" S INDCOUR=@L@(ICOUR) I '($$EXA) G LOOP11
 I (ICOUR="")&(PASSEVIDE=1) G EPILOG
 I (ICOUR="")&(PASSEVIDE=0) G LOOP
MAIN 
 I ABANDON G EPILOG
 S INDCOUR=@L@(ICOUR) I '($$EXA) G LOOP11
 S M=0
LOOP2 
 S M=M+1,CREATION=0
 I $$EXIGROUP(M)="" D CREERGROU(M) S CREATION=1
 
 S MULT(1)=$$^%QSCALVA("L0",LMN,"EFFECTIF.POSTE")
 S CARDLM=$$^%QSCALVA("L0",LMN,"CARD")
 S CLM=$$^%QSCALIN("L0",LMN,"CYCLE.COURANT",TEMPS)
 F %Z=2:1:NCOADDI S CLM(%Z)=$$^%QSCALIN("L0",LMN,"CYCLE.COURANT",TEMPS(%Z))
 S NOINSERE=$$CONDTRT^%QNEQUY
 I ABANDON G EPILOG
 I NOINSERE&CREATION S @P@(INDCOUR)="IMPLACABLE" G LOOP1
 I NOINSERE G LOOP2
 S PASSEVIDE=0 D INSERER
 G LOOP
 
EPILOG 
 S IMPLAC=""
 F %Z=1:1 S IMPLAC=$O(@P@(IMPLAC)) Q:IMPLAC=""  I @P@(IMPLAC)="IMPLACABLE" S MSG=$$^%QZCHW("l'individu")_" "_IMPLAC_" "_$$^%QZCHW("n'a pu etre place") D ADD^%QNEQUY(LIGN,MSG)
 S MSG=""
 D FIN^%QNEQUY
 I ABANDON S MSG=$$^%QZCHW("Abandon demande par l'utilisateur en cours d'equilibrage automatique") D ADD^%QNEQUY(LIGN,MSG) G END
 I CARDL'=CARDP S MSG=CARDP_" "_$$^%QZCHW("individus sur")_" "_CARDL_" "_$$^%QZCHW("ont ete places") D ADD^%QNEQUY(LIGN,MSG)
 
END 
 D PSV^%QSGESTI($$REP^%QNEQETU,@VT@("ETUDE"),"NOTE")
 I $D(@LIGN) D CREN^%QSNOTE3($$REP^%QNEQETU,@VT@("ETUDE"),"NOTE","COMPTE-RENDU",LIGN)
 K @(TEMP)
 Q
 
CREERGROU(M) 
 
 K @(INCOMPL)
 D ADR(ADR,M,.LMN,.LM)
 D STOCK^%QSGES11(LLISTEN,LMN)
 S @LLISTE@(LMN)=LM
 S CLM=0,CARDLM=0
 F %Z=2:1:NCOADDI S CLM(%Z)=0
 
 S MULT(1)=1,MULT(2)=1
 
 D ADDA^%QS0(LMN,"EFFECTIF.POSTE",MULT(1))
 D PA^%QSGESTI("L0",LMN,"CARD",CLM,1)
 D PA^%QSGESTI("L0",LMN,"CYCLE.COURANT",CLM,TEMPS)
 F %Z=2:1:NCOADDI D PA^%QSGESTI("L0",LMN,"CYCLE.COURANT",CLM(%Z),TEMPS(%Z))
 Q
 
INSERER 
 
 
 D PLACER(INFO,.TEMPS,INDCOUR,INSEPI,P,.CARDP,LMN,.CARDLM,.CLM)
 
 D AJINC^%QNEQUI9(INDCOUR,INSEPI,INCOMP,INCOMPG,INCOMPL)
 Q
 
PLACER(INFO,TEMPS,INDCOUR,INSEPI,P,CARDP,LMN,CARDLM,CLM) 
 N ADR
 
 I ($D(@INSEPI@(INDCOUR))#10)=0 D PLACE(INFO,.TEMPS,INDCOUR,P,.CARDP,LMN,.CARDLM,.CLM) Q
 
 S ADR=@INSEP@(@INSEPI@(INDCOUR))
 S A=$O(@ADR@(""))
 F I=0:0 Q:A=""  D PLACE(INFO,.TEMPS,A,P,.CARDP,LMN,.CARDLM,.CLM) S A=$O(@ADR@(A))
 Q
 
PLACE(INFO,TEMPS,INDCOUR,P,CARDP,LMN,CARDLM,CLM) 
 N VAL,Z,%Z,I1
 S VAL=$$VAL(INFO,INDCOUR,TEMPS)
 S @P@(INDCOUR)=LMN,CARDP=CARDP+1
 D STOCK^%QSGES11(LMN,INDCOUR)
 S CARDLM=CARDLM+1
 S CLM=CLM+VAL
 F %Z=2:1:NCOADDI S CLM(%Z)=CLM(%Z)+$$VAL(INFO,INDCOUR,TEMPS(%Z))
 F %Z=2:1:NCOADDI D PA^%QSGESTI("L0",LMN,"CYCLE.COURANT",CLM(%Z),TEMPS(%Z))
 D PA^%QSGESTI("L0",LMN,"CYCLE.COURANT",CLM,TEMPS)
 
 Q:'(PRECEDE)
 S I1=$$N1^%QEPRIM(NOMLIEN,REP,INDCOUR)
 S Z="" F %Z=1:1 S Z=$O(@LISSUC@(I1,Z)) Q:Z=""  S @LISSUPP@(Z)=@LISSUPP@(Z)-1
 Q
 
VAL(INFO1,IND,INFO) 
 N A
 
 S A=$$^%QSCALVA(BASEL,IND,INFO)
 Q A
 
ADR(ADR,M,LMN,LM) 
 D @ADR Q
DEL(DEL,LMN) 
 D @DEL Q
 
EXIGROUP(M) 
 N Z,Z1
 S Z=""
 F Z1=1:1:M S Z=$O(^[QUI]RQS2(LLISTEN,"OBJET",Z))
 I Z'="" S LMN=Z,LM=$$STO^%QSGES11(LMN)
 Q Z
EXA() 
 I $D(@P@(INDCOUR)) Q 0
 I PRECEDE,@LISSUPP@($$N1^%QEPRIM(NOMLIEN,REP,INDCOUR))>0 Q 0
 Q 1

