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

;%QSGE6^INT^1^59547,73881^0
%QSGE6 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
RAVO(BASE,ATT,VAL,OR) 
 I WHOIS("ETUDE")'=0 Q $$RAVOE(BASE,ATT,VAL,OR)
 N CH
 Q:(((BASE="")!(ATT=""))!(VAL=""))!(OR="") ""
 S CH="^[QUI]QUERY2("""_BASE_""","""_ATT_""","_$S((VAL+0)=VAL:VAL,1:""""_VAL_"""")_","_$S((OR+0)=OR:OR,1:""""_OR_"""")_")"
 Q CH
TEST W !,$$RAVO("BASE","ATT",12,"12A")
 Q
 
RAVOE(REP,ATT,VAL,ORD) 
 N TEMP,IND,REFI,%I,REFA,V
 S TEMP=$$TEMP^%SGUTIL
 I $$GETVAL^%QXPETU("REPERTOIRE.CHARGE",REP)="" D LOADREP^%QXPGESD(WHOIS("ETUDE"),REP)
 S IND="" F %I=0:0 S IND=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"CONTEXTE",REP,IND,.REFI) Q:IND=""  D RAVO2
 Q TEMP
RAVO2 S REFA=$$REFAI^%QXPGESD(WHOIS("ETUDE"),REP,IND,REFI,ATT) Q:REFA=""
 S V=$$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,ORD) I V=VAL S @TEMP@(IND)=""
 Q
 ;

