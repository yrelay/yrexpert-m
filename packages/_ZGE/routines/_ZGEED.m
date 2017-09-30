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

;%ZGEED^INT^1^59547,74037^0
%ZGEED ;
S S EDN=$O(^U($J,0,0)) S:'(EDN) (^(1),^(1,0))=EMP,EDN=1 S (EDFL,EDCL)=EDN,EDLL=EDSL,EDP=1,EDRP=0
C S X=^U($J,0,EDCL) G 3
RD R *IN:%BF(5) S:'($T) IN=0 Q
CHR S LX=$L(X) G E:LX>254 W $S(IN:$C(IN),1:"") I EDP>LX S X=X_$S(IN:$C(IN),1:""),EDP=EDP+1 Q:((EDP#RM)'=1)!('(LX))  D POS,W,SRF,POS Q
 S X=$E(X,1,EDP-1)_$S(IN:$C(IN),1:"")_$E(X,EDP+EDOV,999),EDP=EDP+1 D W:'(EDOV),SRF:((LX#RM)=0)&LX,POS Q
Q Q
POS D:'($D(ED(EDCL))) MS^%ZGEEDSF,RF S:EDP>$L(X) EDP=$L(X)+1 S DX=(EDP-1)#RM,DY=((EDP-1)\RM)+ED(EDCL) I DY>EDSL D MS^%ZGEEDSF,RF G POS
 X XY Q
CTR S %=0 G RP:EDRP,CE:'($D(%C(IN))) X %C(IN) G @%
RP S EDR=$S((IN'>%BF(6))!$D(%C(IN)):IN,1:128) G CE:'($D(%C(EDR))) F EDI=1:1:EDRP X %C(EDR) Q:'(EDRP)
 K EDR,EDI S EDRP=0,DX=0 G @%
3 D RF G 0
2 G 1:'($D(ED(EDCLP))) S EDS=ED(EDCLP),(EDPL,EDL)=EDCLP K ED(EDL) D SSRF G 0
1 D POS,W,SRF
0 D POS
R 
 D RD G CTR:((IN>199)!$D(%C(IN)))!EDRP D CHR G R
E W *7 S EDRP=0 Q
CE D E G @%
W W $E(X,EDP,((EDSL-ED(EDCL))*RM)+RM) X:RM'=$X XL Q
X S ^U($J,0,EDCL)=X,EDCL=EDN,X=^(EDCL) Q
CR S ED=$O(^U($J,0,EDCL)),EDN=$S(ED:(EDCL+ED)/2,1:EDCL+1) G E:(EDN=EDCL)!(ED=EDN) S ^(EDN)=$E(X,EDP,999),X=$E(X,1,EDP-1),^(EDN,0)=EDCL,EDCLP=EDCL,DX=EDP-1,EDP=1,%=$S(EDRP:3,1:2) D X S:ED ^(ED,0)=EDCL Q
PC I EDP>1 S EDP=EDP-1 Q
PCR S EDN=^U($J,0,EDCL,0) G E:'(EDN) D X S EDP=$L(X)+1 Q
NC I EDP'>$L(X) S EDP=EDP+1 Q
NCR S EDN=$O(^U($J,0,EDCL)) G E:'(EDN) D X S EDP=1 Q
DPC I EDP>1 S EDDC=$E(X,EDP-1),X=$E(X,1,EDP-2)_$E(X,EDP,999),EDP=EDP-1,%=1 Q
DPCR S EDN=^U($J,0,EDCL,0) G E:'(EDN) S ED=$L(^U($J,0,EDN)) G E:(ED+$L(X))>255 S (X,^(EDN))=(^(EDN))_X K ^(EDCL),ED(EDCL) S:EDFL=EDCL EDFL=EDN S EDCL=EDN,EDP=ED+1,%=1 S:$O(^(EDCL)) ^($O(^(EDCL)),0)=EDCL Q
DNC I EDP'>$L(X) S EDDC=$E(X,EDP),X=$E(X,1,EDP-1)_$E(X,EDP+1,999),%=1 Q
DNCR S EDN=$O(^U($J,0,EDCL)) G E:'(EDN) S ED=$L(^(EDN)) G E:(ED+$L(X))>255 S (X,^(EDCL))=X_(^(EDN)) S:$O(^(EDN)) ^($O(^(EDN)),0)=EDCL K ^U($J,0,EDN),ED(EDN) S:EDFL=EDN EDFL=EDCL S EDP=($L(X)-ED)+1,%=1 Q
PW G PCR:EDP'>1
PWP F EDP=EDP:0 Q:$E(X,EDP-1)'=" "  S EDP=EDP-1
 S EDPP=$L($P(X," ",1,$L($E(X,1,EDP-1)," ")-1))+1,EDP=$L($P(X,",",1,$L($E(X,1,EDP-1),",")-1))+1 S:(EDPP>1)&(EDPP>EDP) EDP=EDPP S:(EDP>1)&($E(X,EDP)=" ") EDP=EDP+1 Q
NW G NCR:EDP>$L(X)
NWP S EDPP=(EDP+$L($P($E(X,EDP+1,999)," ",1)))+1,EDP=(EDP+$L($P($E(X,EDP+1,999),",",1)))+1 S:EDPP<EDP EDP=EDPP F EDP=EDP:0 Q:$E(X,EDP)'=" "  S EDP=EDP+1
 Q
DPW G DPCR:EDP'>1 S ED=EDP D PWP S EDDW=$E(X,EDP+1,ED-1),X=$E(X,1,EDP)_$E(X,ED,999),%=1 Q
DNW G DNCR:EDP>$L(X) S ED=EDP D NWP S EDDW=$E(X,ED,EDP-1),X=$E(X,1,ED-1)_$E(X,EDP,999),EDP=ED,%=1 Q
PL S EDN=^U($J,0,EDCL,0) G E:'(EDN) D X Q
NL S EDN=$O(^U($J,0,EDCL)) G E:'(EDN) D X Q
DPL G DPCR:EDP'>1 S EDDL=$E(X,1,EDP-1),X=$E(X,EDP,999),EDP=1,%=1 Q
DNL G DNCR:EDP>$L(X) S EDDL=$E(X,EDP,999),X=$E(X,1,EDP-1),%=1 Q
RF K ED S EDS=0,(EDPL,EDL)=EDFL,EDLLL=EDLL,EDLL=EDSL,(DX,DY)=0 X XY
RFL F EDPL=EDPL:0 S EDPL=$O(ED(EDPL)) Q:(EDPL'<EDL)!('(EDPL))  K ED(EDPL)
 G RCL:'(EDL),RFE:EDS>EDSL I $D(ED(EDL)),ED(EDL)=EDS S EDL="",EDLL=EDLLL G RFE
 S ED(EDL)=EDS,ED=$S(EDL=EDCL:X,1:^U($J,0,EDL)),EDPL=DX+1,DY=(DX\RM)+EDS,DX=DX#RM X XY W $E(ED,EDPL,((EDSL-EDS)*RM)+RM) X:RM'=$X XL
 S EDS=((($S((EDL=EDCL)&(EDP>$L(ED)):EDP,1:$L(ED))-1)\RM)+1)+EDS,EDPL=EDL,EDL=$O(^U($J,0,EDL)),DX=0 G RFL
RCL S EDLL=EDS-1 F DY=EDS:1:EDLLL X XY,XL
RFE S:EDLL>EDSL EDLL=EDSL K EDLLL,EDPL I EDL F ED=EDL:0 K ED(ED) S ED=$O(ED(ED)) Q:'(ED)
 Q
SRF S EDS=((($S(EDP>$L(X):EDP,1:$L(X))-1)\RM)+1)+ED(EDCL),EDPL=EDCL,EDL=$O(^U($J,0,EDCL)),DX=0
SSRF S EDLLL=EDLL,EDLL=EDSL G RFL

