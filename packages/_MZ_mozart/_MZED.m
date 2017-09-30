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

;%MZED^INT^1^59547,73871^0
MOZED ;
 
 
S S EDN=$O(@%TT@($J,0,0)) S:'(EDN) (^(1),^(1,0))=EMP,EDN=1 S (EDFL,EDCL)=EDN,EDLL=EDSL,EDP=1,EDRP=0
C S X=$P(@%TT@($J,0,EDCL),"^",2,999),XOP=$P(@%TT@($J,0,EDCL),"^",1) G 3
RD W EDBE D:IBMPC&(DTM=0) MOZART^%MZPC
 
 S (%TOUCH,%FLECH,%CTR,%ESC)=""
 S IN=$$MORE^%VZATOU(.%TOUCH,.%FLECH,.%CTR,.%ESC,"",0)
 S IN=$S(%TOUCH'="":%TOUCH,%FLECH'="":%FLECH,%CTR'="":"CTRL"_%CTR,%ESC'="":%ESC,1:1) Q
 S:'($T) IN=0 Q
CHR S:'($D(%TAB)) %TAB=0 S LX=$L(X)
 G E:(XOP=1)!(XOP=2),E:LX>500 W $C(IN) I EDP>LX S X=X_$C(IN),EDP=EDP+1 Q:((EDP#RM)'=1)!('(LX))  D POS,W,SRF,POS Q
 S X=$E(X,1,EDP-1)_$C(IN)_$E(X,EDP+EDOV,999),EDP=EDP+1 S:%TAB'=0 X=$E(X,1,80) D W:'(EDOV),SRF:((LX#RM)=0)&LX,POS Q
Q Q
POS I '($D(ED(EDCL))) W $$N S XOC=XOP D MS^%MZEDSF,RF X XY D:(XOC=1)!(XOC=2) @("BLD^%VVIDEO"_$S(XOC=1:",REV^%VVIDEO",1:""))
 S:EDP>$L($$SUB(X)) EDP=$L($$SUB(X))+1 S DX=(EDP-1)#RM,DY=((EDP-1)\RM)+ED(EDCL) I DY>EDSL W $$N D MS^%MZEDSF,RF,MS^%MZEDSF,RF G POS
 I (XOP'=1)&(XOP'=2) X XY D NORM^%VVIDEO
 X XY Q
CTR S %=0 G RP:EDRP,CE:'($D(^MOZED($J,IN))) X ^MOZED($J,IN) G @%
RP S EDR=$S((IN'>%BF(6))!$D(^MOZED($J,IN)):IN,1:128) G CE:'($D(^MOZED($J,EDR))) F EDI=1:1:EDRP X ^MOZED($J,EDR) Q:'(EDRP)
 K EDR,EDI S EDRP=0,DX=0 G @%
3 D RF G 0
2 G 1:'($D(ED(EDCLP))) S EDS=ED(EDCLP),(EDPL,EDL)=EDCLP K ED(EDL) D SSRF G 0
1 D POS,W,SRF
0 D POS
R D PS0,RD G CTR:((IN'>%BF(6))!$D(^MOZED($J,IN)))!EDRP
 I (IN>127)!(IN<32) D E G R
 D CHR G R
E D ^%VSQUEAK S EDRP=0 Q
CE D E G @%
W W $E($$SUB(X),EDP,((EDSL-ED(EDCL))*RM)+RM) X:RM'=$X XL Q
X S ODX=$X,ODY=$Y D NORM^%VVIDEO S DX=ODX,DY=ODY X XY
 S:'($D(XOP)) XOP="" S XOP=$S(XOP'="":XOP,1:0) G E:EDN=0 S @%TT@($J,0,EDCL)=XOP_"^"_X,EDCL=EDN,X=$P(^(EDCL),"^",2,999),XOP=$P(^(EDCL),"^",1)
 
 I XOP=1 S EDP=1,%=1 D BLD^%VVIDEO,REV^%VVIDEO Q
 I XOP=2 S EDP=1,%=1 D BLD^%VVIDEO Q
 Q
CR 
CR1 I (XOP=1)!(XOP=2) D ^%MZEDOP(X,XOP,"M",.X,.%AB) G E
CR11 S ED=$O(@%TT@($J,0,EDCL)),EDN=$S(ED:(EDCL+ED)/2,1:EDCL+1) G E:(EDN=EDCL)!(ED=EDN) S ^(EDN)=$S($D(XOP):XOP,1:0)_"^"_$E(X,EDP,999),X=$E(X,1,EDP-1),^(EDN,0)=EDCL,EDCLP=EDCL,DX=EDP-1,EDP=1,%=$S(EDRP:3,1:2) D X S:ED ^(ED,0)=EDCL S XOP=3 Q
CR2 G E:EDP'=1 S EDP=1,ED=$O(@%TT@($J,0,EDCL)),EDN=$S(ED:(EDCL+ED)/2,1:EDCL+1) G E:(EDN=EDCL)!(ED=EDN) S ^(EDN)=XOP_"^"_X,XOP=3,X="",^(EDCL)=XOP_"^"_X,^(EDN,0)=EDCL,EDCLP=EDCL,DX=EDP-1,EDP=1,%=$S(EDRP:3,1:2),%=3 S:ED @%TT@($J,0,ED,0)=EDN Q
PC I EDP>1 S EDP=EDP-1 Q
PCR S:'($D(%TAB)) %TAB=0 I %TAB'=0 D PL S EDP=$L(X)+1 D X S:XOP=1 %TAB=1 Q
 S EDN=@%TT@($J,0,EDCL,0) G E:'(EDN) D X S EDP=$L(X)+1 Q
NC I EDP'>$L(X) S EDP=EDP+1 Q
NCR 
LOPNC S EDN=$O(@%TT@($J,0,EDCL)) G E:'(EDN) D X
FINNC S EDP=1 Q
DPC G DPCR:EDP'>1 S EDDC=$E(X,EDP-1),X=$E(X,1,EDP-2)_$E(X,EDP,999),EDP=EDP-1,%=1 Q
DPCR S:'($D(%TAB)) %TAB=0 G:%TAB=0 DPCR1 G:XOP>2 DPCR1 S X="",EDN=EDCL D X,^%VSQUEAK Q
DPCR1 S EDN=@%TT@($J,0,EDCL,0) G E:'(EDN) S EDX=$P(@%TT@($J,0,EDN),"^",2,999),ED=$L(EDX),XOP=$P(@%TT@($J,0,EDN),"^",1) I (XOP=1)!(XOP=2) S XOP=0 G E
 G E:(ED+$L(X))>500 S ^(EDN)=$S($D(XOP):XOP,1:XOP,1:"")_"^"_EDX_X,X=$P(^(EDN),"^",2,999),XOP=$P(^(EDN),"^",1)
 K ^(EDCL),ED(EDCL) S:EDFL=EDCL EDFL=EDN S EDCL=EDN,EDP=ED+1,%=1 S:$O(^(EDCL)) ^($O(^(EDCL)),0)=EDCL Q
DNC 
 G E:EDP>$L(X)
 S EDDC=$E(X,EDP),X=$E(X,1,EDP-1)_$E(X,EDP+1,999),%=1 Q
DNCR S EDN=$O(@%TT@($J,0,EDCL)) G E:'(EDN) S EDX=$P(^(EDN),"^",2,999),ED=$L(EDX) G E:(ED+$L(X))>500 S X=X_$P(^(EDN),"^",2,999),XOP=$P(^(EDN),"^",1)
 I (XOP=1)!(XOP=2) D @("BLD^%VVIDEO"_$S(XOP=2:"",1:",REV^%VVIDEO"))
 S ^(EDCL)=$S($D(XOP):XOP,1:0)_"^"_X_$P(@%TT@($J,0,EDN),"^",2,999) S:$O(^(EDN)) ^($O(^(EDN)),0)=EDCL K @%TT@($J,0,EDN),ED(EDN) S:EDFL=EDN EDFL=EDCL S EDP=($L(X)-ED)+1,%=3 Q
PW S:'($D(%TAB)) %TAB=0 G PCR:(EDP'>1)&(%TAB=0) I (EDP'>1)&(%TAB'=0) D PL S EDP=$L(X)+1 D X S:XOP=1 %TAB=1 Q
PWP F EDP=EDP:0 Q:$E(X,EDP-1)'=" "  S EDP=EDP-1
 S EDPP=$L($P(X," ",1,$L($E(X,1,EDP-1)," ")-1))+1,EDP=$L($P(X,",",1,$L($E(X,1,EDP-1),",")-1))+1 S:(EDPP>1)&(EDPP>EDP) EDP=EDPP S:(EDP>1)&($E(X,EDP)=" ") EDP=EDP+1 Q
NW S:'($D(%TAB)) %TAB=0 G NCR:(EDP>$L(X))&(%TAB=0) I (EDP>$L(X))&(%TAB'=0) D NL S EDP=1 Q
NWP S EDPP=(EDP+$L($P($E(X,EDP+1,999)," ",1)))+1,EDP=(EDP+$L($P($E(X,EDP+1,999),",",1)))+1 S:EDPP<EDP EDP=EDPP F EDP=EDP:0 Q:$E(X,EDP)'=" "  S EDP=EDP+1
 Q
DPW S:'($D(%TAB)) %TAB=0 G DPCR:EDP'>1 S ED=EDP D PWP
 S EDDW=$E(X,EDP,ED-1),X=$E(X,1,EDP-1)_$E(X,ED,999),%=1 Q
DNW 
 G E:EDP>$L(X)
 S ED=EDP D NWP S EDDW=$E(X,ED,EDP-1),X=$E(X,1,ED-1)_$E(X,EDP,999),EDP=ED,%=1 Q
PL S:'($D(%TAB)) %TAB=0
LOPPL S EDN=@%TT@($J,0,EDCL,0) G E:'(EDN) D X Q:%TAB=0  G:(X="u0")!((X="u2")!(X="u3")) LOPPL S:(%TAB>0)&(XOP=1) %TAB=1 Q
NL 
LOPNL S EDN=$O(@%TT@($J,0,EDCL)) G E:'(EDN) D X Q
DPL S:'($D(%TAB)) %TAB=0 G DPCR:EDP'>1 S EDDL=$E(X,1,EDP-1),X=$E(X,EDP,999),EDP=1,%=1 Q
DNL 
 G DNCR:(EDP>$L(X))&($L(X)=0)
 G E:EDP>$L(X) S EDDL=$E(X,EDP,999),EDDL(1)=XOP,X=$E(X,1,EDP-1),%=1
 S $P(@%TT@($J,0,EDCL),"^")=3,$P(@%TT@($J,0,EDCL),"^",2)=" ",XOP=3 Q
RF K ED S EDS=0,(EDPL,EDL)=EDFL,EDLLL=EDLL,EDLL=EDSL,(DX,DY)=0 X XY
RFL F EDPL=EDPL:0 S EDPL=$O(ED(EDPL)) Q:(EDPL'<EDL)!('(EDPL))  K ED(EDPL)
 G RCL:'(EDL),RFE:EDS>EDSL I $D(ED(EDL)),ED(EDL)=EDS S EDL="",EDLL=EDLLL G RFE
 S ED(EDL)=EDS,ED=$S(EDL=EDCL:$$SUB(X),1:$$SUB($P(@%TT@($J,0,EDL),"^",2,999))),%WU=$S(EDL=EDCL:XOP,1:$P(@%TT@($J,0,EDL),"^",1)),EDPL=DX+1,DY=(DX\RM)+EDS,DX=DX#RM X XY S XAF=$E(ED,EDPL,((EDSL-EDS)*RM)+RM)
RFL0 
 I %WU=1 D BLD^%VVIDEO,REV^%VVIDEO X XY W XAF X:RM'=$X XL D NORM^%VVIDEO G RFL1
 I %WU=2 W $$N D PT,BLD^%VVIDEO X XY W XAF X:RM'=$X XL D NORM^%VVIDEO G RFL1
 S ODX=DX W $$N S DX=ODX X XY W XAF X:RM'=$X XL
RFL1 S EDS=((($S((EDL=EDCL)&(EDP>$L(ED)):EDP,1:$L(ED))-1)\RM)+1)+EDS,EDPL=EDL,EDL=$O(@%TT@($J,0,EDL)),DX=0 G RFL
RCL S EDLL=EDS-1 F DY=EDS:1:EDLLL X XY,XL
RFE S:EDLL>EDSL EDLL=EDSL K EDLLL,EDPL I EDL F ED=EDL:0 K ED(ED) S ED=$O(ED(ED)) Q:'(ED)
 Q
SRF S %WU=XOP,EDS=((($S(EDP>$L($$SUB(X)):EDP,1:$L($$SUB(X)))-1)\RM)+1)+ED(EDCL),EDPL=EDCL,EDL=$O(@%TT@($J,0,EDCL)),DX=0
SSRF S EDLLL=EDLL,EDLL=EDSL G RFL
PS0 N PX,PY
 S PX=$X,PY=$Y,DY=21,DX=70 X XY W "  " X XY W PX+1 S DX=77 X XY W "  " X XY W PY+1 S DX=PX,DY=PY X XY Q
SUB(%X1) 
 N %X2,%X3
 S %X2="",%X3=$L(%X1,$C(1)) F %U=1:1:%X3 S %X2=%X2_$P(%X1,$C(1),%U)
 Q %X2
N() X XY D NORM^%VVIDEO Q ""
GOLD D ^%VCRIFLD($J("",42),1,21,0,22) X XY D BLD^%VVIDEO,REV^%VVIDEO,^%VCRIFLD($J("",10),1,21,0,22) W $$N D RST Q
RST I (XOP=1)!(XOP=2) X XY D @("BLD^%VVIDEO"_$S(XOP=2:"",1:",REV^%VVIDEO"))
 Q
PT S DX=0 X XY Q

