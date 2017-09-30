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

;%QXPSUIV^INT^1^59547,73887^0
%QXPSUIV ;;03:20 PM  22 Jul 1992; ; 22 Jul 92  5:31 PM
 
 
SUIV(CHEMIN,ETU,NOMMAT,KEYFIX,KEYNX,X,Y,Z) 
 
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 F %I=1:1:3 S FIX(%I)=0
 F %I=1:1 S %J=$P(KEYFIX,"^",%I) Q:%J=""  S FIX(%J)=1,VAL(%J)=$S(%J=1:X,%J=2:Y,%J=3:Z)
 S ZUGET=KEYNX
 S VAL(ZUGET)=$S(ZUGET=1:X,ZUGET=2:Y,ZUGET=3:Z)
 S ADR1=$S(FIX(1):"SVA1",1:"SVA1B")
 S ADR2=$S(FIX(2):"SVA2",1:"SVA2B")
 S ADR3=$S(FIX(3):"SVA3",1:"SVA3B")
 I CHEMIN="" G NOUV
 
 
SV10 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),CHEMIN),NDC=@GLO@("NOEUD")
 S VU=$$CONCAS^%QZCHAD(GLO,"VU")
 S VOID=$$CONCAS^%QZCHAD(GLO,"VOID")
 F %I=1:1:3 S X(%I)=@GLO@("X",%I)
 G:ZUGET=3 SVA3B
 G:ZUGET=2 SVA2B
 G:ZUGET=1 SVA1B
 
NOUV 
 S CHEMIN=$$GEN^%QCAPOP("chm")
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),CHEMIN),(@GLO@("NOEUD"),NDC)=WHOIS("NDCOUR")
 S VU=$$CONCAS^%QZCHAD(GLO,"VU")
 S VOID=$$CONCAS^%QZCHAD(GLO,"VOID")
BCLND I FIX(1) G:'($D(@ARB@(NDC,"MATRICE",NOMMAT,VAL(1)))) SVA1 S X(1)=VAL(1) G SVG2
 S X(1)=""
SVA1B S X(1)=$O(@ARB@(NDC,"MATRICE",NOMMAT,X(1))) G:X(1)'="" SVG2
SVA1 S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE="")!(%PERE=NDC) Q ""
 S NDC=%PERE
 G BCLND
 
SVG2 I (ZUGET=1)&$D(@VU@(X(1))) G @ADR1
 I FIX(2) S X(2)=VAL(2) G:'($D(@ARB@(NDC,"MATRICE",NOMMAT,X(1),X(2)))) @ADR1 G SVG3
 S X(2)=""
SVA2B S X(2)=$O(@ARB@(NDC,"MATRICE",NOMMAT,X(1),X(2))) G:X(2)'="" SVG3
SVA2 G @ADR1
 
SVG3 I (ZUGET=2)&$D(@VU@(X(2))) G @ADR2
 I FIX(3) S X(3)=VAL(3) G:'($D(@ARB@(NDC,"MATRICE",NOMMAT,X(1),X(2),X(3)))) @ADR2 G SVGS
 S X(3)=""
SVA3B S X(3)=$O(@ARB@(NDC,"MATRICE",NOMMAT,X(1),X(2),X(3))) G:X(3)'="" SVGS
SVA3 G @ADR2
 
SVGS I (ZUGET=3)&$D(@VU@(X(3))) G @ADR3
 I @ARB@(NDC,"MATRICE",NOMMAT,X(1),X(2),X(3))=$C(0) S @VOID@(X(1),X(2),X(3))="" G @ADR3
 I $D(@VOID@(X(1),X(2),X(3))) G @ADR3
 G SUCCES
 
 
SUCCES S @VU@(X(ZUGET))=""
 S @GLO@("NOEUD")=NDC
 F %I=1:1:3 S @GLO@("X",%I)=X(%I)
 Q X(ZUGET)
 
 
INITST 
 D INIETU^%QXPPRIM(2,"TST","EXTERNE")
 S ETU=2
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B1","C1",1)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B2","C1",2)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A1","B1","C2",3)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A3","B3","C1",4)
 D AVANTI^%QXPPRIM(ETU)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B3","C3",5)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A1","B2","C2",6)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B3","C1",7)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B2","C1",8)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A1","B1","C2",$C(0))
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A3","B3","C1",$C(0))
 D AVANTI^%QXPPRIM(ETU)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A1","B3","C4",9)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A2","B1","C5",10)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A1","B2","C3",11)
 D PUSHMAT^%QXPPRIM(ETU,WHOIS("NDCOUR"),"TEST","A3","B1","C1",12)
 Q
 
TST 
 W !,"clef1=A2 ,clef2=B2,  valeurs de clef 3 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","1^2",3,"A2","B2",A) Q:A=""  W !,A
 W ! R R
 
 W !,"clef1=A1 ,clef2=B1,  valeurs de clef 3 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","1^2",3,"A1","B1",A) Q:A=""  W !,A
 W ! R R
 
 W !,"clef1=A2 valeurs de clef 2 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","1",2,"A2",A,"") Q:A=""  W !,A
 W ! R R
 
 W !,"clef3=C3 valeurs de clef 2 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","3^",2,"",A,"C3") Q:A=""  W !,A
 W ! R R
 
 W !,"clef3=C6 valeurs de clef 1 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","3^",1,A,"","C6") Q:A=""  W !,A
 W ! R R
 
 W !,"valeurs de clef 3 : "
 
 S %CH="",A=""
 F %A=0:0 S A=$$SUIV(.%CH,2,"TEST","",3,"","",A) Q:A=""  W !,A
 W ! R R
 
 Q
 ;
 ;
 ;
 ;
 ;
 ;

