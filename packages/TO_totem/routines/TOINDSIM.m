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

;TOINDSIM^INT^1^59547,74872^0
TOINDSIM(XDP,LID) 
 
 S %XI=2 K @(LID),EXP,EXPVU S NUI=1,EXP(1)=XDP,EXC=-1
L S EXC=$N(EXP(EXC)) G:EXC=-1 FL S EX=EXP(EXC) I EX'["(" D GET(EX) G FL
 
 K T,TI,LOCA,PO,PF,AP S NU=0,IY=1
 F Z1=1:1 S CC=$E(EX,Z1) Q:CC=""  I (CC="(")!(CC=")") S LOCA(IY)=Z1,T(LOCA(IY))=CC,NU=$S(CC="(":NU+1,1:NU-1) S:CC="(" PO(Z1)=1,TI(NU,Z1)=1 S:CC=")" PF(Z1)=1 S IY=IY+1
 S PO=$ZP(TI("")),PO=$O(TI(PO,"")),PF=$O(PF(PO)),EXR=$E(EX,PO+1,PF-1),EXP(%XI)=$E(EX,1,PO-1)_"%"_%XI_$E(EX,PF+1,$L(EX)) D GET(EXR)
 S %XI=%XI+1 G L
FL K NUI,XDP,EXP,EXPVU,EXC,T,TI,LOCA,PO,PF,AP Q
 
GET(XX) 
 
 F %U=2:1 S ID=$P(XX,"~",%U) Q:ID=""  I ID'["%" S @LID@(ID)=1
 Q
 
TEST W !,$$^%QZCHW("A tester : ") R EX Q:$A(EX)<32
 D ^TOINDSIM(EX,"IND")
 S ID=-1 F %U=1:1 S ID=$N(IND(ID)) Q:ID=-1  W !,?10,"==> ",ID
 G TEST

