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

;TO43PEDC^INT^1^59547,74871^0
TO43PEDC ;
 
 U 0 K ^POSENR(DOLARI) S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("Encore un petit instant...")
 S NU=-1,PAGE=1,LG=0 F UU=0:0 S NU=$N(^V(DOLARI,YA,NU)) Q:NU=-1  I ^V(DOLARI,YA,NU)'="" S VAL="PARAMETRE^"_NU_"^"_^V(DOLARI,YA,NU) D CONSTA
 S NU=-1,VAL="LISTE^",PAGE=$S($D(^POSENR(DOLARI,PAGE)):PAGE+1,1:PAGE),LG=0 F UU=1:1 S NU=$N(^TO4GEXPL(DOLARI,NU)) Q:NU=-1  S VAL=VAL_NU_$S(NU>9:"",1:" ")_" : "_^TO4GEXPL(DOLARI,NU)_"^" I (UU#2)=0 D CONSTA S VAL="LISTE^"
 D:(UU#2)=0 CONSTA
ECR S NU=-1,PAGE=PAGE+1,LG=0 F UU=0:0 S NU=$N(^EQUIVAL(DOLARI,NU)) G:NU=-1 END D ALORS
ALORS S VAL="SOLUTION1^"_NU_"^"_$P($P(^EQUIVAL(DOLARI,NU),"^",1),"/",1) D CONSTA S VAL="SOLUTION2^"_$P(^EQUIVAL(DOLARI,NU),"^",1) D CONSTA
 S VAL="SOLUTION3^"_$P(^EQUIVAL(DOLARI,NU),"^",3)_"^"_$P(^EQUIVAL(DOLARI,NU),"^",2) D CONSTA D:$D(^DESACOR(DOLARI,NU)) EXP
 Q
EXP S VAL="DESACCORD^" F VV=1:1 S VD=$P(^DESACOR(DOLARI,NU),"^",VV) Q:VD=""  S VAL=VAL_VD_"^" I (VV#2)=0 D CONSTA S VAL="DESACCORD^"
 D:(VV#2)=0 CONSTA Q
END K VV,UU,LG,VAL,NU,VD Q
CONSTA S LG=LG+1 S:LG>LILIM PAGE=PAGE+1,LG=1
 S ^POSENR(DOLARI,PAGE,LG)=VAL

