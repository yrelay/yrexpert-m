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

;LKTXAVEX^INT^1^59547,74867^0
LKTXAVEX W *
 
 
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
PPAVEX ;;|PHYPROT|"ASCIIST"|   ;pas encore utilise
 ;;
PHYAVEX ;;|CAR|E|         ;ebcdic
 ;;|ENR|F|        ;enreg fixe
 ;;|LBL|L|        ;labelled
 ;;|SIZ|80|       ;taille enreg
 ;;|BLK|8000|    ;nb block
 ;;
AVEX ;;|"LKZPAR"|PARAVEX^LKTXAVEX|
 ;;|"LKEX"|EXAVEX^LKTXAVEX|
 ;;
 
EXAVEX ;;|0,0,"AVIS.EXPEDITION.TYPE","D"|6
 ;;|0,0,"AVIS.EXPEDITION.TYPE","F"|6
 ;;|0,0,"AVIS.EXPEDITION.TYPE","T",1|EXT
 ;;|0,0,"AVIS.EXPEDITION.NUMERO","D"|7
 ;;|0,0,"AVIS.EXPEDITION.NUMERO","F"|11
 ;;|0,0,"AVIS.EXPEDITION.NUMERO","T",1|EXT
 ;;|0,0,"AVIS.EXPEDITION","D"|6
 ;;|0,0,"AVIS.EXPEDITION","F"|11
 ;;|0,0,"AVIS.EXPEDITION","T",1|EXT
 ;;|0,0,"AVIS.EXPEDITION","T",2|ALPHA
 ;;|0,0,"ARC","D"|12
 ;;|0,0,"ARC","F"|18
 ;;|0,0,"ARC","T",1|EXT
 ;;|0,0,"POIDS.EXPEDIE","D"|25
 ;;|0,0,"POIDS.EXPEDIE","F"|31
 ;;|0,0,"POIDS.EXPEDIE","T",1|EXT
 ;;|0,0,"POIDS.EXPEDIE","T",2|NUM
 ;;|0,0,"QUANTITE.EXPEDIEE","D"|32
 ;;|0,0,"QUANTITE.EXPEDIEE","F"|36
 ;;|0,0,"QUANTITE.EXPEDIEE","T",1|EXT
 ;;|0,0,"QUANTITE.EXPEDIEE","T",2|NUM
 ;;|0,0,"STATUT.DE.LIVRAISON","D"|45
 ;;|0,0,"STATUT.DE.LIVRAISON","F"|45
 ;;|0,0,"STATUT.DE.LIVRAISON","T",1|EXT
 ;;|0,0,"STATUT.DE.LIVRAISON","T",2|STA^LKTXAVEX
 ;;|0,0,"ATELIER","D"|53
 ;;|0,0,"ATELIER","F"|54
 ;;|0,0,"ATELIER","T",1|EXT
 ;;|0,0,"ATELIER","T",2|SEX1^LKTXAVEX
 ;;|0,0,"DATE.EXPEDITION","D"|78
 ;;|0,0,"DATE.EXPEDITION","F"|80
 ;;|0,0,"DATE.EXPEDITION","T",1|EXT
 ;;|0,0,"DATE.EXPEDITION","T",2|NUM
 ;;|0,0,"DATE.EXPEDITION","T",3|DAT^LKTXAVEX
 ;;
 ;;
 ;;|0,0,"CODE.USINE","D"|1
 ;;|0,0,"CODE.USINE","F"|2
 ;;|0,0,"DESTINATION","D"|19
 ;;|0,0,"DESTINATION","F"|21
 ;;|0,0,"ORIGINE.EXPEDITION","D"|22
 ;;|0,0,"ORIGINE.EXPEDITION","F"|24
 ;;|0,0,"ARTICLE.NUMERO","D"|37
 ;;|0,0,"ARTICLE.NUMERO","F"|44
 ;;|0,0,"NUMERO.ACOMPTE","D"|46
 ;;|0,0,"NUMERO.ACOMPTE","F"|47
 ;;|0,0,"MODE.EXPEDITION","D"|48
 ;;|0,0,"MODE.EXPEDITION","F"|51
 ;;|0,0,"REGULARISATION","D"|52
 ;;|0,0,"REGULARISATION","F"|52
 ;;|0,0,"CORRECTION","D"|77
 ;;|0,0,"CORRECTION","F"|77
 ;;
SEX1(VAL) 
 I VAL<11 S VAL="TLR" Q 0
 I VAL=11 S VAL="FIL" Q 0
 I VAL=13 S VAL="ATF" Q 0
 Q 1
STA(VAL) I VAL="S" S VAL="SOLDE" Q 0
 I VAL="A" S VAL="ACOMPTE" Q 0
 Q 1
DAT(VAL) N MOIS,DATE,ANNEE S DATE=$$DATE^%QMDATE,MOIS=$P(DATE,"/",2),ANNEE=$P(DATE,"/",3),VAL=(VAL\7)+1,VAL="00"_VAL,VAL=$E(VAL,$L(VAL)-1,$L(VAL))
 I ((MOIS<7)&(VAL<39))!((MOIS>6)&(VAL>13)) S VAL=ANNEE_VAL Q 0
 I (MOIS>6)&(VAL<14) S VAL=(ANNEE+1)_VAL Q 0
 I (MOIS<7)&(VAL>38) S VAL=(ANNEE-1)_VAL Q 0
 Q 1
 
SOM ;;QUANTITE.DEJA.EXPEDIEE#^PARCLI($J,"QUANTITE.EXPEDIEE");POIDS.DEJA.EXPEDIE#^PARCLI($J,"POIDS.EXPEDIE");NOMBRE.EXPEDITIONS.DEJA.EFFECTUEES#1
 
PARAVEX ;;|EDGE|EDGE^LKTXAVEX|
 ;;|MODE|NOINC NOSTO|
 ;;
AVEX2 ;;|"LKZPAR"|PARAVEX2^LKTXAVEX|
 ;;|"TABATT"|EXAVEX^LKTXAVEX|
 ;;|"STO"|STO^LKTXAVR1|
 ;;
PARAVEX2 ;;|EDGE|EDGE^LKTXAVEX|
 ;;|MODE|NOINC |
 ;;
EDGE(NIV,X,Y) 
 Q 0
 
SEX(TEMP,PARAM,ORDRE,DEST) 
 N ER,VAL
 I PARAM'="SEX" Q
 S ER=$$LOA^LKZPAR(TEMP,PARAM,ORDRE,.VAL)
 I VAL<11 S @DEST@("ATELIER")="TLR" Q ER
 I VAL=11 S @DEST@("ATELIER")="FIL" Q ER
 I VAL=13 S @DEST@("ATELIER")="ATF" Q ER
 Q 1
EDGERQ(NIV,X,Y) 
 Q 0
TEST S VAL=300 W !,$$DAT(.VAL),"  ",VAL
 S VAL=10 W !,$$DAT(.VAL),"  ",VAL
 Q

