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

;LKTXREV1^INT^1^59547,74868^0
LKTXREV1 W *
 
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;|"A3"||
 ;;
 
 
REV1 ;;|"LKZPAR"|PARREV1^LKTXREV1|
 ;;|"LKEX"|EXREV1^LKTXREV1|
 ;;
PARREV1 ;;|EDGE|EDGE1^LKTXREV1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A,B,TAB
 S TAB="___"
 
 I $E(X,1,1)="A" S @LOCAL@("OP")=0 D EDGF(NIV,1) Q 1-NIV
 S A=$P(X,TAB,1),B=$P(X,TAB,2)
 
 I (A'="")&(B'=""),$$EDG1 D EDGF(NIV,2) Q 2-NIV
 
 I $D(@LOCAL@("OP")),@LOCAL@("OP")=1 Q 3-NIV
 
 I X'="" Q 4-NIV
 Q 0-NIV
EDG1() N A1,B1,N
 S A1=A+0,B1=B+0
 I ('($$ENTP^%QZNBN(A1)))&('($$ENTP^%QZNBN(B1))) Q 0
 
 S A=$P($P(X,"___",3),":",1)
 S A=$$ADR^%QZCHBT(A)
 I A="" Q 0
 
 S @LOCAL@("OP")=1
 Q 1
 
 
EDGF(NIV,NIV1) 
 I NIV'=NIV1,LOCAL'="" K @LOCAL@("ORDRE",NIV1)
 Q
 
EXREV1 ;;|1,0,"%G","T",1|CST^LKEXZ("***GAMME***")|
 ;;|1,0,"NOM","T",1|EXTR^LKEXZ(1,20)|
 ;;|1,0,"NOM","T",2|ALPHA|
 ;;|1,0,"NOM","T",3|CHBKPT^LKEXZ|
 ;;|2,0,"%O","T",1|CST^LKEXZ("***OPERATION***")|
 ;;|2,0,"NOM","T",1|EXTR^LKEXZ(1,999)| ;ligne operation
 ;;|2,0,"NOM","T",2|PARTIE^LKEXZ("___",3,3)|
 ;;|2,0,"NOM","T",3|PARTIE^LKEXZ(":",1,1)|
 ;;|2,0,"NOM","T",4|ALPHA|
 ;;|2,0,"NOM","T",5|CHBKPT^LKEXZ|
 ;;|2,0,"NUMERO.OPERATION","T",1|EXTR^LKEXZ(1,999)|
 ;;|2,0,"NUMERO.OPERATION","T",2|PARTIE^LKEXZ("___",2,2)|
 ;;|2,0,"NUMERO.OPERATION","T",3|SUBST^LKEXZ("___","")|
 ;;|2,0,"NUMERO.OPERATION","T",4|CHBKPT^LKEXZ|
 ;;|2,0,"CEL","T",1|EXTR^LKEXZ(1,999)|
 ;;|2,0,"CEL","T",2|PARTIE^LKEXZ("___",1,1)|
 ;;|2,0,"CEL","T",3|SUBST^LKEXZ("___","")|
 ;;|2,0,"CEL","T",4|CHBKPT^LKEXZ|
 ;;|2,0,"COMMENTAIRE","T",1|EXTR^LKEXZ(1,999)|
 ;;|2,0,"COMMENTAIRE","T",2|PARTIE^LKEXZ("___",4,99)|
 ;;|2,0,"COMMENTAIRE","T",3|SUBST^LKEXZ("___","")|
 ;;|2,0,"COMMENTAIRE","T",4|ALPHA|
 ;;|2,0,"COMMENTAIRE","T",5|NEXTOR^LKEXZ(2)|
 ;;|3,0,"COMMENTAIRE","T",1|EXTR^LKEXZ(1,999)| ;ligne suite d'une
 ;;|3,0,"COMMENTAIRE","T",2|PARTIE^LKEXZ("___",2,99)| ;operation
 ;;|3,0,"COMMENTAIRE","T",3|SUBST^LKEXZ("___","")|
 ;;|3,0,"COMMENTAIRE","T",4|ALPHA|
 ;;|3,0,"COMMENTAIRE","T",5|NEXTOR^LKEXZ(2)|
 ;;|4,0,"COMMENTAIRE","T",1|EXTR^LKEXZ(1,999)| ;ligne suite d'une
 ;;|4,0,"COMMENTAIRE","T",3|SUBST^LKEXZ("___","")| ;gamme
 ;;|4,0,"COMMENTAIRE","T",4|ALPHA|
 ;;|4,0,"COMMENTAIRE","T",5|NEXTOR^LKEXZ(1)|
 ;;
 
 
REV2 ;;|"LKZPAR"|PARREV2^LKTXREV1|
 ;;|"TABATT"|EXREV1^LKTXREV1|
 ;;|"TABLEL","VT"|VT2^LKTXREV1|
 ;;|"TABLEL","REP"|REP^LKTXREV1|
 ;;
 
VT2 ;;|"ENT"|REVIMA|
 ;;
 
REP ;;|"GAMME"|GAMME.SHOP|
 ;;|"OPERATION"|OP.SHOP|
 ;;|"ARTICLE"|SHOP|
 ;;|"AG"|GAMME.INSPECTION|
 ;;|"GO"|OPERATION.INSPECTION|
 ;;
PARREV2 ;;|EDGE|EDGERQ^LKTXREV1|
 ;;|LAST|LASTRQ^LKTXREV1|
 ;;|MODE|NOINC |
 ;;
 
EDGERQ(NIV,X,Y) 
 I X="%G" Q 1-NIV
 I X="%O" Q 2-NIV
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I Y="%G" Q -1
 I Y="%O" Q -1
 Q 0

