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

;%VBASPAG^INT^1^59547,74034^0
GEBASPAG(S,XG,YH,XD,YB,MES,AD) 
 K ^OPT($J),^BASP($J),^ADRC($J),^GOCC($J),^LCR($J) S LI="",LGI=0,LMX=(XD-XG)-1,LC=YB,CC=XG+1 S:LC>23 LC=23 S ^LCR($J,LC)=""
 F %U=1:1 S %V=$P(MES,",",%U) Q:%V=""  S %W=$P(%V,"/",2),%V=$$^%QZCHW($P(%V,"/",1)),LGC=(LGI+$L(%V))+1 D:LGC>LMX INCR S ^LCR($J,LC)=^LCR($J,LC)_%V_" ",^BASP($J,LC,CC)=%V,^OPT($J,%V)=LC_"/"_CC,^ADRC($J,LC,CC)=%W,CC=(CC+$L(%V))+1,LGI=(LGI+$L(%V))+1
 S MES=$S($D(^%SCRE(S,"OPTIONS")):^%SCRE(S,"OPTIONS"),1:""),%U=0
LPU S %U=%U+1,%V=$P(MES,",",%U) G:%V="" FPU
 S %W=$P(%V,":",2),%V=$$^%QZCHW($P(%V,":",1)),LGC=(LGI+$L(%V))+1 D:LGC>LMX INCR
 S ^LCR($J,LC)=^LCR($J,LC)_%V_" ",^BASP($J,LC,CC)=%V,^OPT($J,%V)=LC_"/"_CC,^ADRC($J,LC,CC)=AD,^GOCC($J,LC,CC)=%W,CC=(CC+$L(%V))+1,LGI=(LGI+$L(%V))+1 G LPU
FPU K LI,LGI,LC,LMX,CC Q
INCR S LGI=0,CC=XG+1,LC=LC+1,^LCR($J,LC)="" Q

