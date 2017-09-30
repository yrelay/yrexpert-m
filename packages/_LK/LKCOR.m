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

;LKCOR^INT^1^59547,74867^0
LKCOR ;
 
 
 
 
 
AH(A) N M,I S M="" F I=1:1:$L(A) S M=M_$$ADR^%QZNBA16($A(A,I),16)
 Q M
 
 
 
CH(C) N M,I S M="" F I=1:2:$L(C) S M=M_$C($$ADR^%QZNBA10($E(C,I,I+1),16))
 Q M
 
 
 
A(A,B) N M,I,N K B F I=0:1:$L(A)-1 D TA
 Q
TA S:(I#6)=0 B(I\6)="" S B(I\6)=B(I\6)_$E($A(A,I+1)+1000,2,4) Q
 
 
 
C(C) N M,I S M="",C=C
 F I=1:3:$L(C)-1 S M=M_$C($E(C,I,I+2))
 Q M
 
 
 
PLUS(A,B,C) K @(C) N I S X=$ZP(@A@("")),Y=$ZP(@B@("")),R=0
 F I=1:0 Q:(X="")!(Y="")  D P1
 Q
P1 I X=Y S @C@(X)=@A@(X)+@B@(X),R=$$R(@C@(X)) S:R @C@(X)=@C@(X)-1E19,@C@(X-1)=1 S X=$ZP(@A@(X)),Y=$ZP(@B@(Y)) Q
 I Y<X S @C@(X)=@A@(X),X=$ZP(@A@(X)) Q
 I X<Y S @C@(Y)=@B@(Y),Y=$ZP(@B@(Y)) Q
 Q
R(XX) Q XX'<1E19
 
 
 
TEST S ^A(1)=1,^A(2)=1,^A(6)=1E19-1,^A(7)=1
 S ^B(1)=1,^B(2)=2,^B(3)=1,^B(6)=1E19-1
 D PLUS("^A","^B","^C")
 Q

