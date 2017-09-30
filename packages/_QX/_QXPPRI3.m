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

;%QXPPRI3^INT^1^59547,73887^0
%QXPPRI3 ;; ; 30 Jul 92  6:05 PM
 
 
 
PUSHMAT2(ETU,NOEUD,NOMMAT,X,Y,VALEUR) 
 N ARB,NOUVND,ARBETU,GLOENS
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S @ARB@(NOEUD,"MAT2",NOMMAT,X,Y)=VALEUR
 
 S GLOENS="^[QUI]ETU("""_ETU_""",""REMMAT"","""_NOMMAT_""","""_X_""")"
 I $D(@GLOENS@(NOEUD)),'($D(@GLOENS@(NOEUD,Y))) S @GLOENS@(NOEUD,Y)=""
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND^%QXPPRIM(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC^%QXPPRIM(ETU,NOUVND)
 Q
 
 
 
SUPPMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N ARB,NOUVND,ARB,ARBETU,GLOENS
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S @ARB@(NOEUD,"MAT2",NOMMAT,X,Y)=$C(0)
 
 S GLOENS="^[QUI]ETU("""_ETU_""",""REMMAT"","""_NOMMAT_""","""_X_""")"
 I $D(@GLOENS@(NOEUD)),$D(@GLOENS@(NOEUD,Y)) K @GLOENS@(NOEUD,Y)
 I ^[QUI]ETU(ETU,"MOTEUR")="MANUEL" S NOUVND=$$POPND^%QXPPRIM(ETU) D CRNO^%QARBCON(ARBETU,NOEUD,NOUVND,""),SETNDC^%QXPPRIM(ETU,NOUVND)
 Q
 
 
 
 
PULLMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S NDC=NOEUD
PULLM2 I $D(@ARB@(NDC,"MAT2",NOMMAT,X,Y)) S %ELEMENT=@ARB@(NDC,"MAT2",NOMMAT,X,Y) Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) Q:%PERE="" ""
 S NDC=%PERE G PULLM2
 
 
 
INMAT2(ETU,NOEUD,NOMMAT,X,Y) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S NDC=NOEUD
IN1 I $D(@ARB@(NDC,"MAT2",NOMMAT,A,B)) Q:@ARB@(NDC,"MAT2",NOMMAT,A,B)=$C(0) 0 Q 1
 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) Q:%PERE="" 0
 S NDC=%PERE G IN1
 
 
 
 
SUIV2(CHEMIN,ETU,NOMMAT,KEYFIX,KEYNX,X,Y) 
 
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 F %I=1:1:2 S FIX(%I)=0
 F %I=1:1 S %J=$P(KEYFIX,"^",%I) Q:%J=""  S FIX(%J)=1,VAL(%J)=$S(%J=1:X,%J=2:Y)
 S ZUGET=KEYNX
 S VAL(ZUGET)=$S(ZUGET=1:X,ZUGET=2:Y)
 S ADR1=$S(FIX(1):"SVA1",1:"SVA1B")
 S ADR2=$S(FIX(2):"SVA2",1:"SVA2B")
 I CHEMIN="" G NOUV
 
 
SV10 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),CHEMIN),NDC=@GLO@("NOEUD")
 S VU=$$CONCAS^%QZCHAD(GLO,"VU")
 S VOID=$$CONCAS^%QZCHAD(GLO,"VOID")
 F %I=1:1:2 S X(%I)=@GLO@("X",%I)
 G:ZUGET=2 SVA2B
 G:ZUGET=1 SAV1B
 
NOUV 
 S CHEMIN=$$GEN^%QCAPOP("chm")
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),CHEMIN),(@GLO@("NOEUD"),NDC)=WHOIS("NDCOUR")
 S VU=$$CONCAS^%QZCHAD(GLO,"VU")
 S VOID=$$CONCAS^%QZCHAD(GLO,"VOID")
BCLND I FIX(1) G:'($D(@ARB@(NDC,"MAT2",NOMMAT,VAL(1)))) SVA1 S X(1)=VAL(1) G SVG2
 S X(1)=""
SVA1B S X(1)=$O(@ARB@(NDC,"MAT2",NOMMAT,X(1))) G:X(1)'="" SVG2
SVA1 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) Q ""
 S NDC=%PERE
 G BCLND
 
SVG2 I (ZUGET=1)&$D(@VU@(X(1))) G @ADR1
 I FIX(2) S X(2)=VAL(2) G:'($D(@ARB@(NDC,"MAT2",NOMMAT,X(1),X(2)))) @ADR1 G SVG3
 S X(2)=""
SVA2B S X(2)=$O(@ARB@(NDC,"MAT2",NOMMAT,X(1),X(2))) G:X(2)'="" SVGS
SVA2 G @ADR1
 
 
SVGS I (ZUGET=2)&$D(@VU@(X(2))) G @ADR2
 I @ARB@(NDC,"MAT2",NOMMAT,X(1),X(2))=$C(0) S @VOID@(X(1),X(2))="" G @ADR2
 I $D(@VOID@(X(1),X(2))) G @ADR2
 G SUCCES
 
SUCCES S @VU@(X(ZUGET))=""
 S @GLO@("NOEUD")=NDC
 F %I=1:1:2 S @GLO@("X",%I)=X(%I)
 Q X(ZUGET)
 ;
 ;

