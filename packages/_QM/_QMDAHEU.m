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

;%QMDAHEU^INT^1^59547,73877^0
%QMDAHEU ;
 
 D INTT^%QMDAUTI S TIM=%TIM
TES S HEUR=$P(TIM,":",1),HEUR=$$GETLBLAN^%VTLBLAN(HEUR) S:TIM["P" HEUR=$S(HEUR=12:HEUR,1:HEUR+12) S:(TIM["A")&(HEUR=12) HEUR=0 S MINU=$E($P(TIM,":",2),1,2),HEURE=HEUR_"H"_MINU
FIN K %TIM,HEUR,MINU,TIM Q
 
TEST W !,"Heure a tester : " R TIM Q:TIM=""  D TES^%QMDAK0 W !,HEURE,! G TEST Q
INT S %M=$P($H,",",2)\60,SD=$P($H,",",2)#60
25 S %I=%M\60,H=$S($L(%I)=1:0,1:"")_%I,M=$S($L(%M#60)=1:0,1:"")_(%M#60),SD=$S($L(SD)=1:0,1:"")_SD,HEURE=H_"H"_M_"'"_SD
30 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FORM1(CH,HEUR) 
 N H,M
 S C=$S(CH["H":"H",1:"h")
 S H=$$GETLBLAN^%VTLBLAN($P(CH,C))
 G:H="" ERRF
 G:(H<0)!(H>23) ERRF
 S M=$$GETLBLAN^%VTLBLAN($P(CH,C,2))
 I M="" S M=0 G F1RES
 G:(M<0)!(M>59) ERRF
F1RES S HEUR=$S(H>9:H,1:0_H)_"H"_$S(M>9:M,1:0_M)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FORM2(CH,HEUR) 
 N H,M,S,C
 S C=$S(CH["H":"H",1:"h")
 S H=$$GETLBLAN^%VTLBLAN($P(CH,C))
 G:H="" ERRF
 G:(H<0)!(H>23) ERRF
 S M=$$GETLBLAN^%VTLBLAN($P($P(CH,C,2),"'"))
 I M="" S M=0 G SECO
 G:(M<0)!(M>59) ERRF
SECO S S=$$GETLBLAN^%VTLBLAN($P(CH,"'",2))
 I S="" S S=0 G F2RES
 G:(S<0)!(S>59) ERRF
F2RES S HEUR=$S(H>9:H,1:0_H)_"H"_$S(M>9:M,1:0_M)_"'"_$S(S>9:S,1:0_S)
 Q 1
 
ERRF Q 0
 ;

