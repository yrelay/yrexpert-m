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

;%TLCAMTH^INT^1^59572,36250^0
%TLCAMTH ;;06:11 PM  17 Nov 1993; ; 17 Nov 93  6:11 PM
 
 
 
 
 
 
 
 
SIN(X) q $$ARRND($$SINR(X*1745329251994444E-17),7)
 
 
COS(X) q $$ARRND($$COSR(X*1745329251994444E-17),7)
 
 
TG(X) q $$ARRND($$TANR(X*1745329251994444E-17),7)
 
 
COTG(X) q $$ARRND(1/$$TANR(X*1745329251994444E-17),7)
 
ARCSIN(X) q $$ARRND($$ASINR(X)/1745329251994444E-17,7)
 
ARCCOS(X) q $$ARRND($$ACOSR(X)/1745329251994444E-17,7)
 
ARCTG(X) q $$ARRND($$ATANR(X)/1745329251994444E-17,7)
 
ARCCOTG(X) q $$ARRND($$ATANR(X)*1745329251994444E-17,7)
 
 
 
 
SINR(x) n f,t,k,g
 s x=((x+157079632679E-11)#628318530716E-11)-157079632679E-11
 i x>157079632679E-11 s x=31415926535897E-13-x
 i x<1E-4,x>-1E-4 q x
 s (f,t)=x,x=(-(x))*x f k=2:2 s g=f,t=(t*x)/((k+1)*k),f=f+t q:f=g
 q f
 
COSR(x) n f,t,k,g
 s x=x#628318530716E-11 i x>31415926535897E-13 s x=628318530716E-11-x
 s (t,f)=1,x=(-(x))*x f k=2:2 s g=f,t=(t*x)/((k-1)*k),f=f+t q:f=g
 q f
 
TANR(x) q $$SINR(x)/$$COSR(x)
 
COTR(x) q 1/$$TANR(x)
 
SECR(x) q 1/$$COSR(x)
 
CSCR(x) q 1/$$SINR(x)
 
ASINR(x) n bh,bl,i,bc
 
 i x=0 q 0
 s bh=$$PI/2,bl=-(bh)
 f i=1:1:20 d sinsplit
 q bc
sinsplit 
 s bc=(bh+bl)/2
 i $$SINR(bc)>x s bh=bc
 e  s bl=bc
 q
 
ACOSR(x) 
 n bh,bl,i,bc
 
 i x=1 q 0
 s bh=$$PI,bl=0
 f i=1:1:20 d cossplit
 q bc
cossplit 
 s bc=(bh+bl)/2
 i $$COSR(bc)<x s bh=bc
 e  s bl=bc
 q
 
ATANR(x) n bh,bl,i,bc
 i (x#$$PI)=0 q 0
 s bh=$$PI/2,bl=-(bh)
 f i=1:1:20 d tansplit
 q bc
tansplit 
 s bc=(bh+bl)/2
 i $$TANR(bc)>x s bh=bc
 e  s bl=bc
 q
 
 
 
 
SQR(x) n y,z,t
 
 i x=0 q 0
 s y=(1+x)/2 f z=0:0 s t=y,y=((x/t)+t)/2 q:y'<t
 q y
 
SQ(x) 
 q x*x
 
PUIS(x,y) 
 n z
 s y=+(y) i y?1N.N d SPWR q z
 i y?1"-"1N.N d NPWR q z
 q $$EXP(y*$$LN(x))
SPWR s z=1 f i=1:1:y s z=z*x
 q
NPWR s z=1 f i=1:1:-(y) s z=z/x
 q
 
LOG(x) q $$LN(x)/230258509297E-11
 
LOGBN(x,n) 
 q $$LN(x)/$$LN(n)
 
LN(x) n n,p,s,t,j,u
 
 s n=0,p=1 i x>1 s x=1/x,p=-1
 i x<5E-5 f n=-10:-10 s x=x*220264657895E-7 q:x'<5E-5
 i x<7E-3 f n=n-5:-5 s x=x*148413159104E-9 q:x'<7E-3
 i x<4E-1 f n=n-1:-1 s x=x*271828182847E-11 q:x'<4E-1
 i x<8E-1 f n=n-25E-2:-25E-2 s x=x*12840254167E-10 q:x'<8E-1
 s x=x-1,(s,t)=x
 f j=2:1 s t=(-(t))*x,u=(t/j)+s q:s=u  s s=u
 q $$ARRND(p*(s+n),7)
 
PI() q 314159265359E-11
 
E() q 271828182846E-11
 
EXP(x) n s,t0,t1,neg
 s (s,t0,t1)=1,neg=x<0 i neg s x=-(x)
 f i=1:1:x s t1=t1*271828182846E-11,x=x-1
 f i=5E-1:5E-1:x s t1=t1*164872127065E-11,x=x-5E-1
 f j=1:1 s f=x/j,t=t0*f,s=s+t,t0=t q:t<1E-12
 q $s(neg:1/(s*t1),1:s*t1)
 
ABS(x) q $s(x<0:-(x),1:x)
 
ARRND(X,N) 
 n V s V=$$PUIS(10,N) q (((X*V)+$s(X>0:5E-1,1:-5E-1))\1)/V
 
 
 
VARUSER(N) 
 q $s(N=1:QUI,N=2:WHOIS,N=3:^TABIDENT(WHOIS,"NOM"),N=4:$$MODEL^%QSMODEL,N=5:$j,N=6:$$PCONF^%INCASTO("NOMHOST"),N=7:$$P($ZPOS,"^",2)ODE^%SYSUTI1,1:"")
 
 
 
POSITIF(X) 
 q $$PARA^%QZNBN1(X)&(X>0)
 
VERIFLOG(X,Y) 
 q ((($$PARA^%QZNBN1(X)&(X>0))&$$PARA^%QZNBN1(Y))&(Y>0))&(Y'=1)
 
VERIFPWR(X,Y) 
 q $$PARA^%QZNBN1(X)&$$PARA^%QZNBN1(Y)
 
VERIFARC(X) 
 q ($$PARA^%QZNBN1(X)&(X'<-1))&(X'>1)
 
VERIFNUM(X) 
 q $$PARA^%QZNBN1(X)

