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

;%TLKEAN1^INT^1^59547,74029^0
TLKEAN1 ;
 
 
 
 
 
 
SUBST(A,MODE,TAB,TAB2,POS) 
 N TEMPO,TYP,NFONC
 D INIT^%ANGEPIL
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 D EMPIL^%ANGEPIL("SUBST1^%TLKEAN1")
 I MODE="" S MODE="consultation"
 G INT
SUBST1 K @(TEMPO) D EPIL^%ANGEPIL
 Q
 
INT S POS=1 Q:A=0  S TYP=$$RED^%ANA(A,"TYPE")
 G:TYP="COMPARATEUR.BINAIRE" CBI
 G:TYP="COMPARATEUR.TERNAIRE" CTE
 G:TYP="COUPLE" CPL
 G:TYP="FONCTION" SFONC
 G:TYP="FONCTION.LOGIQUE" FLOG^%TLKEAN2
 G:TYP="FONCTION.SPECIALE" FSPE^%TLKEAN2
 
 G:TYP="NEGATION" NEG
 G:TYP="NOMBRE" RET^%ANGEPIL
 G:TYP="ENTIER" RET^%ANGEPIL
 G:TYP="CHAINE" RET^%ANGEPIL
 G:TYP="OPERATEUR" OPE
 G:TYP="OPERATEUR.LOGIQUE" OPL
 G:TYP="VARIABLE" RET^%ANGEPIL
 G:TYP="ALFANUM" RET^%ANGEPIL
 
 
 G:TYP="ATTRIBUT" ATT
 G:TYP="NOM" RET^%ANGEPIL
 G:TYP="IDF" RET^%ANGEPIL
 G:TYP="INDICE" RET^%ANGEPIL
 G:TYP="NIMP" RET^%ANGEPIL
 G:TYP="CHAINEX" CHX
 G:TYP="COMMENT" RET^%ANGEPIL
 
 G:TYP="ACTION" SACT
 D ^%VZEAVT($$^%QZCHW("TLKEAN1 : Type de noeud inconnu = ")_TYP)
 S POS=0 G RET^%ANGEPIL
 
 
SFONC S NFONC=$$RED^%ANA(A,"TEXTE")
 S @TAB2@(NFONC)=""
 G:NFONC="$ABAQUE" ABAQ^%TLKEAN2
 G FON^%TLKEAN2
 
 
SACT S NFONC=$$RED^%ANA(A,"TEXTE")
 
 S:NFONC'="AFFECTATION" @TAB2@(NFONC)=""
 G ACTION^%TLKEAN2
 
 
ATT K @(TEMPO) S @TEMPO@(1)="NOM",@TEMPO@(2)="REP" D EMPV^%ANGEPIL(TEMPO)
 S NOM=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 S REP=$$RED^%ANA(A,3)
 I REP'=0 S REP=$$RED^%ANA(REP,"TEXTE") I $E(REP,1)="%" S REP=0
 I $E(NOM,1)'="%" S @TAB@(NOM,REP,MODE)=""
 G DEPIL^%ANGEPIL
 
 
CBI K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1)
 D EMPIL^%ANGEPIL("CBI1^%TLKEAN1") G INT
CBI1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(A,2) D EMPIL^%ANGEPIL("CBI2^%TLKEAN1") G INT
CBI2 G DEPIL^%ANGEPIL
 
 
CTE K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("CTE1^%TLKEAN1") G INT
CTE1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("CTE2^%TLKEAN1") G INT
CTE2 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,3) D EMPIL^%ANGEPIL("CTE3^%TLKEAN1") G INT
CTE3 G DEPIL^%ANGEPIL
 
 
CPL K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1)
 D EMPIL^%ANGEPIL("CPL1^%TLKEAN1") G INT
CPL1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(A,2) D EMPIL^%ANGEPIL("CPL2^%TLKEAN1") G INT
CPL2 G DEPIL^%ANGEPIL
 
 
NEG K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED^%ANA(A,1)
 D EMPIL^%ANGEPIL("NEG1^%TLKEAN1") G INT
NEG1 G DEPIL^%ANGEPIL
 
 
OPE K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("OPE1^%TLKEAN1") G INT
OPE1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("OPE2^%TLKEAN1") G INT
OPE2 G DEPIL^%ANGEPIL
 
 
OPL K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("OPL1^%TLKEAN1") G INT
OPL1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("OPL2^%TLKEAN1") G INT
OPL2 G DEPIL^%ANGEPIL
 
 
AFF K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1),MODE="affectation"
 D EMPIL^%ANGEPIL("AFF1^%TLKEAN1") G INT
AFF1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,2),MODE="consultation"
 D EMPIL^%ANGEPIL("AFF2^%TLKEAN1") G INT
AFF2 G DEPIL^%ANGEPIL
 
 
CHX K @(TEMPO) S @TEMPO@(1)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("CHX1^%TLKEAN1") G INT
CHX1 I '(POS) G DEPIL^%ANGEPIL
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("CHX2^%TLKEAN1") G INT
CHX2 G DEPIL^%ANGEPIL
 
 
 
INF N I F I=1:1:2 D INT($$RED^%ANA(A,I))
 Q
 
VSP N NF S NF=$$RED^%ANA(A,"TEXTE")
 I NF="$LISTE" G FSLI
 D ^%VZEAVT($$^%QZCHW("ANSARBRE : Fonction speciale inconnue ...")_NF)
 Q
FSLI D INT($$RED^%ANA(A,1)) Q
 
PRE N I F I=1:1:2 D INT($$RED^%ANA(A,I))
 Q

