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

;%ANARBR5^INT^1^59547,73866^0
%ANARBR5 ;
 
 
 
 
 
TRAIT S A=$$VALP^%ANARBR3,POS=1,T=$$NEWT^%ANARBR3 D SUPP^%ANARBR3 I A=0 S POS=0 D STOT^%ANARBR3(T,"") Q
 S T=$$RED(A,"TYPE")
 I T="COMPARATEUR.BINAIRE" W *
 I T="COMPARATEUR.TERNAIRE" W *
 I T="COUPLE" W *
 I T="FONCTION" W *
 I T="FONCTION.LOGIQUE" W *
 I T="NEGATION" W *
 I T="NOMBRE" W *
 I T="ENTIER" W *
 I T="CHAINE" W *
 I T="OPERATEUR" W *
 I T="OPERATEUR.LOGIQUE" W *
 I T="VARIABLE" W *
 I T="ALFANUM" W *
 I T="ATTRIBUT" W *
 I T="NOM" W *
 I T="INDICE" W *
 I T="NIMP" W *
 I T="CHAINEX" W *
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBR2 : Type de noeud inconnu = ")_T)
 Q
 
 
NIM() D STOT^%ANARBR3(T,$$RED(A,"TEXTE")) Q
 
CHX() S T=$$RED(A,1) Q $S(T=0:"",1:$$INT(T)_" ")_$$INT($$RED(A,2))
 
NOM() Q $$RED(A,"TEXTE")
 
IND() Q $$RED(A,"TEXTE")
 
ATT() N NOM,IND,VAL,VAR
 S NOM=$$RED($$RED(A,1),"TEXTE")
 S IND=$$RED($$RED(A,2),"TEXTE")
 S VAR=$$RED($$RED(A,3),"TEXTE")
 S:$E(NOM,1)="%" VAR="%" S:VAR="" VAR="@"
 I ('($D(CARBR1(VAR,"BASE"))))!('($D(CARBR1(VAR,"OBJET")))) S POSS=0 Q ""
 S VAL=$$^%QSCALIN(CARBR1(VAR,"BASE"),CARBR1(VAR,"OBJET"),NOM,IND)
 D:AFF'="" @(AFF_"("_""""_NOM_"("_IND_")"_$S(VAR="":"",1:"^"_VAR)_""""_")")
 D:AFF'="" @(AFF_"("_""""_$S(VAL="":"Inconnu ...",1:"--> "_VAL)_""""_")")
 I VAL="" S POSS=0 Q ""
 Q VAL
 
INF() S POSS=0 Q ""
 S E1=$S(C=0:1,1:$$INT(C)) Q:E1="" ""
 S E2=$$INT($$RED(A,2)) Q:E2="" ""
 Q "I "_E1_" "_E2
 
CBI() N E1,E2
 S E1=$$INT($$RED(A,1)) I E1="" S POSS=0 Q ""
 S E1=$$S(E1)
 S E2=$$INT($$RED(A,2)) I E2="" S POSS=0 Q ""
 S E2=$$S(E2)
 S EXP="("_E1_$$RED(A,"TEXTE")_E2_")"
 S @("EXP="_EXP) Q EXP
 
CTE() N E1,E2,OP
 S OP=$$RED(A,"TEXTE")
 S E1=$$INT($$RED(A,1)) I E1="" S POSS=0 Q ""
 S E1=$$S(E1)
 S E2=$$INT($$RED(A,2)) I E2="" S POSS=0 Q ""
 S E2=$$S(E2)
 S EXP="(("_E1_$S($E(OP,1,1)="[":"'<",1:">")_$P(E2,"^",1)_")&("_E1_$S($E(OP,2,2)="[":"<",1:"'>")_$P(E2,"^",2)_"))"
 S @("EXP="_EXP) Q EXP
 
CPL() N E1,E2
 W *
 W *
 Q E1_"^"_E2
 
NEG() N E1 S E1=$$INT($$RED(A,1)) I E1="" S POSS=0 Q ""
 S E1=$$S(E1) Q '(E1)
 
NBR() Q $$RED(A,"TEXTE")
 
ENT() Q $$RED(A,"TEXTE")
 
CHA() Q $$RED(A,"TEXTE")
 
FON() S T=$$RED(A,"TEXTE")
 G:T="$NOM" FONOM
 G:T="$PARTIE" FOPAR
 G:T="$SSCH" FOSSC
 G:T="$DATE" FODAT
 G:T="$HEURE" FOHEU
 G:T="$EQUIVALENT" FOEQU
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBR2 : fonction inconnue = ")_T)
 Q ""
FOEQU Q $$^%ANEQUIV(A,.CARBR1,AFF,.POSS)
FODAT Q $$^%ANDATE(A)
FOHEU Q $$^%ANHEURE
FONOM Q CARBR1($$RED($$RED(A,1),"TEXTE"),"OBJET")
FOPAR N CHA,SEP,POS
 S CHA=$$INT($$RED(A,1)) I CHA="" S POSS=0 Q ""
 S SEP=$$INT($$RED(A,2)) I SEP="" S POSS=0 Q ""
 S POS=$$INT($$RED(A,3)) I POS="" S POSS=0 Q ""
 Q $P(CHA,SEP,POS)
FOSSC N CHA,P1,P2
 W *
 W *
 W *
 Q $E(CHA,P1,P2)
 
OPE() N E1,E2
 S E1=$$INT($$RED(A,1)) I E1="" S POSS=0 Q ""
 S E1=$$S(E1)
 S E2=$$INT($$RED(A,2)) I E2="" S POSS=0 Q ""
 S E2=$$S(E2)
 S EXP="("_E1_$$RED(A,"TEXTE")_E2_")",@("EXP="_EXP) Q EXP
 
PRE() Q $$RED(A,"TEXTE")
 
OPL() Q $$RED(A,"TEXTE")
 
VAR() Q $$RED(A,"TEXTE")
 
ACT() Q ""
 I ACTION="$TEXTE" G ATEX
 I ACTION="$DESSINER" G ADES
 I ACTION="$GAMME" G AGAM
 I ACTION="$COMMENT" G ACOM
 I ACTION="$QQSOIT" G AQQS
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Action inconnue ...")) Q
AQQS N ATT,LIG,TEX
 S LIG=$$INT($$RED(A,3)) Q:LIG="" ""
 S ATT=$$RED(A,1),ATT=$$RED($$RED(ATT,1),"TEXTE")
 S TEX=$$RED(A,2),TEX=$$RED(TEX,"TEXTE")
 Q "$QQSOIT("_ATT_";"_TEX_";"_LIG_")"
ATEX N E1,AL S E1=$$INT($$RED(A,1)) Q:E1="" ""
 S AL=$$RED(A,2) Q:AL=0 "$TEXTE("_E1_")"
 Q "$TEXTE("_E1_";"_$$INT(AL)_")"
ADES N OB,VE,MO,LI
 S OB=$$RED($$RED(A,1),"TEXTE")
 S VE=$$INT($$RED(A,2)) Q:VE="" ""
 S MO=$$INT($$RED(A,3)) Q:MO="" ""
 S LI=$$INT($$RED(A,4)) Q:LI="" ""
 Q "$DESSINER("_OB_";"_VE_";"_MO_";"_LI_")"
AGAM N E1 S E1=$$INT($$RED(A,1)) Q:E1="" "" Q "$GAMME("_E1_")"
ACOM N CO,LI
 S CO=$$INT($$RED(A,1)) Q:CO="" ""
 S LI=$$INT($$RED(A,2)) Q:LI="" ""
 Q "$COMMENT("_CO_";"_LI_")"
 
ALF() Q $$RED(A,"TEXTE")
 
S(E) Q $S(E'?.N:""""_$$ZSUBST^%QZCHSUB(E,"""","""""")_"""",1:E)
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

