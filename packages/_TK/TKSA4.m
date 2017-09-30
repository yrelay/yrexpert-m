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

;TKSA4^INT^1^59547,74869^0
TKSA4 ;
 
 
A S K=4 D ^TKSA3 W TK("F") S %C=13,L=TK("RT") W TK("F"),TK("LO"),TK("RON") F %R=2,3,4 W @(TKP) F I=1:1:4 S J=$E("TKPC",I) W:%R=3 $S(J=" ":L_L_L,1:" "_J_" "),L W:%R'=3 $S(J=" ":L_L_L,1:"   "),L
 S %R=3,%C=32 W TK("ROF"),@(TKP),"POP-UP" S %R=4,%C=30 W @(TKP),"CALCULATOR"
 S J=0 D TEXT X ^TKPC W TK("F") S K=5 D ^TKSA3 X ^TK("TERM-ON") D ^TKSA5 X ^TK("TERM-OFF") S K=6 D ^TKSA3
B W TK("F") S %C=25,L=TK("RT") W TK("F"),TK("LO"),TK("RON") F %R=2,3,4 W @(TKP) F I=1:1:6 S J=$E("TKNOTE",I) W:%R=3 $S(J=" ":L_L_L,1:" "_J_" "),L W:%R'=3 $S(J=" ":L_L_L,1:"   "),L
 S %R=3,%C=50 W TK("ROF"),@(TKP),$$^%QZCHW("POP-UP NOTEPAD")
 S J=19 D TEXT D:$D(^TKNOTE)=0 SETUP^TKNOTE X ^TKNOTE
 W TK("HI"),TK("F"),$$^%QZCHW("END OF SAMPLER OF TOOL-KIT I"),! F TK(1)=TK(1):-1:0 X ^TK("TERM-OFF")
 Q
 
TEXT S %C=2,%R=5 F I=2:1:20 S %R=%R+1 W @(TKP),$P($T(TEXT+I+J),";",2,9)
 Q
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;

