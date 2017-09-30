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

;LKTXIM1^INT^1^59547,74868^0
LKTXIM1 ;
INU ;;|"LKZPAR"|PAR^LKST1|
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
 ;;|1,0,"LIGNE.1","T",7|GROUPC^LKEXZ1(256)|
 ;;
 ;;|1,0,"LIGNE.1","T",6.5|ETOA^LKEXZ("EBCDIC")|
 
 
INU1 ;;|"LKZPAR"|PARINU1^LKTXIM1|
 ;;|"LKEX"|EXINU1^LKTXIM1|
 ;;|"TABLEL","EBCDIC"|EBCDIC^LKST2|
 ;;
PARINU1 ;;|EDGE|EDGE1^LKTXIM1|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A,B
 I X'="" Q 1-NIV
 Q 0-NIV
 
EXINU1 ;;|1,0,"%MARQUE","T",1|CST^LKEXZ("***ARTICLE***")|
 ;;|1,0,"NOM.ARTICLE","T",1|EXTR^LKEXZ(1,9)|
 ;;|1,0,"NOM.ARTICLE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"NOM.ARTICLE","T",3|ALPHA|
 ;;|1,0,"POSTE.DE.CHARGE","T",1|EXTR^LKEXZ(10,14)|
 ;;|1,0,"POSTE.DE.CHARGE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"POSTE.DE.CHARGE","T",3|ALPHA|
 ;;|1,0,"NOM.GAMME","T",1|EXTR^LKEXZ(15,15)|
 ;;|1,0,"NOM.GAMME","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"NOM.GAMME","T",3|ALPHA|
 ;;|1,0,"NUMERO.OPERATION","T",1|EXTR^LKEXZ(16,17)|
 ;;|1,0,"NUMERO.OPERATION","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"NUMERO.OPERATION","T",3|NUM|
 ;;|1,0,"TYPE.OPERATION","T",1|EXTR^LKEXZ(18,18)|
 ;;|1,0,"TYPE.OPERATION","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"TYPE.OPERATION","T",3|ALPHA|
 ;;|1,0,"LIBELLE","T",1|EXTR^LKEXZ(19,58)|
 ;;|1,0,"LIBELLE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"LIBELLE","T",3|ALPHA|
 ;;|1,0,"COMMENTAIRE","T",1|EXTR^LKEXZ(19,58)|
 ;;|1,0,"COMMENTAIRE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"COMMENTAIRE","T",3|ALPHA|
 ;;|1,0,"OPERATION.TECHNIQUE","T",1|EXTR^LKEXZ(59,60)|
 ;;|1,0,"OPERATION.TECHNIQUE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"OPERATION.TECHNIQUE","T",3|ALPHA|
 ;;|1,0,"CADENCE.ACTUALISEE","T",1|EXTR^LKEXZ(61,65)|
 ;;|1,0,"CADENCE.ACTUALISEE","T",2|EPACK^LKEXZ(9)|.....
 ;;|1,0,"CADENCE.ACTUALISEE","T",3|NUM^LKEXZ(".",3)|.....
 ;;|1,0,"RENDEMENT","T",1|EXTR^LKEXZ(68,70)|
 ;;|1,0,"RENDEMENT","T",2|EPACK^LKEXZ(5)|
 ;;|1,0,"RENDEMENT","T",3|NUM^LKEXZ(".",4)|.....
 ;;|1,0,"EFFICIENCE","T",1|EXTR^LKEXZ(71,73)|
 ;;|1,0,"EFFICIENCE","T",2|EPACK^LKEXZ(5)|
 ;;|1,0,"EFFICIENCE","T",3|NUM^LKEXZ(".",3)|.....
 ;;|1,0,"MACHINE","T",1|EXTR^LKEXZ(74,80)|
 ;;|1,0,"MACHINE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"MACHINE","T",3|ALPHA|
 ;;|1,0,"OUTIL.1","T",1|EXTR^LKEXZ(81,87)|
 ;;|1,0,"OUTIL.1","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"OUTIL.1","T",3|ALPHA|
 ;;|1,0,"OUTIL.2","T",1|EXTR^LKEXZ(88,94)|
 ;;|1,0,"OUTIL.2","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"OUTIL.2","T",3|ALPHA|
 ;;|1,0,"AMORTISSEMENT.MACHINE.ACTUALISE","T",1|EXTR^LKEXZ(95,98)|
 ;;|1,0,"AMORTISSEMENT.MACHINE.ACTUALISE","T",2|EPACK^LKEXZ(7)|
 ;;|1,0,"AMORTISSEMENT.MACHINE.ACTUALISE","T",3|NUM^LKEXZ(".",2)|.....
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.ACTUALISE","T",1|EXTR^LKEXZ(99,102)|
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.ACTUALISE","T",2|EPACK^LKEXZ(7)|
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.ACTUALISE","T",3|NUM^LKEXZ(".",2)|.....
 ;;|1,0,"PIECE.PAR.CYCLE","T",1|EXTR^LKEXZ(103,104)|
 ;;|1,0,"PIECE.PAR.CYCLE","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"PIECE.PAR.CYCLE","T",3|NUM|
 ;;|1,0,"DATE.CREATION","T",1|EXTR^LKEXZ(109,114)|
 ;;|1,0,"DATE.CREATION","T",2|ETOA^LKEXZ("EBCDIC")|
 ;;|1,0,"DATE.CREATION","T",3|62^LKEXZ|
 ;;|1,0,"CADENCE.STANDARD","T",1|EXTR^LKEXZ(200,204)|
 ;;|1,0,"CADENCE.STANDARD","T",2|EPACK^LKEXZ(9)|
 ;;|1,0,"CADENCE.STANDARD","T",3|NUM^LKEXZ(".",3)|.....
 ;;|1,0,"AMORTISSEMENT.MACHINE.STANDARD","T",1|EXTR^LKEXZ(205,208)|
 ;;|1,0,"AMORTISSEMENT.MACHINE.STANDARD","T",2|EPACK^LKEXZ(7)|
 ;;|1,0,"AMORTISSEMENT.MACHINE.STANDARD","T",3|NUM^LKEXZ(".",2)|.....
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.STANDARD","T",1|EXTR^LKEXZ(209,212)|
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.STANDARD","T",2|EPACK^LKEXZ(7)|
 ;;|1,0,"AMORTISSEMENT.OUTILLAGE.STANDARD","T",3|NUM^LKEXZ(".",2)|.....
 ;;
 ;

