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

;%AMREXSS^INT^1^59547,73865^0
%AMREXSS(TRT) ;;12:25 PM  4 Nov 1993;
 
 
 
 N PLAN,PLIND,GLOAN
 S GLOAN=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S EXP=$$TEMP^%SGUTIL
 S PLAN=$$TEMP^%SGUTIL,TABADR=$$TEMP^%SGUTIL,TABETQ=$$TEMP^%SGUTIL
 S GLET=$$TEMP^%SGUTIL
 S PLIND=$$TEMP^%SGUTIL
 S GLOROUT=$$TEMP^%SGUTIL
 D MKPLAN
 D EXEPLAN(PLAN)
 Q
 
 
EXEPLAN(PLAN) 
 N NUMIND,IPL,REG
 S IPL=""
REGLE S IPL=$O(@PLAN@(IPL)) Q:IPL=""
 S REG=@PLAN@(IPL)
 W !,^[QUI]TTL(TRT,2,REG)
S2 S GLOANREG=$$CONCAS^%QZCHAD(GLOAN,REG)
 S SSEXPR=$$CONCAS^%QZCHAD(GLOAN,REG)
 S EVAL=0,SSEXPR=1
 D REGLE^%AV8(GLOROUT,GLOANREG,EVAL,SSEXPR,GLET,GLOANREG)
 G REGLE
 
 
MKPLAN S IPLAN=0,REG=""
MKPL2 S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""  S TXTR=^[QUI]TTL(TRT,2,REG)
 G:$E(TXTR)=":" MKPL2
 S IPLAN=IPLAN+1,@PLAN@(IPLAN)=REG
 I $E(TXTR,1,9)="$ADRESSE(" S ADR=$P($P(TXTR,"$ADRESSE(""",2),""")"),@TABADR@(ADR)=IPLAN
 I $E(TXTR,1,11)="$ETIQUETTE(" S ADR=$P($P(TXTR,"$ETIQUETTE(""",2),""")"),@TABETQ@(ADR)=IPLAN
 G MKPL2
 Q
 
ALLTRT S TRT="" F %T=0:0 S TRT=$O(^[QUI]TTL(TRT)) Q:TRT=""  W *7," ",TRT D ^%AMREXSS(TRT)

