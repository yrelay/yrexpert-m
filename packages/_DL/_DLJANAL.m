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

;%DLJANAL^INT^1^59547,73868^0
DLJANAL ;
 
 
 
INIT K ^LDANAL($J)
 S ^LDANAL($J,"VAL")=0
 S ^LDANAL($J,"AD")=0
 Q
 
END K ^LDANAL($J)
 Q
 
VALSUIV S ^LDANAL($J,"VAL")=^LDANAL($J,"VAL")+1
 Q
EMPVAL(VAR) Q:'($D(@VAR))
 S ^LDANAL($J,"VAL",^LDANAL($J,"VAL"),VAR)=@VAR
 Q
 
DEPVAL S NIVAL=^LDANAL($J,"VAL")
 S I=""
 F %I=0:0 S I=$O(^LDANAL($J,"VAL",NIVAL,I)) Q:I=""  S @(I_"="""_^LDANAL($J,"VAL",NIVAL,I)_"""")
 S ^LDANAL($J,"VAL")=NIVAL-1
 
DEPAD 
 S NIVAD=^LDANAL($J,"AD")
 S ^LDANAL($J,"AD")=NIVAD-1
 G @^LDANAL($J,"AD",NIVAD)
 
EMPAD(AD) S NIVAD=^LDANAL($J,"AD")+1
 S ^LDANAL($J,"AD",NIVAD)=AD
 S ^LDANAL($J,"AD")=NIVAD
 Q
 
EXPRESS(Y,VISU,COMP,MERR) 
 N POS,I,%I,ERREUR,PCH,MORES1,MORES2,AT,VIRG
 S POS=1,COMP="(",ERREUR=0,MERR="",VIRG=0
 S Y=$$GETLBLAN^%VTLBLAN(Y)
 D EMPAD("FEXPR^%DLJANAL")
EXPR1 S C=$E(Y,POS)
 I C="(" S POS=POS+1,COMP=COMP_"(" D EMPAD("EXPR10^%DLJANAL") G EXPR1
 D EMPAD("EXPR2^%DLJANAL")
 G:C="""" CHAINE
 G:C="$" FONCT
 G:".-"[C NOMBRE
 G:C?1A ATTRIBUT
 G NOMBRE
 
EXPR10 S C=$E(Y,POS)
 I C'=")" S MERR=$$^%QZCHW("Une parenthese etait attendu") D:VISU ^%VZEAVT(MERR) S ERREUR=1 G DEPAD
 S COMP=COMP_")",POS=POS+1
 
EXPR2 G:ERREUR DEPAD
 S C=$E(Y,POS)
 G:C=")" DEPAD
 G:C="" DEPAD
 I C="," G:VIRG DEPAD
 I "_#+-*/\"'[C S MERR=$$^%QZCHW("Un operateur _#+-*/\ etait attendu") D:VISU ^%VZEAVT(MERR) S ERREUR=1 G DEPAD
 S COMP=COMP_C_"(",POS=POS+1
 D EMPAD("EXPR3^%DLJANAL")
 G EXPR1
 
EXPR3 S COMP=COMP_")"
 G EXPR2
 
FEXPR Q:ERREUR 0
 S COMP=COMP_")"
 S C=$E(Y,POS)
 I C'="" S MERR=$$^%QZCHW("Caractere(s) en trop...") D:VISU ^%VZEAVT(MERR) Q 0
 Q 1
 
CHAINE S COMP=COMP_""""
 S POS=POS+1
BCH S C=$E(Y,POS)
 S POS=POS+1
 I C="""" S COMP=COMP_"""" G:$E(Y,POS)="""" CHAINE G DEPAD
 S COMP=COMP_C
 G BCH
 
NOMBRE S C=$E(Y,POS)
 I C="-" S COMP=COMP_"-",POS=POS+1,C=$E(Y,POS)
 G:C="." N3
 F %I=0:0 Q:C'?1N  S COMP=COMP_C,POS=POS+1,C=$E(Y,POS)
 G:C'="." DEPAD
N3 S COMP=COMP_".",POS=POS+1,C=$E(Y,POS)
 F %I=0:0 Q:C'?1N  S COMP=COMP_C,POS=POS+1,C=$E(Y,POS)
 G DEPAD
 
ATTRIBUT D IDF
 G:ERREUR DEPAD
 S CONCUR=$$LEX^%LXSTOCK(PCH,.AT)
 I (CONCUR=1)&VISU D POCLEPA^%VVIDEO W PCH," --> ",AT H 1 D POCLEPA^%VVIDEO G OKAT
 G:CONCUR=1 OKAT
 S MERR=$S(CONCUR>1:PCH_$$^%QZCHW(" est ambigu au lexique"),1:PCH_$$^%QZCHW(" est inconnu au lexique"))
 I '(VISU) S ERREUR=1 G DEPAD
 D ^%VZEAVT(MERR)
 D LEXIQ^%LXSTOCK("REAFF^%DLJANAL") S CONCUR=$$LEX^%LXSTOCK(PCH,.AT)
 I CONCUR=1 D POCLEPA^%VVIDEO W PCH," --> ",AT H 1 D POCLEPA^%VVIDEO G OKAT
 I CONCUR>1 D ^%VZEAVT(PCH_$$^%QZCHW(" est ambigu au lexique"))
 D POCLEPA^%VVIDEO
 S ERREUR=1
 G DEPAD
OKAT S C=$E(Y,POS)
 I C'="'" S PCH="DEFAUT" G ATMORES
 S POS=POS+1,C=$E(Y,POS)
 D IDF
 G:ERREUR DEPAD
ATMORES D VAR(PCH,.MORES1,.MORES2)
 S ^V($J,"PAR",MORES1,MORES2,AT)=""
 S COMP=COMP_"^V($J,"""_MORES1_""","_MORES2_","""_AT_""")"
 G DEPAD
 
IDF S PCH=""
 I C'?1A S ERREUR=1 Q
IDF2 F %I=0:0 Q:C'?1NA  S PCH=PCH_C,POS=POS+1,C=$E(Y,POS)
 I C="." S PCH=PCH_".",POS=POS+1,C=$E(Y,POS) G IDF2
 Q
 
VAR(IDENT,MOTRES1,MOTRES2) 
 I IDENT="ARTICLE" S MOTRES1="ARTICLE",MOTRES2="ART" Q
 I IDENT="PERE" S MOTRES1="ARTICLE",MOTRES2="PERE" Q
 I IDENT="DEFAUT" S MOTRES1="ARTICLE",MOTRES2="DEF" Q
 I IDENT="TETE" S MOTRES1="ARTICLE",MOTRES2="TETE" Q
 I IDENT="GAMME" S MOTRES1="GAMME",MOTRES2="GAMME" Q
 I IDENT="LANCEMENT" S MOTRES1=IDENT,MOTRES2="LANC" Q
 I IDENT="MACHINE1" S MOTRES1=IDENT,MOTRES2="MAC1" Q
 I IDENT="MACHINE2" S MOTRES1=IDENT,MOTRES2="MAC2" Q
 I IDENT="OPERATION1" S MOTRES1=IDENT,MOTRES2="OP1" Q
 I IDENT="OPERATION2" S MOTRES1=IDENT,MOTRES2="OP2" Q
 S MOTRES1="FAMILLE.TECHNO"
 S MOTRES2=""""_IDENT_""""
 Q
 
REAFF D CLEPAG^%VVIDEO
 D ^%VAFIGRI,^%VAFISCR
 Q
 
COMPAR(OPER,VISU,RESOP,UN,MERR) 
 N C,POS
 S RESOP="",POS=1
 S OPER=$$GETLBLAN^%VTLBLAN(OPER)
 S:$E(OPER)="'" RESOP="'",POS=2
 S C=$E(OPER,POS),UN=1
 I "[]=<>"'[C S MERR=$$^%QZCHW("Un comparateur [, ], =, <, >, [], [[, ]], ][ ou sa negation etait attendu") D:VISU ^%VZEAVT(MERR) Q 0
 S RESOP=RESOP_C,POS=POS+1,C=$E(OPER,POS)
 G:(C'="[")&(C'="]") COMPAR2
 S RESOP=RESOP_C,POS=POS+1,UN=0,C=$E(OPER,POS)
COMPAR2 I C'="" S MERR=$$^%QZCHW("Un comparateur [, ], =, <, >, [], [[, ]], ][ ou sa negation etait attendu") D:VISU ^%VZEAVT(MERR) Q 0
 Q 1
 
ETOU(LIB,ETOU,VISU,MERR) 
 S LIB=$$GETLBLAN^%VTLBLAN(LIB)
 I LIB="" S ETOU="&" Q 1
 I LIB=$$^%QZCHW("ET") S ETOU="&" Q 1
 I LIB=$$^%QZCHW("OU") S ETOU="!" Q 1
 S MERR=$$^%QZCHW("Valeurs ET, OU uniquement")
 D:VISU ^%VZEAVT(MERR)
 Q 0
 
TERN(COMP1,OP,Y,VISU,COMPTOT,MERR) 
 N POS,I,%I,ERREUR,PCH,MORES1,MORES2,AT,COMP2,COMP3,COMP,VIRG,NEG
 S POS=1,COMP="(",ERREUR=0,MERR="",NEG="",VIRG=1
 D EMPAD("TERN1^%DLJANAL")
 S Y=$$GETLBLAN^%VTLBLAN(Y)
 G EXPR1
TERN1 Q:ERREUR 0
 I $E(Y,POS)'="," S MERR=$$^%QZCHW("Une , etait attendue") D:VISU ^%VZEAVT(MERR) Q 0
 S POS=POS+1
 S COMP2=COMP_")",COMP="(",VIRG=0
 D EMPAD("TERN2^%DLJANAL")
 G EXPR1
TERN2 Q:ERREUR 0
 S C=$E(Y,POS)
 I C'="" S MERR=$$^%QZCHW("Caractere(s) en trop...") D:VISU ^%VZEAVT(MERR) Q 0
 S COMP3=COMP_")"
 S:$E(OP)="'" NEG="'",OP=$E(OP,2,3)
 S COMPTOT=NEG_"(("_COMP1_$S($E(OP,1,1)="[":"'<",1:">")_COMP2_")&("_COMP1_$S($E(OP,2,2)="[":"<",1:"'>")_COMP3_"))"
 Q 1
 
FONCT G:$E(Y,POS,POS+7)="$ABAQUE(" ABAQUE^%DLJANA2
 G:$E(Y,POS,POS+4)="$MAX(" MAX^%DLJANA2
 S MERR=$$^%QZCHW("Seules les fonctions $ABAQUE et $MAX sont acceptees")
 S ERREUR=1
 D:VISU ^%VZEAVT(MERR)
 G DEPAD
 ;
 ;

