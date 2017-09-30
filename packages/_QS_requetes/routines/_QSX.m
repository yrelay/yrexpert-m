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

;%QSX^INT^1^59547,73883^0
QSX ;
 
 
 
 
 
 
 
ATT(STO,REP,ATT) 
 N I,J,K,IND,VAL,ORD,CARD
 K @STO@(REP,ATT)
1 S IND="",CARD=0
 F I=0:0 S IND=$O(^[QUI]QUERYV(REP,IND)) Q:IND=""  D ATT11
 S @STO@(REP,ATT,"CARD","QUERYV")=CARD
 
2 S VAL="",CARD=0
 F I=0:0 S VAL=$O(^[QUI]QUERY2(REP,ATT,VAL)) Q:VAL=""  D ATT21
 S @STO@(REP,ATT,"CARD","QUERY2")=CARD
 
3 S IND="",CARD=0
 F I=0:0 S IND=$O(^[QUI]QUERY3(REP,IND)) Q:IND=""  D ATT31
 S @STO@(REP,ATT,"CARD","QUERY3")=CARD
 
4 S VAL="",CARD=0
 F I=0:0 S VAL=$O(^[QUI]QUERY4(REP,VAL)) Q:VAL=""  D ATT41
 S @STO@(REP,ATT,"CARD","QUERY4")=CARD
 
 Q
ATT11 S ORD=""
 F J=0:0 S ORD=$O(^[QUI]QUERYV(REP,IND,ATT,ORD)) Q:ORD=""  D ATT12
 Q
ATT12 S VAL=""
 S VAL=^[QUI]QUERYV(REP,IND,ATT,ORD)
 Q:VAL=""
 S CARD=CARD+1
 Q
 
ATT21 S ORD=""
 F J=0:0 S ORD=$O(^[QUI]QUERY2(REP,ATT,VAL,ORD)) Q:ORD=""  D ATT22
 Q
ATT22 S IND=""
 F K=0:0 S IND=$O(^[QUI]QUERY2(REP,ATT,VAL,ORD,IND)) Q:IND=""  S CARD=CARD+1
 Q
 
ATT31 S ORD=""
 F J=0:0 S ORD=$O(^[QUI]QUERY3(REP,IND,ORD)) Q:ORD=""  D ATT32
 Q
ATT32 S VAL=""
 F K=0:0 S VAL=$O(^[QUI]QUERY3(REP,IND,ORD,ATT,VAL)) Q:VAL=""  S CARD=CARD+1
 Q
 
ATT41 S ORD=""
 F J=0:0 S ORD=$O(^[QUI]QUERY4(REP,VAL,ATT,ORD)) Q:ORD=""  D ATT42
 Q
ATT42 S IND=""
 F K=0:0 S IND=$O(^[QUI]QUERY4(REP,VAL,ATT,ORD,IND)) Q:IND=""  S CARD=CARD+1
 Q

