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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VCOPSCR^INT^1^59547,74034^0
%VCOPSCR ;;02:55 PM  4 Sep 1996
 
 W !,"copie de grille du directory : " R DIR Q:$A(DIR)<32
 W !,"Si la grille existe faut-il la detruire (O/N) ? " R *%DEL S %DEL=$C(%DEL),%DEL=$S(%DEL="O":1,1:0) W !
 D GEGET Q:'($D(^SC($J)))
 K ^GLOB($I) S %NG=1 D INT^%DIR
 S SC="",%NG=1 F %U=0:1 S SC=$O(^SC($J,SC)) Q:SC=""  S ^GLOB($I,%NG)="[DIR]SCRE("""_SC_"""",^GLOB($I,%NG+1)="[DIR]SCRE("""_SC_",COMMENT""",%NG=%NG+2
COPI I '($D(^GLOB($I))) G FIN
 W !,!,%U," Grille",$S(%U>2:"s",1:"")," a copier",!
 S %NG=-1 F %UU=1:1 S %NG=$N(^GLOB($I,%NG)) G:%NG=-1 FIN D TRAIT
TRAIT S (%ARR,NOMTREE)=^GLOB($I,%NG),%ARR="^"_%ARR,%LARR=$L(%ARR) S:$E(NOMTREE,1)'="^" NOMTREE="^"_NOMTREE
 I (NOMTREE'["[")!(NOMTREE'["]") W !,NOMTREE," de quel directory ?" G END
 S %UC=$P($P(NOMTREE,"]",1),"[",2),%UC=$S(%UC["""":$P(%UC,"""",2),1:%UC) I %UC=%DIR W !,NOMTREE,*7," Dangereux ce que vous faites... refusee!" G END
 W !,NOMTREE," " S %TAD="WRIT^UTZRGLC",$ZT="",%TREECOP=$P(NOMTREE,"]",2)
 S %TREEF=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE),%TREEDEL="^"_%TREECOP_$S(%TREECOP["(":")",1:""),%TREECOP=%TREECOP_$S(%TREECOP["(":",",1:"("),%TREE=$P(NOMTREE,"]",1)_"]"_%TREECOP K:%DEL=1 @(%TREEDEL)
 I ($D(@%TREEF)#10)=1 S %RS=@%TREEF,@%TREEDEL=%RS
 S %TREE=$P(%TREEDEL,"(",1),%T=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE_"("""")")
 ;; cao debug ^%Q
 F %U=1:1 S %T=$$^%Q($Q(@%T)) Q:%T=""  S %T=$P(NOMTREE,"]",1)_"]"_$P(%T,"^",2,999) Q:$E(%T,1,%LARR)'=%ARR  D WRIT
END Q
WRIT W "." S %RS=@%T,%NEW=%TREE_"("_$P(%T,"(",2,500),@%NEW=%RS G END
ERR W *7
 I $ZE["SYNTAX" W "Erreur de syntax, " G RET
 I $ZE["UNDEF" W "Parametre indefini dans le nom du global, " G RET
 I $ZE["PROTE" W "Acces a ce global interdit, " G RET
RET W "copie refusee !" G END
FIN K %DEL,%TREE,%NG,%G,%UU,NOMTREE,%NEW,%RS,%TREECOP,%TREEDEL Q
GEGET 
 K ^SC($J)
LP W !,"Grille : " R SC G:$A(SC)<32 FINI G UNK:SC[","
 I $E(SC)="'" S KIL=1,TB="^SC($J)",SC=$E(SC,2,999) G TR
 S KIL=0,TB="^[DIR]SCRE" G TR
TR I $D(@TB@(SC)) S:KIL=0 ^SC($J,SC)="" K:KIL=1 ^SC($J,SC) G LP
 G TIR:SC["-",STA:$E(SC,$L(SC))="*"
UNK W " ???" G LP
TIR S P1=$P(SC,"-",1),P2=$P(SC,"-",2),TB="^[DIR]SCRE"
TIR0 G:(P1="")!(P2="") UNK S P1=$ZP(@TB@(P1)),P2=$O(@TB@(P2)),%U=0 F %V=0:1 S P1=$O(@TB@(P1)) Q:P1=""  Q:P1=P2  I P1'[",COMMENT" S %U=%U+1 S:KIL=0 ^SC($J,P1)="" K:KIL=1 ^SC($J,P1)
 S PL=$S(%U>1:"s",1:"") W " ",%U," Grille",PL,$S(KIL=1:" retiree",1:" selectionnee"),PL G LP
STA S TB="^[DIR]SCRE",P1=$P(SC,"*",1),P2=P1_"z" G TIR0
FINI Q

