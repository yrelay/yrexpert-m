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

;%QZCHEXP^INT^1^59547,73887^0
ZEXPMPS(%EXP,%ID,%TB) 
 N %U,%V,%W,ID,%NU,NU,EXP,OK K @(%TB),^PIL($J) S %NU=1,^PIL($J,%NU)=%EXP,^PIL($J,%NU,1)=%ID,%NU=%NU+1,NU=""
LNU S NU=$O(^PIL($J,NU)) G:NU="" FNU S EXP=^PIL($J,NU),ID=^PIL($J,NU,1)
 F %U=1:1 S %V=$E(EXP,%U) Q:%V=""  S %W=$A(%V),OK=$S(%W<48:1,(%W>57)&(%W<65):1,(%W>90)&(%W<97):1,%W>122:1,1:0) G DET:OK
 S @%TB@(EXP)=ID G LNU
DET F %U=1:1 S %W=$P(EXP,%V,%U) Q:%W=""  S ^PIL($J,%NU)=%W,^PIL($J,%NU,1)="$P("_ID_","""_%V_""","_%U_")",%NU=%NU+1
 G LNU
FNU Q
 
TEST K TB W !,"EXP : " R %EXP Q:$A(%EXP)<32  D ZEXPMPS(%EXP,"I","TB")
 S %U="" F %V=1:1 S %U=$O(TB(%U)) Q:%U=""  W !,%U,?20,TB(%U)
 G TEST

