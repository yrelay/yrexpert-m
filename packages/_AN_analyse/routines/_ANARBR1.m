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

;%ANARBR1^INT^1^59547,73866^0
%ANARBR1 ;
 
 
 
 
SUBST(ARBRE,CARBR1,AFF) N TYP Q $$INT(ARBRE)
INT(ARBRE) Q:ARBRE=0 "" S TYP=$$RED(ARBRE,"TYPE")
 I TYP="COMPARATEUR.BINAIRE" Q $$CBI
 I TYP="COMPARATEUR.TERNAIRE" Q $$CTE
 I TYP="COUPLE" Q $$CPL
 I TYP="FONCTION.LOGIQUE" Q $$FLO
 I TYP="NEGATION" Q $$NEG
 I TYP="NOMBRE" Q $$NBR
 I TYP="ENTIER" Q $$ENT
 I TYP="CHAINE" Q $$CHA
 I TYP="FONCTION" Q $$FON
 I TYP="OPERATEUR" Q $$OPE
 I TYP="PRECEDENCE" Q $$PRE
 I TYP="OPERATEUR.LOGIQUE" Q $$OPL
 I TYP="VARIABLE" Q $$VAR
 I TYP="ACTION" Q $$ACT
 I TYP="ALFA" Q $$ALF
 I TYP="INFERENCE" Q $$INF
 I TYP="ATTRIBUT" Q $$ATT
 I TYP="NOM" Q $$NOM
 I TYP="INDICE" Q $$IND
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("ANSARBR1 : Type de noeud inconnu = ")_TYP)
 Q
 
 
NOM() Q $$RED(ARBRE,"TEXTE")
 
IND() Q $$RED(ARBRE,"TEXTE")
 
ATT() N NOM,IND,VAL,VAR
 S NOM=$$RED($$RED(ARBRE,1),"TEXTE")
 S IND=$$RED($$RED(ARBRE,2),"TEXTE")
 S VAR=$$RED($$RED(ARBRE,3),"TEXTE")
 S:$E(NOM,1)="%" VAR="%" S:VAR="" VAR="@"
 S VAL=$$^%QSCALIN(CARBR1(VAR,"BASE"),CARBR1(VAR,"OBJET"),NOM,IND)
 D @(AFF_"("_""""_NOM_"("_IND_")"_$S(VAR="":"",1:"^"_VAR)_""""_")")
 D @(AFF_"("_""""_$S(VAL="":"Inconnu ...",1:"--> "_VAL)_""""_")")
 Q $S(VAL?1N.N:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 
INF() N C,E1,E2 S C=$$RED(ARBRE,1)
 S E1=$S(C=0:1,1:$$INT(C)) Q:E1="" ""
 S E2=$$INT($$RED(ARBRE,2)) Q:E2="" ""
 Q "I "_E1_" "_E2
 
CBI() N E1,E2
 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" ""
 S E2=$$INT($$RED(ARBRE,2)) Q:E2="" ""
 Q "("_E1_$$RED(ARBRE,"TEXTE")_E2_")"
 
CTE() N E1,E2,OP
 S OP=$$RED(ARBRE,"TEXTE")
 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" ""
 S E2=$$INT($$RED(ARBRE,2)) Q:E2="" ""
 Q "(("_E1_$S($E(OP,1,1)="[":"'<",1:">")_$P(E2,"^",1)_")&("_E1_$S($E(OP,2,2)="[":"<",1:"'>")_$P(E2,"^",2)_"))"
 
CPL() N E1,E2
 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" ""
 S E2=$$INT($$RED(ARBRE,2)) Q:E2="" ""
 Q E1_"^"_E2
 
FLO() N FLO S FLO=$$RED(ARBRE,"TEXTE")
 G:FLO="$EXISTE" FEXIS
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("ANARBR1 : fonction logique inconnue = ")_FLO)
 Q ""
FEXIS N ATR,CH,VATR S ATR=$$RED(ARBRE,1),CH=$$RED(ARBRE,2)
 S VATR=$$INT(ATR)
 
 Q:CH=0 "("_VATR_"'="""")"
 
 N IND,NOM,VAR S CH=$$INT(CH) Q:CH="" ""
 S NOM=$$RED(ATR,1),IND=$$RED(ATR,2),VAR=$$RED(ATR,3)
 
 Q:IND'=0 "("_VATR_"="_CH_")" S NOM=$$INT(NOM),VAR=$$INT(VAR)
 S:VAR="" VAR="@"
 
 Q "$$AIR^%QSGEST5("""_CARBR1(VAR,"BASE")_""","""_CARBR1(VAR,"OBJET")_""","""_NOM_""")"
 
NEG() N E1 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" "" Q "('"_E1_")"
 
NBR() Q $$RED(ARBRE,"TEXTE")
 
ENT() Q $$RED(ARBRE,"TEXTE")
 
CHA() Q """"_$$ZSUBST^%QZCHSUB($$RED(ARBRE,"TEXTE"),"""","""""")_""""
 
FON() S TYP=$$RED(ARBRE,"TEXTE")
 G:TYP="$NOM" FONOM
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("ANSARBR1 : fonction inconnue = ")_TYP)
 Q ""
FONOM Q CARBR1($$RED($$RED(ARBRE,1),"TEXTE"),"OBJET")
 
OPE() N E1,E2
 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" ""
 S E2=$$INT($$RED(ARBRE,2)) Q:E2="" ""
 Q "("_E1_$$RED(ARBRE,"TEXTE")_E2_")"
 
PRE() Q $$RED(ARBRE,"TEXTE")
 
OPL() Q $$RED(ARBRE,"TEXTE")
 
VAR() Q $$RED(ARBRE,"TEXTE")
 
ACT() N ACTION S ACTION=$$RED(ARBRE,"TEXTE")
 I ACTION="$TEXTE" G ATEX
 I ACTION="$DESSINER" G ADES
 I ACTION="$GAMME" G AGAM
 I ACTION="$COMMENT" G ACOM
 I ACTION="$QQSOIT" G AQQS
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Action inconnue ")) Q
AQQS N ATT,LIG,TEX
 S LIG=$$INT($$RED(ARBRE,3)) Q:LIG="" ""
 S ATT=$$RED(ARBRE,1),ATT=$$RED($$RED(ATT,1),"TEXTE")
 S TEX=$$RED(ARBRE,2),TEX=$$RED(TEX,"TEXTE")
 Q "$QQSOIT("_ATT_";"_TEX_";"_LIG_")"
ATEX N E1,AL S E1=$$INT($$RED(ARBRE,1)) Q:E1="" ""
 S AL=$$RED(ARBRE,2) Q:AL=0 "$TEXTE("_E1_")"
 Q "$TEXTE("_E1_";"_$$INT(AL)_")"
ADES N OB,VE,MO,LI
 S OB=$$RED($$RED(ARBRE,1),"TEXTE")
 S VE=$$INT($$RED(ARBRE,2)) Q:VE="" ""
 S MO=$$INT($$RED(ARBRE,3)) Q:MO="" ""
 S LI=$$INT($$RED(ARBRE,4)) Q:LI="" ""
 Q "$DESSINER("_OB_";"_VE_";"_MO_";"_LI_")"
AGAM N E1 S E1=$$INT($$RED(ARBRE,1)) Q:E1="" "" Q "$GAMME("_E1_")"
ACOM N CO,LI
 S CO=$$INT($$RED(ARBRE,1)) Q:CO="" ""
 S LI=$$INT($$RED(ARBRE,2)) Q:LI="" ""
 Q "$COMMENT("_CO_";"_LI_")"
 
ALF() Q $$RED(ARBRE,"TEXTE")
 
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

