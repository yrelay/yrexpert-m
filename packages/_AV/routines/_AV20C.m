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

;%AV20C^INT^1^59547,73867^0
%AV20C ;;06:28 PM  29 Oct 1993;
 
 
ANALEX(CHAINE,POLO) 
 
 
 S PCOND=condition
 S PCOMPA=condition
 S SIVU=0
 S polon=""
 
START 
 S LASTTYPE="",LASTITEM="",ERROR=0,CHAINE=expr,PTC=1,CC=""
 K @(POLO) S @POLO=0
LOOP I ERROR G FIN
 D LECCAR^%AVXR(CHAINE,.PTC,.CC)
 I CC="" G FIN
 I (CC="(")!(CC=")") S ERROR=1,msg=" presence de parentheses " G FIN
 I CC=" " S PTC=PTC+1 G LOOP
 I CC="%" D ATTRITEMP G LOOP
 I CC="""" S ERROR=1,msg=" presence de "" " G FIN
 I CC=":" D COMMENTAIRE G FIN
 I CC="|" D CODEXPRESS G LOOP
 I CC="$" D VERBE G LOOP
 I CC=sepmul D MULTI G LOOP
 I CC=sepch D CHAINE G LOOP
 
 I $$SEPAR^%AVXR(CC)=1 D SEPAR G LOOP
 I $$LETTRE^%AVXR(CC)=1 D ATTRIBUT G LOOP
 I $$CHIFFRE^%AVXR(CC)=1 D NOMBRE G LOOP
 
 I ((($A(CC)'<$A(0))&($A(CC)'>$A(9)))!(CC="."))=0 S ERROR=2,msg=" presence de caractere illegal " G FIN
 Q
ATTRITEMP 
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT)
 S TYPEITEM="ATTRIBUT.TEMPORAIRE"
 I (LASTITEM="^")&(LASTTYPE="OPERATEUR.BINAIRE") S TYPEITEM="INDIVIDU.SYMBOLIQUE"
 D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"") S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
ATTRIBUT 
 N FULLMOT S FULLMOT=""
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT)
 I (((MOT="SI")!(MOT="ALORS"))!(MOT="ET"))!(MOT="OU") D @MOT Q
 I '($$OKLEX^%AVXR(MOT,.FULLMOT)) S ERROR=3,msg=MOT_" inconnu ou ambigu au  lexique " Q
 
 S TYPEITEM="ATTRIBUT" D PUSH^%AMRANAR(POLO,TYPEITEM,FULLMOT,"")
 S LASTTYPE="ATTRIBUT",LASTITEM=MOT
 Q
SI I condition S ERROR=12,msg="mot reserve SI non valide" Q
 I SIVU S ERROR=12,msg="mot reserve SI non valide" Q
 S PCOMPA=1,SIVU=1,PCOND=1
 Q
ALORS I condition S ERROR=13,msg="mot reserve ALORS non valide" Q
 I '(SIVU) S ERROR=13,msg="mot reserve ALORS non valide" Q
 I '(PCOND) S ERROR=13,msg="mot reserve ALORS non valide" Q
 S PCOMPA=0,PCOND=0
 D PUSH^%AMRANAR(POLO,"FIN.CONDITION",MOT,"") Q
 
OU I '(PCOND) S ERROR=12,msg="mot reserve OU non valide" Q
 S PCOMPA=1
 D PUSH^%AMRANAR(POLO,"OPERATEUR.BINAIRE",MOT,35E-1) Q
 Q
ET S PCOMPA=1
 D PUSH^%AMRANAR(POLO,"OPERATEUR.BINAIRE",MOT,4) Q
 Q
 
NOMBRE 
 N OK S OK=0
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT) I '($$NUM^%QZNBN(MOT)) S ERROR=5,msg=MOT_" nombre mal forme " Q
 S TYPEITEM="CONSTANTE.NUMERIQUE" D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"")
 S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
CHAINE 
 N OK,MOT,CARF S OK=0,MOT=""
 S CARF=sepch
 D LECNEXT^%AVXR(CHAINE,.CARF,.PTC,.MOT,.OK) I '(OK) S ERROR=7,msg=" erreur s ur code d operation anterieure " Q
 S MOT=@HEAP@(MOT)
 S TYPEITEM="CONSTANTE.CHAINE" D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,"")
 S LASTTYPE=TYPEITEM,LASTITEM=sepch
 Q
 
COMMENTAIRE 
 
 S MOT=$E(CHAINE,PTC,$L(CHAINE))
 Q
 
 
SEPAR 
 
 
 I "[!+-*/#\_;&<>["[CC D BINAIRE S PTC=PTC+1 Q
 I CC="=" D EGAL S PTC=PTC+1 Q
 I CC="^" D CHAPEAU S PTC=PTC+1 Q
 I CC=";" D PTVRG S PTC=PTC+1 Q
 I CC="|" D CODEXPRESS S PTC=PTC+1 Q
 I "!&<>"[CC D BOOLE S PTC=PTC+1 Q
 I "[]"[CC D BRAQUETTE
 
 I CC="'" D NEGATEUR S PTC=PTC+1 Q
 S ERROR=6,msg=CC_" separateur illegal " Q
 
BINAIRE 
 S TYPEITEM="OPERATEUR.BINAIRE" D PUSH^%AMRANAR(POLO,TYPEITEM,CC,$$PRIO(CC)_"/2/2/0")
 S LASTTYPE=TYPEITEM,LASTITEM=CC
 Q
CHAPEAU 
 S TYPEITEM="OPERATEUR.BINAIRE" D PUSH^%AMRANAR(POLO,TYPEITEM,CC,198E-2_"/2/2/0")
 S LASTTYPE=TYPEITEM,LASTITEM=CC
 Q
 
EGAL G:PCOMPA EGALCOMP
 S TYPEITEM="AFFECTATION"
 D PUSH^%AMRANAR(POLO,TYPEITEM,CC,"2.3")
 
 S LASTTYPE=TYPEITEM,LASTITEM=CC
 S PCOMPA=1
 Q
EGALCOMP 
 S TYPEITEM="OPERATEUR.BINAIRE"
 D PUSH^%AMRANAR(POLO,TYPEITEM,CC,3)
 S PCOMPA=0
 S LASTTYPE=TYPEITEM,LASTITEM=CC
 Q
 
CODEXPRESS 
 N OK,MOT,CARF S OK=0,MOT=""
 S CARF="|"
 D LECNEXT^%AVXR(CHAINE,.CARF,.PTC,.MOT,.OK) I '(OK) S ERROR=7,msg=" erreur s ur code d operation anterieure " Q
 I LASTTYPE="VERBE" G UNPARA
 S TYPEITEM="CODE.EXPRESSION.ANTERIEURE" D PUSH^%AMRANAR(POLO,TYPEITEM,"|"_MOT_"|","")
 S LASTTYPE=TYPEITEM,LASTITEM="|"
 Q
UNPARA 
 
 
 D PULL^%AMRANAR(POLO,.OTY,.OVA,.OIN)
 S MINARG=$P(OIN,"/",2),MAXARG=$P(OIN,"/",3)
 S NBARG=1
 I (NBARG<MINARG)!(NBARG>MAXARG) S ERROR=10,msg="nombre de parametres incorrects pour le verbe "_OVA Q
 S $P(OIN,"/",4)=NBARG,$P(OIN,"/",5)=NBARG
 
 
 D PUSH^%AMRANAR(POLO,OTY,OVA,OIN)
 S TYPEITEM="CODE.EXPRESSION.ANTERIEURE" D PUSH^%AMRANAR(POLO,TYPEITEM,"|"_MOT_"|","")
 S LASTTYPE=TYPEITEM,LASTITEM="|"
 Q
 
MULTI 
 N OK,MOT,CARF
 N OTY,OVA,OIN,ARGMIN,ARGMAX
 S OK=0,MOT=""
 S CARF=sepmul
 D LECNEXT^%AVXR(CHAINE,.CARF,.PTC,.MOT,.OK) I '(OK) S ERROR=7,msg=" erreur sur code d'operation anterieure " Q
 I LASTTYPE'="VERBE" S ERROR=8,msg="; parasite"
 
 
 D PULL^%AMRANAR(POLO,.OTY,.OVA,.OIN)
 S MINARG=$P(OIN,"/",2),MAXARG=$P(OIN,"/",3)
 S CHARG=multi(MOT)
 S NBARG=$L(CHARG,"|")
 I (NBARG<MINARG)!(NBARG>MAXARG) S ERROR=10,msg="nombre de parametres incorrects pour le verbe "_OVA Q
 S $P(OIN,"/",4)=NBARG,$P(OIN,"/",5)=NBARG
 
 
 D PUSH^%AMRANAR(POLO,OTY,OVA,OIN)
 
 S TYPEITEM="CODE.EXPRESSION.ANTERIEURE"
 F IARG=1:1:NBARG S (CC,MOT)=$P(CHARG,"|",IARG) D PUSH^%AMRANAR(POLO,TYPEITEM,"|"_MOT_"|","")
 S LASTTYPE=TYPEITEM,LASTITEM="|"
 Q
 
NEGATEUR 
 
 N OPTC S OPTC=PTC
 S CC1=$E(CHAINE,PTC+1) I (CC1="")!(CC1=" ") S ERROR=8,msg=" erreur sur negateur" Q
 I "'!+*/#\_;&^"[CC1 S ERROR=8,msg=" erreur sur negateur" Q
 I "=-[]<>$"[CC1 S LASTTYPE="NEGATEUR",LASTITEM=CC
 
 D PUSH^%AMRANAR(POLO,"OPERATEUR.UNAIRE",CC,32E-1)
 Q
VERBE 
 N OK,MOT,CARF S OK=0,MOT=""
 D LECMOT^%AVXR(CHAINE,.PTC,.MOT)
 I '($$VERBE^%AVXR(MOT,moteur)) S ERROR=9,msg=MOT_" verbe inconnu dans le moteur "_MOTEUR Q
 
 
 S TYPEITEM="VERBE" D PUSH^%AMRANAR(POLO,TYPEITEM,MOT,101E-2_"/1/10/0/0/")
 S LASTTYPE=TYPEITEM,LASTITEM=MOT
 Q
FIN 
 Q
 
 
PRIO(CC) Q:CC="&" 4 Q:CC="!" 35E-1 Q:"><"[CC 3 Q 2
 
TEST 
 S msg="",ERROR=0,polon=""
 
 S chaine=" |12|+"" epaisseur"" 343.21 %EPAISSEUR.INITIALE  MODE.DE.GARNISSAGE*|1|"_": commentaire"
 
 Q

