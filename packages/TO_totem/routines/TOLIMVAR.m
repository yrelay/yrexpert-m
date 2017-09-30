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

;TOLIMVAR^INT^1^59547,74873^0
TOLIMVAR ;
 
L K R,RAR,VAR,T,LOCA,MA,MI S IX=1
 S SI=" |^|,|'=|'<|'>|'[|']|,|'|:|_|@|#|+|*|-|/|\|[|]|(|)|&|!|<|>|=|",SJ=" K | Q | G | I | D | S | F | X | O | U | O:| U:| X:| K:| Q:| G:| I:| D:| S:| F:| W | W:| O | O:| C | C:|",XDP=$S($L(XDP)'<252:$E(XDP,5,299),1:XDP)_" S "
 F TT=1:1 S I=$P(SJ,"|",TT) Q:I=""  S POSI=1 F Z1=0:0 S POSI=$F(XDP,I,POSI) Q:POSI=0  S R(POSI-$L(I))=$L(I)_"|"_I
 S XPX=1,IKS=$N(R(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(R(IK)) Q:IKS=-1  I IKS'=(IK+$P(R(IK),"|",1)) S PCH=$E(XDP,IK+$P(R(IK),"|",1),IKS-1),RAR(XPX)=PCH_"|"_$P(R(IK),"|",2),XPX=XPX+1
 S XPX=1,WW=-1 F AS=0:0 K T S WW=$N(RAR(WW)) Q:WW=-1  D NETOI S XDP="("_EN_")" D SUIT
 Q
SUIT F TT=1:1 S I=$P(SI,"|",TT) Q:I=""  S POSI=1 F Z1=0:0 S POSI=$F(XDP,I,POSI) Q:POSI=0  S T(POSI-$L(I))=$L(I)
 S IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+T(IK)) S PCH=$E(XDP,IK+T(IK),IKS-1),VAR(XPX)=PCH,XPX=XPX+1
 Q
NETOI S EN="",RAR1=$P(RAR(WW),"|",1),FON=$P(RAR(WW),"|",2) F UI=1:2 Q:$P(RAR1,"""",UI)=""  S EN=EN_$P(RAR1,"""",UI)
 Q:(FON'["G")&((FON'["D")&(FON'["W"))
 G:(FON["G:")!((FON["D:")!(FON["W:")) PT
 S EN2="" F RT=1:1 Q:$P(EN,",",RT)=""  S EN2=EN2_$P($P(EN,",",RT),":",2)_","
 S EN=EN2 Q
PT S EN=$P(EN," ",1) Q

