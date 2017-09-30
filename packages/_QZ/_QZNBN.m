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

;%QZNBN^INT^1^59547,73887^0
ZNUME ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ENTP(CH) 
 N SIG,TEST
 Q:CH="" 0
 Q:CH="+" 0
 Q:CH="-" 0
 S SIG=$S($E(CH,1)="-":"-",$E(CH,1)="+":"+",1:"")
 I SIG="-" Q 0
 I SIG="+" S CH=$E(CH,2,500)
 S TEST=CH?.N Q TEST
 
ENT(CH) 
 N SIG
 Q:CH="" 0
 Q:CH="+" 0
 Q:CH="-" 0
 S SIG=$S($E(CH,1)="-":"-",$E(CH,1)="+":"+",1:"")
 I SIG="" Q $$ENTP(CH)
 S CH=$E(CH,2,500)
 Q $$ENTP(CH)
 
NUM(CH) 
 N SIG,TESTF,TESTP,ENT,FRAC,PUI
 Q:CH="" 0
 Q:CH="+" 0
 Q:CH="-" 0
 S SIG=$S($E(CH,1)="-":"-",$E(CH,1)="+":"+",1:"")
 S CH=$S(SIG="":CH,1:$E(CH,2,500))
 S TESTP=CH["E",TESTF=CH["."
 I ('(TESTP))&('(TESTF)) Q $$ENTP(CH)
 I '(TESTP) G FRAC
PUI S PUI=$P(CH,"E",2)
 S CH=$P(CH,"E",1)
 Q:'($$ENT(PUI)) 0
FRAC S FRAC=$P(CH,".",2)
 S ENT=$P(CH,".",1)
 I ENT'="" Q:'($$ENTP(ENT)) 0
 Q:FRAC="" ENT'=""
 Q:$E(FRAC,1)="+" 0
 Q $$ENTP(FRAC)
 
POS(CH) 
 Q:'($$NUM(CH)) 0
 Q CH>0
 
POSN(CH) 
 Q:'($$NUM(CH)) 0
 Q CH'<0
 
ALPH(CH) 
 Q:CH="" 0
 Q $E(CH,1)?1U
 
MOD(A,B) 
 N RES
 S RES=A#B
 Q $S(RES:RES,1:B)
 
ANG(CH) 
 Q:'($$NUM(CH)) 0
 Q (CH'<0)&(CH'>360)

