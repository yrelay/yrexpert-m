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

;%TXP4RD^INT^1^59547,74032^0
%TXP4RD(t,rfixe,PB) ;;06:27 PM  19 Jul 1993; ; 08 Sep 93 10:08 AM
 
 
 
 
 
 n RMIN,RMAX,rr,ILIGN,r
 s RMIN=$$RMIN(t),RMAX=$$RMAX(t)
 s r=(rfixe\lot)*lot
 q $$CALCUL(t,rfixe,(rfixe\lot)*lot,PB,RMIN,RMAX)
 
CALCUL(t,rfixe,r,PB,RMIN,RMAX) 
 n d,f,qopt,QMIN,QMAX,qx,q,Cqd,TMAX,fmi,fmx,a,r1,rmod,npb,SAVPB,RMIN2,RMAX2,qoptlast,MCOUNT,count,AVOIR
 s MCOUNT=100
 s TMAX=@tmax@(PB),d=@demd@(t)
 s f=VLIMI,qopt=-1,a(4)=f,a(5)=f,fmx=f
 i (rfixe\lot)<RMIN g sol
 s QMIN=$s(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 s QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t))
 i TYPE'>0 s QMAX=$$MIN(QMAX,$$MAX(0,$$MULT(SIGMADT(t)-r,qlot))),QMAX=$$MIN(QMAX,$$MAX(0,$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)))
 s QMIN=(QMIN\qlot)*qlot,QMAX=(QMAX\qlot)*qlot g:QMIN>QMAX sol
 i (t+1)'>PMAX g norm
 s count=0,qoptlast=""
 s fmi=0 f q=QMIN:qlot:QMAX q:count>MCOUNT  s count=count+1,rmod=(r+q)-d i rmod'<0 s Cqd=$$COUT(t,q,r,d) i f>Cqd s f=Cqd,qopt=q,fmx=fmi i qopt'=qoptlast s count=0,qoptlast=qopt
 g sol
 
norm s RMIN2=$$RMIN(t+1),RMAX2=$$RMAX(t+1),q=QMIN
bcqx s rmod=(r+q)-d g:rmod<0 incqx
 s (SAVPB,npb)=PB s:(t+1)>TMAX PB=@tapb@(npb),TMAX=@tmax@(PB) s:(t+1)'>TMAX PB=npb s r1=(rmod\lot)*lot
 s pbza=0
LOOPZA l +@PRD@(t+1,r1)
 i '($d(@PRD@(t+1,r1))) s @PRD@(t+1,r1)="" l -@PRD@(t+1,r1) s valtx=$$CALCUL(t+1,rmod,r1,PB,RMIN2,RMAX2) i valtx'<VLIMI s fmi=VLIMI g retf
 s il=@PRD@(t+1,r1)
 l -@PRD@(t+1,r1)
 i il="" s AVOIR(r1)=q,PB=SAVPB g incqx
 s fmi=@prd@(il,9)
retf s PB=SAVPB i f>fmi s Cqd=$$COUT(t,q,r,d)+fmi i f>Cqd s f=Cqd,qopt=q,fmx=fmi
incqx s q=q+qlot g:q'>QMAX bcqx
 
avoir 
 
 s r1=""
nxav g:'($d(AVOIR)) sol
 s r1=$o(AVOIR(r1)) g:r1="" nxav
 l +@PRD@(t+1,r1):0 e  h 1e-1 g nxav
 
 i '($d(@PRD@(t+1,r1))) s @PRD@(t+1,r1)="" l -@PRD@(t+1,r1) g s2
 s il=@PRD@(t+1,r1)
 l -@PRD@(t+1,r1)
 i il="" g nxav
s2 s q=AVOIR(r1),fmi=@prd@(il,9)
 i f>fmi s Cqd=$$COUT(t,q,r,d)+fmi i f>Cqd s f=Cqd,qopt=q,fmx=fmi
 k AVOIR(r1)
 g nxav
 
sol l +^[QUI]SEMASOL("PRD") s ILIGN=@PRD+1,@PRD=ILIGN l -^[QUI]SEMASOL("PRD")
 i qopt'<0 s a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 s @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx,@prd@(ILIGN,9)=f
 l +@PRD@(t,r) s @PRD@(t,r)=ILIGN l -@PRD@(t,r)
 q f
 
MAX(a,b) q $s(a>b:a,1:b)
MIN(a,b) q $s(a<b:a,1:b)
 
COUT(t,q,r,d) n CT s CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d) q CT
 
 
 
 
COUTPRD(t,q) q:q=0 0
 i $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" q (cprix*q)+stp
 s h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 s xcp1=cp1*h1,xcp2=cp2*h2,cp=xcp1+xcp2,xstp=stp
 q cp+xstp
 
COUTSTK(r) q:r<0 0 q (r*cprix)*(cst/100)
MULT(a,b) 
 n m1 s m1=a\b i (m1*b)<a s m1=m1+1
 q m1*b
 
RMIN(t) 
 n RMIN
 s RMIN=$$MAX(@RMINCO@(t),@RMINP@(t)),RMIN=$$MAX(RMIN,@demd@(t)-@QMAXCO@(t))
 s RMIN=RMIN\lot
 q RMIN
RMAX(t) 
 n RMAX
 s RMAX=$$MIN(@RMAXCO@(t),@RMAXP@(t)),RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 s RMAXI(t)=RMAX
 s RMAX=(RMAX\lot)+1
 i (RMAX*lot)<qlot s RMAX=qlot\lot i RMAX'>0 s RMAX=1
 q RMAX
 ;

