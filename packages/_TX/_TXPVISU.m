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

;%TXPVISU^INT^1^59547,74033^0
%TXPVISU ;;05:41 PM  25 Mar 1993; ; 13 Mar 93  4:14 PM
 
AUTRE 
 W !,"nom du global " R GLO
 S A=GLO,G=$$CONCAS^%QZCHAD(GLO,"ARB")
 D TEST
 Q
ARBRE(ETUDE,ATELIER) 
 N TEMP,G,R,U,TITRE
 S A="^[QUI]arb("""_ETUDE_""","""_ATELIER_""")"
 S G="^[QUI]arb("""_ETUDE_""","""_ATELIER_""",""ARB"")"
 D TEST
 Q
TEST 
 N U
 S U=$$INIGLOUC
 
 S TITRE="1"_$C(0)_"1"_$C(0)_"arborescence"_$C(0)
 D ^%QULELU(G,G,7,3,U,TITRE)
 K @(U)
 Q
XXX(TP) 
 S printer=0,VISU=0
 S RACINE=@TP@("O")
 D CLEPAG^%VVIDEO
 W !,RACINE,!,"------------------------"
 
 
 U printer W !,?10,"* valeur * ",$$PULLVAL^%TXPPRIM(A,RACINE,"VALEUR",1),$S($D(@A@("EXT",RACINE)):" e ",1:"")
 
 S TYPE=$$PULLVAL^%TXPPRIM(A,RACINE,"TYPE",1)
 S VMIN=$$PULLVAL^%TXPPRIM(A,RACINE,"VALEUR.DE.CONTRAINTE",1)
 S %capa=$O(@etuatcg@(""))
 S PERIODE=$$PULLVAL^%TXPPRIM(A,RACINE,"PERIODE.A.ARBITRER",1),VCTR="*"
 I PERIODE>0 S VCTR=$$PULLMAT^%TXPPRIM(A,RACINE,"VALEUR.MAXI.DE.CONTRAINTE",PERIODE,%capa)
 S REALISA=$$PULLVAL^%TXPPRIM(A,RACINE,"IRREALISABLE",1)
 U printer W !,?10,"* periode a arbitrer * ",PERIODE
 S ARTICLE=$$PULLVAL^%TXPPRIM(A,RACINE,"ARTICLE.A.ARBITRER",1)
 U printer W !,?10,"* article a arbitrer * ",ARTICLE
 U printer W !,?10,"* type * ",TYPE," realisable : ",$S(REALISA="NON":"OUI",1:"NON")
 U printer W !,?10,"* valeur de contrainte * ",VMIN
 U printer W !,?10,"* valeur MAXI de contrainte * ",VCTR," en ",PERIODE
 U printer W !,?10,"* valeur de jauge* ",$S($D(@A@("VAL",RACINE)):@A@("VAL",RACINE),1:"indefinie")
 U printer W " quantite ctg (min) ",$$PULLMAT^%TXPPRIM(A,RACINE,"QMINP",PERIODE,ARTICLE)
 U printer W " quantite ctg (max) ",$$PULLMAT^%TXPPRIM(A,RACINE,"QMAXP",PERIODE,ARTICLE)
 U printer W !,"     nombre de libres ",$$PULLVAL^%TXPPRIM(A,RACINE,"NOMBRE.DE.VARIABLES.LIBRES",PERIODE),!
 D ^%VZEAVT("")
 S MODG=0
 Q
 
 
ABRV(L,LG) S V=@L Q $E(V,6,$L(V))
 
 
FULL(TP) 
 N GAG,VAL S GAG=@TP@("O")
 S TYPE=$$PULLVAL^%TXPPRIM(A,GAG,"TYPE",1)
 S VAL=$$PULLVAL^%TXPPRIM(A,GAG,"VALEUR",1)
 
 Q GAG_"  (type "_TYPE_" valeur "_VAL_")"
 
 
 
printarb(A,RACINE) 
 N N,i,j,TYPE,VMIN
 
 
 U printer W !,"*** sommet ***  ",RACINE,"   de pere ",$S($D(@A@("INV",RACINE)):@A@("INV",RACINE),1:"indefini")
 U printer W !,?10,"* valeur * ",$S($D(@A@("VAL",RACINE)):@A@("VAL",RACINE),1:"inconnue"),$S($D(@A@("EXT",RACINE)):" e ",1:"")
 S TYPE=$$PULLVAL^%TXPPRIM(A,RACINE,"TYPE",1)
 S VMIN=$$PULLVAL^%TXPPRIM(A,RACINE,"VALEUR.DE.CONTRAINTE",1)
 S %capa=$O(@etuatcg@(""))
 S PERIODE=$$PULLVAL^%TXPPRIM(A,RACINE,"PERIODE.A.ARBITRER",1),VCTR="*"
 I PERIODE>0 S VCTR=$$PULLMAT^%TXPPRIM(A,RACINE,"VALEUR.MAXI.DE.CONTRAINTE",PERIODE,%capa)
 S REALISA=$$PULLVAL^%TXPPRIM(A,RACINE,"IRREALISABLE",1)
 U printer W !,?10,"* periode a arbitrer * ",PERIODE
 S ARTICLE=$$PULLVAL^%TXPPRIM(A,RACINE,"ARTICLE.A.ARBITRER",1)
 U printer W !,?10,"* article a arbitrer * ",ARTICLE
 U printer W !,?10,"* type * ",TYPE," realisable : ",$S(REALISA="NON":"OUI",1:"NON")
 U printer W !,?10,"* valeur de contrainte * ",VMIN
 U printer W !,?10,"* valeur MAXI de contrainte * ",VCTR," en ",PERIODE
 U printer W !,?10,"* valeur de jauge* ",$S($D(@A@("VAL",RACINE)):@A@("VAL",RACINE),1:"indefinie")
 U printer W " quantite ctg (min) ",$$PULLMAT^%TXPPRIM(A,RACINE,"QMINP",PERIODE,ARTICLE)
 U printer W " quantite ctg (max) ",$$PULLMAT^%TXPPRIM(A,RACINE,"QMAXP",PERIODE,ARTICLE)
 U printer W !,"     nombre de libres ",$$PULLVAL^%TXPPRIM(A,RACINE,"NOMBRE.DE.VARIABLES.LIBRES",PERIODE),!
 U printer W !,?10,"* ici les fils de * ",RACINE,! U 0 I printer=0,VISU>1 R *u
 U printer S N="",j=10 F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  W:j>75 ! S:j>75 j=10 W ?j,"* ",N," *"
 I $O(@A@("ARB",RACINE,""))="" G FPRINT
 S N="" F i=1:1 S N=$O(@A@("ARB",RACINE,N)) Q:N=""  D printarb(A,N)
 
FPRINT 
 I printer=0 U 0 R *xxx
 U printer W !
 Q
 
INIGLOUC() 
 N U
 S U=$$TEMP^%SGUTIL
 S @U@("AUTRE",1)="XXX^%TXPVISU",@U@("AUTRE",1,"TXT")="caracteristiques",@U@("AUTRE",1,"COM")="caracteristiques noeud",@U@("AUTRE",1,"CTR")="B",@U@("AUTRE",1,"NUMUC")=1
 S @U@("AFF")="$$ABRV^%TXPVISU"
 S @U@("FULL")="$$FULL^%TXPVISU"
 Q U

