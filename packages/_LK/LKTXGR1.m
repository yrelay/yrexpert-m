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

;LKTXGR1^INT^1^59547,74868^0
LKTXGR1 ;
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;
GR1 ;;|"LKZPAR"|PARGR1^LKTXGR1|
 ;;|"LKEX"|EXGR1^LKTXGR1|
 ;;
PARGR1 ;;|EDGE|EDGE1^LKTXGR1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A,B
 I X'="" Q 1-NIV
 Q 0-NIV
 
EXGR1 ;;|1,0,"%MARQUE","T",1|CST^LKEXZ("***GAMME***")|
 ;;|1,0,"NOM","T",1|PARTIE^LKEXZ("^",1,2)|
 ;;|1,0,"NOM","T",2|TR^LKEXZ("^",".")|
 ;;|1,0,"NOM","T",3|CHBKPT^LKEXZ|
 ;;|1,0,"NOM","T",4|ALPHA|
 ;;|1,0,"LIBELLE","T",1|PARTIE^LKEXZ("^",1,1)|
 ;;|1,0,"LIEU","T",1|PARTIE^LKEXZ("^",2,2)|
 ;;|1,0,"RUE","T",1|PARTIE^LKEXZ("^",3,3)|
 ;;|1,0,"RUE","T",2|ALPHA|
 ;;|1,0,"CODE.POSTAL","T",1|PARTIE^LKEXZ("^",4,4)|
 ;;|1,0,"VILLE","T",1|PARTIE^LKEXZ("^",5,5)|
 ;;|1,0,"NUMERO.TELEPHONE","T",1|PARTIE^LKEXZ("^",6,6)|
 ;;|1,0,"NUMERO.TELEPHONE","T",2|ALPHA|
 ;;|1,0,"PARAMETRE.INCONNU","T",1|PARTIE^LKEXZ("^",7,7)|
 ;;|1,0,"NUMERO.TELECOPIE","T",1|PARTIE^LKEXZ("^",8,8)|
 ;;|1,0,"NUMERO.TELECOPIE","T",2|ALPHA|
 ;;|1,0,"COMMENTAIRE.1","T",1|PARTIE^LKEXZ("^",9,9)|
 ;;|1,0,"COMMENTAIRE.2","T",1|PARTIE^LKEXZ("^",10,10)|
 ;;|1,0,"COMMENTAIRE.3","T",1|PARTIE^LKEXZ("^",11,11)|
 ;;
 
 
GR2 ;;|"LKZPAR"|PARGR2^LKTXGR1|
 ;;|"TABATT"|EXGR1^LKTXGR1|
 ;;|"TABLEL","REP"|REP^LKTXGR1|
 ;;
 
REP ;;|"CORRESPONDANT"|CORREPONDANT|
 ;;
PARGR2 ;;|EDGE|EDGERQ^LKTXGR1|
 ;;|LAST|LASTRQ^LKTXGR1|
 ;;|MODE|NOINC |
 ;;
 
EDGERQ(NIV,X,Y) 
 I X="%MARQUE" Q 1
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I Y="%MARQUE" Q -1
 Q 0

