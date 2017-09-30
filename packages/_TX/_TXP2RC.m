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

;%TXP2RC^INT^1^59547,74032^0
%TXP2RC(t,rfixe,pb) 
 n d,RMIN,RMAX,rlot,f,qopt,QMIN,QMAX,qx,q,Cqd,ILIGN,PB,TMAX,fmi,fmx,a,r,r1,rlot,Q1,Q2,Q11,Q22 s PB=pb,TMAX=@tmax@(pb),d=@demd@(t),RMIN="",RMAX=""
 s rlot=rfixe\lot
 s RMIN=$$MAX(@RMINCO@(t),@RMINP@(t)),RMIN=$$MAX(RMIN,d-@QMAXCO@(t))
 s RMAX=@RMAXCO@(t),RMAX=$$MIN(RMAX,@RMAXP@(t)),RMAX=$$MIN(RMAX,SIGMADT(t)+qlot),RMAXI(t)=RMAX
 s RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 i (RMAX*lot)<qlot s RMAX=qlot\lot i RMAX'>0 s RMAX=1
 s r=rlot*lot
 s QMIN=$s(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 s QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t)),Q11=$$MULT(SIGMADT(t)-r,qlot),Q22=$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)
 i TYPE'>0 s Q1=$$MAX(0,Q11),Q2=$$MAX(0,Q22),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 s f=30000000,qopt=-1,a(4)=f,a(5)=f,fmx=f
 i (rlot<RMIN)!(rlot>RMAX) g sol
 s QMIN=QMIN\qlot,QMAX=QMAX\qlot
 f qx=QMIN:1:QMAX s q=qx*qlot,fmi=$$f(t+1,(r+q)-d,PB),Cqd=$$COUT(t,q,r,d)+fmi i f>Cqd s f=Cqd,qopt=q,fmx=fmi
sol l +^[QUI]SEMASOL("PRD") s ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN l -^[QUI]SEMASOL("PRD")
 i qopt'<0 s a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 s @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx
 s @prd@(ILIGN,9)=f
 q f
 
QMIN(r,t) 
 s QMIN=@QMINCO@(t)
 s QMIN=$$MAX(QMIN,@QMINP@(t))
 s QMIN=$$MAX(0,@demd@(t)-r)
 q
 
 
QMAX(r,t) 
 s QMAX=@QMAXCO@(t)
 s QMAX=$$MIN(QMAX,@QMAXP@(t)),Q1=$$MAX(0,SIGMADT(t)-r),Q2=$$MAX(0,(RMAXI(t+1)+@demd@(t))-r)
 s QMAX=$$MIN(Q1,QMAX),QMAX=$$MIN(Q2,QMAX)
 s QMAX(t)=QMAX
 q
 
 
f(t,r,pb) 
 n LIGNE,PB,r1,res,valtx
 i t>TMAX s PB=@tapb@(pb),TMAX=@tmax@(pb)
 i t'>TMAX s PB=pb
 i r<0 q 30000000
 i t>PMAX q 0
 s r1=(r\lot)*lot
LOOPZA l +@PRD@(t,r1):1 e  g LOOPZA
 i '($d(@PRD@(t,r1))) s valtx=$$%TXP2RC(t,r,PB) i valtx>3000000 l -@PRD@(t,r1) q 30000000
 l -@PRD@(t,r1) s r1=(r\lot)*lot,LIGNE=@PRD@(t,r1) q @prd@(LIGNE,9)
MAX(a,b) 
 q $s(a>b:a,1:b)
MIN(a,b) 
 q $s(a<b:a,1:b)
 
COUT(t,q,r,d) 
 s CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d)
 q CT
 
COUTPRD(t,q) 
 
 i q=0 q 0
 s h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 s xcp1=cp1*h1,xcp2=cp2*h2,cp=xcp1+xcp2,xstp=stp
 q cp+xstp
COUTSTK(r) 
 i r<0 q 0
 q (r*cprix)*(cst/100)
MULT(a,b) 
 n m1 s m1=a\b i (m1*b)<a s m1=m1+1
 q m1*b

