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

;LKTXBRP1^INT^1^59547,74868^0
LKTXBRP1 W *
 
 
 
 
 
 
 
 
LNODE ;;
 ;;|"A2"||
 ;;
LEC ;;|CAR|A|         ;  ASCII
 ;;|ENR|F|        ;enreg FIXE
 ;;|LBL|L|        ;labelled
 ;;|SIZ|256|       ;taille enreg
 ;;|BLK|8192|    ;nb block
 ;;
ELC ;;|"LKZPAR"|PARELC^LKTXBRP1|
 ;;|"LKEX"|EXELC^LKTXBRP1|
 ;;
EXELC ;;|1,0,"REPERE.CIRCUIT.IMPRIME","D"|6|
 ;;|1,0,"REPERE.CIRCUIT.IMPRIME","F"|10|
 ;;|1,0,"REPERE.CIRCUIT.IMPRIME","T",1|EXT|
 ;;|1,0,"REPERE.CIRCUIT.IMPRIME","T",2|ALPHA|
 ;;|1,0,"REPERE.CIRCUIT.IMPRIME","INFO","LIEN"|1|
 ;;|1,0,"NOM","D"|12|
 ;;|1,0,"NOM","F"|21|
 ;;|1,0,"NOM","T",1|EXT|
 ;;|1,0,"NOM","T",2|ALPHA|
 ;;|1,0,"NOM","T",3|TR^LKEXZ("_","/")|
 ;;|1,0,"TYPE.COMPOSANT","D"|23|
 ;;|1,0,"TYPE.COMPOSANT","F"|37|
 ;;|1,0,"TYPE.COMPOSANT","T",1|EXT|
 ;;|1,0,"TYPE.COMPOSANT","T",2|ALPHA|
 ;;|1,0,"GEOMETRIE","D"|39|
 ;;|1,0,"GEOMETRIE","F"|53|
 ;;|1,0,"GEOMETRIE","T",1|EXT|
 ;;|1,0,"GEOMETRIE","T",2|ALPHA|
 ;;|1,0,"GEOMETRIE","T",3|TR^LKEXZ("_",".")|
 ;;|1,0,"ABSCISSE","D"|55|
 ;;|1,0,"ABSCISSE","F"|60|
 ;;|1,0,"ABSCISSE","T",1|EXT|
 ;;|1,0,"ABSCISSE","T",2|ALPHA|
 ;;|1,0,"ABSCISSE","INFO","LIEN"|1|
 ;;|1,0,"ORDONNEE","D"|62|
 ;;|1,0,"ORDONNEE","F"|66|
 ;;|1,0,"ORDONNEE","T",1|EXT|
 ;;|1,0,"ORDONNEE","T",2|ALPHA|
 ;;|1,0,"ORDONNEE","INFO","LIEN"|1|
 ;;|1,0,"SURFACE.DE.LOCALISATION","D"|68|
 ;;|1,0,"SURFACE.DE.LOCALISATION","F"|69|
 ;;|1,0,"SURFACE.DE.LOCALISATION","T",1|EXT|
 ;;|1,0,"SURFACE.DE.LOCALISATION","T",2|ALPHA|
 ;;|1,0,"SURFACE.DE.LOCALISATION","INFO","LIEN"|1|
 ;;|1,0,"ORIENTATION","D"|71|
 ;;|1,0,"ORIENTATION","F"|75|
 ;;|1,0,"ORIENTATION","T",1|EXT|
 ;;|1,0,"ORIENTATION","T",2|ALPHA|
 ;;|1,0,"ORIENTATION","INFO","LIEN"|1|
 ;;|1,0,"GROUPE","D"|77|
 ;;|1,0,"GROUPE","F"|81|
 ;;|1,0,"GROUPE","T",1|EXT|
 ;;|1,0,"GROUPE","T",2|ALPHA|
 ;;|1,0,"CARACTERISTIQUE","D"|83|
 ;;|1,0,"CARACTERISTIQUE","F"|92|
 ;;|1,0,"CARACTERISTIQUE","T",1|EXT|
 ;;|1,0,"CARACTERISTIQUE","T",2|ALPHA|
 ;;|1,0,"TOLERANCE","D"|94|
 ;;|1,0,"TOLERANCE","F"|98|
 ;;|1,0,"TOLERANCE","T",1|EXT|
 ;;|1,0,"TOLERANCE","T",2|ALPHA|
 ;;|1,0,"POWER.TYPE","D"|100|
 ;;|1,0,"POWER.TYPE","F"|104|
 ;;|1,0,"POWER.TYPE","T",1|EXT|
 ;;|1,0,"POWER.TYPE","T",2|ALPHA|
 
PARELC ;;|EDGE|EDGE^LKTXBRP1|
 ;;|MODE|NOINC NOSTO|
 ;;
ELC2 ;;|"LKZPAR"|PARELC2^LKTXBRP1|
 ;;|"TABATT"|EXELC^LKTXBRP1|
 ;;
PARELC2 ;;|EDGE|EDGERQ^LKTXBRP1|
 ;;|LAST|LASTRQ^LKTXBRP1|
 ;;|MODE|NOINC |
 ;;
EDGE(NIV,X,Y) 
 N A
 S A=$E(X,1,4)
 I A="COMP" Q 1-NIV
 Q 0-NIV
 
EDGERQ(NIV,X,Y) 
 I X="ABSCISSE" Q 1-NIV
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I (NIV=1)&(X="TYPE.COMPOSANT") Q -1
 Q 0

