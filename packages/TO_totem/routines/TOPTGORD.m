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

;TOPTGORD^INT^1^59547,74874^0
TOPTGORD ;
 
 S %9N=-1,%9U=$P(^[QUI]GRAPHE(%9GR,%9VER),"^",5),^TWREF($J,TWREF)=1,^DEFTW($J,TWREF)=%9GR_"^"_%9VER_"^"_%9U,%9PI=0
 F %9U=1:1 S %9N=$N(^[QUI]GRAPHE(%9GR,%9VER,%9N)) Q:%9N=-1  D T0 S %9PI=1
 G FIN
SUIT S %9N=-1 F %9U=1:1 S %9N=$N(^POINCOM($J,%9N)) Q:%9N=-1  I ^POINCOM($J,%9N)=1 K ^POINCOM($J,%9N)
 K ^PTINOCOM($J),^CARDPT($J) S %9NP=-1 F %9U=1:1 S %9NP=$N(^POINCOM($J,%9NP)) Q:%9NP=-1  S TWREF=-1 F %9U1=1:1 S TWREF=$N(^POINCOM($J,%9NP,TWREF)) Q:TWREF=-1  S %9PI=$S($D(^PTINIT($J,TWREF)):^PTINIT($J,TWREF),1:"") D T3
 G T4
T3 I %9PI'="",'($D(^POINCOM($J,%9PI))) S ^PTINOCOM($J,TWREF)=1
 S %9POND=$S(%9NP=%9PI:0,1:1),^CARDPT($J,TWREF)=$S($D(^CARDPT($J,TWREF)):^CARDPT($J,TWREF)+%9POND,1:%9POND),^CARDPT($J,TWREF,%9NP)=%9POND G FIN
T4 K ^TRICARD($J),^TWREFVU($J) F %9U=1:1 S TWREF=$N(^CARDPT($J,TWREF)) Q:TWREF=-1  S:'($D(^PTINOCOM($J,TWREF))) ^TRICARD($J,-(^CARDPT($J,TWREF)),TWREF)=1
 K ^ORDOBJ($J) S %9ORD=1,%9TWC="" F %9U=1:1 S %9TWC=$O(^PTINOCOM($J,%9TWC)) Q:%9TWC=""  S TWREF=%9TWC D T2
 S %9NU="" F %9U=1:1 S %9NU=$O(^TRICARD($J,%9NU)) Q:%9NU=""  S TWREF="" F %90=1:1 S TWREF=$O(^TRICARD($J,%9NU,TWREF)) Q:TWREF=""  S ^ORDOBJ($J,%9ORD)=TWREF,%9ORD=%9ORD+1,^TWREFVU($J,TWREF)=1 K ^TRICARD($J,%9NU,TWREF) D T2
 S %9TW=-1 F %9U=1:1 S %9TW=$N(^TWREF($J,%9TW)) Q:%9TW=-1  I '($D(^TWREFVU($J,%9TW))) S ^ORDOBJ($J,%9ORD)=%9TW,%9ORD=%9ORD+1
 G FINI
T2 S %9NP=-1,%9CS=0,%9TWR="" F %9U1=1:1 S %9NP=$N(^CARDPT($J,TWREF,%9NP)) Q:%9NP=-1  S %9TW=-1 F %9U2=1:1 S %9TW=$N(^POINCOM($J,%9NP,%9TW)) Q:%9TW=-1  I '($D(^TWREFVU($J,%9TW))),^CARDPT($J,%9TW)>%9CS S %9CS=^CARDPT($J,%9TW),%9TWR=%9TW
 G:%9TWR="" END
 S TWREF=%9TWR,^TWREFVU($J,TWREF)=1,^ORDOBJ($J,%9ORD)=TWREF,%9ORD=%9ORD+1 K ^TRICARD($J,%9CS,TWREF) G T2
FIN Q
T0 S %9CH=^[QUI]GRAPHE(%9GR,%9VER,%9N),%9EG=$E($P(%9CH,"^",1)) G:(%9EG'="A")&((%9EG'="T")&((%9EG'="P")&(%9EG'="C"))) END G @%9EG
P S %9NP=$P(%9CH,"^",2) G:%9NP="" END S:%9PI=0 ^PTINIT($J,TWREF)=%9NP D T1 G END
T F %9IT=3,6 S %9NP=$P(%9CH,"^",%9IT) I %9NP'="" S:(%9PI=0)&(%9IT=3) ^PTINIT($J,TWREF)=%9NP D T1
 G END
A F %9IT=3,6,9 S %9NP=$P(%9CH,"^",%9IT) I %9NP'="" S:(%9PI=0)&(%9IT=3) ^PTINIT($J,TWREF)=%9NP D T1
 G END
C S %9NP=$P(%9CH,"^",6) I %9PI=0,%9NP'="" S ^PTINIT($J,TWREF)=%9NP
 G T
T1 G:$D(^POINCOM($J,%9NP,TWREF)) END S ^POINCOM($J,%9NP)=$S(($D(^POINCOM($J,%9NP))#10)=1:^POINCOM($J,%9NP)+1,1:1),^POINCOM($J,%9NP,TWREF)=1 G END
END Q
FINI Q

