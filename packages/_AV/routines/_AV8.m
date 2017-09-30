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

;%AV8^INT^1^59547,73867^0
%AV8 ;;10:31 AM  4 Nov 1993;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REGLE(GLOROUT,GLOREG,EVAL,EXPR,GEVAL,GEXPR) 
 N ENSPOLO,DEJAEXP
 N III,ENSPOLO,TABTXT
 I EVAL=2 S SSEVAL=$$CONCAS^%QZCHAD(GEVAL,"C"),@SSEVAL=0
 S DEROUT=0
 S DEJAEXP=$$TEMP^%SGUTIL
 S TABTXT=$$TEMP^%SGUTIL
 S ENSPOLO=$$CONCAS^%QZCHAD(GLOREG,"POLC")
 I EXPR S SSEXPR=$$CONCAS^%QZCHAD(GEXPR,"EXPC") K @(SSEXPR) S @SSEXPR=0
 G:$D(@ENSPOLO)<10 ACTI
 S @DEJAEXP@(0,"VV")=$C(1),@DEJAEXP@(0,"RR")=""
 S III=0
BCC S III=III+1 G:'($D(@ENSPOLO@(III))) BCCF
 
 D UNEXP^%AV8D($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR,.TXT)
 Q:DEROUT
 S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR,@DEJAEXP@(III,"TXT")=TXT
 G BCC
BCCF K @(DEJAEXP)
 
 I EVAL G:'(VV) FREG
ACTI S ENSPOLO=$$CONCAS^%QZCHAD(GLOREG,"POLA")
 I EVAL=2 S SSEVAL=$$CONCAS^%QZCHAD(GEVAL,"A"),@SSEVAL=0
 I EXPR S SSEXPR=$$CONCAS^%QZCHAD(GEXPR,"EXPA") K @(SSEXPR) S @SSEXPR=0
 S @DEJAEXP@(0,"VV")=1,@DEJAEXP@(0,"RR")=""
 S III=0
BCA S III=III+1 G:'($D(@ENSPOLO@(III))) BCAF
 
 D UNEXP^%AV8D($$CONCAT^%QZCHAD(ENSPOLO,III),.VV,.RR,.TXT)
 Q:DEROUT
 S @DEJAEXP@(III,"VV")=VV,@DEJAEXP@(III,"RR")=RR,@DEJAEXP@(III,"TXT")=TXT
 G BCA
BCAF 
 K @(DEJAEXP)
FREG Q
 
 
 
AJEXPR(TXT,TYPE) S @SSEXPR=@SSEXPR+1,@SSEXPR@(@SSEXPR)=TXT,@SSEXPR@(@SSEXPR,"TYPE")=TYPE Q
 
AJEVAL(DESC,VAL) S @SSEVAL=@SSEVAL+1,@SSEVAL@(@SSEVAL)=DESC,@SSEVAL@(@SSEVAL,"VAL")=VAL Q
 ;
 ;
 ;

