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

;%QCAGTU7^INT^1^59547,73875^0
TRIWAYER ;
 
 
 S STOP=0,%WT("%2I")=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE) I ($D(@%WT("%2I"))#10)=1 S (%WT("%1C"),%TREFC)="" D @%TAD Q:STOP'=0
 S %WT("%2I")=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE),%WT("%2V")=0,%WT("%2P")=1 F %WT("%2Z")=0:0 S %WT("%2P")=$F(%WT("%2I"),",",%WT("%2P")) Q:%WT("%2P")=0  S %WT("%2V")=%WT("%2V")+1
 S %WT("%2IPR")=%WT("%2V")+1 K %WT("%2V"),%WT("%2P"),%WT("%2I"),%WT("%2Z")
 S %1G=NOMTREE_$S(NOMTREE["(":")",1:""),%WT("%2G")=NOMTREE_$S(%1G[")":",",1:"(")_"%WT(""%2""),",%WT("%2")="" F %WT("%1")=1:1 S (%PR,%WT("%2R"))=%WT("%2IPR"),%WT("%2")=$O(@%1G@(%WT("%2"))) Q:%WT("%2")=""  D AFFR Q:STOP=1
 K %WT,%0,%WT("%2IPR"),%WT("%1C"),%WT("%2G"),%2,%WT("%1"),%WT("%2P"),%1G,%2S,%3S,%WT("%1Z"),%2L Q
AFFR I $D(@%1G@(%WT("%2")))#10 D TR S %TREFC=""""_%WT("%LIB1")_"""",%WT("%1C")=%WT("%2") D @%TAD G:STOP'=0 FRES G:'($D(@%1G@(%WT("%2")))\10) FRES S (%PR,%WT("%2R"))=%PR+1 D ARRAY2 G FRES
 S (%PR,%WT("%2R"))=%PR+1 D ARRAY2
FRES S:STOP="F" STOP=0 Q
ARRAY2 S %2S="%3S)"
DESCEN2 Q:STOP=1  N %2L,%3S,%PR S %PR=%WT("%2R"),%2L=$L(%2S)-4,%3S="" F %WT("%1Z")=0:0 S %3S=$O(@(%WT("%2G")_%2S)) Q:%3S=""  D SUBS2 Q:STOP=1
 Q
SUBS2 I $D(@(%WT("%2G")_%2S))#10 D TR S %TREFC=""""_%WT("%LIB1")_""","_%2S,%WT("%21")=%WT("%2"),%WT("%2")=%3S D TR S %WT("%2")=%WT("%21"),%TREFC=$P(%TREFC,"%3S",1)_""""_%WT("%LIB1")_"""",%WT("%1C")=%3S D @%TAD Q:STOP=1  I STOP="F" S STOP=0 Q
 I $D(@(%WT("%2G")_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)",%WT("%2R")=%PR+1 D DESCEN2 Q:STOP'=0  S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
TR S %WT("%LIB1")=$P(%WT("%2"),"""",1) Q:%WT("%LIB1")=%WT("%2")  S %CAR="""",RS=%WT("%2") D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %WT("%U")=2:1:%NBCAR S %WT("%LI")=$P(%WT("%2"),"""",%WT("%U")),%WT("%LIB1")=%WT("%LIB1")_""""""_%WT("%LI")
FINT K %WT("%LI"),%LIB,RS,%NBCAR,%WT("%U") Q

