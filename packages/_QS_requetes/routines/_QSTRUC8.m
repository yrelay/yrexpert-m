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

;%QSTRUC8^INT^1^59547,73883^0
%QSTRUC8 ;
 ;; fonction d'acces a la base de donnees
 ;; dans un premier temps uniquement pour cacher la structure des
 ;; querys
 
 
 
 
NXTR(REP) 
 Q $O(^[QUI]QUERYV(REP))
 
 
NXTRI(REP,IND) 
 N RF
 I WHOIS("ETUDE")=0 Q $O(^[QUI]QUERYV(REP,IND))
 I $$GETVAL^%QXPETU("REPERTOIRE.CHARGE",REP)="" D LOADREP^%QXPGESD(WHOIS("ETUDE"),REP)
 Q $$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"CONTEXTE",REP,IND,.RF)
 
 
NXTRIA(REP,IND,ATT) 
 I WHOIS("ETUDE")=0 Q $O(^[QUI]QUERYV(REP,IND,ATT))
 N REF,RFA S REF=$$REF^%QXPGESD(WHOIS("ETUDE"),REP,IND) Q:REF="" ""
 I $$GETVAL^%QXPETU("INDIVIDU.CHARGE",REF)="" D LOADIND^%QXPGESD(WHOIS("ETUDE"),REP,IND,REF)
 Q $$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"ATTRIBUT",REF,ATT,.RFA)
 
NXTRIAO(REP,IND,ATT,ORD) 
 I WHOIS("ETUDE")=0 Q $O(^[QUI]QUERYV(REP,IND,ATT,ORD))
 N REFA,VV S REFA=$$REFA^%QXPGESD(WHOIS("ETUDE"),REP,IND,ATT) Q:REFA="" ""
 Q $$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,ORD,.VV)
 
 
VALEUR(REP,IND,ATT,ORD) 
 I WHOIS("ETUDE")=0 Q ^[QUI]QUERYV(REP,IND,ATT,ORD)
 N REFA S REFA=$$REFA^%QXPGESD(WHOIS("ETUDE"),REP,IND,ATT) Q $$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,ORD)
 
 
GETVAL(REP,IND,ATT,ORD) 
 I WHOIS("ETUDE")=0 Q $S($D(^[QUI]QUERYV(REP,IND,ATT,ORD)):^[QUI]QUERYV(REP,IND,ATT,ORD),1:"")
 N REFA S REFA=$$REFA^%QXPGESD(WHOIS("ETUDE"),REP,IND,ATT) Q:REFA="" "" Q $$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,ORD)
 
 
 
 
PARCAO(%rr,%ii,%xx) 
 N %tt,ATT,ORD,VAL,%zz1,%zz2
 I WHOIS("ETUDE")'=0 G PARCAO2
 S ATT="" F %tt(1)=0:0 S ATT=$O(^[QUI]QUERYV(%rr,%ii,ATT)) Q:ATT=""  S ORD="" F %tt(2)=0:0 S ORD=$O(^[QUI]QUERYV(%rr,%ii,ATT,ORD)) Q:ORD=""  S VAL=^[QUI]QUERYV(%rr,%ii,ATT,ORD) X %xx
 Q
PARCAO2 
 S %tt(1)=$$REF^%QXPGESD(WHOIS("ETUDE"),%rr,%ii) Q:%tt(1)=""
 I $$GETVAL^%QXPETU("INDIVIDU.CHARGE",%tt(1))="" D LOADIND^%QXPGESD(WHOIS("ETUDE"),%rr,%ii,%tt(1))
 S ATT="" F %tt(2)=0:0 S ATT=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"ATTRIBUT",%tt(1),ATT,.%zz1) Q:ATT=""  D PRCAO2
 Q
PRCAO2 S ORD="" F %tt(4)=0:0 S ORD=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",%zz1,ORD,.VAL) Q:ORD=""  X %xx
 Q
 
NXTRIAV(REP,IND,ATT,VAL) 
 N O,%O,TAB,V,REFA
 G:WHOIS("ETUDE")'=0 RIAVE
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,ATT,O),TAB(V)=O
 Q $O(TAB(VAL))
RIAVE S REFA=$$REFA^%QXPGESD(WHOIS("ETUDE"),REP,IND,ATT) Q:REFA="" ""
 S O="" F %O=0:0 S O=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,O,.V) Q:O=""  S TAB(V)=O
 Q $O(TAB(VAL))
 
 
NXTRIAVO(REP,IND,ATT,VAL,ORD) 
 N O,%O,TAB,V
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,ATT,O) I V=VAL S TAB(O)=""
 Q $O(TAB(ORD))
 
 
NXTRA(REP,ATT) 
 Q $O(^[QUI]QUERY2(REP,ATT))
 
NXTRAV(REP,ATT,VAL) 
 Q $O(^[QUI]QUERY2(REP,ATT,VAL))
 
NXTRAVO(REP,ATT,VAL,ORD) 
 Q $O(^[QUI]QUERY2(REP,ATT,VAL,ORD))
 
NXTRAVOI(REP,ATT,VAL,ORD,IND) 
 Q $O(^[QUI]QUERY2(REP,ATT,VAL,ORD,IND))
 
NXTRIO(REP,IND,ORD) 
 Q $O(^[QUI]QUERY3(REP,IND,ORD))
 
NXTRIOV(REP,IND,ORD,VAL) 
 Q $O(^[QUI]QUERY3(REP,IND,ORD,VAL))
 
NXTRIOAV(REP,IND,ORD,ATT,VAL) 
 Q $O(^[QUI]QUERY3(REP,IND,ORD,ATT,VAL))
 
NXTRV(REP,VAL) 
 Q $O(^[QUI]QUERY4(REP,VAL))
 
NXTRVA(REP,VAL,ATT) 
 Q $O(^[QUI]QUERY4(REP,VAL,ATT))
 
NXTRVAO(REP,VAL,ATT,ORD) 
 Q $O(^[QUI]QUERY4(REP,VAL,ATT,ORD))
 
NXTRVAOI(REP,VAL,ATT,ORD,IND) 
 Q $O(^[QUI]QUERY4(REP,VAL,ATT,ORD,IND))
 
 
 I WHOIS("ETUDE")=0 Q $O(^[QUI]QUERYV(REP,IND,ATT,ORD))
 N REF S REF=$$GETREF^%QXPGES(WHOIS("ETUDE"),REP,IND) Q:REF="" ""
 S O=$$SVMATI^%QXPPRI2(WHOIS("ETUDE"),$$NDCOUR^%QXPPRIM(WHOIS("ETUDE")),"INDIVIDUS",REF,ATT,ORD)
 Q O
 
NXTRIAOV(REP,IND,ATT,ORD,VAL) 
 Q:VAL'="" ""
 I $D(^[QUI]QUERYV(REP,IND,ATT,ORD)) Q ^[QUI]QUERYV(REP,IND,ATT,ORD)
 Q ""
 
 
 
 
 
PRVR(REP) 
 Q $ZP(^[QUI]QUERYV(REP))
 
PRVRI(REP,IND) 
 Q $ZP(^[QUI]QUERYV(REP,IND))
 
PRVRIA(REP,IND,ATT) 
 Q $ZP(^[QUI]QUERYV(REP,IND,ATT))
 
 
PRVRIAO(REP,IND,ATT,O) 
 Q $ZP(^[QUI]QUERYV(REP,IND,ATT,O))
 
PRVRIAV(REP,IND,ATT,VAL) 
 N O,%O,TAB
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,ATT,O),TAB(V)=O
 Q $ZP(TAB(VAL))
 
PRVRIAVO(REP,IND,ATT,VAL,ORD) 
 N O,%O,TAB,V
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,ATT,O) I V=VAL S TAB(O)=""
 Q $ZP(TAB(ORD))
 
PRVRA(REP,ATT) 
 Q $ZP(^[QUI]QUERY2(REP,ATT))
 
PRVRAV(REP,ATT,VAL) 
 Q $ZP(^[QUI]QUERY2(REP,ATT,VAL))
 
PRVRAVO(REP,ATT,VAL,ORD) 
 Q $ZP(^[QUI]QUERY2(REP,ATT,VAL,ORD))
 
PRVRAVOI(REP,ATT,VAL,ORD,IND) 
 Q $ZP(^[QUI]QUERY2(REP,ATT,VAL,ORD,IND))
 
PRVRIO(REP,IND,ORD) 
 Q $ZP(^[QUI]QUERY3(REP,IND,ORD))
 
PRVRIOV(REP,IND,ORD,VAL) 
 Q $ZP(^[QUI]QUERY3(REP,IND,ORD,VAL))
 
PRVRIOAV(REP,IND,ORD,ATT,VAL) 
 Q $ZP(^[QUI]QUERY3(REP,IND,ORD,ATT,VAL))
 
PRVRV(REP,VAL) 
 Q $ZP(^[QUI]QUERY4(REP,VAL))
 
PRVRVA(REP,VAL,ATT) 
 Q $ZP(^[QUI]QUERY4(REP,VAL,ATT))
 
PRVRVAO(REP,VAL,ATT,ORD) 
 Q $ZP(^[QUI]QUERY4(REP,VAL,ATT,ORD))
 
PRVRVAOI(REP,VAL,ATT,ORD,IND) 
 Q $ZP(^[QUI]QUERY4(REP,VAL,ATT,ORD,IND))
 
 
 
LISTVAL(REP,IND,ATT,GLO) 
 N O,%O,V
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(REP,IND,ATT,O)) Q:O=""  S V=^[QUI]QUERYV(REP,IND,ATT,O),@GLO@(V)=""
 Q

