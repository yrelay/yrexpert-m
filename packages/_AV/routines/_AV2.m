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

;%AV2^INT^1^59547,73867^0
%AV2(expr,condition,moteur,msg,ERROR,expres,STOCK) ;;12:08 PM  29 Dec 1995
 
 
 
 
 
 
 
 
 
 
 
 S POLO="polon"
 S polon=""
 
START 
 
 S LASTTYPE="",LASTITEM="",ERROR=0,CHAINE=expr,PTC=1,CC=""
 K @(POLO) S @POLO=0
 S PILEOP=$$TEMP^%SGUTIL K @(PILEOP) S @PILEOP=0
 
LOOP I ERROR G FIN
 
 D LECCAR^%AVXR(CHAINE,.PTC,.CC)
 I CC="" G FIN
 I (CC="(")!(CC=")") S ERROR=1,msg=" presence de parentheses " G FIN
 I CC=" " S PTC=PTC+1 G LOOP
 I CC="%" D ATTRITEMP G LOOP
 I CC="""" D CONSTANTE G LOOP
 I CC=":" D COMMENTAIRE G FIN
 I CC="|" D CODEXPRESS G LOOP
 I CC="$" D VERBE G LOOP
 
 I $$SEPAR^%AVXR(CC)=1 D SEPAR G LOOP
 I $$LETTRE^%AVXR(CC)=1 D ATTRIBUT G LOOP
 I $$CHIFFRE^%AVXR(CC)=1 D NOMBRE G LOOP
 
 I ((($A(CC)'<$A(0))&($A(CC)'>$A(9)))!(CC="."))=0 S ERROR=2,msg=" presence de caractere illegal " G FIN
 Q
ATTRITEMP 
 
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT)
 S TYPEITEM="ATTRIBUT.TEMPORAIRE"
 I (LASTITEM="^")&(LASTTYPE="OPERATEUR.BINAIRE") S TYPEITEM="INDIVIDU.SYMBOLIQUE"
 I (LASTITEM="$indeval")&(LASTTYPE="OPERATEUR.UNAIRE") S TYPEITEM="INDIVIDU.SYMBOLIQUE"
 D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"") S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
ATTRIBUT 
 N FULLMOT S FULLMOT=""
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT)
 I MOT="SI" D PUSH^%AMRANAR(POLO,"DEBUT.CONDITION",MOT,"") S:condition="" condition=1 Q
 I MOT="ALORS" D PUSH^%AMRANAR(POLO,"DEBUT.ACTION",MOT,"") S:condition="" condition=0 Q
 S:condition="" condiion=0
 
 I '($$OKLEX^%AVXR(MOT,.FULLMOT)) S ERROR=3,msg=MOT_" inconnu ou ambigu au  lexique " Q
 
 S TYPEITEM="ATTRIBUT" D PUSH^%AMRANAR(POLO,TYPEITEM,FULLMOT,"")
 S LASTTYPE="ATTRIBUT",LASTITEM=MOT
 Q
CONSTANTE 
 N OK,MOT,CARA S OK=0,MOT="",CARA=""""
 D LECNEXT^%AVXR(CHAINE,CARA,.PTC,.MOT,.OK) I '(OK) S ERROR=4,msg=MOT_" chaine mal formee " Q
 S TYPEITEM="CONSTANTE.CHAINE" D PUSH^%AMRANAR(POLO,TYPEITEM,""""_MOT_"""","")
 S LASTTYPE="CONSTANTE.CHAINE",LASTITEM=MOT
 Q
NOMBRE 
 N OK S OK=0
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT) I '($$NUM^%QZNBN(MOT)) S ERROR=5,msg=MOT_" nombre mal forme " Q
 S TYPEITEM="CONSTANTE.NUMERIQUE" D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"")
 S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
COMMENTAIRE 
 
 S MOT=$E(CHAINE,PTC,$L(CHAINE))
 Q
SEPAR 
 
 
 I "!+-*/#\_;&<>"[CC D BINAIRE S PTC=PTC+1 Q
 I CC="=" D EGAL S PTC=PTC+1 Q
 I CC="^" D CHAPEAU S PTC=PTC+1 Q
 I CC=";" D PTVRG S PTC=PTC+1 Q
 I CC="|" D CODEXPRESS S PTC=PTC+1 Q
 I "!&<>"[CC D BOOLE S PTC=PTC+1 Q
 I "[]"[CC D BRAQUETTE
 
 I CC="'" D NEGATEUR S PTC=PTC+1 Q
 S ERROR=6,msg=CC_" separateur illegal " Q
 
BINAIRE 
 D PUSHOP^%AMRANAR("OPERATEUR.BINAIRE",CC,2) S LASTTYPE="OPERATEUR.BINAIRE",LASTITEM=CC
 S TYPEITEM="OPERATEUR.BINAIRE" D PUSH^%AMRANAR(POLO,TYPEITEM,CC,2)
 Q
CHAPEAU 
 D PUSHOP^%AMRANAR("OPERATEUR.BINAIRE",CC,198E-2) S LASTTYPE="OPERATEUR.BINAIRE",LASTITEM=CC
 S TYPEITEM="OPERATEUR.BINAIRE" D PUSH^%AMRANAR(POLO,TYPEITEM,CC,198E-2)
 Q
EGAL 
 S TYPEITEM=$S(condition=1:"COMPARATEUR.EGAL",1:"AFFECTATION")
 S INFO=$S(condition=1:1,1:4)
 
 D PUSHOP^%AMRANAR(TYPEITEM,CC,2) S LASTTYPE=TYPEITEM,LASTITEM=CC
 D PUSH^%AMRANAR(POLO,TYPEITEM,CC,"2.3")
 Q
CODEXPRESS 
 N OK,MOT,CARF S OK=0,MOT=""
 S CARF="|"
 D LECNEXT^%AVXR(CHAINE,.CARF,.PTC,.MOT,.OK) I '(OK) S ERROR=7,msg=" erreur s ur code d operation anterieure " Q
 I LASTTYPE="VERBE" D PUSHOP^%AMRANAR("FINCODEXPRESS",CC,LASTITEM)
 S TYPEITEM="CODE.EXPRESSION.ANTERIEURE" D PUSH^%AMRANAR(POLO,TYPEITEM,"|"_MOT_"|","")
 S LASTTYPE=TYPEITEM,LASTITEM="|"
 Q
NEGATEUR 
 
 N OPTC S OPTC=PTC
 S CC1=$E(CHAINE,PTC+1) I (CC1="")!(CC1=" ") S ERROR=8,msg=" erreur sur negateur" Q
 I "'!+*/#\_;&^"[CC1 S ERROR=8,msg=" erreur sur negateur" Q
 I "=-[]<>$"[CC1 D PUSHOP^%AMRANAR("NEGATEUR",CC,2) S LASTTYPE="NEGATEUR",LASTITEM=CC
 D PUSH^%AMRANAR(POLO,"NEGATEUR",CC,"1")
 Q
VERBE 
 
 N OK,MOT,CARF S OK=0,MOT=""
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT) I (((MOT="$subex")!(MOT="$indeval"))!(MOT="$puteval"))!(MOT="$geteval") S TYPEITEM=$S(MOT="$subex":"OPERATEUR.UNAIRE",MOT="$indeval":"OPERATEUR.UNAIRE",1:"OPERATEUR.BINAIRE") D PUSHOP^%AMRANAR(TYPEITEM,MOT,$S(MOT="$subex":1,1:2)),PUSH^%AMRANAR(POLO,TYPEITEM,MOT,$S(MOT="$subex":1,1:2)) S LASTTYPE=TYPEITEM,LASTITEM=MOT Q
 I '($$VERBE^%AVXR(MOT,moteur)) S ERROR=9,msg=MOT_" verbe inconnu dans le moteur "_MOTEUR Q
 D PUSHOP^%AMRANAR("VERBE",MOT,"3")
 S TYPEITEM="VERBE" D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"3")
 S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
TEST 
 S msg="",ERROR=0,polon=""
 
 S chaine=" |12|+"" epaisseur"" 343.21 %EPAISSEUR.INITIALE  MODE.DE.GARNISSAGE*|1|"_": commentaire"
 D ^%AV2(chaine,1,"PROCEDURAL",100,.msg,.ERROR,"polon")
 Q
FIN 
 
 
 S DELTA=0 D ^%AV21
 
 
 
 
 
 
 
 
 Q
 ;

