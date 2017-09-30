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

;%QCAMEM3^INT^1^59547,73875^0
ZSAVMEM ;
 
SAVE I '($D(^SAVMEM($J))) S ^SAVMEM($J)=0
 S ^SAVMEM($J)=^SAVMEM($J)+1,%0=^SAVMEM($J) K ^SAVMEM($J,%0),^SATBMEM($J,%0) S %="%2" F %1=1:1 S %2=$O(@%) Q:%2=""  D AFF
FIN0 K %,%0,%1,%2,%11,%12
FIN Q
AFF I ($D(@%2)#10)=1 S ^SAVMEM($J,%0,%2)=@%2
 I $D(@%2)=1 K @(%2) G END
 I ($D(@%2)\10)=1 S %11="" F %12=1:1 S %11=$O(@%2@(%11)) Q:%11=""  I $D(@%2@(%11))=1 S ^SATBMEM($J,%0,%2,%11)=@%2@(%11) K @%2@(%11)
END S %=%2 G FIN
REST G:'($D(^SAVMEM($J))) FIN
 S %0=^SAVMEM($J),%2="" F %1=1:1 S %2=$O(^SAVMEM($J,%0,%2)) Q:%2=""  S @%2=^SAVMEM($J,%0,%2)
 S %1="" F %11=1:1 S %1=$O(^SATBMEM($J,%0,%1)) Q:%1=""  S %2="" F %12=1:1 S %2=$O(^SATBMEM($J,%0,%1,%2)) Q:%2=""  S @%1@(%2)=^SATBMEM($J,%0,%1,%2)
 S ^SAVMEM($J)=^SAVMEM($J)-1 K ^SAVMEM($J,%0),^SATBMEM($J,%0) G FIN0
ARRAY S VARP=VAR_"(",SUBS="S)"
 
DESCEND N L,S S L=$L(SUBS)-2,S="" F Z=0:0 S S=$O(@(VARP_SUBS)) Q:S=""  D SUBS
 Q
SUBS I $D(@(VARP_SUBS))#10 S @(GLO_SUBS)=@(VARP_SUBS)
 I $D(@(VARP_SUBS))\10 S SUBS=$E(SUBS,1,L)_""""_S_""""_",S)" D DESCEND S SUBS=$E(SUBS,1,L)_"S)"
 Q
 ;

