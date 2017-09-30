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

;%QXPGES^INT^1^59547,73887^0
%QXPGES ;; ; 22 Jul 92 11:11 AM
 
 
PA(ETU,REP,IND,ATT,VAL,ORD) 
 N REF,NDEP,NDCOUR,A,%A,O,%O,V
 S NDDEP=$$NDDEP^%QXPPRIM(ETU)
 S NDCOUR=WHOIS("NDCOUR")
 S REF=$$GETREF(ETU,REP,IND)
 I REF'="" G PA2
 S REF=$$PULLVAL^%QXPPRI7(ETU,NDDEP,"NBCONTEXT",1)
 S REF=REF+1
 D PUSHVAL^%QXPPRI7(ETU,NDDEP,"NBCONTEXT",1,REF)
 D PUSHMAT^%QXPPRIM(ETU,NDCOUR,"CONTEXTE",REP,IND,1,REF)
 D PUSHVAL^%QXPPRI7(ETU,NDDEP,"REFERENCE",REF,REP_$C(0)_IND)
PA2 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"INDIVIDUS",REF,ATT,ORD,VAL)
 Q
 
 
PS(ETU,REP,IND,ATT,ORD) 
 N REF
 S REF=$$GETREF(ETU,REP,IND) Q:REF=""
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"INDIVIDUS",REF,ATT,ORD,$C(0))
 Q
 
 
SX(ETU,REP,IND) 
 N REF S REF=$$GETREF(ETU,REP,IND) Q:REF=""
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND,1,$C(0)) Q
 
 
CALIN(ETU,REP,IND,ATT,ORD) 
 N REF S REF=$$GETREF(ETU,REP,IND) Q:REF="" ""
 Q $$PULLMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"INDIVIDUS",REF,ATT,ORD)
 
CALVA(ETU,REP,IND,ATT) 
 N REF,O S REF=$$GETREF(ETU,REP,IND) Q:REF="" ""
 S O=$$SVMATI^%QXPPRI2(ETU,WHOIS("NDCOUR"),"INDIVIDUS",REF,ATT,"")
 Q:O="" ""
 Q $$PULLMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"INDIVIDUS",REF,ATT,O)
 
 
 
 
 
GETREF(ETU,REP,IND) 
 N REF,NDEP,A,%A,O,%O,V
 S NDDEP=$$NDDEP^%QXPPRIM(ETU)
 S REF=$$PULLMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND,1)
 I REF'="" Q:REF=$C(0) "" Q REF
 I '($D(^[QUI]QUERYV(REP,IND))) Q ""
 S REF=$$PULLVAL^%QXPPRI7(ETU,NDDEP,"NBCONTEXT",1)
 S REF=REF+1
 D PUSHVAL^%QXPPRI7(ETU,NDDEP,"NBCONTEXT",1,REF)
 D PUSHMAT^%QXPPRIM(ETU,NDDEP,"CONTEXTE",REP,IND,1,REF)
 D PUSHVAL^%QXPPRI7(ETU,NDDEP,"REFERENCE",REF,REP_$C(0)_IND)
 I ^[QUI]ETU(ETU,"CHARGEMENT")=1 S A="" F %A=0:0 S A=$O(^[QUI]QUERYV(REP,IND,A)) Q:A=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,A,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,A,O) D PUSHMAT^%QXPPRIM(ETU,NDDEP,"INDIVIDUS",REF,A,O,V)
 Q REF
 ;
 ;
 ;

