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

;%AMREXPL^INT^1^59547,73865^0
%AMREXPL ;;07:14 PM  3 Nov 1993;
 
 
 
 
 
 
 
 
 
 
 
EXEPLAN(PLIND,PLAN,FIRST,UCIND) 
 N NUMIND,IPL,REG
 N REP,IND
 S NUMIND=""
BCLIND S NUMIND=$O(@PLIND@(NUMIND)) Q:NUMIND=""
 D @UCIND
 S IPL=FIRST
REGLE G:IPL="" BCLIND S REG=@PLAN@(IPL)
 
 
 
 S (NUMET,^[QUI]RQSDON("EXPLTRT"))=^[QUI]RQSDON("EXPLTRT")+1
 S DEROUT=0
 S GLET="^[QUI]RQSDON(""EXPLTRT"","_NUMET_")"
 G:'($D(^TOZE($J,"JRN"))) S2 G:'(^TOZE($J,"JRN")) S2
 D NOUVINST^%AMJAJ($$GET^%SGVAR("JRN"),^[QUI]TTL(TRT,2,REG),$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT")_$C(0)_TRT_$C(0)_REG_$C(0)_REP_$C(0)_IND_$C(0)_NUMET)
 D AJJOURN^%AMJAJ($$GET^%SGVAR("JRN"),"execution de la regle numero "_REG)
S2 S GLOANREG=$$CONCAS^%QZCHAD(GLOAN,REG)
 S EVAL=2,SSEXPR=0
 D REGLE^%AV8(GLOROUT,GLOANREG,EVAL,SSEXPR,GLET,GLOAN)
 I '(DEROUT) G NXRGE
 I DEROUT=1 S DEROUT=0,IPL=@TABADR@(NOUVADR) G REGLE
 I DEROUT=3 S DEROUT=0 G BCLIND
NXRGE S IPL=$O(@PLAN@(IPL))
 G REGLE

