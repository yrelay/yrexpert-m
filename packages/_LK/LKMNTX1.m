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

;LKMNTX1^INT^1^59547,74867^0
LKMNTX1 W *
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
PHYMN ;;|CAR|A|         ;ebcdic
 ;;|ENR|F|        ;enreg fixe
 ;;|LBL|L|        ;labelled
 ;;|SIZ|80|       ;taille enreg
 ;;|BLK|8000|    ;nb block
 ;;
 
MN1 ;;|"LKZPAR"|PARMN1^LKMNTX1|
 ;;|"MODE"|PV|
 ;;
PARMN1 ;;|EDGE|EDGE1^LKMNTX1|    ;
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 Q 0
 
MN2 ;;|"LKZPAR"|PARMN2^LKMNTX1|
 ;;|"TABATT"|EXMN1^LKMNTX1|
 ;;
PARMN2 ;;|EDGE|EDGERQ^LKMNTX1|
 ;;|LAST|LASTRQ^LKMNTX1|
 ;;|MODE|NOINC |
 ;;
 
EDGERQ(NIV,X,Y) 
 I X="%MARQUE" Q 1
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I Y="%MARQUE" Q -1
 Q 0
 ;

