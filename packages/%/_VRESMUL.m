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

;%VRESMUL^INT^1^59547,74036^0
GERESMUL(SC) 
 
 
 
 
 
 
 K RESUL,AFRESU,PATOUCH,DEJALU
REST N IC
 S IC=$ZP(^SAVMUL($J,SC,"")) G:IC="" FIN
 G:'($D(^SAVMUL($J,SC,IC))) FIN
 S %1G="^SAVMUL($J,SC,IC)",%2="" F %0=1:1 S %2=$O(@%1G@(%2)) Q:%2=""  K @(%2)
 S %2G="^SAVMUL($J,SC,IC,%2,",%2="" F %1=1:1 S %2=$O(@%1G@(%2)) Q:%2=""  D AFFR
 K ^SAVMUL($J,SC,IC),%2G,%2P,%1G,%2S,%3S,%1Z,%2L
RQS G:'($D(^%SCREC(SC,"GERQS"))) FG S %1="" F %2=1:1 S %1=$O(^%SCREC(SC,"GERQS",%1)) G:%1="" FG S %0="S RESUL(%1)="_^%SCREC(SC,"GERQS",%1) X %0
FG K %0,%1,%2 Q
AFFR I $D(@%1G@(%2))#10 S @%2=@%1G@(%2) G:'($D(@%1G@(%2))\10) FRES D ARRAY2 G FRES
 D ARRAY2
FRES Q
ARRAY2 S %2P=%2_"(",%2S="%3S)"
DESCEN2 N %2L,%3S S %2L=$L(%2S)-4,%3S="" F %1Z=0:0 S %3S=$O(@(%2G_%2S)) Q:%3S=""  D SUBS2
 Q
SUBS2 I $D(@(%2G_%2S))#10 S @(%2P_%2S)=@(%2G_%2S)
 I $D(@(%2G_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)" D DESCEN2 S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
FIN Q

