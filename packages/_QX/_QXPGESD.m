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

;%QXPGESD^INT^1^59547,73887^0
%QXPGESD ;;02:36 PM  29 Jul 1992; 29 Jul 92 12:30 PM ; 07 Aug 92  3:32 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REF(ETU,REP,IND) N REF
 S REF=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND)
 Q:REF=$C(0) "" Q:REF'="" REF
 I '($D(^[QUI]QUERYV(REP,IND))) D PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,$C(0)) Q ""
 Q $$INIIND(0)
 
 
 
REFC(ETU,REP,IND) 
 N REF
 S REF=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND)
 I (REF'=$C(0))&(REF'="") Q REF
 I REF="" Q:$D(^[QUI]QUERYV(REP,IND)) $$INIIND(0) D PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,$C(0))
 S REF=$$GETVAL^%QXPETU("NBCONTEXT",1)+1
 D SETVAL^%QXPETU("NBCONTEXT",1,REF),PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND,REF),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",REF,REP_$C(0)_IND)
 Q REF
 
 
 
 
REFAC(ETU,REP,IND,ATT) 
 N REFI,REFA
 S REFI=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND)
 I (REFI'=$C(0))&(REFI'="") D:$$GETVAL^%QXPETU("INDIVIDU.CHARGE",REFI)="" LOADIND(ETU,REP,IND,REFI) G REFAC2
 G:REFI=$C(0) REFAC1
 I $D(^[QUI]QUERYV(REP,IND)) S REFI=$$INIIND(1) G REFAC2
 D PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,$C(0))
REFAC1 S REFI=$$GETVAL^%QXPETU("NBCONTEXT",1)+1
 D SETVAL^%QXPETU("NBCONTEXT",1,REFI),PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND,REFI),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",REFI,REP_$C(0)_IND)
 G REFAC3
REFAC2 S REFA=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"ATTRIBUT",REFI,ATT)
 I (REFA'=$C(0))&(REFA'="") Q REFA
REFAC3 S REFA=$$GETVAL^%QXPETU("NBATT",1)+1
 D SETVAL^%QXPETU("NBATT",1,REFA),PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"ATTRIBUT",REFI,ATT,REFA)
 Q REFA
 
 
 
REFA(ETU,REP,IND,ATT) 
 N REFI,REFA
 S REFI=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND)
 Q:REFI=$C(0) ""
 I REFI'="" D:$$GETVAL^%QXPETU("INDIVIDU.CHARGE",REFI)="" LOADIND(ETU,REP,IND,REFI) G REFA2
 I $D(^[QUI]QUERYV(REP,IND)) S REFI=$$INIIND(1) G REFA2
 D PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,$C(0)) Q ""
REFA2 S REFA=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"ATTRIBUT",REFI,ATT)
 I REFA=$C(0) Q ""
 I REFA'="" Q REFA
 I $$GETVAL^%QXPETU("INDIVIDU.CHARGE",REFI)=1 Q ""
 I $D(^[QUI]QUERYV(REP,IND,ATT)) S REFA=$$INIATT Q REFA
 D PUSHMAT2^%QXPPRI7(ETU,0,"ATTRIBUT",REFI,ATT,$C(0))
 Q ""
 
 
 
 
REFAIC(ETU,REP,IND,REFI,ATT) 
 N REFA
 G REFAC2
 
 
 
 
REFAI(ETU,REP,IND,REFI,ATT) 
 N REFA
 G REFA2
 
 
 
 
 
LOADREP(ETU,REP) 
 N IND,%I,REF,R
 S R=$$GETVAL^%QXPETU("NBCONTEXT",1)
 S IND="" F %I=0:0 S IND=$O(^[QUI]QUERYV(REP,IND)) Q:IND=""  S REF=$$PULLMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND) I REF="" S R=R+1 D PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,R),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",R,REP_$C(0)_IND)
 D SETVAL^%QXPETU("NBCONTEXT",1,R)
 D SETVAL^%QXPETU("REPERTOIRE.CHARGE",REP,1)
 Q
 
LOADIND(ETU,REP,IND,REFI) 
 N ATT,%A,REF,O,%O
 S REFA=$$GETVAL^%QXPETU("NBATT",1)
 S ATT="" F %A=0:0 S ATT=$O(^[QUI]QUERYV(REP,IND,ATT)) Q:ATT=""  S REFA=REFA+1 D PUSHMAT2^%QXPPRI7(ETU,0,"ATTRIBUT",REFI,ATT,REFA) S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  D ECR
 D SETVAL^%QXPETU("NBATT",1,REFA)
 D SETVAL^%QXPETU("INDIVIDU.CHARGE",REFI,1)
 Q
ECR D PUSHMAT2^%QXPPRI7(ETU,0,"VALEURS",REFA,O,^[QUI]QUERYV(REP,IND,ATT,O)) Q
 
 
 
INIIND(COMPLET) 
 N REF
 S REF=$$GETVAL^%QXPETU("NBCONTEXT",1)+1
 D SETVAL^%QXPETU("NBCONTEXT",1,REF),PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,REF),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",REF,REP_$C(0)_IND)
 D:COMPLET LOADIND(ETU,REP,IND,REF)
 Q REF
 
INIATT() 
 N REF
 S REF=$$GETVAL^%QXPETU("NBATT",1)+1
 D SETVAL^%QXPETU("NBATT",1,REF),PUSHMAT2^%QXPPRI7(ETU,0,"ATTRIBUT",REFI,ATT,REF)
 Q REF
 
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,A,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,A,O) D PUSHMAT2^%QXPPRI7(ETU,0,"VALEURS",REFA,O,V)
 
LOADI N A,%A,REFA,O,%O,V
 S A="" F %A=0:0 S A=$O(^[QUI]QUERYV(REP,IND,A)) Q:A=""  D LD2
 Q
LD2 S REFA=$$GETVAL^%QXPETU("NBATT",1)+1
 D SETVAL^%QXPETU("NBATT",1,REFA),PUSHMAT2^%QXPPRI7(ETU,0,"ATTRIBUT",REF,A,REFA)
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,A,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,A,O) D PUSHMAT2^%QXPPRI7(ETU,0,"VALEURS",REFA,O,V)
 Q
 
LOADI2(ETU,REF) 
 N REP,IND
 S REP=$$PULLVAL^%QXPPRI7(ETU,0,"REFERENCE",REF),IND=$P(REP,$C(0),2),REP=$P(REP,$C(0))
 D LOADI
 Q
 
 
 
REFLC(ETU,IND) 
 N REF,REP
 S REP="L0"
 S REF=$$REFL(ETU,IND) Q:REF'="" REF
 S REF=$$GETVAL^%QXPETU("NBCONTEXT",1)+1
 D SETVAL^%QXPETU("NBCONTEXT",1,REF),PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND,REF),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",REF,REP_$C(0)_IND)
 Q REF
 
 
 
 
 
REFL(ETU,IND) 
 N REF,A,%A,O,%O,V,REP,BASE,ADR,ADRT
 S REP="L0"
 S REF=$$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND)
 I REF'="" Q:REF=$C(0) "" Q REF
 I '($D(^[QUI]QUERYV(REP,IND))) Q ""
 S REF=$$GETVAL^%QXPETU("NBCONTEXT",1)+1
 D SETVAL^%QXPETU("NBCONTEXT",1,REF),PUSHMAT2^%QXPPRI7(ETU,0,"CONTEXTE",REP,IND,REF),PUSHVAL^%QXPPRI7(ETU,0,"REFERENCE",REF,REP_$C(0)_IND)
 I ^[QUI]ETU(ETU,"CHARGEMENT")=1 D LOADI
 G:'($D(^[QUI]QUERYV(REP,IND,"TRIEE",1))) LISTE2
 S ADR=^[QUI]QUERYV(REP,IND,"ADRESSE",1)
 S A="" F %A=0:0 S A=$O(@ADR@(A)) Q:A=""  D PUSHMAT2^%QXPPRI7(ETU,0,"LISTE",REF,@ADR@(A),A),PUSHMAT2^%QXPPRI7(ETU,0,"LISTE.TRIEE",REF,A,@ADR@(A))
 Q REF
LISTE2 Q:'($D(^[QUI]QUERYV(REP,IND,"ADRESSE",1))) REF
 S ADR=^[QUI]QUERYV(REP,IND,"ADRESSE",1)
 S A="" F %A=1:1 S A=$O(@ADR@(A)) Q:A=""  D PUSHMAT2^%QXPPRI7(ETU,0,"LISTE",REF,A,%A),PUSHMAT2^%QXPPRI7(ETU,0,"LISTE.TRIEE",REF,%A,A)
 Q REF
 ;

