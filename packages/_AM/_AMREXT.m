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

;%AMREXT^INT^1^59547,73865^0
%AMREXT ;;10:20 AM  27 Oct 1993;
 
 
 
 
EXECTRT(TRT,REP,IND) 
 S CXT("@","BASE")=REP
 S CXT("@","OBJET")=IND
 S EXP=$$TEMP^%SGUTIL
 S:'($D(^[QUI]RQSDON("EXPLTRT"))) ^[QUI]RQSDON("EXPLTRT")=0
 S IRG=1,REG=""
NXRGE S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""
 S (NUMET,^[QUI]RQSDON("EXPLTRT"))=^[QUI]RQSDON("EXPLTRT")+1
 S GLET="^[QUI]RQSDON(""EXPLTRT"","_NUMET_")"
 I $D(^TOZE($J,"JRN")),^TOZE($J,"JRN") D NOUVINST^%AMJAJ($$GET^%SGVAR("JRN"),^[QUI]TTL(TRT,2,REG),$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT")_$C(0)_TRT_$C(0)_REG_$C(0)_REP_$C(0)_IND_$C(0)_NUMET),AJJOURN^%AMJAJ($$GET^%SGVAR("JRN"),"execution de la regle numero "_REG)
 S GLOSTO=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S GLOSTO=$$CONCAS^%QZCHAD(GLOSTO,REG)
 S EXECC=$$CONCAS^%QZCHAD(GLET,"C")
 S EXECA=$$CONCAS^%QZCHAD(GLET,"A")
 D REGLE(TRT,IRG)
 S IRG=IRG+1
 G NXRGE
 
 
VISU(TRT,NUMET) 
 S REG=""
 S GLET="^[QUI]RQSDON(""EXPLTRT"","_NUMET_")"
NXRGU S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""
 S GLOSTO=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S GLOSTO=$$CONCAS^%QZCHAD(GLOSTO,REG)
 I $D(@GLOSTO@("EXPC")) S r=$$AFFIFEN^%AMUTXT("condition",$$CONCAS^%QZCHAD(GLOSTO,"EXPC"),"$$MOREC^%AMREXTR")
 S r=$$AFFIFEN^xjaff3("action",$$CONCAS^%QZCHAD(GLOSTO,"EXPA"),"$$MOREA^%AMREXTR")
 G NXRGU
 
MOREA(ICOUR) 
 S EXECC=$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLET,REG),"C")
 S EXECA=$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLET,REG),"A")
 Q $S($D(@EXECA@(ICOUR)):@EXECA@(ICOUR),1:"???")
 
REGLE(TRT,REG) 
 S GLOREG="^[QUI]RQSDON(""ANTRT"","""_TRT_""","_REG_")"
 S EVAL=2,SSEXPR=1
 S GLOROUT=$$TEMP^%SGUTIL
 S @GLOROUT@("ACCES BASE")="$$qscalin^%AV7"
 S @GLOROUT@("INDIVIDU COURANT")="tcour^%AV7"
 S @GLOROUT@("PROXIMITE")="prox^%AV7"
 S @GLOROUT@("ECRITURE BASE")="$$affect^%AV7"
 S @GLOROUT@("VERBES SPECIAUX")="$$ADRVRB^%AV7"
 D REGLE^%AV7(GLOROUT,GLOREG,EVAL,SSEXPR,GLET,"^[QUI]RQSDON(""ANTRT"","""_TRT_""","_REG_")")
 Q
 ;

