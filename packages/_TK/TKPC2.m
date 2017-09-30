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

;TKPC2^INT^1^59547,74869^0
TKPC2 ;
 
SETUP F I=2:1 S A=$T(SETUP+I) Q:A=""  S ^TKPC($P(A," "))=$P(A," ",2,99)
 Q
MODE S TKREF=1 X ^TKPC("M1"),^TKPC("M2"),^("M3") W TK("LO") X ^("FACE") W TK("HI"),TKK S TKJ=$S(TK2:"$J(TKA,12,2)",1:"$J(TKA,12)")
M3 S %R=TKSR+5,%C=TKSC+14 F I=1:1:2 S A="TK"_I,%R=%R+1 F J=@A:1 W @(TK("P")),$S(J#2:"ON ",1:"OFF") R B#1 Q:B=""  S @A=(J+1)#2
M1 S %R=TKSR+4,%C=TKSC+2 W @(TK("P")),"TKPC OPTIONS" S %R=%R+1 F I=1:1:5 S %R=%R+1,J=$P($$^%QZCHW("Display,Fixed Dec.,"),",",I) W @(TK("P")),J,$J("",16-$L(J))
M2 S %R=TKSR+5,%C=TKSC+14 F I=1:1:2 S %R=%R+1 W @(TK("P")),$S(@("TK"_I):"ON ",1:"OFF")
HELP S (TKPR,TKPC,TKRE,%C)=1,%R=0 F I=1:1:24 S %R=%R+1,J=$P(^("H"_I),";",2,9) W @(TK("P")),J,$J("",(((I<12)*25)+54)-$L(J)) I I=24 W TKK Q
H1 
H2 
H3 
H4 
H5 
H6 
H7 
H8 
H9 
H10 
H11 
H12 
H13 
H14 
H15 
H16 
H17 
H18 
H19 
H20 
H21 
H22 
H23 
H24 
HELPFR S (TKPR,TKPC,TKRE,%C)=1,%R=0 F I=1:1:24 S %R=%R+1,J=$P(^("HFR"_I),";",2,9) W @(TK("P")),J,$J("",(((I<12)*25)+54)-$L(J)) I I=24 W TKK Q
HFR1 
HFR2 
HFR3 
HFR4 
HFR5 
HFR6 
HFR7 
HFR8 
HFR9 
HFR10 
HFR11 
HFR12 
HFR13 
HFR14 
HFR15 
HFR16 
HFR17 
HFR18 
HFR19 
HFR20 
HFR21 
HFR22 
HFR23 
HFR24 

