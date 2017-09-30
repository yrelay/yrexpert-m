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

;%TXOPT1^INT^1^59547,74031^0
%TXOPT1(PB,ATELIER,ARTICLE,PMAX) 
 
 
 S:'($D(ETUDE)) ETUDE=PB
 W #
 W " etude du probleme"," ",PB,"   ",ATELIER," ",ARTICLE
 S PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)",dmd="^[QUI]demande(ETUDE,ATELIER,ARTICLE)"
 K @(PRD),@(prd),SIGMADT
 S qmh=^[QUI]qmh(ATELIER,ARTICLE),lot=^[QUI]taillelot(ATELIER,ARTICLE)
 S qlot=^[QUI]taillelan(ATELIER,ARTICLE)
 S cst=^[QUI]cst(ATELIER,ARTICLE)
 
 S QMINC="^[QUI]qminc(PB,ATELIER,ARTICLE)"
 S QMAXC="^[QUI]qmaxc(PB,ATELIER,ARTICLE)"
 S RMINC="^[QUI]rminc(PB,ATELIER,ARTICLE)"
 S RMAXC="^[QUI]rmaxc(PB,ATELIER,ARTICLE)"
 S QMINP="^[QUI]qminpb(ETUDE,ATELIER,ARTICLE)"
 S QMAXP="^[QUI]qmaxpb(ETUDE,ATELIER,ARTICLE)"
 S RMINP="^[QUI]rminpb(ETUDE,ATELIER,ARTICLE)"
 S RMAXP="^[QUI]rmaxpb(ETUDE,ATELIER,ARTICLE)"
 S qmax1="^[QUI]qmax1(ATELIER,ARTICLE)"
 S qmax2="^[QUI]qmax2(ATELIER,ARTICLE)"
 S cp1="^[QUI]cp1(ATELIER,ARTICLE)"
 S cp2="^[QUI]cp2(ATELIER,ARTICLE)"
 S stp=^[QUI]stp(ATELIER,ARTICLE)
 S cst=^[QUI]cst(ATELIER,ARTICLE)
 S SIGMADT(PMAX+1)=0,RMAXI(PMAX+1)=0,@dmd@(PMAX+1)=0
 F t=PMAX:-1:1 S SIGMADT(t)=SIGMADT(t+1)+@dmd@(t)
 S ILIGN=0
 F t=PMAX:-1:1 D PERIODE(t)
 Q
PERIODE(t) 
 
 S d=@dmd@(t),RMIN="",RMAX=""
 D RMIN(t,.RMIN),RMAX(t,.RMAX)
 
 S RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 
 S qoptlast="vide" F rlot=RMIN:1:RMAX S r=rlot*lot D optq Q:qoptlast=-20
 Q
optq ;;
 D QMIN(r,t),QMAX(r,t)
 S f=30000000,qopt=-1
 S QMIN=QMIN\qlot,QMAX=(QMAX\qlot)+1
 
 F qx=QMIN:1:QMAX S q=qx*qlot,Cqd=$$COUT(t,q,r)+$$f(t+1,(r+q)-d) D print I f>Cqd S f=Cqd,qopt=q
 S ILIGN=ILIGN+1,@PRD@(t,r)=ILIGN
 S @prd@(ILIGN,1)=t,@prd@(ILIGN,2)=r,@prd@(ILIGN,3)=qopt,@prd@(ILIGN,4)=d,@prd@(ILIGN,5)=(r+qopt)-d,@prd@(ILIGN,6)=$$COUTPRD(t,qopt),@prd@(ILIGN,7)=$$COUTSTK(r),@prd@(ILIGN,8)=$$f(t+1,(r+qopt)-d),@prd@(ILIGN,9)=(@prd@(ILIGN,6)+@prd@(ILIGN,7))+@prd@(ILIGN,8)
 S qoptlast=$S(qopt=0:qoptlast-1,1:qoptlast)
 W !," ",t," ",r," ",qopt," ",f\1
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
 S QMIN=$$MAX(0,@dmd@(t)-r)
 Q
 
QMAX(r,t) 
 
 S QMAX=@QMAXC@(t)
 S QMAX=$$MIN(QMAX,@QMAXP@(t))
 S QMAX=$$MIN(QMAX,SIGMADT(t)-r),QMAX=$$MIN(QMAX,(RMAXI(t+1)+@dmd@(t))-r)
 S QMAX(t)=QMAX
 Q
RMIN(t,RMIN) 
 S RMIN=$$MAX(@RMINC@(t),@RMINP@(t))
 S RMIN=$$MAX(RMIN,@dmd@(t)-@QMAXC@(t))
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
f(t,r) 
 N LIGNE
 I t>PMAX Q 0
 I r<0 Q 30000000
 I '($D(@PRD@(t,r))) Q 30000000
 S LIGNE=@PRD@(t,r) Q @prd@(LIGNE,9)
COUTPRD(t,q) 
 I q=0 Q 0
 S xcp1=0,xcp2=0
 S xcp1=@cp1@(t)*$$MIN(@qmax1@(t),q)
 I q>@qmax1@(t) S xcp2=@cp2@(t)*(q-@qmax1@(t))
 
 S cp=xcp1+xcp2
 ;; setup 
 S xstp=stp
 Q (cp/qmh)+xstp
COUTSTK(r) 
 Q ((r*@cp2@(t))/qmh)*(cst/100)
 ;; quatre pourcent de la valeur de production de ce qui est en stock
MAX(a,b) 
 Q $S(a>b:a,1:b)
MIN(a,b) 
 Q -($$MAX(-(a),-(b)))
 
V(PB,ATELIER,ARTICLE,PMAX) 
 
 N %V
 D ^%TXOPT1(PB,ATELIER,ARTICLE,PMAX)
 S tdeb=1 W !," niveaux initiaux possibles pour ",tdeb I '($D(@PRD@(tdeb))) W "*** aucun " S %V=30000000 G FINV
 W !,! S rdeb="" F z=1:1 S rdeb=$O(@PRD@(tdeb,rdeb)) Q:rdeb=""  W !," ",rdeb S il=@PRD@(tdeb,rdeb) I @prd@(il,9)<10000000 W !,PB," ","r init= ",rdeb," v ",@prd@(il,9),! S %V=@prd@(il,9),@prd@("NIVEAU.INITIAL")=rdeb Q
 R *uuu W !,!,!
FINV Q %V

