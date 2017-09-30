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

;LKST1^INT^1^59547,74867^0
LKST1 ;
 
TRCOD ;;|"00"|.|
 ;;|"40"| |
 ;;|"C1"|A|
 ;;|"C2"|B|
 ;;|"C3"|C|
 ;;|"C4"|D|
 ;;|"C5"|E|
 ;;|"C6"|F|
 ;;|"C7"|G|
 ;;|"C8"|H|
 ;;|"C9"|I|
 ;;|"D1"|J|
 ;;|"D2"|K|
 ;;|"D3"|L|
 ;;|"D4"|M|
 ;;|"D5"|N|
 ;;|"D6"|O|
 ;;|"D7"|P|
 ;;|"D8"|Q|
 ;;|"D9"|R|
 ;;|"E2"|S|
 ;;|"E3"|T|
 ;;|"E4"|U|
 ;;|"E5"|V|
 ;;|"E6"|W|
 ;;|"E7"|X|
 ;;|"E8"|Y|
 ;;|"E9"|Z|
 ;;|"F0"|0|
 ;;|"F1"|1|
 ;;|"F2"|2|
 ;;|"F3"|3|
 ;;|"F4"|4|
 ;;|"F5"|5|
 ;;|"F6"|6|
 ;;|"F7"|7|
 ;;|"F8"|8|
 ;;|"F9"|9|
 ;;
HDR ;;|"HDR"|0|
 ;;
VT ;;|"VT"||
 ;;
PAR ;;|EDGE|EDGE^LKST1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE(NIV,X,Y) 
 N A
 S A=$L(X)
 
 I X["Block number 6" S @LOCAL@("HEADER","HDR")=1
 
 
 I X["***  End of file  ***" S @LOCAL@("HEADER","HDR")=0
 I A<58 Q 0-NIV
 I '(@LOCAL@("HEADER","HDR")) Q 0-NIV
 Q 1-NIV
 
 
 
PAR1 ;;|EDGE|EDGE1^LKST1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A
 S A=$L(X)
 
 
 S @LOCAL@("HEADER","HDR")=1
 
 
 I X["***  End of file  ***" S @LOCAL@("HEADER","HDR")=0
 I A<58 Q 0-NIV
 I '(@LOCAL@("HEADER","HDR")) Q 0-NIV
 Q 1-NIV
 ;

