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

;TKSA3^INT^1^59547,74869^0
TKSA3 ;
 
BEG S %C=13,L=TK("RT") W TK("F"),TK("LO"),TK("RON") F %R=2,3,4 W @(TKP) F I=1:1:14 S J=$E("PG&A TOOLKIT-I",I) W:%R=3 $S(J=" ":L_L_L,1:" "_J_" "),L W:%R'=3 $S(J=" ":L_L_L,1:"   "),L
 W TK("ROF"),!
 S L=0 F %C=16:13:57 G:L=K END S %R=18 D CUBE S L=L+1 D TITLE
 F %C=23:13:49 G:L=K END S %R=13 D CUBE S L=L+1 D TITLE
 F %C=30 G:L=K END S %R=8 D CUBE S L=L+1 D TITLE
 G END
CUBE S SR=%R,SC=%C W @(TKP),TK("HI"),TK("TLC") F I=1:1:12 W TK("HL")
 W TK("TRC") F %C=SC,SC+13 F %R=SR+1:1:SR+3 W @(TKP),TK("VL")
 S %R=%R+1,%C=SC W @(TKP),TK("BLC") F I=1:1:12 W TK("HL")
 W TK("BRC"),TK("LO") S %R=SR-2,%C=SC+3 W @(TKP) F I=1:1:12 W TK("HL")
 W TK("TRC") S %C=SC+15 F %R=SR-1:1:SR+1 W @(TKP),TK("VL")
 F I=1:1:4 S A=$P("-1,1\-1,14\3,14\2,15","\",I),%R=A+SR,%C=$P(A,",",2)+SC W @(TKP),"/"
 Q
 
END S %R=24,%C=60 W @(TKP),TK("LO"),$$^%QZCHW("Press RETURN ") R B Q
TITLE S A=$P($T(DATA+L),";",2,255),%C=SC+1 W TK("HI") W:L=K TK("RON") F %R=SR+1:1:SR+3 S B=$P(A,"\",%R-SR),B=B_$J("",((-($L(B)))\2)+6) W @(TKP),$J(B,12)
 W TK("ROF"),TK("LO") Q
DATA 
 ;
 ;
 ;
 ;
 ;
 ;

