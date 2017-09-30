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

;%QSACTVL^INT^1^59547,73880^0
%QSACTVL(A,CONTEXT) ;;09:06 AM  6 May 1992;
 
 
 
 
 N T Q $$INT(A)
INT(A) Q:A=0 "" S T=$$RED^%ANA(A,"TYPE")
 I T="OBJET" Q $$OBJ
 I T="IDF" Q $$NOM
 I T="COMPARATEUR.BINAIRE" Q $$CBI
 I T="COMPARATEUR.TERNAIRE" Q $$CTE
 I T="COUPLE" Q $$CPL
 I T="FONCTION.LOGIQUE" Q $$FLO
 I T="NEGATION" Q $$NEG
 I T="NOMBRE" Q $$NBR
 I T="ENTIER" Q $$ENT
 I T="CHAINE" Q $$CHA
 I T="FONCTION" Q $$FON
 I T="OPERATEUR" Q $$OPE
 I T="PRECEDENCE" Q $$PRE
 I T="OPERATEUR.LOGIQUE" Q $$OPL
 I T="VARIABLE" Q $$VAR
 I T="ACTION" Q $$ACT
 I T="ALFA" Q $$ALF
 I T="INFERENCE" Q $$INF
 I T="ATTRIBUT" Q $$ATT
 I T="NOM" Q $$NOM
 I T="INDICE" Q $$IND
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("RQSARBR2 : Type de noeud inconnu = "_T))
 Q
 
 
NOM() Q $$RED^%ANA(A,"TEXTE")
 
IND() Q $$RED^%ANA(A,"TEXTE")
 
ATT() N NOM,IND,VAL,VAR
 S NOM=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 S IND=$$RED^%ANA($$RED^%ANA(A,2),"TEXTE")
 S VAR=$$RED^%ANA($$RED^%ANA(A,3),"TEXTE")
 S:$E(NOM,1)="%" VAR="%" S:VAR="" VAR="@"
 S VAL=$S($D(@CONTEXT@(VAR,NOM)):@CONTEXT@(VAR,NOM),1:"")
 Q $S(VAL?1N.N:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 
OBJ() N NOM,VAL,VAR
 S NOM=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 S VAR=$$RED^%ANA($$RED^%ANA(A,2),"TEXTE")
 S:$E(NOM,1)="%" VAR="%" S:VAR="" VAR="@"
 S VAL=$S($D(@CONTEXT@(VAR,NOM)):@CONTEXT@(VAR,NOM),1:"")
 Q $S(VAL?1N.N:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 
INF() N C,E1,E2 S C=$$RED^%ANA(A,1)
 S E1=$S(C=0:1,1:$$INT(C)) Q:E1="" ""
 S E2=$$INT($$RED^%ANA(A,2)) Q:E2="" ""
 Q "I "_E1_" "_E2
 
CBI() N E1,E2
 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" ""
 S E2=$$INT($$RED^%ANA(A,2)) Q:E2="" ""
 Q "("_E1_$$RED^%ANA(A,"TEXTE")_E2_")"
 
CTE() N E1,E2,OP
 S OP=$$RED^%ANA(A,"TEXTE")
 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" ""
 S E2=$$INT($$RED^%ANA(A,2)) Q:E2="" ""
 Q "(("_E1_$S($E(OP,1,1)="[":"'<",1:">")_$P(E2,"^",1)_")&("_E1_$S($E(OP,2,2)="[":"<",1:"'>")_$P(E2,"^",2)_"))"
 
CPL() N E1,E2
 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" ""
 S E2=$$INT($$RED^%ANA(A,2)) Q:E2="" ""
 Q E1_"^"_E2
 
FLO() N FLO S FLO=$$RED^%ANA(A,"TEXTE")
 G:FLO="$EXISTE" FEXIS
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("RQSARBR2 : fonction logique inconnue = ")_FLO)
 Q ""
FEXIS N ATR,CH,VATR S ATR=$$RED^%ANA(A,1),CH=$$RED^%ANA(A,2)
 S VATR=$$INT(ATR)
 
 Q:CH=0 "("_VATR_"'="""")"
 
 N IND,NOM,VAR S CH=$$INT(CH) Q:CH="" ""
 S NOM=$$RED^%ANA(ATR,1),IND=$$RED^%ANA(ATR,2),VAR=$$RED^%ANA(ATR,3)
 
 Q:IND'=0 "("_VATR_"="_CH_")" S NOM=$$INT(NOM),VAR=$$INT(VAR)
 S:VAR="" VAR="@"
 
 
 Q "$$^%QSCALVA("""_CONTEXT(VAR,"BASE")_""","""_CONTEXT(VAR,"OBJET")_""","""_NOM_""")'="""""
 
 
NEG() N E1 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" "" Q "('"_E1_")"
 
NBR() Q $$RED^%ANA(A,"TEXTE")
 
ENT() Q $$RED^%ANA(A,"TEXTE")
 
CHA() Q """"_$$ZSUBST^%QZCHSUB($$RED^%ANA(A,"TEXTE"),"""","""""")_""""
 
FON() Q:$$RED^%ANA(A,"TEXTE")'="$PARAM" ""
 N VAL
 S VAL=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 S VAL=@TEMPOPAR@(VAL)
 Q $S(VAL?1N.N:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 
OPE() N E1,E2
 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" ""
 S E2=$$INT($$RED^%ANA(A,2)) Q:E2="" ""
 Q "("_E1_$$RED^%ANA(A,"TEXTE")_E2_")"
 
PRE() Q $$RED^%ANA(A,"TEXTE")
 
OPL() Q $$RED^%ANA(A,"TEXTE")
 
VAR() Q $$RED^%ANA(A,"TEXTE")
 
ACT() N ACTION S ACTION=$$RED^%ANA(A,"TEXTE")
 I ACTION="$TEXTE" G ATEX
 I ACTION="$DESSINER" G ADES
 I ACTION="$GAMME" G AGAM
 I ACTION="$COMMENT" G ACOM
 I ACTION="$QQSOIT" G AQQS
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Action inconnue ...")) Q
AQQS N ATT,LIG,TEX
 S LIG=$$INT($$RED^%ANA(A,3)) Q:LIG="" ""
 S ATT=$$RED^%ANA(A,1),ATT=$$RED^%ANA($$RED^%ANA(ATT,1),"TEXTE")
 S TEX=$$RED^%ANA(A,2),TEX=$$RED^%ANA(TEX,"TEXTE")
 Q "$QQSOIT("_ATT_";"_TEX_";"_LIG_")"
ATEX N E1,AL S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" ""
 S AL=$$RED^%ANA(A,2) Q:AL=0 "$TEXTE("_E1_")"
 Q "$TEXTE("_E1_";"_$$INT(AL)_")"
ADES N OB,VE,MO,LI
 S OB=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 S VE=$$INT($$RED^%ANA(A,2)) Q:VE="" ""
 S MO=$$INT($$RED^%ANA(A,3)) Q:MO="" ""
 S LI=$$INT($$RED^%ANA(A,4)) Q:LI="" ""
 Q "$DESSINER("_OB_";"_VE_";"_MO_";"_LI_")"
AGAM N E1 S E1=$$INT($$RED^%ANA(A,1)) Q:E1="" "" Q "$GAMME("_E1_")"
ACOM N CO,LI
 S CO=$$INT($$RED^%ANA(A,1)) Q:CO="" ""
 S LI=$$INT($$RED^%ANA(A,2)) Q:LI="" ""
 Q "$COMMENT("_CO_";"_LI_")"
 
ALF() Q $$RED^%ANA(A,"TEXTE")

