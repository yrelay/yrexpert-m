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

;%VSAVMUL^INT^1^59547,74036^0
GESAVMUL(SC) 
 
 
 
 
 
 
SAVE N IC
 S IC=$ZP(^SAVMUL($J,SC,""))+1
 K ^SAVMUL($J,SC,IC) S %="%2",%3=$P($T(SAV),";;",2) F %4=1:1 S %2=$P(%3,",",%4) Q:%2=""  D AFF
FIN0 K %,%0,%1,%2,%11,%12,%1G,%2P,%3S,%2S,%3,%4
FIN Q
AFF I ($D(@%2)#10)=1 S ^SAVMUL($J,SC,IC,%2)=@%2
 I $D(@%2)=1 G END
 I ($D(@%2)\10)=1 D ARRAY
END S %=%2 G FIN
ARRAY S %1G="^SAVMUL($J,SC,IC,%2,",%2P=%2_"(",%2S="%3S)"
DESCEND N %2L,%3S S %2L=$L(%2S)-4,%3S="" F Z=0:0 S %3S=$O(@(%2P_%2S)) Q:%3S=""  D SUBS
 Q
SUBS I $D(@(%2P_%2S))#10 S @(%1G_%2S)=@(%2P_%2S)
 I $D(@(%2P_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)" D DESCEND S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
SAV ;;m,RESUL,AFRESU,PATOUCH,DEJALU

