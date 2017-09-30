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

;%QSCALVA^INT^1^59547,73880^0
%QSCALVA(BASE,OBJET,ATTR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N RES
 Q:((BASE="")!(OBJET=""))!(ATTR="") ""
 I WHOIS("ETUDE")'=0 Q $$CALVA^%QXPGES2(WHOIS("ETUDE"),BASE,OBJET,ATTR)
 S RES=$O(^[QUI]QUERYV(BASE,OBJET,ATTR,""))
 I RES'="" Q ^[QUI]QUERYV(BASE,OBJET,ATTR,RES)
 I (ATTR="UNITE.DE.COMPTE")&$D(^[QUI]QUERYV(BASE,OBJET)) Q 1
 Q ""
 
 
FORMEX(BASE,OBJET,ATTR) 
 N RES
 Q:((BASE="")!(OBJET=""))!(ATTR="") ""
 I WHOIS("ETUDE")'=0 S RES=$$CALVA^%QXPGES2(WHOIS("ETUDE"),BASE,OBJET,ATTR) G FORMEXS
 S RES=$O(^[QUI]QUERYV(BASE,OBJET,ATTR,""))
 I RES="" Q:(ATTR="UNITE.DE.COMPTE")&$D(^[QUI]QUERYV(BASE,OBJET)) 1 Q ""
 S RES=^[QUI]QUERYV(BASE,OBJET,ATTR,RES)
FORMEXS D:'($D(^[QUI]RQSDON("REMATDAT",BASE,ATTR))) SETREM^%QMDAUC(BASE,ATTR)
 Q:^[QUI]RQSDON("REMATDAT",BASE,ATTR) ""
 Q $$AFFI^%QMDAUC(BASE,ATTR,RES)
 
MVI(BASE,OBJET,ATT,GLO,TYP) D MV(BASE,OBJET,ATT,.GLO,.TYP) Q
 
 
MV(BASE,OBJET,ATT,GLO,TYP) 
 N N,O
 I WHOIS("ETUDE")'=0 D MV^%QXPGES2(WHOIS("ETUDE"),BASE,OBJET,ATT,.GLO,.TYP) Q
 S O=""
 F N=0:1 S O=$O(^[QUI]QUERYV(BASE,OBJET,ATT,O)) Q:O=""  S GLO(O)=^[QUI]QUERYV(BASE,OBJET,ATT,O)
 S GLO=N
 S TYP=$$TYPE^%QSGEST9(BASE,ATT)
 I GLO=0,(ATT="UNITE.DE.COMPTE")&$D(^[QUI]QUERYV(BASE,OBJET)) S GLO=1,GLO(1)=1
 Q
 
 
MVG(BASE,OBJET,ATT,GLO,TYP) 
 N N,O
 S O=""
 I WHOIS("ETUDE")'=0 D MVG^%QXPGES2(WHOIS("ETUDE"),BASE,OBJET,ATT,GLO,.TYP) Q
 F N=0:1 S O=$O(^[QUI]QUERYV(BASE,OBJET,ATT,O)) Q:O=""  S @GLO@(O)=^[QUI]QUERYV(BASE,OBJET,ATT,O)
 S @GLO=N
 S TYP=$$TYPE^%QSGEST9(BASE,ATT)
 I N=0,(ATT="UNITE.DE.COMPTE")&$D(^[QUI]QUERYV(BASE,OBJET)) S @GLO=1,@GLO@(1)=1
 Q
 
 
 
LISTE(BASE,OBJET,ATT,GLO) 
 N N,O
 I WHOIS("ETUDE")'=0 D MVG^%QXPGES2(WHOIS("ETUDE"),BASE,OBJET,ATT,GLO,.N) Q
 S O="" F N=0:1 S O=$O(^[QUI]QUERYV(BASE,OBJET,ATT,O)) Q:O=""  S @GLO@(O)=^[QUI]QUERYV(BASE,OBJET,ATT,O)
 S @GLO=N
 Q
 
 
 
OR(BASE,OBJET,ATT,VAL) 
 N OR,%O
 Q:(((BASE="")!(OBJET=""))!(ATT=""))!(VAL="") ""
 S OR="" F %O=0:0 S OR=$O(^[QUI]QUERYV(BASE,OBJET,ATT,OR)) Q:OR=""  Q:^[QUI]QUERYV(BASE,OBJET,ATT,OR)=VAL
 Q:OR'="" OR
 I (ATT="UNITE.DE.COMPTE")&$D(^[QUI]QUERYV(BASE,OBJET)) Q 1
 Q ""
 
 
 
 
 
COP(BASE,OBJET,GLO) 
 N ATT,VAL,INDICE,%U
 S ATT="" F %U=0:0 S ATT=$O(^[QUI]QUERYV(BASE,OBJET,ATT)) Q:ATT=""  S INDICE="" F %I=0:0 S INDICE=$O(^[QUI]QUERYV(BASE,OBJET,ATT,INDICE)) Q:INDICE=""  S VAL=^[QUI]QUERYV(BASE,OBJET,ATT,INDICE),@GLO@(BASE,OBJET,ATT,VAL,INDICE)=""
 Q
 
 
MVS(BASE,OBJET,ATT,GLO) 
 
 I $$TYPE^%QSGEST9(BASE,ATT)'=0 Q
 N OR,I
 S OR="" F I=0:0 S OR=$O(@GLO@(OR)) Q:OR=""  D PA^%QSGESTI(BASE,OBJET,ATT,@GLO@(OR),OR)
 Q
 ;

