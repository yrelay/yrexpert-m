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

;%TLQUER3^INT^1^59547,74030^0
%TLQUER3 ;;12:20 PM  21 Jul 1992; ; 31 Jul 92  2:39 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RECTRT(WHOIS1,QUI1,TRT1,WHOIS2,QUI2,TRT2,MODE,XMODE) 
 N GLOVAL,I,ITRT,GLATT1,ATT,%ATT,IND,%IND,VAL,%VAL,TEMP
 N I,T,NBFILS,NOMCLF
 D EMBRAYE^%TLQUER
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RECTRT")
 K @(TEMP)
 S T=$C(9)
 I XMODE=3 D STOLK^%QMCPOZ(QUI,"TRTF"_T_TRT2) K @(TEMP) D DEBRAYE^%TLQUER Q
 
 D COPIND
 K @(TEMP)
 D DEBRAYE^%TLQUER
 Q
COPIND 
 D EMBRAYE^%TLQUER
 S GLATT1=$$LISTATT1^%QMCPZ(WHOIS1,QUI1,"TRAITEMENT",TRT1)
 D GLOCOP^%QCAGLC(GLATT1,TEMP)
 
 
 S ATT="" F %ATT=0:0 S ATT=$O(@TEMP@(ATT)) Q:ATT=""  S IND="" F %IND=0:0 S IND=$O(@TEMP@(ATT,IND)) Q:IND=""  S VAL=@TEMP@(ATT,IND) D COPATT
 D DEBRAYE^%TLQUER
 Q
 
COPATT 
 I (ATT="NOM")!(ATT="APPELE.PAR") Q
 I ATT="ANALYSE.CORRECTE" D:MODE PA^%QMCPZ(WHOIS2,QUI2,"TRAITEMENT",TRT2,ATT,VAL,IND) D:'(MODE) PA^%QMCPZ(WHOIS2,QUI2,"TRAITEMENT",TRT2,ATT,0,IND) Q
 I ((ATT="NOMBRE.DE.REGLES")!(ATT="NOMBRE.DE.PHRASES"))!(ATT="ENTETE") D PA^%QMCPZ(WHOIS2,QUI2,"TRAITEMENT",TRT2,ATT,VAL,IND) Q
 I '(MODE) Q
 I ATT="APPELLE" D:QUI1=QUI2 ADDS^%QMCPZ(WHOIS2,QUI2,"TRAITEMENT",TRT2,"APPELLE","TRAITEMENT",VAL) Q
 D PA^%QMCPZ(WHOIS2,QUI2,"TRAITEMENT",TRT2,ATT,VAL,IND)
 Q
 ;
 ;

