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

;LKTXBEL1^INT^1^59547,74868^0
LKTXBEL1 W *
 
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;|"A3"||
 ;;
 
BEL ;;|"LKZPAR"|PAR^LKST1|
 ;;|"LKEX"|EXBEL^LKTXBEL1|
 ;;|"TABLEL","TRANSCOD"|TRCOD^LKST1|
 ;;|"TABLEL","HEADER"|HDR^LKST1|
 ;;|"TABLEL","VT"|VT^LKST1|
 ;;
EXBEL ;;|1,0,"LIGNE.1","D"|1|
 ;;|1,0,"LIGNE.1","F"|48|
 ;;|1,0,"LIGNE.1","T",1|EXT|
 ;;|1,0,"LIGNE.1","T",2|MPARTIE^LKEXZ(" ",2,17)|
 ;;|1,0,"LIGNE.1","T",3|TRAN^LKTRAN("TRANSCOD")|
 ;;|1,0,"LIGNE.1","T",4|CON^LKTRAN|
 ;;|1,0,"LIGNE.1","T",5|KILLMV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",6|INV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",7|GROUPC^LKEXZ1(150)|
 ;;
 
 
BEL1 ;;|"LKZPAR"|PARBEL1^LKTXBEL1|
 ;;|"LKEX"|EXBEL1^LKTXBEL1|
 ;;
PARBEL1 ;;|EDGE|EDGE1^LKTXBEL1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A,B
 
 I $E(X,13,19)="ARTICLE" Q 1-NIV
 
 I $E(X,11,14)?.N Q 2-NIV
 
 I $E(X,33,39)="MOYENNE" Q 3-NIV
 
 S A=$E(X,17,19)
 S B=$$ALPHA^LKEX(.A)
 I $$POS^%QZNBN(A) Q 4-NIV
 Q 0-NIV
 
EXBEL1 ;;|1,0,"%G","T",1|CST^LKEXZ("***GAMME***")|
 ;;|1,0,"NOM","T",1|EXTR^LKEXZ(22,31)|
 ;;|1,0,"NOM","T",2|ALPHA|
 ;;|1,0,"DESIGNATION","T",1|EXTR^LKEXZ(40,70)|
 ;;|1,0,"DESIGNATION","T",2|ALPHA|
 ;;|2,0,"%O","T",1|CST^LKEXZ("***OPERATION***")|
 ;;|2,0,"NOM","T",1|EXTR^LKEXZ(16,36)|
 ;;|2,0,"NOM","T",2|CHBKPT^LKEXZ|
 ;;|2,0,"NUMERO.OPERATION","T",1|EXTR^LKEXZ(11,14)|
 ;;|2,0,"NUMERO.OPERATION","T",2|NUM|
 ;;|2,0,"TEMPS.EXECUTION.MACHINE","T",1|EXTR^LKEXZ(40,46)|
 ;;|2,0,"TEMPS.EXECUTION.MACHINE","T",2|ALPHA|
 ;;|2,0,"TEMPS.EXECUTION.MACHINE","T",3|CHBKPT^LKEXZ|
 ;;|2,0,"TEMPS.EXECUTION.MAIN.D.OEUVRE","T",1|EXTR^LKEXZ(48,54)|
 ;;|2,0,"TEMPS.EXECUTION.MAIN.D.OEUVRE","T",2|ALPHA|
 ;;|2,0,"TEMPS.EXECUTION.MAIN.D.OEUVRE","T",3|CHBKPT^LKEXZ|
 ;;|2,0,"TEMPS.PREPARATION","T",1|EXTR^LKEXZ(56,63)|
 ;;|2,0,"TEMPS.PREPARATION","T",2|ALPHA|
 ;;|2,0,"TEMPS.PREPARATION","T",3|CHBKPT^LKEXZ|
 ;;|2,0,"DESIGNATION","T",1|EXTR^LKEXZ(70,83)|
 ;;|2,0,"DESIGNATION","T",2|ALPHA|
 ;;|2,0,"SITUATION.OPERATIONNELLE","T",1|EXTR^LKEXZ(99,105)|
 ;;|2,0,"SITUATION.OPERATIONNELLE","T",2|ALPHA|
 ;;|2,0,"DATE.DERNIERE.MODIFICATION","T",1|EXTR^LKEXZ(133,140)|
 ;;|2,0,"DATE.DERNIERE.MODIFICATION","T",2|TR^LKEXZ(" ","")|
 ;;|2,0,"DATE.DERNIERE.MODIFICATION","T",3|42^LKEXZ1|
 ;;|3,0,"DESCRIPTION.1","T",1|EXTR^LKEXZ(70,120)|
 ;;|3,0,"DESCRIPTION.1","T",2|ALPHA|
 ;;|4,0,"COMMENTAIRE","T",1|EXTR^LKEXZ(22,53)|
 ;;|4,0,"COMMENTAIRE","T",2|ALPHA|
 ;;
 
 
BEL2 ;;|"LKZPAR"|PARBEL2^LKTXBEL1|
 ;;|"TABATT"|EXBEL1^LKTXBEL1|
 ;;|"TABLEL","VT"|VT2^LKTXBEL1|
 ;;|"TABLEL","REP"|REP^LKTXBEL1|
 ;;
 
VT2 ;;|"ENT"|BELLANGER|
 ;;
 
REP ;;|"GAMME"|MOZ|
 ;;|"OPERATION"|MOZOP|
 ;;|"ARTICLE"|ARTICLE|
 ;;|"AG"|GAMME.MOZART|
 ;;|"GO"|OPERATION.MOZART|
 ;;
PARBEL2 ;;|EDGE|EDGERQ^LKTXBEL1|
 ;;|LAST|LASTRQ^LKTXBEL1|
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

