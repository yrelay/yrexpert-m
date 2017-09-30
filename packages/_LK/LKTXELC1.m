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

;LKTXELC1^INT^1^59547,74868^0
LKTXELC1 W *
 
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
PHYELC ;;|CAR|E|         ;ebcdic
 ;;|ENR|F|        ;enreg fixe
 ;;|LBL|L|        ;labelled
 ;;|SIZ|128|       ;taille enreg
 ;;|BLK|128|    ;nb block
 ;;
ELC ;;|"LKZPAR"|PARELC^LKTXELC1|
 ;;|"LKEX"|EXELC^LKTXELC1|
 ;;
EXELC ;;|2,0,"NIVEAU.RELATIF","D"|2|
 ;;|2,0,"NIVEAU.RELATIF","F"|10|
 ;;|2,0,"NIVEAU.RELATIF","T",1|EXT|
 ;;|2,0,"NIVEAU.RELATIF","T",2|TR^LKEXZ(". ","")|
 ;;|2,0,"NUMERO.SEQUENCE","D"|12|
 ;;|2,0,"NUMERO.SEQUENCE","F"|15|
 ;;|2,0,"NUMERO.SEQUENCE","T",1|EXT|
 ;;|2,0,"NOM","D"|17|
 ;;|2,0,"NOM","F"|31|
 ;;|2,0,"NOM","T",1|EXT|
 ;;|2,0,"NOM","T",2|ALPHA|
 ;;|2,0,"NOM","T",3|CHBKPT^LKEXZ|
 ;;|2,0,"DESIGNATION","D"|32|
 ;;|2,0,"DESIGNATION","F"|59|
 ;;|2,0,"DESIGNATION","T",1|EXT|
 ;;|2,0,"DESIGNATION","T",2|ALPHA|
 ;;|2,0,"NUMERO.PLAN","D"|61|
 ;;|2,0,"NUMERO.PLAN","F"|76|
 ;;|2,0,"NUMERO.PLAN","T",1|EXT|
 ;;|2,0,"NUMERO.PLAN","T",2|ALPHA|
 ;;|2,0,"INDICE","D"|61|
 ;;|2,0,"INDICE","F"|61|
 ;;|2,0,"INDICE","T",1|EXT|
 ;;|2,0,"INDICE","T",2|ALPHA|
 ;;|2,0,"QUANTITE","D"|77|
 ;;|2,0,"QUANTITE","F"|85|
 ;;|2,0,"QUANTITE","T",1|EXT|
 ;;|2,0,"QUANTITE","T",2|NUM^LKEXZ(".",3)|
 ;;|2,0,"QUANTITE","T",3|NUM|
 ;;|2,0,"QUANTITE","INFO","LIEN"|1|
 ;;|2,0,"UNITE","D"|86|
 ;;|2,0,"UNITE","F"|87|
 ;;|2,0,"UNITE","T",1|EXT|
 ;;|2,0,"UNITE","T",2|ALPHA|
 ;;|2,0,"UNITE","INFO","LIEN"|1|
 ;;|2,0,"DATE.APPLICATION.DEBUT","D"|88|
 ;;|2,0,"DATE.APPLICATION.DEBUT","F"|93|
 ;;|2,0,"DATE.APPLICATION.DEBUT","T",1|EXT|
 ;;|2,0,"DATE.APPLICATION.DEBUT","T",2|61^LKEXZ|
 ;;|2,0,"DATE.APPLICATION.DEBUT","INFO","LIEN"|1|
 ;;|2,0,"DATE.APPLICATION.FIN","D"|95|
 ;;|2,0,"DATE.APPLICATION.FIN","F"|100|
 ;;|2,0,"DATE.APPLICATION.FIN","T",1|EXT|
 ;;|2,0,"DATE.APPLICATION.FIN","T",2|61^LKEXZ|
 ;;|2,0,"DATE.APPLICATION.FIN","INFO","LIEN"|1|
 ;;|2,0,"NUMERO.MODIFICATION","D"|101|
 ;;|2,0,"NUMERO.MODIFICATION","F"|105|
 ;;|2,0,"NUMERO.MODIFICATION","T",1|EXT|
 ;;|2,0,"NUMERO.MODIFICATION","T",2|ALPHA|
 ;;|2,0,"NUMERO.MODIFICATION","INFO","LIEN"|1|
 ;;|1,0,"NIVEAU.RELATIF","D"|1|
 ;;|1,0,"NIVEAU.RELATIF","F"|7|
 ;;|1,0,"NIVEAU.RELATIF","T",1|EXT|
 ;;|1,0,"NIVEAU.RELATIF","T",2|TR^LKEXZ(". ","")|
 ;;|1,0,"NOM","D"|9|
 ;;|1,0,"NOM","F"|22|
 ;;|1,0,"NOM","T",1|EXT|
 ;;|1,0,"NOM","T",2|ALPHA|
 ;;|1,0,"NOM","T",3|CHBKPT^LKEXZ|
 ;;|1,0,"DESIGNATION","D"|24|
 ;;|1,0,"DESIGNATION","F"|40|
 ;;|1,0,"DESIGNATION","T",1|EXT|
 ;;|1,0,"NUMERO.PLAN","D"|54|
 ;;|1,0,"NUMERO.PLAN","F"|69|
 ;;|1,0,"NUMERO.PLAN","T",1|EXT|
 ;;|1,0,"NUMERO.PLAN","T",2|ALPHA|
 ;;
 
 ;;|2,0,"NUMERO.VAR","D"|0|
 ;;|2,0,"NUMERO.VAR","F"|0|
 ;;|2,0,"NUMERO.VAR","T",1|EXT|
 ;;|2,0,"NUMERO.VAR","T",2|NUM|
 ;;|2,0,"AJS.DEL","F"|0|
 ;;|2,0,"AJS.DEL","D"|0|
 ;;|2,0,"QUANTITE.PRODUIT","D"|0|
 ;;|2,0,"QUANTITE.PRODUIT","F"|0|
 
PARELC ;;|EDGE|EDGE^LKTXELC1|
 ;;|MODE|NOINC NOSTO|
 ;;
ELC2 ;;|"LKZPAR"|PARELC2^LKTXELC1|
 ;;|"TABATT"|EXELC^LKTXELC1|
 ;;
PARELC2 ;;|EDGE|EDGERQ^LKTXELC1|
 ;;|LAST|LASTRQ^LKTXELC1|
 ;;|MODE|NOINC |
 ;;
EDGE(NIV,X,Y) 
 N A
 S A=$E(X,1,1)
 I A="C" Q 2-NIV
 I A="P" Q 1-NIV
 Q 0-NIV
 
EDGERQ(NIV,X,Y) 
 I (X="DESIGNATION")&(Y="NIVEAU.RELATIF") Q 1-NIV
 I X="DATE.APPLICATION.DEBUT" Q 2-NIV
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I (NIV=1)&(X="NUMERO.PLAN") Q -1
 I ((NIV'=1)&(NIV'=0))&(X="UNITE") Q -2
 Q 0

