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

;%EDRQQUC^INT^1^59547,73869^0
EDRQQUC ;
 
 
 
 
 
OK S (REFUSE,STOPUC)=0 Q
ERR S (REFUSE,STOPUC)=1 Q
SQ D ^%VSQUEAK G ERR
M(M) D ^%VZEAVT(M) Q
 
REPER S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 G:RESUL(IC)="" SQ G:"*?"'[$E(RESUL(IC),$L(RESUL(IC))) ROK
 S (TAB(ICC),RESUL(IC))=$$SUP^%QUCHOIX("^[QUI]RQSAUTOR(WHOIS)",RESUL(IC),0,0,79,23)
 S SICC=ICC,SIC=IC D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S ICC=SICC,IC=SIC
 G:RESUL(IC)="" SQ
ROK I '($D(^[QUI]RQSAUTOR(WHOIS,RESUL(IC)))) D M("Repertoire inconnu") G ERR
 G OK
ATTRI S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 G:RESUL(IC)="" SQ G:"*?"'[$E(RESUL(IC),$L(RESUL(IC))) AOK
 N BASE S BASE=$$NOMINT^%QSF(RESUL(IC-1))
 S (TAB(ICC),RESUL(IC))=$$SUP^%QUCHOIX($$LISTATT2^%QSGEST6(BASE),RESUL(IC),0,0,79,23)
 S SICC=ICC,SIC=IC
 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S ICC=SICC,IC=SIC
 G:RESUL(IC)="" SQ
 G OK
VALEU G:RESUL(IC)="" SQ G:"*?"'[$E(RESUL(IC),$L(RESUL(IC))) VOK
 N BASE S BASE=$$NOMINT^%QSF(RESUL(IC-2))
 N LVAL
 ;;DTM2
 ;;N TEMP S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VALEU")
 ;;S LVAL=$$CONCAS^%QZCHAD(TEMP,"LVAL")
 ;;D LIS3^%QSTRUC2("^[QUI]QUERY2",BASE,RESUL(IC-1),LVAL)
 ;;FINDTM2
 ;;NONDTM2
 S LVAL=$$LAV^%QSGEST6(BASE,RESUL(IC-1))
 ;;FINNONDTM2
 S (TAB(ICC),RESUL(IC))=$$SUP^%QUCHOIX(LVAL,RESUL(IC),0,0,79,23)
 S SICC=ICC,SIC=IC D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S ICC=SICC,IC=SIC
 ;;DTM2
 ;;K @TEMP
 ;;FINDTM2
 G:RESUL(IC)="" SQ
VOK G OK
AOK G OK
CONTE S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 G:RESUL(IC)="" SQ G OK
EQUIV G:RESUL(IC)="" SQ G OK
 
 
EQUIVA(BA,ATT,VAL,CTX) 
 Q:(((BA="")!(ATT=""))!(VAL=""))!(CTX="") ""
 I $D(^[QUI]RQQ(BA,ATT,VAL,CTX)) Q $P(^[QUI]RQQ(BA,ATT,VAL,CTX),"^",1)
 Q VAL

