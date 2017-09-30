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

;%QCAGLC2^INT^1^59547,73875^0
%QCAGLC2(S,D) ;;02:38 PM  4 Sep 1996
 
 
 
 D COP(S,"",D,0) Q
COP(S,N,D,V) N I,AD,ADD,S1,B,C,DIR
 S S1=$$CONCAT(S,N),DIR="^" S:$E(S,2,2)="[" DIR=$P(S,"]",1)_"]"
 S:DIR[":" DIR=$P(S,"]",1,2)_"]"
 ;; cao debug ^%Q
 S AD=DIR_$E($$^%Q($Q(@S1)),2,600),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 F I=1:0 Q:AD'[$E(S,1,$L(S)-1)  S @ADD=@AD W:V !,ADD,?40,@(ADD)," <-- ",?50,AD,?90,@(AD) S AD=DIR_$E($$^%Q($Q(@AD)),2,600),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 I ($D(@S)#10)=1 S @D=@S
 Q
 
COP1 S @ADD=@AD W:V !,ADD,?40,@(ADD)," <-- ",?50,AD,?90,@(AD) S AD=DIR_$E($$^%Q($Q(@AD)),2,600),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 S @ADD=@AD W:V !,ADD,?40,@(ADD)," <-- ",?50,AD,?90,@(AD)
 S AD=DIR_$E($$^%Q($Q(@AD)),2,600)
 S C=$E(AD,$L(S)+1,$L(AD)-1)
 S ADD=$$CONCAT(D,C)
 S B=$E(S,1,$L(S)-1)
 Q
TEST N CTR,S
 W "exemple :",!,"^glo(1,2)--->^[x]glu(""aa"")",!
 D MES^%VLECFL("","a copier : ",.CTR,.S)
 Q:(S="")!(CTR'="")
 D MES^%VLECFL(""," dans : ",.CTR,.D)
 Q:(D="")!(CTR'="")
 D ^%QCAGLC1(S,D)
 Q
 
TEST0 K ^TATA D COP("^TX(1,""ARC1"")","","^TATA(3)",1) Q
TEST1 K ^TATA D COP("^TX","","^TATA(3)",1) Q
TEST2 K ^TATA D COP("^TX","1","^TATA(3)",1) Q
TEST3 K ^TATA D COP("^[""DUB1:[EXPLOIT]""]TX(1,""ARC1"")","","^TATA(3)",1) Q
TEST4 K ^TATA X ^EXP D COP("^[QUI]TX(1,""ARC1"")","","^TATA(3)",1) Q
CONCAT(R,P) I P="" S P=""""""
 I $E(P)="(" S P=$E(P,2,$L(P))
 I R["(" S R=$E(R,1,$L(R)-1)_"," Q R_P_")"
 S P="("_P Q R_P_")"
 
 W $$CONCAT("^TX","")
 W $$CONCAT("^TX(1)","")
 W $$CONCAT("^TX(1)","1,2")
 Q

