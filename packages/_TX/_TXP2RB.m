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

;%TXP2RB^INT^1^59547,74032^0
%TXP2RB(t,rfixe,pb) ;;05:25 PM  3 May 1993; ; 25 Jun 93  5:33 PM
 
 
 
 N d,RMIN,RMAX,rlot,f,qopt,QMIN,QMAX,qx,q,Cqd,ILIGN,PB,TMAX,fmi,fmx,a
 N r,r1,rlot,Q1,Q2,Q11,Q22
 N qoptlast,MCOUNT,count
 S MCOUNT=100
 S PB=pb,TMAX=@tmax@(pb)
 S d=@demd@(t),RMIN="",RMAX=""
 S rlot=rfixe\lot
 D RMIN(t,.RMIN),RMAX(t,.RMAX)
 I VISU=1 W !,"***2*** etude de stock : mini,demande, maxi ",RMIN," ",@demd@(t)," ",RMAX," periode ",t
 
 S RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 I VISU=1 W !," ???2???etude de stock : mini,demande, maxi ",RMIN," ",@demd@(t)," ",RMAX
 
 S r=rlot*lot
 S QMIN=$S(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 
 
 S QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t)),Q11=$$MULT^%TXP1R(SIGMADT(t)-r,qlot),Q22=$$MULT^%TXP1R((RMAXI(t+1)+d)-r,qlot)
 I TYPE'>0 S Q1=$$MAX(0,Q11),Q2=$$MAX(0,Q22),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 S f=VLIMI,qopt=-1,a(4)=f,a(5)=f,fmx=f,count=0,qoptlast=""
 I rlot<RMIN G sol ;;!(rlot>RMAX) g sol
 S QMIN=QMIN\qlot,QMAX1=QMAX\qlot
 
 S QMAX=QMAX1
 
 I VISU=1 W !," ??**2**?? etude de production : mini maxi ",QMIN," ",QMAX
 F qx=QMIN:1:QMAX Q:count>MCOUNT  S count=count+1,q=qx*qlot,fmi=$$f(t+1,(r+q)-d,PB),Cqd=$$COUT^%TXP1R(t,q,r,d)+fmi D print I f>Cqd S f=Cqd,qopt=q,fmx=fmi I qopt'=qoptlast S count=0,qoptlast=qopt
 
sol L +^[QUI]SEMASOL("PRD") S ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN L -^[QUI]SEMASOL("PRD")
 I qopt'<0 S a(4)=$$COUTPRD^%TXP1R(t,qopt),a(5)=$$COUTSTK^%TXP1R((r+qopt)-d)
 S @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx
 S @prd@(ILIGN,9)=f
 
 I VISU=1 W !," **2** : solution ",t," ",r," ",qopt," ",f\1
 Q f
 
 
print 
 I '(VISU=1) Q
 I qx=QMIN W !,!,"***2***"," periode :",t,!,?5,"qt pr",?10,"dde",?20,"stk",?30,"cout",?45,"opt"
 W !,?5,q,?10,d,?20,r,?30,Cqd\1,?55,f\1
 W !,"qopt : ",qopt," qoptlast : ",qoptlast," count : ",count
 R *zzzz
 Q
 
 
QMIN(r,t) 
 S QMIN=@QMINCO@(t)
 S QMIN=$$MAX(QMIN,@QMINP@(t))
 S QMIN=$$MAX(0,@demd@(t)-r)
 Q
 
 
QMAX(r,t) 
 S QMAX=@QMAXCO@(t)
 S QMAX=$$MIN(QMAX,@QMAXP@(t)),Q1=$$MAX(0,SIGMADT(t)-r),Q2=$$MAX(0,(RMAXI(t+1)+@demd@(t))-r)
 S QMAX=$$MIN(Q1,QMAX),QMAX=$$MIN(Q2,QMAX)
 S QMAX(t)=QMAX
 Q
RMIN(t,RMIN) 
 S RMIN=$$MAX(@RMINCO@(t),@RMINP@(t))
 S RMIN=$$MAX(RMIN,@demd@(t)-@QMAXCO@(t))
 Q
RMAX(t,RMAX) 
 S RMAX=@RMAXCO@(t)
 S RMAX=$$MIN(RMAX,@RMAXP@(t))
 S RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 S RMAXI(t)=RMAX
 Q
 
 
COUT(t,q,r) 
 
 S CT=$$COUTPRD(t,q)+$$COUTSTK(r)
 Q CT
 
f(t,r,pb) 
 N LIGNE,PB,r1,res,valtx
 I r<0 Q VLIMI
 I t>PMAX Q 0
 I t>TMAX S PB=@tapb@(pb),TMAX=@tmax@(PB)
 I t'>TMAX S PB=pb
 S r1=(r\lot)*lot
 I '($D(@PRD@(t,r1))) S valtx=$$^%TXP2RB(t,r,PB) I valtx>VLIMI Q VLIMI
 S r1=(r\lot)*lot
 S LIGNE=@PRD@(t,r1)
 S res=@prd@(LIGNE,9)
 Q res
 
COUTPRD(t,q) 
 I $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" Q (cprix*q)+stp
 I q=0 Q 0
 S xcp1=0,xcp2=0
 S xcp1=cp1*$$MIN(qmax1,q)
 I q>qmax1 S xcp2=cp2*(q-qmax1)
 
 S cp=xcp1+xcp2
 
 S xstp=stp
 Q (cp/qmh)+xstp
COUTSTK(r) 
 Q ((r*cp2)/qmh)*(cst/100)
 ;; quatre pourcent de la valeur de production de ce qui est en stock
 
MAX(a,b) 
 Q $S(a>b:a,1:b)
MIN(a,b) 
 Q $S(a<b:a,1:b)
 ;

