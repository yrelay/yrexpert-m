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

;%TXP1RB^INT^1^59547,74032^0
%TXP1RB(pb,apb,ATELIER,ARTICLE,PMAX,dmd,STOCKINI,VISU) ;;05:19 PM  13 Jan 1993; ; 13 Jan 93  5:22 PM
 
 
 
 
 
 
 
 
 
 
 
 
 n PB,TMAX
 i (VISU#2)=1 w #," etude du probleme"," ",pb,"   ",ATELIER," ",ARTICLE
 s PB=pb,TMAX=@tmax@(pb)
 
 k SIGMADT
 s qmh=@etuata@("Quantite moyenne horaire"),lot=@etuata@("capacite d'un conteneur")
 s qlot=@etuata@("taille d'un lot de lancement")
 s ratio=qlot\lot i ratio=0 s ratio=1
 s cst=@etuata@("cout de stockage(%)")
 s cprix=@etuata@("Prix de Revient")
 s stp=@etuata@("cout de lancement")
 s SIGMADT(PMAX+1)=0,RMAXI(PMAX+1)=0,@dmd@(PMAX+1)=0
 f t=PMAX:-1:1 s SIGMADT(t)=SIGMADT(t+1)+@dmd@(t)
 s ILIGN=0,@PRD=ILIGN
 f t=TMAX:-1:1 s AVORT=0 d PERIODE(t),diag(t,.AVORT) q:AVORT=1
 q
 
PERIODE(t) 
 s d=@dmd@(t),RMIN="",RMAX=""
 d RMIN(t,.RMIN),RMAX(t,.RMAX)
 i (VISU#2)=1 w !,"periode : ",t," etude de stock : mini,demande, maxi ",RMIN," ",@dmd@(t)," ",RMAX r *u
 i t=1 s RMIN=STOCKINI,RMAX=STOCKINI
 s RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 i (RMAX*lot)<qlot s RMAX=qlot\lot i RMAX'>0 s RMAX=1
 i (VISU#2)=1 w !,"periode : ",t," etude de stock : mini,demande, maxi ",RMIN," ",@dmd@(t)," ",RMAX r *u
 
 f rlot=RMIN:ratio:RMAX s r=rlot*lot d optq
 q
 
optq n a,fmi,fmx,count,mlr
 
 s QMIN=$s(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 
 
 s QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t)),Q11=$$MULT(SIGMADT(t)-r,qlot),Q22=$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)
 i TYPE'>0 s Q1=$$MAX(0,Q11),Q2=$$MAX(0,Q22),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 
 s f=30000000,qopt=-1,fmx=f,a(4)=f,a(5)=f,mlr=1,count=0
 s QMIN=QMIN\qlot,QMAX1=QMAX\qlot ;;;;;s:((QMAX1*qlot)<QMAX) QMAX1=QMAX1+1
 s QMAX=QMAX1
 i (VISU#2)=1 w !,"periode : ",t," etude de production : mini maxi ",QMIN," ",QMAX r *u
 f qx=QMIN:1:QMAX s count=count+1 q:(count>20)&(qopt'<0)  s q=qx*qlot,fmi=$$f(t+1,(r+q)-d,PB),Cqd=$$COUT(t,q,r,d)+fmi d print i f>Cqd s f=Cqd,qopt=q,fmx=fmi,count=0
 s ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN
 i qopt'<0 s a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 s @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx
 s @prd@(ILIGN,9)=f
 i (VISU#2)=1 w !," periode ",t," stock init ",r," production ",qopt," valeur ",f\1," dont st ",a(5)," dont cpr ",a(4)
 q
 
print i ('(VISU#2))=1 q
 i qx=QMIN w !,!,"****"," periode :",t,!,?7,"qt pr",?15,"dde",?28,"stk",?38,"cout",?65,"opt"
 w !,t,?7,q,?15,d,?28,r,?38,Cqd\1,?65,f\1
 i (VISU#2)=1 r *zzzz
 q
 
RMIN(t,RMIN) 
 s RMIN=$$MAX(@RMINCO@(t),@RMINP@(t))
 s RMIN=$$MAX(RMIN,@dmd@(t)-@QMAXCO@(t))
 q
RMAX(t,RMAX) 
 s RMAX=$$MIN(@RMAXCO@(t),@RMAXP@(t))
 s RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 s RMAXI(t)=RMAX
 q
 
 
COUT(t,q,r,d) 
 s CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d)
 q CT
 
f(t,r,pb) 
 n LIGNE,PB,r1
 s PB=pb i t>TMAX s PB=@tapb@(pb),TMAX=@tmax@(pb)
 i r<0 q 30000000
 i t>PMAX q 0
 
 
 s r1=(r\lot)*lot i '($d(@PRD@(t,r1))),$$PPAL^%TXP2RCO(t,r,PB)>3000000 q 30000000
 s LIGNE=@PRD@(t,r1) q @prd@(LIGNE,9)
 
COUTPRD(t,q) 
 
 i q=0 q 0
 s h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 s xcp1=cp1*h1
 s xcp2=cp2*h2
 s cp=xcp1+xcp2
 
 s xstp=stp
 q cp+xstp
COUTSTK(r) 
 i r<0 q 0
 
 
 q (r*cprix)*(cst/100)
 
MAX(a,b) q $s(a>b:a,1:b)
MIN(a,b) q $s(a<b:a,1:b)
 
 
V(pb,apb,ATELIER,ARTICLE,PMAX,demd,STOCKINI,VISU) 
 n %V,PB,TMAX
 d CLEPAG^%VVIDEO,LINEUP^%TXPSUTI
 s tdeb=1,TMAX=@tmax@(pb)
 i tdeb>TMAX s PB=apb
 i tdeb'>TMAX s PB=pb
 s %V=300000000,TMAX=@tmax@(PB)
 d ^%TXP1RB(pb,apb,ATELIER,ARTICLE,PMAX,demd,STOCKINI,(VISU#2)=1)
 
 i '($d(@PRD@(tdeb))) s %V=30000000 g FINV
 s rdeb="",rdeb=$o(@PRD@(tdeb,rdeb)),il=@PRD@(tdeb,rdeb) i @prd@(il,9)<10000000 w:(VISU#2)=1 !,PB," ","r init= ",rdeb," v ",@prd@(il,9),! s %V=@prd@(il,9),@prd@("NIVEAU.INITIAL")=rdeb
 i (VISU#2)=1 r *uuu w !,!,!
FINV q %V
diag(tdeb,AVORT) 
 s AVORT=0
 i TYPE'=0 q
 i '($d(@PRD@(tdeb))) d recomm1 q
 s rdeb=""
lodiag 
 s rdeb=$o(@PRD@(tdeb,rdeb)) i rdeb="" d recomm1 q
 s il=@PRD@(tdeb,rdeb) i @prd@(il,9)<10000000 g findiag
 g lodiag
findiag q
recomm1 
 s AVORT=1,%V=30000000
 u 0 w !,!,!,"~~~~~~ echec de la resolution elementaire a la periode ~~~ ",tdeb
 w !," ceci veut dire que pour cette periode et les suivantes, les contraintes de NIVEAU de STOCK et/ou les contraintes de NIVEAU de PRODUCTION"
 w !,"sont trop serrees."
 w !,"Nous vous conseillons de RELAXER ces contraintes ,en desserrant d'abord les contraintes de niveau de STOCK de la periode ",tdeb
 w !," [RETURN]" r %xxx
 q
MULT(a,b) 
 
 n m1 s m1=a\b i (m1*b)<a s m1=m1+1
 q m1*b

