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

;%QXPPRIM^INT^1^59547,73887^0
%QXPPRIM ;;02:38 PM  20 Jul 1992; ; 31 Jul 92  3:51 PM
 
 
 
 
PUSHLIST(ETU,NOEUD,NOMLISTE,ELEMENT) 
 N ARB,NOUVND,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S @ARB@(NOEUD,"LISTE",NOMLISTE,ELEMENT)=""
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC(ETU,NOUVND)
 Q
 
 
PULLLIST(ETU,NOEUD,NOMLISTE,ELEMPREC) 
 N %ELEMENT,%PERE,NDC,ARB,OUT,ARBETU
 G PULLB
 S ARB=$$STO(ETU)
 S NDC=NOEUD
PULL2 S %ELEMENT=$O(@ARB@(NDC,"LISTE",NOMLISTE,ELEMPREC))
 I %ELEMENT="" S %PERE=$$PERE^%QARBCON(ETU,NDC) Q:(%PERE="")!(%PERE=NDC) "" S NDC=%PERE G PULL2
 I @ARB@(NDC,"LISTE",NOMLISTE,%ELEMENT)=$C(0) S OUT(%ELEMENT)="" G PULL2
 I $D(OUT(%ELEMENT)) G PULL2
 Q %ELEMENT
 
PULLB N %I
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S NDC=NOEUD
 F %I=0:0 S %ELEMENT=$O(@ARB@(NDC,"LISTE",NOMLISTE,ELEMPREC)) S:%ELEMENT'="" OUT(%ELEMENT)="" S %PERE=$$PERE^%QARBCON(ARBETU,NDC) Q:(%PERE="")!(%PERE=NDC)  S NDC=%PERE
 S %ELEMENT=$O(OUT(ELEMPREC))
 Q %ELEMENT
 
 
 
SUPPLIST(ETU,NOEUD,NOMLISTE,ELEMENT) 
 N ARB,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S @ARB@(NOEUD,"LISTE",NOMLISTE,ELEMENT)=$C(0)
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC(ETU,NOUVND)
 Q
 
 
BELOLIST(ETU,NOEUD,NOMLISTE,ELEMENT) 
 N NDC,%PERE,ARB,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S NDC=NOEUD
BELO2 I $D(@ARB@(NDC,"LISTE",NOMLISTE,ELEMENT)) Q:@ARB@(NDC,"LISTE",NOMLISTE,ELEMENT)=$C(0) 0 Q 1
 S %PERE=$$PERE^%QARBCON(ETU,NDC) I (%PERE="")!(%PERE=NDC) Q 0
 S NDC=%PERE G BELO2
 
 
COPYLIST(ETU,NOEUD,NOMLIST,GLOBAL) 
 N EL,%EL
 S EL="" F %EL=0:0 S EL=$$PULLLIST(ETU,NOEUD,NOMLIST,EL) Q:EL=""  S @GLOBAL@(EL)=""
 Q
 
 
 
PUSHMAT(ETU,NOEUD,NOMMAT,X,Y,INDICE,VALEUR) 
 N ARB,NOUVND,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S @ARB@(NOEUD,"MATRICE",NOMMAT,X,Y,INDICE)=VALEUR
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC(ETU,NOUVND)
 Q
 
 
 
 
SUPPMAT(ETU,NOEUD,NOMMAT,X,Y,INDICE,VALEUR) 
 N ARB,NOUVND
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S @ARB@(NOEUD,"MATRICE",NOMMAT,X,Y,INDICE)=$C(0)
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC(ETU,NOUVND)
 Q
 
 
 
PULLMAT(ETU,NOEUD,NOMMAT,X,Y,INDICE) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S NDC=NOEUD
PULLM2 I $D(@ARB@(NDC,"MATRICE",NOMMAT,X,Y,INDICE)) S %ELEMENT=@ARB@(NDC,"MATRICE",NOMMAT,X,Y,INDICE) Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) Q ""
 S NDC=%PERE
 G PULLM2
 
 
INMAT(ETU,NOEUD,NOMMAT,X,Y,INDICE) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU,R1,R2,A,B,VOID,R3,C
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S VOID=$$TEMP^%SGUTIL
 S NDC=NOEUD
IN1 I X'="" S A=X,R1="R1" G IN2
 S R1="R1C",A=""
R1C S A=$O(@ARB@(NDC,"MATRICE",NOMMAT,A)) G:A'="" IN2
R1 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) K @(VOID) Q 0
 S NDC=%PERE G IN1
 
IN2 I Y'="" S B=Y,R2="R2" G IN3
 S R2="R2C",B=""
R2C S B=$O(@ARB@(NDC,"MATRICE",NOMMAT,A,B)) G:B="" @R1 G IN3
R2 G @R1
 
IN3 I INDICE'="" S C=INDICE,R3="R3" G:'($D(@ARB@(NDC,"MATRICE",NOMMAT,A,B,C))) @R2 G IN4
 S R3="R3C",C=""
R3C S C=$O(@ARB@(NDC,"MATRICE",NOMMAT,A,B,C)) G:C="" @R2 G IN4
R3 G @R2
 
IN4 I $D(@VOID@(A,B,C)) G @R3
 I @ARB@(NDC,"MATRICE",NOMMAT,A,B,C)=$C(0) S @VOID@(A,B,C)="" G @R3
 K @(VOID) Q 1
 
 
 
 
 
 
PUSHVAL(ETU,NOEUD,NOMATTRI,INDICE,VALEUR) 
 N NOUVND,ARB,ARBETU
 S ARBETU=$$ARBETU(ETU),ARB=$$STO(ETU)
 S @ARB@(NOEUD,"ATTRIBUT",NOMATTRI,INDICE)=VALEUR
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC(ETU,NOUVND)
 Q
 
 
 
PULLVAL(ETU,NOEUD,NOMATTRI,INDICE) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU
 S ARB=$$STO(ETU),ARBETU=$$ARBETU(ETU)
 S NDC=NOEUD
PULLV2 I $D(@ARB@(NDC,"ATTRIBUT",NOMATTRI,INDICE)) S %ELEMENT=@ARB@(NDC,"ATTRIBUT",NOMATTRI,INDICE) Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) Q ""
 S NDC=%PERE
 G PULLV2
 
NDCOUR(ETU) 
 Q ^[QUI]ETU(ETU,"NDCOUR")
 
 
AVANTI(ETU) 
 N NDP,NDF,ARBETU
 S NDP=$$NDCOUR(ETU),NDF=$$POPND(ETU),ARBETU=$$ARBETU(ETU)
 D CRNO^%QARBCON(ARBETU,NDP,NDF,"")
 D SETNDC(ETU,NDF)
 Q
 
SETNDC(ETU,NDC) S ^[QUI]ETU(ETU,"NDCOUR")=NDC Q
 
POPND(ETU) N ND S (ND,^[QUI]ETU(ETU,"DERND"))=^[QUI]ETU(ETU,"DERND")+1 Q ND
 
STO(ETU) 
 Q "^[QUI]ETU("""_ETU_""",""ARB"")"
 
ARBETU(ETU) 
 Q "^[QUI]ETU("""_ETU_""",""ARBETU"")"
 
 
 
 
 
 
 
 
INIETU(ETU,MOTEUR,CHARGEMENT) 
 K ^[QUI]ETU(ETU)
 S ^[QUI]ETU(ETU,"NDCOUR")=0
 S ^[QUI]ETU(ETU,"DERND")=0
 S ^[QUI]ETU(ETU,"MOTEUR")=MOTEUR
 S ^[QUI]ETU(ETU,"CHARGEMENT")=CHARGEMENT
 D INISTD(ETU)
 Q
 
 
INISTD(ETU) 
 N R,%R,RI,GLOB
 S GLOB=$$TLIEN^%QSGES21
 S R="" F %R=0:0 S R=$O(@GLOB@(R)) Q:R=""  D PUSHVAL(ETU,0,"NUMEROS.DE.LIENS",R,@GLOB@(R))
 Q
 ;
 ;
 ;

