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

;LKTXIO1^INT^1^59547,74868^0
LKTXIO1 ;
XY S APP="INOG1"
 S H="D"
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXIO1","","",1)
 
 Q
INU ;;|"LKZPAR"|PAR^LKTXIO1|
 ;;|"LKEX"|EXINU^LKTXIM1|
 ;;|"TABLEL","HEADER"|HDR^LKST1|
 ;;|"TABLEL","VT"|VT^LKST1|
 ;;|"TABLEL","EBCDIC"|EBCDIC^LKST2|
 ;;
EXINU ;;|1,0,"LIGNE.1","D"|1|
 ;;|1,0,"LIGNE.1","F"|48|
 ;;|1,0,"LIGNE.1","T",1|EXT|
 ;;|1,0,"LIGNE.1","T",2|MPARTIE^LKEXZ(" ",2,17)|
 ;;|1,0,"LIGNE.1","T",2.5|HD^LKTRAN|
 ;;|1,0,"LIGNE.1","T",3|CHAR^LKTRAN|
 ;;|1,0,"LIGNE.1","T",4|CON^LKTRAN|
 ;;|1,0,"LIGNE.1","T",5|KILLMV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",6|INV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",6.5|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"LIGNE.1","T",7|GROUPC^LKEXZ1(256)|
 
PAR1 ;;|EDGE|EDGE1^LKTXIO1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A
 S A=$L(X)
 
 
 S @LOCAL@("HEADER","HDR")=1
 
 
 
 I A<58 Q 0-NIV
 
 Q 1-NIV
 ;

