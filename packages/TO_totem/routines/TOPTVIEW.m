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

;TOPTVIEW^INT^1^59547,74874^0
TOPTVIEW ;
 
 D:'(%TABTRA) CLEAR^%VVIDEO S:'($D(%9ECH)) %9ECH=1 S %9NP=-1,%9POP=-1 K ^PARGR($J)
 F %9V="%9XDEB","%9YDEB" S ^PARGR($J,%9V)=$S($D(^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA",%9V)):^[QUI]GRDEFOBJ(%9GR,%9VER,5,"DATA",%9V),1:$S(%9V="%9XDEB":2000,1:1500))
 S:'($D(%9VISIN)) %9VISIN=0
 S %9XDEB=^PARGR($J,"%9XDEB"),%9YDEB=^PARGR($J,"%9YDEB") I %9AR'=0 S %9XD1=%9XDEB,%9YD1=%9YDEB D ^PTANGROT
 D ^%PBPZGRA S %FONC="INIT" D ^%PBPZ S %FONC="PRENDRE" D ^%PBPZ
 S:'($D(%9XTR)) %9XTR=0 S:'($D(%9YTR)) %9YTR=0 D ^%PBPZCLR,^PTCADRE,^PTCADECH
 N %9RM S %9RM=0 G RMS
RM N %9RM S %9RM=1
RMS S %9POP=-1,%9TT="^[QUI]GRDEFOBJ(%9GR,%9VER)"
 F %9V=1:1 S %9POP=$N(@%9TT@(%9POP)) Q:%9POP=-1  S %9NP=-1 F %9U=1:1 S %9NP=$N(@%9TT@(%9POP,"COM",%9NP)) Q:%9NP=-1  S %9R=@%9TT@(%9POP,"COM",%9NP),%9TC=":",%9X=$P(%9R,"^",1),%9Y=$P(%9R,"^",2),%9MSGE=%9NP D C0
 G C1
C0 Q:((%9NP["R=")!(%9NP["A="))!(%9NP["/")
 D XY^PTCONVER(%9X,%9Y,.%9X,.%9Y),^PTPOSMSG Q
 S %9XD1=(%9X+%9XTR)*%9ECH,%9YD1=(%9Y+%9YTR)*%9ECH I %9AR'=0 D ROT^PTANGROT S %9XD1=%9XD2,%9YD1=%9YD2
 S %9X=%9XD1,%9Y=%9YD1 D ^PTPOSMSG Q
C1 
 I ($D(^[QUI]GRAPHE(%9GR,%9VER))#10)'=1 S ^[QUI]GRAPHE(%9GR,%9VER)=1_"^"_%DAT_"^"_%DAT_"^"_1_"^1?^1?"
 S %92="^[QUI]GRAPHE(%9GR,%9VER)",%9ECHS=$P(@%92,"^",1) S:%9ECHS="" %9ECHS=1 I %9ECHS["/" S @("%91="_%9ECHS),%9ECHS=%91 K %91
 S %9XES=$P(@%92,"^",5),%9ZES=$P(@%92,"^",6) S:%9ZES="" %9ZES="???" S:%9XES="" %9XES="1?" D PECH K %92
 K %9NP,%9TT,%9V,%9U,%9TC,%9MSGE,%9X,%9X S:'($D(REP)) REP="C" D BEG^PTGETGR G:REP="C" FIN S %9X=200,%9Y=2700,%9MSGE="Objet "_%9GR_"     version "_%9VER_"   ",%9TC=8 D ^PTPOSMSG
FIN Q
PECH I $D(%9RM) Q:%9RM
 Q:%TABTRA  S %9TC=":",%9MSGE=%9ZES_" mm",%9X=400,%9Y=2920 D ^PTPOSMSG Q

