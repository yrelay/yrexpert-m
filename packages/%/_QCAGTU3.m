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

;%QCAGTU3^INT^1^59547,73875^0
%ZTREEWR ;
 
 S %2I=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE),%2V=0,%2P=1 F %2Z=0:0 S %2P=$F(%2I,",",%2P) Q:%2P=0  S %2V=%2V+1
 S %2IPR=%2V+1 K %2V,%2P,%2I,%2Z S STOP=0,%1G=NOMTREE_$S(NOMTREE["(":")",1:""),%2G=NOMTREE_$S(%1G[")":",",1:"(")_"%2,",%2="" F %1=1:1 S (%PR,%2PR)=%2IPR,%2=$O(@%1G@(%2)) Q:%2=""  D AFFR Q:STOP=1
 K %0,%2IPR,%1C,%2G,%2,%1,%2P,%1G,%2S,%3S,%1Z,%2L Q
AFFR I $D(@%1G@(%2))#10 S %TREFC=""""_%2_"""",%1C=%2 D @%TAD G:STOP'=0 FRES G:'($D(@%1G@(%2))\10) FRES S (%PR,%2PR)=%PR+1 D ARRAY2 G FRES
 S (%PR,%2PR)=%PR+1 D ARRAY2
FRES S:STOP="F" STOP=0 Q
ARRAY2 S %2S="%3S)"
DESCEN2 Q:STOP=1  N %2L,%3S,%PR S %PR=%2PR,%2L=$L(%2S)-4,%3S="" F %1Z=0:0 S %3S=$O(@(%2G_%2S)) Q:%3S=""  D SUBS2 Q:STOP=1
 Q
SUBS2 I $D(@(%2G_%2S))#10 S %TREFC=""""_%2_""","_%2S,%TREFC=$P(%TREFC,"%3S",1)_""""_%3S_"""",%1C=%3S D @%TAD Q:STOP=1  I STOP="F" S STOP=0 Q
 I $D(@(%2G_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)",%2PR=%PR+1 D DESCEN2 Q:STOP'=0  S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
TEST W !,"nom du global : " R NOMTREE Q:NOMTREE=""  S %TAD="ECR^%QCAGTU4" D DEB^%VTIME,^%QCAGTU4,AFF^%VTIME G TEST
ECR W !,%TREFC,"  ","%PR=",%PR Q

