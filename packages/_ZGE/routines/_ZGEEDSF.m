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

;%ZGEEDSF^INT^1^59547,74037^0
ZGEEDSF ;
IN S:'($D(%EDI)) %EDI=11 S ^U($J,0,EDCL)=X,$P(%ED,U,1)=%EDI D SET^%ZGEINSF Q
ED S X=^U($J,0,EDCL),$P(%ED,U,1)=%EDE D SET^%ZGEINSF Q
E W *7 S EDRP=0 Q
X S ^U($J,0,EDCL)=X,X=^(EDN),EDCL=EDN Q
PS S EDN=0 F ED=0:0 S ED=^U($J,0,EDFL,0) Q:'(ED)  S EDFL=ED,EDN=((($L(^U($J,0,ED))-1)\RM)+1)+EDN Q:EDN>(EDSL-1)
 G E:'(EDN) S EDN=EDFL,EDP=1,%=3 D X Q
NS S EDN=0 F ED=0:0 S ED=$O(^U($J,0,EDFL)) Q:'(ED)  S EDFL=ED,EDN=((($L(^(ED))-1)\RM)+1)+EDN Q:EDN>(EDSL-1)
 G E:'(EDN) S EDN=EDFL,EDP=1,%=3 D X Q
MS S EDN=0,EDFL=EDCL F ED=0:0 S ED=^U($J,0,EDFL,0) Q:'(ED)  S EDFL=ED,EDN=((($L(^U($J,0,ED))-1)\RM)+1)+EDN Q:EDN>(EDSL/2)
 Q
PLC G E:($L(X)+$L(EDDC))>255 S X=$E(X,1,EDP-1)_EDDC_$E(X,EDP,999),%=1 Q
PLW G E:($L(X)+$L(EDDW))>255 S X=$E(X,1,EDP-1)_EDDW_$E(X,EDP,999),%=1 Q
PLL G E:($L(X)+$L(EDDL))>255 S X=$E(X,1,EDP-1)_EDDL_$E(X,EDP,999),%=1 Q
FQ D IN
 S %Q="Model: ",X=$S($D(EDST)#2:EDST,1:EMP) D ^%ZGEIN S EDST=X D ED Q
FNS S ED=$F($E(X,EDP,999),EDST) I ED S EDP=(EDP+ED)-1 Q
 S EDN=EDCL
 F ED=0:0 S EDN=$O(^U($J,0,EDN)) G E:'(EDN) S ED=$F(^(EDN),EDST) Q:ED
 S EDP=ED D X Q
FRQ D IN
Q1 S %Q="Replace: ",X=$S($D(EDST)#2:EDST,1:EMP) D ^%ZGEIN G FRQQ:%C S EDST=X
Q2 S %Q="with: ^^22",X=$S($D(EDS2)#2:EDS2,1:EMP) D ^%ZGEIN G Q1:(+(%C))=1 S EDS2=X
FRQQ D ED Q
RS G E:($P($E(X,1,EDP-1),EDST,$L($E(X,1,EDP-1),EDST))'=EMP)!(EDP'>1)
 G E:(($L(X)-$L(EDST))+$L(EDS2))>255 S X=$P(X,EDST,1,$L($E(X,1,EDP-1),EDST)-1)_EDS2_$E(X,EDP,999),EDP=(EDP-$L(EDST))+$L(EDS2) Q
FRALL D FRQ Q:%C  F ED=0:0 D FNS Q:'(ED)  D RS
 Q
FRIA D FRQ Q:%C  F ED=0:0 W FNS*
 Q
CTR S DX=0,DY=21 X XY W %Q X XL R *IN:%BF(5) S:'($T) IN=128 W $C((IN+64)#128) I $D(^%ZGE("C",+(%ED),SET,IN,1))#2 S EDR=129,%C(EDR)=^(1) Q
 D E G CTR
TAB S EDPP=8-(EDP#8) S:'(EDPP) EDPP=7 G:($L(X)+EDPP)>255 E S X=$E(X,1,EDP-1)_$J("",EDPP)_$E(X,EDP,999),EDP=EDP+EDPP,%=2,EDCLP=EDCL Q
FB S EDN=0 Q:'(ED)  Q:'($D(^U($J,0,$P(ED,U,1)))#2)  S EDN=$P(ED,U,1) D X S EDP=$S($P(ED,U,2)>$L(X):$L(X)+1,1:$P(ED,U,2)) Q
RB S EDL=EDCL,EDPP=EDP,ED=$S($D(EDBB):EDBB,1:EMP) D FB G E:'(EDN) K ^U($J,1) Q:EDCL>EDL
 I EDL=EDCL Q:EDP'<EDPP  S ^U($J,1,1)=$E(X,EDP,EDPP-1),^(0)=1,X=$E(X,1,EDP-1)_$E(X,EDPP,999),%=1 Q
 G E:((EDP+$L(^U($J,0,EDL)))-EDPP)>255
 S ^U($J,1,1)=$E(X,EDP,999),X=$E(X,1,EDP-1),EDS=EDCL
 F ED=2:1 S EDS=$O(^U($J,0,EDS)) Q:EDS'<EDL  S ^U($J,1,ED)=^U($J,0,EDS) K ^U($J,0,EDS),ED(EDS) S:EDS=EDFL EDFL=EDCL
 S ^U($J,1,ED)=$E(^U($J,0,EDL),1,EDPP-1),^U($J,1,0)=ED,X=X_$E(^U($J,0,EDL),EDPP,999) K ^U($J,0,EDL),ED(EDL) S:EDFL=EDL EDFL=EDCL S EDN=$O(^U($J,0,EDCL)),EDCLP=EDCL,%=2 S:EDN ^(EDN,0)=EDCL Q
WB G E:'($D(^U($J,1))) S ED=^U($J,1,0)
 I ED=1 S ED=^U($J,1,1) G E:($L(X)+$L(ED))>255 S X=$E(X,1,EDP-1)_ED_$E(X,EDP,999),EDBB=EDCL_U_EDP,EDP=EDP+$L(ED),EDCLP=EDCL,%=2 Q
 G E:(((EDP-1)+$L(^U($J,1,1)))>255)!(((($L(^(ED))+$L(X))-EDP)+1)>255)
 S ^U($J,0,EDCL)=$E(X,1,EDP-1)_(^(1)),X=$E(X,EDP,999),EDBB=EDCL_U_EDP,EDL=EDCL,EDN=$O(^U($J,0,EDCL)),EDS=$S(EDN:(EDN-EDCL)/ED,1:1) G E:(EDCL+EDS)=EDCL S EDCLP=EDCL,%=2
 F EDN=2:1:ED-1 S EDPP=EDL,EDL=EDL+EDS,^U($J,0,EDL)=^U($J,1,EDN),^(EDL,0)=EDPP
 S EDPP=EDL,EDCL=EDL+EDS,X=^U($J,1,ED)_X,EDP=$L(^(ED))+1,^U($J,0,EDCL)=X,^(EDCL,0)=EDPP,EDN=$O(^U($J,0,EDCL)) S:EDN ^(EDN,0)=EDCL Q

