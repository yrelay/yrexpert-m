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

;%TLQUER^INT^1^59547,74030^0
%TLQUER ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXISTE(TTT) 
 N VAL
 D EMBRAYE
 S VAL=$$IR^%QSGEST5("TRAITEMENT",TTT)
 D DEBRAYE
 Q VAL
 
 
 
 
 
 
 
 
 
 
 
 
 
CREER(TTT) 
 N GLOTRT,GLOVL,ITRT,NBINC,INDNR,TCOUR,TMAX,ICOUR,IMAX,I,RESCREA,GLONR
 N ITRT
 Q:'($$REPM^%QSGEST9("TRAITEMENT"))
 D EMBRAYE
 
 
 S RESCREA=$$CREER^%QSGEIND("TRAITEMENT",TTT,"",1,0)
 
 
 
 
 
 S GLONR=$$LAV^%QSGEST6("TRAITEMENT","NON.RESOLU")
 I $D(@GLONR@(TTT,TTT)) S ITRT="" F I=0:0 S ITRT=$O(@GLONR@(TTT,TTT,ITRT)) Q:ITRT=""  D SOLVE
 
 D PA^%QSGESTI("TRAITEMENT",TTT,"DATE.CREATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("TRAITEMENT",TTT,"DATE.DERNIERE.MODIFICATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("TRAITEMENT",TTT,"ANALYSE.CORRECTE",1,1)
 D DEBRAYE
 Q
 
SOLVE 
 
 
 D EMBRAYE
 D ADDS^%QSGEST3("TRAITEMENT",ITRT,"APPELLE","TRAITEMENT",TTT)
 
 D PS^%QSGESTI("TRAITEMENT",ITRT,"NON.RESOLU",TTT,TTT)
 D DEBRAYE
 Q
 
 
 
 
 
 
 
 
 
 
 
 
SUPP(TTT) 
 N VAL
 D EMBRAYE
 I '($$EXISTE(TTT)) D DEBRAYE Q
 N GLOVAL,NBINC,TRTCOUR,I
 
 S TRTCOUR="" F I=0:0 S TRTCOUR=$$NXTRIAO^%QSTRUC8("TRAITEMENT",TTT,"APPELE.PAR",TRTCOUR) Q:TRTCOUR=""  D MDFAPP
 
 D SX^%QSGESTK("TRAITEMENT",TTT)
 D DEBRAYE
 Q
MDFAPP D SUPS^%QSGEST3("TRAITEMENT",TRTCOUR,"APPELLE","TRAITEMENT",TTT)
 D PA^%QSGESTI("TRAITEMENT",TRTCOUR,"NON.RESOLU",TTT,TTT)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFVAL(TTT,ATTRIB,INDICE,VALEUR) 
 D EMBRAYE
 I '($$IR^%QSGE5("TRAITEMENT",TTT)) D DEBRAYE Q
 D PA^%QSGESTI("TRAITEMENT",TTT,ATTRIB,VALEUR,INDICE)
 D DEBRAYE
 Q
 
 
GETVAL(TTT,ATTRIB,INDICE) 
 N RES
 D EMBRAYE
 I '($$OAIR^%QSGE5("TRAITEMENT",TTT,ATTRIB,INDICE)) D DEBRAYE Q ""
 S RES=$$^%QSCALIN("TRAITEMENT",TTT,ATTRIB,INDICE)
 D DEBRAYE
 Q RES
 
 
EMBRAYE 
 I WHOIS("ETUDE")=0 Q
 S ^NUMETUD($J)=WHOIS("ETUDE"),WHOIS("ETUDE")=0
 Q
 
DEBRAYE 
 S:^NUMETUD($J)'=0 WHOIS("ETUDE")=^NUMETUD($J),^NUMETUD($J)=0
 Q

