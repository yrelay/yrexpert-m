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

;TKMENU1^INT^1^59547,74869^0
TKMENU1 ;
 
 
PW S PWD=$P(X,"\",3),%R=23,%C=1
P0 W @(TKP),TK("CS"),TK("HI"),$P(X,"\"),TK("LO"),$$^%QZCHW(" Password > "),TK("HI"),TK("CL") S PW="",L=0
P1 X ^TK("ECHO-OFF") R PW#$L(PWD) X ^TK("ECHO-ON") G ^TKMENU:PW="" I PW="?" W $$^%QZCHW("  Enter the password assigned to this option.") H 2 G P1
 G NEXT^TKMENU:PW=PWD W $$^%QZCHW("  Incorrect password.  Please retry."),*7 H 2 G P0
 
CODE S %R=18,%C=33 W @(TKP),TK("HI"),$$^%QZCHW("Enter User Code") S %R=20 W @(TKP),TK("LO")," ****     ****" S %C=40 W @(TKP) X ^TK("ECHO-OFF") S A="" F I=1:1:6 R B#1:50 Q:B=""  S:B?1L B=$C($A(B)-32) S A=A_B I A?1.NPA,$D(^TKMENU("CODE",A)) S ZID(0)=^(A) G CODEX
 S %R=20,%C=31 W @(TKP),$$^%QZCHW("INCORRECT USER CODE   ") H 2 W TK("F") H
CODEX Q
 
LCL S I=$P(^TKMENU(1),"\",5) G:I="" SELECT^TKMENU R X#$L(I):30
 I X?.E1L.E F L=1:1:$L(X) S:$E(X,L)?1L X=$E(X,1,L-1)_$C($A(X,L)-32)_$E(X,L+1,99)
 G:I'=X SELECT^TKMENU X ^TK("ECHO-ON") W TK("F"),TK("HI"),$$^%QZCHW("PROGRAMMER MODE") Q
 ;

