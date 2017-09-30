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

;LKTLAVEX^INT^1^59547,74867^0
LKTLAVEX W *
 
 
 
 
 
 
PPAVEX ;;|PHYPROT|"ASCIIST"|   ;pas encore utilise
 ;;
PHYAVEX ;;|CAR|E|         ;ebcdic
 ;;|ENR|F|        ;enreg fixe
 ;;|LBL|L|        ;labelled
 ;;|SIZ|80|       ;taille enreg
 ;;|BLK|8000|    ;nb block
 ;;
AVEX ;;|"LKZPAR"|PARAVEX^LKTLAVEX|
 ;;|"LKEX"|EXAVEX^LKTLAVEX|
 ;;
 
EXAVEX ;;|0,0,"CODE.USINE","D"|1
 ;;|0,0,"CODE.USINE","F"|2
 ;;|0,0,"AVIS.EXPEDITION.TYPE","D"|6
 ;;|0,0,"AVIS.EXPEDITION.TYPE","F"|6
 ;;|0,0,"AVIS.EXPEDITION.NUMERO","D"|7
 ;;|0,0,"AVIS.EXPEDITION.NUMERO","F"|11
 ;;|0,0,"ARC","D"|12
 ;;|0,0,"ARC","F"|18
 ;;|0,0,"DESTINATION","D"|19
 ;;|0,0,"DESTINATION","F"|21
 ;;|0,0,"ORIGINE.EXPEDITION","D"|22
 ;;|0,0,"ORIGINE.EXPEDITION","F"|24
 ;;|0,0,"POIDS.EXPEDIE","D"|25
 ;;|0,0,"POIDS.EXPEDIE","F"|31,NUM
 ;;|0,0,"QUANTITE.EXPEDIEE","D"|32
 ;;|0,0,"QUANTITE.EXPEDIEE","F"|36,NUM
 ;;|0,0,"ARTICLE.NUMERO","D"|37
 ;;|0,0,"ARTICLE.NUMERO","F"|44
 ;;|0,0,"STATUT.DE.LIVRAISON","D"|45
 ;;|0,0,"STATUT.DE.LIVRAISON","F"|45
 ;;|0,0,"NUMERO.ACOMPTE","D"|46
 ;;|0,0,"NUMERO.ACOMPTE","F"|47
 ;;|0,0,"MODE.EXPEDITION","D"|48
 ;;|0,0,"MODE.EXPEDITION","F"|51
 ;;|0,0,"REGULARISATION","D"|52
 ;;|0,0,"REGULARISATION","F"|52
 ;;|0,0,"SEX","D"|53
 ;;|0,0,"SEX","F"|54
 ;;|0,0,"CORRECTION","D"|77
 ;;|0,0,"CORRECTION","F"|77
 ;;|0,0,"DATE.EXPEDITION","D"|78
 ;;|0,0,"DATE.EXPEDITION","F"|80
 ;;
SOM ;;QUANTITE.DEJA.EXPEDIEE#^PARCLI($J,"QUANTITE.EXPEDIEE");POIDS.DEJA.EXPEDIE#^PARCLI($J,"POIDS.EXPEDIE");NOMBRE.EXPEDITIONS.DEJA.EFFECTUEES#1
 
PARAVEX ;;|EDGE|EDGE^LKTLAVEX|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE(NIV,X) 
 Q 0
AVEX2 ;;|"LKTRST"|TRAVEX^LKTLAVEX|
 ;;|"LKZPAR"|PARAVE2^LKTLAVEX|
 ;;
PARAVE2 ;;|EDGE|EDGE^LKTLAVEX|
 ;;|MODE|NOINC STO|
 ;;
 
TRAVEX ;;|0,0,"ORIGINE.EXPEDITION","TAB"|^[QUI]CLIENCGD|
 ;;|0,0,"ORIGINE.EXPEDITION","PARAMETRE",1|ORIGINE.EXPEDITION|
 ;;|0,0,"ORIGINE.EXPEDITION","NPAR",1|CLIENT.ORIGINE|
 ;;|0,0,"ORIGINE.EXPEDITION","NPAR",3|CLIENT.ORIGINE.ADRESSE|
 ;;|0,0,"DESTINATION","TAB"|^[QUI]CLIENCGD|
 ;;|0,0,"DESTINATION","PARAMETRE",1|DESTINATION|
 ;;|0,0,"DESTINATION","NPAR",1|CLIENT.DESTINATION|
 ;;|0,0,"DESTINATION","NPAR",3|CLIENT.DESTINATION.ADRESSE|
 ;;
 ;;|0,0,"CODE.USINE","TAB"|^[QUI]USINECGD|      ;transcodage 1+1-->N
 ;;|0,0,"CODE.USINE","PARAMETRE",1|CODE.USINE|
 ;;|0,0,"CODE.USINE","PARAMETRE",2|%USINE|      ;instanciation ds prog par $O
 ;;|0,0,"CODE.USINE","NPAR",1|USINE|
 ;;|0,0,"CODE.USINE","NPAR",2|USINE.ADRESSE|
 ;;
 
SEX(TEMP,PARAM,ORDRE,DEST) 
 N ER
 I PARAM'="SEX" Q
 S ER=$$LOA^LKZPAR(TEMP,PARAM,ORDRE,.VAL)
 I VAL<11 W *
 I VAL=11 W *
 I VAL=13 W *
 Q 1
 ;

