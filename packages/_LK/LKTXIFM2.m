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

;LKTXIFM2^INT^1^59547,74868^0
LKTXIFM2 ;
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
AMA ;;|"LKZPAR"|PARAMA^LKTXIFM2|
 ;;|"LKEX"|EXAMA^LKTXIFM2|
 ;;
EXAMA ;;|1,"*","NOM.ABONNE","T",1|PARTIE^LKEXZ($C(9),1,1)|
 ;;|1,"*","LOCALITE","T",1|PARTIE^LKEXZ($C(9),2,2)|
 ;;|1,"*","ADRESSE.ABONNE","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","ADRESSE.ABONNE","T",2|PARTIE^LKEXZ("^",1,1)|
 ;;|1,"*","CODE.POSTAL.ABONNE","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","CODE.POSTAL.ABONNE","T",2|PARTIE^LKEXZ("^",2,2)|
 ;;|1,"*","VILLE.ABONNE","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","VILLE.ABONNE","T",2|PARTIE^LKEXZ("^",3,3)|
 ;;|1,"*","TELEPHONE","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","TELEPHONE","T",2|PARTIE^LKEXZ("^",4,4)|
 ;;|1,"*","CODE.INTERNE","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","CODE.INTERNE","T",2|PARTIE^LKEXZ("^",5,5)|
 ;;|1,"*","TELEX","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","TELEX","T",2|PARTIE^LKEXZ("^",6,6)|
 ;;|1,"*","INTERLOCUTEUR1","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","INTERLOCUTEUR1","T",2|PARTIE^LKEXZ("^",7,7)|
 ;;|1,"*","INTERLOCUTEUR2","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","INTERLOCUTEUR2","T",2|PARTIE^LKEXZ("^",8,8)|
 ;;|1,"*","INTERLOCUTEUR3","T",1|PARTIE^LKEXZ($C(9),3,3)|
 ;;|1,"*","INTERLOCUTEUR3","T",2|PARTIE^LKEXZ("^",9,9)|
 ;;
PARAMA ;;|EDGE|EDGE^LKTXIFM2|
 ;;|MODE|STO INC|
 ;;
EDGE(NIV,X,Y) 
 Q 1-NIV
 
AMA2 ;;|"LKZPAR"|PARAMA2^LKTXIFM2|
 ;;|"TABATT"|EXAMA^LKTXIFM2|
 ;;|"RAG"|"ANNUAIRE"|
 ;;
 ;;|"STO"|STO^LKTXAVR1|
 ;;
PARAMA2 ;;|EDGE|EDGE^LKTXIFM2|
 ;;|MODE|NOINC |
 ;;
 ;;|LAST|LAST2^LKTXIFM2|
 ;;
EDGE2(NIV,X,Y) 
 I X="ADRESSE.ABONNE" Q 1
 Q 0
LAST2(NIV,X,Y) 
 I (Y="ADRESSE.ABONNE")!(Y="") Q -1
 Q 0

