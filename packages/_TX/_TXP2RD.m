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

;%TXP2RD^INT^1^59547,74032^0
%TXP2RD(t,rfixe,PB) ;;01:27 PM  13 Mar 1993; ; 25 Jun 93  5:33 PM
 N d,RMIN,RMAX,f,qopt,QMIN,QMAX,qx,q,Cqd,ILIGN,TMAX,fmi,fmx,a,r,r1,rlot,Q1,Q2,Q11,Q22,rmod,npb,SAVPB
 S TMAX=@tmax@(PB),d=@demd@(t),RMIN="",RMAX=""
 S rlot=rfixe\lot
 S RMIN=$$MAX(@RMINCO@(t),@RMINP@(t)),RMIN=$$MAX(RMIN,d-@QMAXCO@(t))
 S RMAX=$$MIN(@RMAXCO@(t),@RMAXP@(t)),RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 S RMAXI(t)=RMAX
 S RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 S r=rlot*lot
 S QMIN=$S(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 
 I VISU=1 W !,!,!,"**2***  qlot,SIGMA,r,RMAXI,d",!,!,!,qlot," ",SIGMADT(t)," ",r," ",RMAXI(t+1)," ",@dmd@(t) R *%xxx
 S QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t)),Q11=$$MULT(SIGMADT(t)-r,qlot),Q22=$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)
 I VISU=1 W !,!,!,"**2***  q max,Q11,Q22",!,QMAX," ",Q11," ",Q22 R *%xxx
 I TYPE'>0 S Q1=$$MAX(0,Q11),Q2=$$MAX(0,Q22),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 S f=VLIMI,qopt=-1,a(4)=f,a(5)=f,fmx=f
 I rlot<RMIN G sol
 I VISU=1 W !,"**2*** q min q max,r,d ",QMIN," ",QMAX," ",r," ",d R *%xxx
 S QMIN=(QMIN\qlot)*qlot,QMAX=(QMAX\qlot)*qlot
 I VISU=1 W !,"**2***?? q min q max,r,d ",QMIN," ",QMAX," ",r," ",d R *%xxx
 I QMIN>QMAX G sol
 
 S q=QMIN
bcqx S rmod=(r+q)-d G:rmod<0 incqx
 I VISU=1 W !,"**2*** rmod ",rmod," ",r," ",q," ",d R *%xxx
 S (SAVPB,npb)=PB
 I (t+1)>PMAX S fmi=0 G retf
 I (t+1)>TMAX S PB=@tapb@(npb),TMAX=@tmax@(PB)
 I (t+1)'>TMAX S PB=npb
 S r1=(rmod\lot)*lot
LOOPZA L +@PRD@(t+1,r1):1 E  D M^%TXP1RD("tentative de prise sur @PRD@("_(t+1)_","_r1_")") G LOOPZA
 I '($D(@PRD@(t+1,r1))) S valtx=$$%TXP2RD(t+1,rmod,PB) I valtx>VLIMI L -@PRD@(t+1,r1) S fmi=VLIMI G retf
 L -@PRD@(t+1,r1) S fmi=@prd@(@PRD@(t+1,r1),9)
retf S PB=SAVPB
 S Cqd=$$COUT(t,q,r,d)+fmi
 I f>Cqd S f=Cqd,qopt=q,fmx=fmi
incqx S q=q+qlot G:q'>QMAX bcqx
sol L +^[QUI]SEMASOL("PRD") S ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN L -^[QUI]SEMASOL("PRD")
 I qopt'<0 S a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 S @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx,@prd@(ILIGN,9)=f
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

