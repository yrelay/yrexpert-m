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

;%TXPRSL1^INT^1^59547,74033^0
%TXPRSL1 ;;07:09 PM  28 May 1993; 17 Feb 93 11:22 AM ; 25 Jun 93  5:31 PM
 
 
 
 
 
STOGEN f VAR="ETUDE","ATELIER","ARTICLE","lot","qlot","cst","cprix","VISU","TYPE","PMAX","dmd","qmh","nbhn","cp1","cp2","stp" s @CARGEN@(IGEN,"VAR",VAR)=@VAR
 f VAR="SIGMADT" s zzz="" f %zzz=0:0 s zzz=$o(@VAR@(zzz)) q:zzz=""  s @CARGEN@(IGEN,"TAB",VAR,zzz)=@VAR@(zzz)
 f VAR="RMAXI" s zzz="" f %zzz=0:0 s zzz=$o(@VAR@(zzz)) q:zzz=""  s @CARGEN@(IGEN,"TAB",VAR,zzz)=@VAR@(zzz)
 q
 
 
UNSEUL s q=QMIN*qlot
 s fmi=$$f(t+1,(r+q)-d,PB)
 s Cqd=$$COUT(t,q,r,d)+fmi d print i f>Cqd s f=Cqd,qopt=q,fmx=fmi
 q
f(t,r,pb) 
 n LIGNE,PB,r1
 s PB=pb i t>TMAX s PB=@tapb@(pb),TMAX=@tmax@(pb)
 q:r<0 VLIMI q:t>PMAX 0
 s r1=(r\lot)*lot
 s pbza=0
LOOPZA l +@PRD@(t,r1):1 e  d M^%TXP1RD("tentative de prise sur @PRD@("_t_","_r1_")") s pbza=1 g LOOPZA
 i pbza d M^%TXP1RD("")
 i '($d(@PRD@(t,r1))) g SOLV1
 s LIGNE=@PRD@(t,r1)
 l -@PRD@(t,r1)
 i LIGNE="" d M^%SGCOSLV("en attente de resolution de @PRD@("_t_","_r1_")") h 5e-1 g LOOPZA
 q @prd@(LIGNE,9)
SOLV1 s @PRD@(t,r1)=""
 l -@PRD@(t,r1)
 i $$^%TXP4RD(t,r,PB)'<VLIMI q VLIMI
 s LIGNE=@PRD@(t,r1) q @prd@(LIGNE,9)
 
 
print i ('(VISU#2))=1 q
 i qx=QMIN w !,!,"****"," periode :",t,!,?7,"qt pr",?15,"dde",?28,"stk",?38,"cout",?65,"opt"
 w !,t,?7,q,?15,d,?28,r,?38,Cqd\1,?65,f\1
 i (VISU#2)=1 r *zzzz
 q
 
COUT(t,q,r,d) 
 s CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d)
 q CT
 
COUTPRD(t,q) q:q=0 0
 i $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" q:q=0 0 q (cprix*q)+stp
 s h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 s xcp1=cp1*h1,xcp2=cp2*h2
 s cp=xcp1+xcp2,xstp=stp
 q cp+xstp
 
COUTSTK(r) q:r<0 0 q (r*cprix)*(cst/100)
MAX(a,b) q $s(a>b:a,1:b)
MIN(a,b) q $s(a<b:a,1:b)
 
MULT(a,b) 
 n m1 s m1=a\b i (m1*b)<a s m1=m1+1
 q m1*b
 
 
SOLVEPB 
 
 n TMAX,apb,PB,tplus1,r1,VAL
 
 s ^[QUI]cptpb(NATPB)=$s('($d(^[QUI]cptpb(NATPB))):1,1:^[QUI]cptpb(NATPB)+1)
 s ^[QUI]cptpb(NATPB,$j)=$s('($d(^[QUI]cptpb(NATPB,$j))):1,1:^[QUI]cptpb(NATPB,$j)+1)
 d M^%SGCOSLV("resolution du pb "_IPB)
 
 s PB=@LISTEPB@(IPB,"CARSPE","PB")
 s tplus1=@LISTEPB@(IPB,"CARSPE","t")
 s r1=@LISTEPB@(IPB,"CARSPE","r1")
 s pbza=0
SZA l +@PRD@(tplus1,r1):1 e  d M^%TXP1RD("tentative de prise sur @PRD@("_tplus1_","_r1_")") s pbza=1 g SZA
 i pbza d M^%TXP1RD("")
 i '($d(@PRD@(tplus1,r1))) g SOLVE2
 s VAL=@PRD@(tplus1,r1)
 l -@PRD@(tplus1,r1)
 i VAL="" d M^%SGCOSLV("en attente de resolution de @PRD@("_tplus1_","_r1_")") h 5e-1 g SZA
 s @LISTEPB@(IPB,"CARSPE","fmi")=@prd@(VAL,9) g epilo
SOLVE2 s @PRD@(tplus1,r1)=""
 l -@PRD@(tplus1,r1)
 d M2^%SGCOSLV("resolution du pb "_IPB,$j((^[QUI]cptpb(NATPB,$j)*100)/^[QUI]cptpb(NATPB)," ",2)_" %")
 s TMAX=@LISTEPB@(IPB,"CARSPE","TMAX"),apb=@LISTEPB@(IPB,"CARSPE","apb")
 s @LISTEPB@(IPB,"CARSPE","fmi")=$$^%TXP4RD(tplus1,@LISTEPB@(IPB,"CARSPE","r"),PB)
epilo 
 s @LISTRES@(IGEN,IPB)="" zsync
 q
 ;

