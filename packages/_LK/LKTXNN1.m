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

;LKTXNN1^INT^1^59547,74868^0
LKTXNSC1 W *
 
 
 
 
 
 
 
 
PPNSC1 ;;|PHYPROT|"ASCIIST"|   ;pas encore utilise
 ;;
PHYNSC1 ;;|CAR|E|         ;ebcdic
 ;;|ENR|F|        ;enreg fixe
 ;;|LBL|L|        ;labelled
 ;;|SIZ|80|       ;taille enreg
 ;;|BLK|8000|    ;nb block
 ;;
 
NSC1 ;;|"LKZPAR"|PARNSC1^LKTXNSC1|
 ;;|"LKEX"|EXNSC1^LKTXNSC1|
 ;;|"MODE"|PV|
 ;;
EXNSC1 ;;|0,0,"*","D"|41
 ;;|0,0,"*","F"|80
 ;;|0,0,"*","T",1|EXT
 ;;|0,0,"*","T",2|ALPHA
 ;;|0,0,"*","PD"|1
 ;;|0,0,"*","PF"|40
 ;;|0,0,"*","PT",1|EXTP
 ;;|0,0,"*","PT",2|ALPHA
 ;;
 ;;|0,0,"FORME","T",1|NUM
PARNSC1 W *
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 Q 0
 
NSC2 ;;|"LKZPAR"|PARNSC2^LKTXNSC1|
 ;;|"TABATT"|EXNSC1^LKTXNSC1|
 ;;
PARNSC2 W *
 ;;|MODE|NOINC STO|
 ;;|LAST|LAST2^LKTXNSC1|
 ;;
EDGE2(NIV,X,Y) 
 I $E(X,1,7)="ATELIER" Q 1
 Q 0
LAST2(NIV,X,Y) 
 N Y1
 S Y1=$E(Y,1,7)
 I (Y1="ATELIER")!(Y1="") Q -1
 Q 0
FIRST2(NIV,X,Y) 
 N X1
 S X1=$E(X,1,7)
 I X1="ATELIER" Q 1
 Q 0
 ;

