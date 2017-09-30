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

;LKTXCPP2^INT^1^59547,74868^0
LKTXCPP2 ;
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
AMA ;;|"LKZPAR"|PARAMA^LKTXCPP2|
 ;;|"LKEX"|EXAMA^LKTXCPP2|
 ;;
 ;;|0,0,"ENREG","D"|1|
 ;;|0,0,"ENREG","F"|999|
 ;;|0,0,"ENREG","T",1|EXT|
 ;;
EXAMA ;;|1,"*","NOM","T",1|PARTIE^LKEXZ("$",2,2)|
 ;;|1,"*","NOM","T",2|EXTR^LKEXZ(1,7)|
 ;;|1,"*","INDICE.PIECE","T",1|PARTIE^LKEXZ("$",2,2)|
 ;;|1,"*","INDICE.PIECE","T",2|EXTR^LKEXZ(8,9)|
 ;;|1,"*","COMMANDE.BANDE.NUMERIQUE","T",1|PARTIE^LKEXZ("%",2,2)|
 ;;|2,"*","LONGUEUR.DEBIT","T",1|PARTIE^LKEXZ("\",2,2)|
 ;;|2,"*","LARGEUR.DEBIT","T",1|PARTIE^LKEXZ("\",3,3)|
 ;;|2,"*","EPAISSEUR.DEBIT","T",1|PARTIE^LKEXZ("\",4,4)|
 ;;|2,"*","NATURE.MATIERE","T",1|PARTIE^LKEXZ("\",5,5)|
 ;;|2,"*","NOMBRE.PIECE.DEBIT","T",1|PARTIE^LKEXZ("\",8,8)|
 ;;|2,"*","TEMPS.EXECUTION.POINCONNAGE","T",1|PARTIE^LKEXZ("\",9,9)|
 ;;|2,"*","TEMPS.EXECUTION.POINCONNAGE","T",2|PARTIE^LKEXZ(".",1,1)|
 ;;|2,"*","TEMPS.MANUTENTION.POINCONNAGE","T",1|PARTIE^LKEXZ("\",9,9)|
 ;;|2,"*","TEMPS.MANUTENTION.POINCONNAGE","T",2|PARTIE^LKEXZ(".",2,2)|
 ;;
PARAMA ;;|EDGE|EDGE^LKTXCPP2|
 ;;|MODE|STO INC|
 ;;
EDGE(NIV,X,Y) 
 N A
 S A=$E(X,1,1)
 I A="@" Q 1-NIV
 I A="\" Q 2-NIV
 Q 0-NIV
 
AMA2 ;;|"LKZPAR"|PARAMA2^LKTXCPP2|
 ;;|"TABATT"|EXAMA^LKTXCPP2|
 ;;
 ;;|"STO"|STO^LKTXAVR1|
 ;;
PARAMA2 ;;|EDGE|EDGE2^LKTXCPP2|
 ;;|MODE|NOINC |
 ;;|LAST|LAST2^LKTXCPP2|
 ;;
EDGE2(NIV,X,Y) 
 I X="COMMANDE.BANDE.NUMERIQUE" Q 1
 Q 0
LAST2(NIV,X,Y) 
 I (Y="COMMANDE.BANDE.NUMERIQUE")!(Y="") Q -1
 Q 0

