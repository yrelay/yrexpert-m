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

;%QCAMEMS^INT^1^59547,73875^0
ZSAVMEM ;
 
 
 g MEM^%QCAMEM
SAVE i '($d(^SAVMEM($j))) s ^SAVMEM($j)=0
 s ^SAVMEM($j)=^SAVMEM($j)+1,%0=^SAVMEM($j) k ^SAVMEM($j,%0),^SATBMEM($j,%0) s %="%2" f %1=1:1 s %2=$o(@%) q:%2=""  d AFF
FIN0 k %,%0,%1,%2,%11,%12,%1G,%2P,%3S,%2S
FIN q
AFF i ($d(@%2)#10)=1 s ^SAVMEM($j,%0,%2)=@%2
 i $d(@%2)=1 g END
 i ($d(@%2)\10)=1 d ARRAY
END s %=%2 g FIN
ARRAY s %1G="^SAVMEM($J,%0,%2,",%2P=%2_"(",%2S="%3S)"
DESCEND n %2L,%3S s %2L=$l(%2S)-4,%3S="" f Z=0:0 s %3S=$o(@(%2P_%2S)) q:%3S=""  d SUBS
 q
SUBS i $d(@(%2P_%2S))#10 s @(%1G_%2S)=@(%2P_%2S)
 i $d(@(%2P_%2S))\10 s %2S=$e(%2S,1,%2L)_""""_%3S_""""_",%3S)" d DESCEND s %2S=$e(%2S,1,%2L)_"%3S)"
 q
 ;

