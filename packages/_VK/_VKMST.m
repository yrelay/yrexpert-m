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

;%VKMST^INT^1^59547,74035^0
VLMSTO ;
 
 S P1=RESUL(3),MQ=RESUL(2)
 S P2=0 I $D(^[QUI]ARTV(NR)) S P2=$P(^[QUI]ARTV(NR),"^",4)
 S:P2=0 P2=P1 D TOSTOK I AQ'>0 S P=P1,V=0 G VLMSTO+5
 S Q3=AQ,Q1=(AQ-MQ)/Q3,Q2=MQ/Q3,P=(P1*Q1)+(P2*Q2),V=Q3*P
 S RESUL(4)=P,RESUL(5)=V D LOOP^%VAFIGRI,^%VAFISCR
 Q
TOSTOK S AQ=0 Q:'($D(^[QUI]ARTS(NR)))  S RZ=^[QUI]ARTS(NR)
 F I=1:1:^%SCRE("ARTS") I (I#6)=2 S RZZ=$P(RZ,"^",I) D CLEAR S AQ=AQ+RZZ
 Q
CLEAR Q:RZZ=0
 S RZZ2=$P(RZZ,".",1) I RZZ2=0 S RZZ="."_$P(RZZ,".",2) Q
 S RZZ1=$P(RZZ,".",2) Q:RZZ1=""
LOOP S LL=$L(RZZ1) I $E(RZZ1,LL)=0 S RZZ1=$E(RZZ1,1,LL-1) G LOOP
 S RZZ=$P(RZZ,".",1)_"."_RZZ1
 F Z=0:0 S PB=$F(RZZ," ") Q:(PB=0)!($E(RZZ,1)'=" ")  S RZZ=$E(RZZ,PB,$L(RZZ)+1)
 Q

