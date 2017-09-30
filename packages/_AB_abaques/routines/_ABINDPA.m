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

;%ABINDPA^INT^1^59547,73864^0
ABINDPA(XDP,PDX) 
 
 S %XI=2 K EXP,EXPVU S NUI=1,EXP(1)=XDP,EXC=-1
L S EXC=$N(EXP(EXC)) G:EXC=-1 FL S EX=EXP(EXC) I EX'["(" D GET(EX) G FL
 
 K T,TI,LOCA,PO,PF,AP S NU=0,IY=1
 F Z1=1:1 S CC=$E(EX,Z1) Q:CC=""  I (CC="(")!(CC=")") S LOCA(IY)=Z1,T(LOCA(IY))=CC,NU=$S(CC="(":NU+1,1:NU-1) S:CC="(" PO(Z1)=1,TI(NU,Z1)=1 S:CC=")" PF(Z1)=1 S IY=IY+1
 S PO=$ZP(TI("")),PO=$O(TI(PO,"")),PF=$O(PF(PO)),EXR=$E(EX,PO+1,PF-1),EXP(%XI)=$E(EX,1,PO-1)_"%"_%XI_$E(EX,PF+1,$L(EX)) D GET(EXR,.RXE) S EXPVU("%"_%XI)=RXE
 S %XI=%XI+1 G L
FL S %LSEP="()~",XDP=EX,ADRG=$$^%QZCHW("FIN"),ADRF="TR^%ABINDPA"
FLS D ^%ABVSQUL I EX["%" S XDP=EX G FLS
FLF S PDX=EX K RXE,NUI,XDP,EXP,EXPVU,EXC,T,TI,LOCA,PO,PF,AP Q
TR S VPOL(VI)=$S(VI=1:PCH,1:"("_$S(PCH'["%":PCH,1:EXPVU(PCH))_")") Q
 
GET(XX,YY) 
 
 S YY=$P(XX,"~",1) F %U=2:1 S ID=$P(XX,"~",%U) Q:ID=""  S YY=YY_"~"_$S(ID["%":"",1:"(")_ID_$S(ID["%":"",1:")")
 Q
 
TEST W !,$$^%QZCHW("A tester : ") R EX Q:$A(EX)<32  D ^%ABINDPA(EX,.RES) W !,?10,"==> ",RES
 G TEST

