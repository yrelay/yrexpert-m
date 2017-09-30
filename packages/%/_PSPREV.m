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

;%PSPREV^INT^1^59547,73874^0
%PSPREV ;;10:36 AM  10 Jun 1992; ; 08 Nov 92 10:45 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EVAL(PRED,BASE,OBJET) 
 N REG,IEL,NATERR,DEROUT,V,PARCO,PAREXE
 
 S PARCO("REP")=BASE,PARCO("IND")=OBJET,REG="",DEROUT=0
 S CXT("%","BASE")="%"
NXREG1 K V S REG=$O(^[QUI]RQSDON("COMPPRED",PRED,REG)) Q:REG="" 1 S IEL=""
NXIEL1 S IEL=$O(^[QUI]RQSDON("COMPPRED",PRED,REG,IEL)) G:IEL="" NXREG1
 X ^[QUI]RQSDON("COMPPRED",PRED,REG,IEL) Q:DEROUT 0
 G:NATERR=3 NXREG1 G NXIEL1
 
 
 
 
EVAL2(PRED,BASE,OBJET,GLORES) 
 N REG,IEL,NATERR,DEROUT,V,PARCO,PAREXE,TOT,OK,DEROUT
 S CXT("%","BASE")="%"
 S PARCO("REP")=BASE,PARCO("IND")=OBJET,REG="",TOT=0,OK=0,DEROUT=0
NXREG2 K V S REG=$O(^[QUI]RQSDON("COMPPRED",PRED,REG))
 I REG="" S @GLORES=$S(TOT=0:1,1:OK/TOT) Q TOT=OK
 S COEF=$S($D(^[QUI]RQSGLO("PRED",PRED,REG,"COEF")):^[QUI]RQSGLO("PRED",PRED,REG,"COEF"),1:1),TOT=TOT+COEF
 S IEL=""
NXIEL2 S IEL=$O(^[QUI]RQSDON("COMPPRED",PRED,REG,IEL))
 I IEL="" S @GLORES@(REG)=1,OK=OK+COEF G NXREG2
 X ^[QUI]RQSDON("COMPPRED",PRED,REG,IEL)
 I DEROUT S @GLORES@(REG)=0,DEROUT=0 G NXREG2
 I NATERR=3 S @GLORES@(REG)=1,OK=OK+COEF G NXREG2
 G NXIEL2
 
 
REQUETE(PRED,LISTE) 
 N BASE,IND,%I,LRES,ADRES,CARD
 I $D(^[QUI]RQSNOINT(LISTE)) S BASE=LISTE,ADRL=$$LISTIND^%QSGEST6(LISTE) G RQ2
 S BASE=$$BASE^%QSGEST7(LISTE),ADRL=$$ADRLIS^%QSGEST7(LISTE)
RQ2 S LRES=$$GEN^%QCAPOP("RQP")
 D CRETYPV^%QSGES11(BASE,LRES,"PREDICAT","PREDICAT",PRED,"INDIVIDU")
 S ADRES=$$ADRLIS^%QSGEST7(LRES),CARD=0
 S ADRLT=$$ADRLT^%QSGEST7(LRES)
 S IND="" F %I=0:0 S IND=$O(@ADRL@(IND)) Q:IND=""  I $$EVAL(PRED,BASE,IND) S @ADRES@(IND)="",CARD=CARD+1,@ADRLT@(CARD)=IND
 D PA^%QSGESTI("L0",LRES,"CARD",CARD,1),PA^%QSGESTI("L0",LRES,"DATE.UTILISATION",$$31^%QMDATE1($$DATENO2^%QMDATE($H)),1),PA^%QSGESTI("L0",LRES,"HEURE.UTILISATION",$$HEUREX^%QMDATE($H),1)
 Q LRES
 ;
 ;
 ;
 ;

