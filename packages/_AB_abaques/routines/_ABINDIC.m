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

;%ABINDIC^INT^1^59547,73864^0
%ABINDIC(XDP,LID) 
 
 S %XI=2,XDP="("_XDP_")" K E1XP,E1XPVU S E1XP(1)=XDP,E1XC=-1
L S E1XC=$N(E1XP(E1XC)) G:E1XC=-1 FL S E1X=E1XP(E1XC) G:E1X'["(" FL S E1X="("_E1X_")"
 K T1,T1I,LOCB,P1O,P1F,A1P S NU=0,IY=1
 F Z1=1:1 S CC=$E(E1X,Z1) Q:CC=""  I (CC="(")!(CC=")") S LOCB(IY)=Z1,T1(LOCB(IY))=CC,NU=$S(CC="(":NU+1,1:NU-1) S:CC="(" P1O(Z1)=1,T1I(NU,Z1)=1 S:CC=")" P1F(Z1)=1 S IY=IY+1
 S P1O=$ZP(T1I("")),P1O=$O(T1I(P1O,"")),P1F=$O(P1F(P1O)),E1XR=$E(E1X,P1O+1,P1F-1),E1XP(%XI)=$E(E1X,2,P1O-1)_"%"_%XI_$E(E1X,P1F+1,$L(E1X)-1)
 S XDP="("_E1XR_")",E1XPVU("%"_%XI)=XDP
 S %XI=%XI+1 G L
FL S E1XT=E1XPVU("%"_(%XI-1)),E1XT=$E(E1XT,2,$L(E1XT)-1) K @(LID) F %U=1:1 S T1I=$P(E1XT,"~",%U) Q:T1I=""  S @LID@(%U)=$S($D(E1XPVU(T1I)):$E(E1XPVU(T1I),2,$L(E1XPVU(T1I))-1),1:T1I)
 S @LID=%U-2 K XDP,E1XP,E1XPVU,E1XC,T1,T1I,LOCB,P1O,P1F,A1P Q
TEST W !,$$^%QZCHW("A tester : ") R E1X Q:$A(E1X)<32  D ^%ABINDIC(E1X,"IND") F %U=1:1 Q:'($D(IND(%U)))  W !,?10,"==> ",IND(%U)
 G TEST

