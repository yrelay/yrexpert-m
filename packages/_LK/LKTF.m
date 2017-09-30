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

;LKTF^INT^1^59547,74867^0
ZGLOCOP(S,D) D COP(S,"",D) W *
COP(S,N,D) N I,AD,ADD,S1
 S S1=$$CONCAT(S,N)
 S AD=$Q(@S1),ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1))
 F I=1:0 Q:AD'[$E(S,1,$L(S)-1)  S @ADD=@AD W !,ADD," ",AD," ",@(AD) S ADD=$$CONCAT(D,$E(AD,$L(S)+1,$L(AD)-1)),AD=$Q(@AD)
 I ($D(@S)#10)=1 S @D=@S
 Q
TEST D COP("^TX(1,""ARC1"")","","^TATA(3)") Q
TEST1 D COP("^TX","","^TATA(3)") Q
TEST2 D COP("^TX","1","^TATA(3)") Q
CONCAT(R,P) I P="" S P=""""""
 I $E(P)="(" S P=$E(P,2,$L(P))
 I R["(" S R=$E(R,1,$L(R)-1)_"," Q R_P_")"
 S P="("_P Q R_P_")"
 
TEST3 W $$CONCAT("^TX","")
 W $$CONCAT("^TX(1)","")
 W $$CONCAT("^TX(1)","1,2")
 Q

