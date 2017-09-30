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

;%QWSER1^INT^1^59547,73886^0
QWSER1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
SELEC(REP,IND,DOM,TABSEL) 
 N REG,ATRES,GCR
 Q:'($$EXIRI^%QWSTOL(REP,IND))
 S GCR=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C1"")",DOM)
 Q:'($D(@GCR))
 S REG=""
NXTRG2 S REG=$O(@GCR@(REG)) Q:REG=""
 I (@GCR@(REG,"P")="*")!$$EXIRIAO^%QWSTOL(REP,IND,@GCR@(REG,"P"),1) G STSL2
 G NXTRG2
 
STSL2 I @GCR@(REG,"S")=0 G OKREG2
 S ATRES=""
AX2 S ATRES=$O(@GCR@(REG,"R",ATRES)) G:ATRES="" NXTRG2
 I '($$EXIRIAO^%QWSTOL(REP,IND,ATRES,1)) G OKREG2
 G AX2
 
OKREG2 
 S:'($D(^[QUI]RQSDON("QW","REM",1,DOM,REG))) ^[QUI]RQSDON("QW","REM",1,DOM,REG)=2E-1,^[QUI]RQSDON("QW","REM",1,DOM,REG,"BONUS")=80,^[QUI]RQSDON("QW","REM",1,DOM,REG,"MALUS")=20
 S @TABSEL@(1,DOM,REG)=""
 G NXTRG2

