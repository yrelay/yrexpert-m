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

;LKMZ^INT^1^59547,74867^0
LKMZ ;
 
 
 
LK1(TYPE) 
 I TYPE="PV" Q "^[QUI]LKY(""PV"")"
 
 I TYPE="EC" Q "^[QUI]LKY2"
 I TYPE="XEC" Q "^[QUI]LKY(""XEC"")"
 I TYPE="XPV" Q "^[QUI]LKY(""XPV"")"
 Q ""
LK2(TYPE) 
 I TYPE="PV" Q "^[QUI]LKY(""PV1"")"
 I TYPE="EC" Q "^[QUI]LKYPROT"
 I TYPE="XEC" Q "^[QUI]LKY(""XEC2"")"
 I TYPE="XPV" Q "^[QUI]LKY(""XPV2"")"
 Q ""
LK3(TYPE) 
 
 I TYPE="EC" Q "^[QUI]LKYATR2"
 I TYPE="XEC" Q "^[QUI]LKY(""XEC3"")"
 I TYPE="XPV" Q "^[QUI]LKY(""XPV3"")"
 Q ""
LK4(TYPE) 
 I TYPE="PV" Q "^[QUI]LKY(""EC4"")"
 Q ""
LK5(TYPE) 
 I TYPE="XEC" Q "^[QUI]LKY(""XEC5"")"
 I TYPE="XPV" Q "^[QUI]LKY(""XPV5"")"
 Q ""
LK6(TYPE) 
 I TYPE="XEC" Q "^[QUI]LKY(""XEC6"")"
 I TYPE="XPV" Q "^[QUI]LKY(""XPV6"")"
 Q ""
LK7() 
 Q "^[QUI]LKYENR2"
 
 
MAXENR(PAS) 
 N ADR
 S ADR=$$LK7
 S RES=0,NOENR=""
BMAXE S NOENR=$O(@ADR@(PAS,NOENR))
 Q:NOENR="" RES
 S VAL=$P(@ADR@(PAS,NOENR),"^")
 S:VAL>RES RES=VAL
 G BMAXE
 
 
 
 
 
 
 
 
 
POS(TYPE,G,ATT) 
 I TYPE="EC" G POSEC
 I TYPE="PV" G POSPV
 I TYPE="XEC" G POSXEC
 I TYPE="XPV" G POSXPV
 Q 0
POSEC I G=1 G POSEC1
 I G=2 G POSEC2
 I G=3 G POSEC3
 Q 0
 
 
 
 
 
 
POSEC1 
 Q $S(ATT="LE":1,ATT="SEP":2,ATT="REP":3,1:0)
 
 
 
 
 
 
 
POSEC2 Q $S(ATT="IO":1,ATT="CODAGE":2,ATT="LABEL":3,ATT="L":4,ATT="LB":5,1:0)
 
 
 
 
POSEC3 
 Q $S(ATT="LAST":1,ATT="INDICE":2,ATT="DEFAUT":3,ATT="NUMERIQUE":4,ATT="LONGUEUR":5,ATT="CAREMP":6,ATT="DATE":7,ATT="FORMAT":8,1:0)
 
 
POSPV I G=1 G POSPV1
 I G=2 G POSPV2
 Q 0
 
 
 
 
 
 
 
POSPV1 Q $S(ATT="LE":1,ATT="LA":2,ATT="MARQUE":3,ATT="REP":4,ATT="SUPPORT":5,1:0)
 
 
 
 
 
 
 
 Q $S(ATT="IO":1,ATT="CODAGE":2,ATT="LABEL":3,ATT="L":4,ATT="LB":5,1:0)
 
 
POSXEC I G=1 G POSXEC1
 I G=2 G POSXEC2
 I G=3 G POSXEC3
 I G=5 G POSXEC5
 I G=6 G POSXEC6
 Q 0
 
 
 
 
POSXEC1 Q $S(ATT="LE":1,ATT="REP":2,ATT="SUPPORT":3,1:0)
 
 
 
 
 
 
 
POSXEC2 Q $S(ATT="IO":1,ATT="CODAGE":2,ATT="LABEL":3,ATT="L":4,ATT="LB":5,1:0)
 
 
 
 
POSXEC3 Q $S(ATT="FIRST":1,ATT="LAST":2,1:0)
 
 
 
 
POSXEC6 Q $S(ATT="LE":1,ATT="SEP":2,1:0)
 
 
POSXPV I G=1 G POSXPV1
 I G=2 G POSXPV2
 I G=3 G POSXPV3
 I G=5 G POSXPV5
 I G=6 G POSXPV6
 Q 0
 
 
 
 
POSXPV1 Q $S(ATT="LE":1,ATT="REP":2,ATT="SUPPORT":3,1:0)
 
 
 
 
 
 
POSXPV2 Q $S(ATT="IO":1,ATT="CODAGE":2,ATT="LABEL":3,ATT="L":4,ATT="LB":5,1:0)
 
POSXPV3 Q 0
 
 
 
 
POSXPV6 Q $S(ATT="LE":1,ATT="LA":2,1:0)

