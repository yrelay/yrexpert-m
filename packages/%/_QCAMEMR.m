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

;%QCAMEMR^INT^1^59547,73875^0
ZRESMEM ;
 
 
 g RMEM^%QCAMEM
REST g:'($d(^SAVMEM($j))) FIN k
 s %0=^SAVMEM($j),%1G="^SAVMEM($J,%0)",%2G="^SAVMEM($J,%0,%2,",%2="" f %1=1:1 s %2=$o(@%1G@(%2)) q:%2=""  d AFFR
 k ^SAVMEM($j,%0),%0,%2G,%2,%1,%2P,%1G,%2S,%3S,%1Z,%2L s ^SAVMEM($j)=^SAVMEM($j)-1 q
AFFR i $d(@%1G@(%2))#10 s @%2=@%1G@(%2) g:'($d(@%1G@(%2))\10) FRES d ARRAY2 g FRES
 d ARRAY2
FRES q
ARRAY2 s %2P=%2_"(",%2S="%3S)"
DESCEN2 n %2L,%3S s %2L=$l(%2S)-4,%3S="" f %1Z=0:0 s %3S=$o(@(%2G_%2S)) q:%3S=""  d SUBS2
 q
SUBS2 i $d(@(%2G_%2S))#10 s @(%2P_%2S)=@(%2G_%2S)
 i $d(@(%2G_%2S))\10 s %2S=$e(%2S,1,%2L)_""""_%3S_""""_",%3S)" d DESCEN2 s %2S=$e(%2S,1,%2L)_"%3S)"
 q
FIN q

