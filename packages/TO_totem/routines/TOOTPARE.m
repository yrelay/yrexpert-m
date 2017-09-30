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

;TOOTPARE^INT^1^59547,74873^0
TOOTPARE ;
 
 K TOP S $ZT="ERR",TOP("%5ERR")=0 K ^PAROUV($I),^PARFER($I),^PARCOUP($I) S REFUSE=0,TOP("%5L")=$L(EXP),^PARFER($I)=0,^PAROUV($I)=0
 F TOP("%5PAR")="(",")" S TOP("%5POS")=1,TOP("%5TB")=$S(TOP("%5PAR")="(":"^PAROUV($I)",1:"^PARFER($I)"),TOP("%5CP")=1 D P1
 G P2
P1 F TOP("%5Z")=1:1 S TOP("%5POS")=$F(EXP,TOP("%5PAR"),TOP("%5POS")) Q:TOP("%5POS")=0  S @TOP("%5TB")=TOP("%5CP"),TOP("%5CP")=TOP("%5CP")+1,@TOP("%5TB")@(TOP("%5POS")-1)=1
 Q
P2 I ^PARFER($I)'=^PAROUV($I) S REFUSE=2 G FIN
 G:^PAROUV($I)=0 FIN
T0 S TOP("%5PF")=$O(^PARFER($I,"")) G:TOP("%5PF")="" T1 S (TOP("%5POP"),TOP("%5POC"))="",TOP("%5ST")=0
 F TOP("%5Z")=1:1 S TOP("%5POC")=$O(^PAROUV($I,TOP("%5POC"))) Q:TOP("%5POC")=""  D T2 G:TOP("%5ERR")=1 FIN G:TOP("%5ST")=1 T0
 D T4 G:TOP("%5ERR")=1 FIN G T0
T2 I TOP("%5POC")'>TOP("%5PF") G T3
T4 S ^PARCOUP($I,TOP("%5POP"))=TOP("%5PF") K ^PAROUV($I,TOP("%5POP")),^PARFER($I,TOP("%5PF")) S TOP("%5ST")=1 G END
T3 S TOP("%5POP")=TOP("%5POC") G END
T1 S TOP("%5TR")=0 I $D(^PARCOUP($I,1)),^PARCOUP($I,1)=TOP("%5L") S TOP("%5TR")=1
 K ^PAROUV($I) S (TOP("%5POC"),TOP("%5POP"),TOP("%5PFP"))="" F TOP("%5Z")=1:1 S TOP("%5POC")=$O(^PARCOUP($I,TOP("%5POC"))) Q:TOP("%5POC")=""  D T5 G:TOP("%5ERR")=1 FIN
 S TOP("%5EXP")="",TOP("%5C")=0,TOP("%5IO")="" F TOP("%5Z")=1:1 S TOP("%5IO")=$O(^PAROUV($I,TOP("%5IO"))) Q:TOP("%5IO")=""  S TOP("%5EXP")=TOP("%5EXP")_$E(EXP,TOP("%5C"),TOP("%5IO")-1),TOP("%5C")=TOP("%5IO")+1
 S TOP("%5EXP")=TOP("%5EXP")_$E(EXP,TOP("%5C"),599),EXP=TOP("%5EXP") I TOP("%5TR")=1 S EXP=$E(EXP,2,$L(EXP)-1)
FIN K TOP S $ZT="" G END
ERR S REFUSE=2,TOP("%5ERR")=1 G FIN
T5 S TOP("%5PFC")=^PARCOUP($I,TOP("%5POC")),TOP("%5IO")=TOP("%5POC")-1,TOP("%5IF")=TOP("%5PFC")+1 I (TOP("%5POP")=TOP("%5IO"))&(TOP("%5PFP")=TOP("%5IF")) S ^PAROUV($I,TOP("%5POP"))=1,^PAROUV($I,TOP("%5PFP"))=1
 S TOP("%5POP")=TOP("%5POC"),TOP("%5PFP")=TOP("%5PFC") G END
END Q
 
TEST W !,$$^%QZCHW("A tester : ") R EXP Q:EXP=""
 D ^TOOTPARE W !,?10,"==> ",EXP G TEST

