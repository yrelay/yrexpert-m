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

;%QWACR1^INT^1^59547,73886^0
QWACR1(REP,IND,NR,DOM) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N VAL,ATRES,NOUV,ERR,GCOMP
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C1"")",DOM)
 
 S $ZT="ERCOND^%QWACR1"
COMP I @(@GCOMP@(NR,"C"))  S $ZT="" G ACT
 
 S $ZT="" Q 0
 
ERCOND S ERR=$ZE,$ZT=""
 I $E(ERR,1,6)="<UNDEF" Q 0
 G COMP
 
ACT S NOUV=1
 S ATRES=""
ACT2 S ATRES=$O(@GCOMP@(NR,"R",ATRES)) G:ATRES="" FACT
 I @GCOMP@(NR,"S"),$$EXIRIAO^%QWSTOL(REP,IND,ATRES,1) G ACT2
 S $ZT="ERACT^%QWACR1"
ACT21 S @("VAL="_@GCOMP@(NR,"R",ATRES,"E"))
 S $ZT=""
 I $$AFFECT^%QWSTOE(1,NR,NOUV,REP,IND,ATRES,1,VAL) S NOUV=0
 G ACT2
FACT Q 1-NOUV
 
ERACT 
 S CODERR=$ZE,$ZT=""
 I $E(CODERR,1,6)="<UNDEF" G ACT2
 G ACT21

