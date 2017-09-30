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

;%QXPGES2^INT^1^59547,73887^0
%QXPGES2 ;;12:07 PM  29 Jul 1992; 22 Jul 92 11:11 AM ; 07 Aug 92  2:10 PM
 
 
 
PA(ETU,REP,IND,ATT,VAL,ORD) 
 N REFA S REFA=$$REFAC^%QXPGESD(ETU,REP,IND,ATT) D PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,ORD,VAL) Q
 
 
 
PA2(ETU,REP,IND,REFI,ATT,VAL,ORD) 
 N REFA S REFA=$$REFAIC^%QXPGESD(ETU,REP,IND,REFI,ATT) D PUSHMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,ORD,VAL) Q
 
 
 
PS(ETU,REP,IND,ATT,ORD) 
 N REFA S REFA=$$REFA^%QXPGESD(ETU,REP,IND,ATT) Q:REFA=""  D SUPPMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,ORD) Q
 
 
 
PSV(ETU,REP,IND,ATT) 
 N REFI S REFI=$$REF^%QXPGESD(ETU,REP,IND) Q:REFI=""  D SUPPMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"ATTRIBUT",REFI,ATT) Q
 
 
 
SX(ETU,REP,IND) 
 N REF S REF=$$REF^%QXPGESD(ETU,REP,IND) Q:REF=""  D SUPPMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"CONTEXTE",REP,IND) Q
 
 
 
CALIN(ETU,REP,IND,ATT,ORD) 
 N REFA S REFA=$$REFA^%QXPGESD(ETU,REP,IND,ATT) Q:REFA="" "" Q $$PULLMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,ORD)
 
 
 
CALVA(ETU,REP,IND,ATT) 
 N REFA,O,VV S REFA=$$REFA^%QXPGESD(ETU,REP,IND,ATT) Q:REFA="" ""
 S O=$$SUIVMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,"",.VV) Q:O="" "" Q VV
 
 
MV(ETU,REP,IND,ATT,GLO,TYP) 
 N N,O,REFA,VV
 N REFA,O S REFA=$$REFA^%QXPGESD(ETU,REP,IND,ATT) I REFA="" S (N,GLO)=0 G MVFIN
 S O=""
 F N=0:1 S O=$$SUIVMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,O,.VV) Q:O=""  S GLO(O)=VV
 S GLO=N
MVFIN S TYP=$$TYPE^%QSGEST9(REP,ATT)
 I N=0,(ATT="UNITE.DE.COMPTE")&$$IR^%QSGE5(REP,ATT) S GLO=1,GLO(1)=1
 Q
 
 
 
MVG(ETU,REP,IND,ATT,GLO,TYP) 
 N O,REFA,VV,N
 N REFA,O S REFA=$$REFA^%QXPGESD(ETU,REP,IND,ATT) I REFA="" S (N,@GLO)=0 G MVGFIN
 S O=""
 F N=0:1 S O=$$SUIVMAT2^%QXPPRI7(ETU,WHOIS("NDCOUR"),"VALEURS",REFA,O,.VV) Q:O=""  S @GLO@(O)=VV
 S @GLO=N
MVGFIN S TYP=$$TYPE^%QSGEST9(REP,ATT)
 I N=0,(ATT="UNITE.DE.COMPTE")&$$IR^%QSGE5(REP,IND) S @GLO=1,@GLO@(1)=1
 Q
 ;
 ;

