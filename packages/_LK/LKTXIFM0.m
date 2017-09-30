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

;LKTXIFM0^INT^1^59547,74868^0
LKTXIFM0 ;
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
AMA ;;|"LKZPAR"|PARAMA^LKTXIFM0|
 ;;|"LKEX"|EXAMA^LKTXIFM0|
 ;;
EXAMA ;;|1,"*","NUMERO.DOSSIER","T",1|PARTIE^LKEXZ($C(9),1,1)|
 ;;|1,"*","DATE.PR","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","DATE.PR","T",2|PARTIE^LKEXZ("^",1,1)|
 ;;|1,"*","CYCLE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","CYCLE","T",2|PARTIE^LKEXZ("^",2,2)|
 ;;|1,"*","DUREE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","DUREE","T",2|PARTIE^LKEXZ("^",3,3)|
 ;;|1,"*","DIABETE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","DIABETE","T",2|PARTIE^LKEXZ("^",4,4)|
 ;;|1,"*","LUXATION.HANCHE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","LUXATION.HANCHE","T",2|PARTIE^LKEXZ("^",5,5)|
 ;;|1,"*","JUMEAUX","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","JUMEAUX","T",2|PARTIE^LKEXZ("^",6,6)|
 ;;|1,"*","AUTRES","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","AUTRES","T",2|PARTIE^LKEXZ("^",7,7)|
 ;;|1,"*","INCOMPATIBILITE.RHESUS.ABO","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","INCOMPATIBILITE.RHESUS.ABO","T",2|PARTIE^LKEXZ("^",8,8)|
 ;;|1,"*","RUBEOLE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","RUBEOLE","T",2|PARTIE^LKEXZ("^",9,9)|
 ;;|1,"*","TOXOPLASMOSE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","TOXOPLASMOSE","T",2|PARTIE^LKEXZ("^",10,10)|
 ;;
PARAMA ;;|EDGE|EDGE^LKTXIFM0|
 ;;|MODE|STO INC|
 ;;
EDGE(NIV,X,Y) 
 Q 1-NIV
 
AMA2 ;;|"LKZPAR"|PARAMA2^LKTXIFM0|
 ;;|"TABATT"|EXAMA^LKTXIFM0|
 ;;|"RAG"|"PATIENT"|
 ;;|"RAGF"|"RMGO"|
 ;;|"FILS"|"RMGO"|
 ;;
 ;;|"STO"|STO^LKTXAVR1|
 ;;
PARAMA2 ;;|EDGE|EDGE^LKTXIFM0|
 ;;|MODE|NOINC |
 ;;
 ;;|LAST|LAST2^LKTXIFM0|
 ;;
EDGE2(NIV,X,Y) 
 I X="AUTRES" Q 1
 Q 0
LAST2(NIV,X,Y) 
 I (Y="AUTRES")!(Y="") Q -1
 Q 0

