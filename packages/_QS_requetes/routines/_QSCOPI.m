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

;%QSCOPI^INT^1^59547,73881^0
QSCOPI ;
 
 
 
 
 N I,J,TEMP,LTR,K,TR,TR1,BASE,STRU,MSG,MODEL,BASED,STRUD,MID
 D ON^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LTR=$$CONCAS^%QZCHAD(TEMP,"LTR")
 S MSG=$$INITR(LTR)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) K @(TEMP) Q
 S TR=$$SELECT^%QSGEST6(LTR,$$^%QZCHW("Quelle transformation ?"))
 Q:TR=""
 S MODEL=$$MODEL^%QSMODEL Q:MODEL=""
 S TR1=$P(@LTR@(TR),"/",1) Q:TR1=""
 S MID=$P(@LTR@(TR),"/",3) Q:MID=""
 S STRU=$$CONCAS^%QZCHAD("^RQSMOD7",MODEL_",TR,"_TR1)
 S STRUD=$$CONCAS^%QZCHAD("^RQSMOD7",MODEL_",MI,"_MID)
 S BASE=@STRU@("BS")
 S BASED=@STRUD@("BS")
 S LISTE=$$CHL^%QSCOPIN(BASE)
 Q:LISTE=""
 D ^%QSCPK(LISTE,BASED,STRUD)
 D ^%QSCOPY(LISTE,BASE,STRU)
 K @(TEMP)
 D OFF^%VZEATT
 Q
INITR(GL) 
 N I,I,S,D,MODEL
 S MODEL=$$MODEL^%QSMODEL
 Q:MODEL="" $$ERMODEL^%QSMODEL
 S S=$O(^RQSMOD8(MODEL,""))
 F I=0:1 Q:S=""  D TI S S=$O(^RQSMOD8(MODEL,S))
 Q:(I*J)=0 "Pas de transformation inter repertoire chargee pour votre schema"
 Q ""
TI S D=$O(^RQSMOD8(MODEL,S,""))
 F J=0:1 Q:D=""  D TI1 S D=$O(^RQSMOD8(MODEL,S,D))
 Q
TI1 S @GL@(S_" ----> "_D)=$P(^RQSMOD8(MODEL,S,D),"^",1)_"/"_S_"/"_D Q

