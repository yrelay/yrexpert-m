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

;%QNEQUI5^INT^1^59547,73879^0
%QNEQUI5(L,ETUDE,TAL,TAG,LIND,INSEPL,LH,LG,C,CLM,CINSIND,INDCOUR,INSEPI,LMN,LLISTEN,MODAF,OK,VCYCLE,VINCOMP,DMULT,NAFF,MULT,ERREUR,ABANDON) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N A,OLG,DMULT1,LTA,NTR,NLI,NADRT,SELECIN
 I '($D(CXT)) N CXT
 I TAL=0 S TAL=""
 I TAG=0 S TAG=""
 I (TAG="")&(TAL="") Q 1
 S OLG=LG
 S DMULT1=DMULT<MULT(2)
 
 D ZERO^%QSGE11(LIND)
 D STOCK^%QSGES11(LIND,INDCOUR)
 
 
 D ZERO^%QSGE11(INSEPL)
 D INSEP(INDCOUR,INSEPI,.INSEPL)
 D ZERO^%QSGE11(LH)
 D UNION^%QSGE11(LMN,INSEPL,LH)
 
 
 D:NAFF=0 KILLVL^%TLIACTI
 D PA^%QSGESTI("%",$J,"%CYCLE",C,1)
 D PA^%QSGESTI("%",$J,"%CYCLE.COURANT",CLM,1)
 D PA^%QSGESTI("%",$J,"%OK",OK,1)
 D PA^%QSGESTI("%",$J,"%CYCLE.PROPOSE",CINSIND,1)
 D PA^%QSGESTI("%",$J,"%DEPASSEMENT.CYCLE",$S(VCYCLE:$$^%QZCHW("OUI"),1:$$^%QZCHW("NON")),1)
 D PA^%QSGESTI("%",$J,"%INCOMPATIBLE",VINCOMP,1)
 
 D PA^%QSGESTI("%",$J,"%EFFECTIF.POSTE.COURANT",MULT(1),1)
 D PA^%QSGESTI("%",$J,"%EFFECTIF.POSTE.PROPOSE",MULT(2),1)
 D PA^%QSGESTI("%",$J,"%EFFECTIF.MAX.PAR.POSTE",DMULT,1)
 D:ERREUR'="" PA^%QSGESTI("%",$J,"%ERREUR",ERREUR,1)
 G:NAFF=2 MAJMAP
 D VLISTE(.CXT,"%LISTE.OPERATIONS",L,"")
 D VLISTE(.CXT,"%POSTE.COURANT",LMN,"")
 D VLISTE(.CXT,"%POSTE.PROPOSE",LH,"")
 D VLISTE(.CXT,"%GROUPE.INSEPARABLES",INSEPL,"")
 D VETU(.CXT,"%ETUDE.COURANTE",ETUDE,"")
 G SMAJ
MAJMAP D STATT^%TLBAATT("%",$J,"%CYCLE",C,1,"AJOUT")
 D VLISTE(.CXT,"%LISTE.OPERATIONS",L,"M")
 D VLISTE(.CXT,"%POSTE.COURANT",LMN,"M")
 D VLISTE(.CXT,"%POSTE.PROPOSE",LH,"M")
 D VLISTE(.CXT,"%GROUPE.INSEPARABLES",INSEPL,"M")
 D VETU(.CXT,"%ETUDE.COURANTE",ETUDE,"M")
 D STATT^%TLBAATT("%",$J,"%CYCLE.COURANT",CLM,1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%OK",OK,1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%CYCLE.PROPOSE",CINSIND,1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%DEPASSEMENT.CYCLE",$S(VCYCLE:$$^%QZCHW("OUI"),1:$$^%QZCHW("NON")),1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%INCOMPATIBLE",VINCOMP,1,"AJOUT")
 
 D STATT^%TLBAATT("%",$J,"%EFFECTIF.POSTE.COURANT",MULT(1),1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%EFFECTIF.POSTE.PROPOSE",MULT(2),1,"AJOUT")
 D STATT^%TLBAATT("%",$J,"%EFFECTIF.MAX.PAR.POSTE",DMULT,1,"AJOUT")
 D:ERREUR'="" STATT^%TLBAATT("%",$J,"%ERREUR",ERREUR,1,"AJOUT")
SMAJ G:TAL="" STALF
 G:NAFF'=0 STAL1
 I $$EXISTE^%TLINTER(TAL),$$EX^%QS0(LIND) S A=$$CONTEXTL^%TLIACTI(TAL,LIND,MODAF,0,0,.CXT,.ABANDON)
 D FIN
 I ABANDON D KILLVL^%TLIACTI Q 0
 G STALF
STAL1 
 S LTA="TAL",NLI=LIND,NTR=TAL,NADRT="STAL1R^%QNEQUI5"
 G:NAFF=1 TRTNORM^%QNEQU16 G TRTMAP^%QNEQU16
STAL1R D FIN
 I ABANDON Q 0
 G STALF
STALF 
 I TAG="" D:NAFF=0 KILLVL^%TLIACTI Q OK
 
 S LG=OLG
 
 D ZERO^%QSGE11(LG)
 D COPY^%QSGE11(LLISTEN,LG)
 D STOCK^%QSGES11(LG,LH)
 D ELIMI^%QSGES11(LG,LMN)
 
 G:NAFF'=0 STAG1
 D VLISTE(.CXT,"%LISTE.POSTES",LG,"")
 I $$EXISTE^%TLINTER(TAG),$$EX^%QS0(LIND) S A=$$CONTEXTL^%TLIACTI(TAG,LIND,MODAF,0,0,.CXT,.ABANDON)
 D FIN
 D KILLVL^%TLIACTI
 Q:OK=0 0
 Q 1
STAG1 
 D:MODEX'=2 VLISTE(.CXT,"%LISTE.POSTES",LG,"")
 D:MODEX=2 VLISTE(.CXT,"%LISTE.POSTES",LG,"M")
 S LTA="TAG",NLI=LIND,NTR=TAG,NADRT="STAG1R^%QNEQUI5"
 G:NAFF=1 TRTNORM^%QNEQU16 G TRTMAP^%QNEQU16
STAG1R D FIN
 Q:OK=0 0
 Q 1
 
 
INSEP(INDCOUR,INSEPI,INSEPL) 
 I ($D(@INSEPI@(INDCOUR))#10)=0 D STOCK^%QSGES11(INSEPL,INDCOUR) Q
 S INSEPL=@INSEPI@(INDCOUR)
 Q
 
 
 
 
 
 
 
VLISTE(CXT,LIB,L,UTIL) 
 S CXT(LIB,"BASE")="L0"
 S CXT(LIB,"OBJET")=L
 D PA^%QSGESTI("%",$J,LIB,L,1)
 I UTIL="M" D STATT^%TLBAATT("%",$J,LIB,L,1,"AJOUT")
 Q
 
VETU(CXT,LIB,ETU,UTIL) 
 S CXT(LIB,"BASE")=$$REP^%QNEQETU
 S CXT(LIB,"OBJET")=ETU
 D PA^%QSGESTI("%",$J,LIB,ETU,1)
 I UTIL="M" D STATT^%TLBAATT("%",$J,LIB,ETU,1,"AJOUT")
 Q
 
FIN N OK1,M1
 I ABANDON D ABAND(.ABANDON)
 I ABANDON S OK=0,ERREUR="" Q
 S ERREUR=$$^%QSCALVA("%",$J,"%ERREUR")
 S OK1=$$^%QSCALVA("%",$J,"%OK")
 I OK1=0 S OK=0 Q
 I OK1=1 S OK=1,ERREUR="" G FIN1
 
 S OK='((VCYCLE!VINCOMP)!DMULT1)
 Q
FIN1 S M1=$$^%QSCALVA("%",$J,"%EFFECTIF.POSTE.PROPOSEE")
 
 I $$ENTP^%QZNBN(M1) S MULT(2)=M1
 
 Q
ABAND(AB) 
 I NAFF'=0 S AB=1 Q
 D POCLEPA^%VVIDEO
 S AB=$$MES^%VZEOUI($$^%QZCHW("Souhaitez vous abandonner l'equilibrage automatique en cours"),"N")
 Q

