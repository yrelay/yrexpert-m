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

;%QXP2R^INT^1^59547,73887^0
%QXP2R(t,rfixe,pb) ;;05:58 PM  1 Sep 1992; ; 01 Sep 92  6:09 PM
 
 N QMINC,QMAXC,RMINC,RMAXC
 S QMINC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"",""copie"")"
 S QMAXC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"",""copie"")"
 S RMINC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"",""copie"")"
 S RMAXC="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"",""copie"")"
 Q $$RUN(t,rfixe,pb)
 
RUN(t,rfixe,pb) 
 N d,RMIN,RMAX,qoptlast,rlot,f,qopt,QMIN,QMAX,qx,q,Cqd,ILIGN
 S PB=pb,TMAX=@tmax@(pb)
 S d=@demd@(t),RMIN="",RMAX=""
 S rlot=rfixe\lot
 D RMIN(t,.RMIN),RMAX(t,.RMAX)
 S RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 S f=30000000 I (rlot<RMIN)!(rlot>RMAX) Q f
 S qoptlast="vide",r=rlot*lot D optq Q:qoptlast=-20
 Q f
 
optq D QMIN(r,t),QMAX(r,t)
 S f=30000000,qopt=-1
 S QMIN=QMIN\qlot,QMAX1=QMAX\qlot S:(QMAX1*qlot)<QMAX QMAX1=QMAX1+1 S QMAX=QMAX1
 F qx=QMIN:1:QMAX S q=qx*qlot,Cqd=$$COUT(t,q,r)+$$f(t+1,(r+q)-d,PB) D print I f>Cqd S f=Cqd,qopt=q
 S ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN
 S @prd@(ILIGN,1)=t,@prd@(ILIGN,2)=r,@prd@(ILIGN,3)=qopt,@prd@(ILIGN,4)=d,@prd@(ILIGN,5)=(r+qopt)-d,@prd@(ILIGN,6)=$$COUTPRD(t,qopt)
 S @prd@(ILIGN,7)=$$COUTSTK(r),@prd@(ILIGN,8)=$$f(t+1,(r+qopt)-d,PB),@prd@(ILIGN,9)=(@prd@(ILIGN,6)+@prd@(ILIGN,7))+@prd@(ILIGN,8)
 S qoptlast=$S(qopt=0:qoptlast-1,1:qoptlast)
 Q
print 
 Q
 I qx=QMIN W !,!,"****"," periode :",t,!,?5,"qt pr",?10,"dde",?20,"stk",?30,"cout",?45,"opt"
 W !,?5,q,?10,d,?20,r,?30,Cqd\1,?55,f\1
 R *zzzz
 Q
 
 
QMIN(r,t) 
 S QMIN=@QMINC@(t)
 S QMIN=$$MAX(QMIN,@QMINP@(t))
 S QMIN=$$MAX(0,@demd@(t)-r)
 Q
 
 
QMAX(r,t) 
 S QMAX=@QMAXC@(t)
 S QMAX=$$MIN(QMAX,@QMAXP@(t))
 S QMAX=$$MIN(QMAX,SIGMADT(t)-r),QMAX=$$MIN(QMAX,(RMAXI(t+1)+@demd@(t))-r)
 S QMAX(t)=QMAX
 Q
RMIN(t,RMIN) 
 S RMIN=$$MAX(@RMINC@(t),@RMINP@(t))
 S RMIN=$$MAX(RMIN,@demd@(t)-@QMAXC@(t))
 Q
RMAX(t,RMAX) 
 S RMAX=@RMAXC@(t)
 S RMAX=$$MIN(RMAX,@RMAXP@(t))
 S RMAX=$$MIN(RMAX,SIGMADT(t))
 S RMAXI(t)=RMAX
 Q
COUT(t,q,r) 
 
 
 S CT=$$COUTPRD(t,q)+$$COUTSTK(r)
 Q CT
f(t,r,pb) 
 N LIGNE,PB,r1
 I t>TMAX S PB=@tapb@(pb),TMAX=@tmax@(pb)
 I t'>TMAX S PB=pb
 I r<0 Q 30000000
 I t>PMAX Q 0
 S r1=(r\lot)*lot I '($D(@PRD@(t,r1))),$$RUN(t,r,PB)>3000000 Q 30000000
 S LIGNE=@PRD@(t,r1) Q @prd@(LIGNE,9)
 
COUTPRD(t,q) 
 I q=0 Q 0
 S xcp1=0,xcp2=0
 S xcp1=cp1*$$MIN(qmax1,q)
 I q>qmax1 S xcp2=cp2*(q-qmax1)
 
 S cp=xcp1+xcp2
 ;; setup 
 S xstp=stp
 Q (cp/qmh)+xstp
COUTSTK(r) 
 Q ((r*cp2)/qmh)*(cst/100)
 ;; quatre pourcent de la valeur de production de ce qui est en stock
MAX(a,b) 
 Q $S(a>b:a,1:b)
MIN(a,b) 
 Q -($$MAX(-(a),-(b)))
 ;
