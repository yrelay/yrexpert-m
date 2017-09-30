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

;%QSGEST6^INT^1^59547,73881^0
%QSGEST6 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SEL(NOM,TI) S TI=$$^%QCAZG("TI") Q $$SELECT(NOM,TI)
 
 
 
 
 
 
 
 
 
SELECT(NOM,TI) N CHOIX S TI=$E($$^%QCAZG("TI"),1,40)
 D CLEPAG^%VVIDEO D:TI'="" ^%VZCD0(TI),INIT^%QUCHOIP(NOM,1,"",1,5,75,18)
 D:TI="" INIT^%QUCHOIP(NOM,1,"",1,0,75,22)
 D AFF^%QUCHOIP
 S CHOIX=$$UN^%QUCHOIP
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 Q CHOIX
AFF(NOM) Q $$AFFICH(NOM)
 
 
 
 
 
 
 
 
AFFICH(NOM) N CHOIX
 D CLEPAG^%VVIDEO
 D INIT^%QUCHOIP(NOM,1,"",1,0,75,19)
 D AFF^%QUCHOIP
 D ^%VZEAVT(" ")
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 Q 1
LISTIND(REP) Q:REP="" ""
 I WHOIS("ETUDE")=0 Q "^["""_QUI_"""]QUERYV("""_REP_""")"
 I $$GETVAL^%QXPETU("REPERTOIRE.CHARGE",REP)="" D LOADREP^%QXPGESD(WHOIS("ETUDE"),REP)
 Q $$GLOMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"CONTEXTE",REP)
 
 
 
 
 
 
 
 
LISTATT1(REP,I) Q:(REP="")!(I="") "" Q "^["""_QUI_"""]QUERYV("""_REP_""","_$S((I+0)=I:I,1:$$S1^%QZCHAD(I))_")"
 
 
 
 
 
 
 
 
LISTATT2(REP) Q:REP="" "" Q "^["""_QUI_"""]QUERY2("""_REP_""")"
 
 
 
 
 
 
 
LISTVAL(REP,I,A) Q:((REP="")!(I=""))!(A="") "" Q "^["""_QUI_"""]QUERYV("""_REP_""","_$S((I+0)=I:I,1:""""_I_"""")_","""_A_""")"
 
 
 
 
 
 
 
 
 
 
VALOR(REP,I,A,O) Q:(((REP="")!(I=""))!(A=""))!(O="") "" Q:$D(^[QUI]QUERYV(REP,I,A,O))<9 "" Q ^[QUI]QUERYV(REP,I,A,O)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LAV(REP,ATT) Q:REP="" "" Q "^["""_QUI_"""]QUERY2("""_REP_""","""_ATT_""")"
 ;

