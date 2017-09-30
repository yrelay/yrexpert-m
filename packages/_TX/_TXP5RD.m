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

;%TXP5RD^INT^1^59547,74032^0
%TXP5RD(t,rfixe,PB) ;;11:54 AM  14 May 1993; ; 25 Jun 93  5:34 PM
 N RMIN,RMAX,rr,ILIGN,r,r1,qopt,t2
 N TMAX
 S RMIN=$$RMIN(t),RMAX=$$RMAX(t)
 S rr=$$CALCUL(t,rfixe,(rfixe\lot)*lot,PB,RMIN,RMAX)
 S r=rfixe,t2=t
loop11 
 S TMAX=@tmax@(PB)
 I t2>TMAX S PB=@tapb@(PB)
 S r=(r\lot)*lot
 Q:'($D(@LOCPRD@(t2,r))) rr
 S @PRD@(t2,r)=@LOCPRD@(t2,r)
 S ILIGN=@PRD@(t2,r)
 S @prd@(ILIGN,9)=@LOCprd@(ILIGN,9)
 S (qopt,@prd@(ILIGN,"VAL"))=@LOCprd@(ILIGN,"VAL")
 S r1=$P(qopt,"^",3)
 S t2=t2+1,r=r1 Q:t2>PMAX rr G loop11
 Q rr
 
CALCUL(t,rfixe,r,PB,RMIN,RMAX) 
 N d,f,qopt,QMIN,QMAX,qx,q,Cqd,TMAX,fmi,fmx,a,r1,rmod,npb,SAVPB,RMIN2,RMAX2,qoptlast,MCOUNT,count
 S MCOUNT=100
 S TMAX=@tmax@(PB),d=@demd@(t)
 S f=VLIMI,qopt=-1,a(4)=f,a(5)=f,fmx=f
 I (rfixe\lot)<RMIN G sol
 S QMIN=$S(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 S QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t))
 I TYPE'>0 S QMAX=$$MIN(QMAX,$$MAX(0,$$MULT(SIGMADT(t)-r,qlot))),QMAX=$$MIN(QMAX,$$MAX(0,$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)))
 S QMIN=(QMIN\qlot)*qlot,QMAX=(QMAX\qlot)*qlot G:QMIN>QMAX sol
 I (t+1)'>PMAX G norm
 S count=0,qoptlast=""
 S fmi=0 F q=QMIN:qlot:QMAX Q:count>MCOUNT  S count=count+1,rmod=(r+q)-d I rmod'<0 S Cqd=$$COUT(t,q,r,d) I f>Cqd S f=Cqd,qopt=q,fmx=fmi I qopt'=qoptlast S count=0,qoptlast=qopt
 G sol
 
norm S RMIN2=$$RMIN(t+1),RMAX2=$$RMAX(t+1),q=QMIN
bcqx S rmod=(r+q)-d G:rmod<0 incqx
 S (SAVPB,npb)=PB S:(t+1)>TMAX PB=@tapb@(npb),TMAX=@tmax@(PB) S:(t+1)'>TMAX PB=npb S r1=(rmod\lot)*lot
 I '($D(@LOCPRD@(t+1,r1))) S valtx=$$CALCUL(t+1,rmod,r1,PB,RMIN2,RMAX2) I valtx'<VLIMI S fmi=VLIMI G retf
 S fmi=@LOCprd@(@LOCPRD@(t+1,r1),9)
retf S PB=SAVPB I f>fmi S Cqd=$$COUT(t,q,r,d)+fmi I f>Cqd S f=Cqd,qopt=q,fmx=fmi
incqx S q=q+qlot G:q'>QMAX bcqx
sol L +^[QUI]SEMASOL("PRD") S ILIGN=@PRD+1,@PRD=ILIGN,@LOCPRD@(t,r)=ILIGN L -^[QUI]SEMASOL("PRD")
 I qopt'<0 S a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 S @LOCprd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx,@LOCprd@(ILIGN,9)=f
 Q f
 
MAX(a,b) Q $S(a>b:a,1:b)
MIN(a,b) Q $S(a<b:a,1:b)
 
COUT(t,q,r,d) N CT S CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d) Q CT
 
 
 
COUTPRD(t,q) Q:q=0 0
 I $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" Q (cprix*q)+stp
 S h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 S xcp1=cp1*h1,xcp2=cp2*h2,cp=xcp1+xcp2,xstp=stp
 Q cp+xstp
 
COUTSTK(r) Q:r<0 0 Q (r*cprix)*(cst/100)
MULT(a,b) 
 N m1 S m1=a\b I (m1*b)<a S m1=m1+1
 Q m1*b
 
RMIN(t) 
 N RMIN
 S RMIN=$$MAX(@RMINCO@(t),@RMINP@(t)),RMIN=$$MAX(RMIN,@demd@(t)-@QMAXCO@(t))
 S RMIN=RMIN\lot
 Q RMIN
RMAX(t) 
 N RMAX
 S RMAX=$$MIN(@RMAXCO@(t),@RMAXP@(t)),RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 S RMAXI(t)=RMAX
 S RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 Q RMAX

