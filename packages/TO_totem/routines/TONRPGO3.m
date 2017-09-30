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

;TONRPGO3^INT^1^59547,74873^0
%ZCOPGL2 ;
 
TRAIT S %ARR=NOMTREE,%LARR=$L(%ARR)
 S %TREEF=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE),%TREECF=$S(%TREECOP["(":%TREECOP_")",1:%TREECOP)
 I ($D(@%TREEF)#10)=1 S %RS=@%TREEF,@%TREECF=%RS
 S %TREE=$P(%TREECOP,"(",1),%T=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE_"("""")"),%TREECOP=$S(%TREECOP["(":%TREECOP_",",1:%TREECOP_"(")
 F %U=1:1 S %T=$Q(@%T) Q:%T=""  S %T=$S($E(NOMTREE,2)="[":$P(NOMTREE,"]",1)_"]"_$P(%T,"^",2),1:%T) Q:$E(%T,1,%LARR)'=%ARR  D WRIT
END Q
WRIT S %RS=@%T,%NEW=%TREECOP_$E(%T,%LARR+2,500),@%NEW=%RS G END
FIN K %DEL,%TREE,%NG,%G,%UU,NOMTREE,%NEW,%RS,%TREECOP,%TREEDEL Q
BEG S %TREECOP="^%ZGE",NBLG=0,NBGL=0
TR D NEWGL,%ZCOPGL1 G:$D(@NOMTREE) TR
END1 K DATAC,%TAD,NOMTREE,%TREECOP
FIN1 Q
NEWGL S NBGL=NBGL+1,NOMTREE="^EGZ"_NBGL W !,NOMTREE Q
TEST D BEG

