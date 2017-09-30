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

;%TXPRSLV^INT^1^59547,74033^0
%TXPRSLV ;;04:26 PM  6 Oct 1993; 17 Feb 93 11:22 AM ; 06 Oct 93  4:27 PM
 
 
 
 N LISTEPB,CARGEN,LPBCOUR,NBPB,IPB,TIMOUT,TVD,NOTHG,TYPEPB,IGEN,ASSIST,NATPB
 N STOGEN
 
 N a,fmi,fmx,count,mlr,SAVTMAX,MAXICNT
 N MESURER S MESURER=1
 S ^[QUI]VERSION("DATE")=$H
 S STOGEN=0
 D:MESURER DEB^%SGMESU("%TXPRSLV : initialisation ")
 S QMIN=$S(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 S QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t))
 I TYPE'>0 S Q1=$$MAX(0,$$MULT(SIGMADT(t)-r,qlot)),Q2=$$MAX(0,$$MULT((RMAXI(t+1)+@dmd@(t))-r,qlot)),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 S f=VLIMI,qopt=-1,fmx=f,a(4)=f,a(5)=f,mlr=1
 S QMIN=QMIN\qlot,QMAX=QMAX\qlot
 I (VISU#2)=1 W !,"periode : ",t," etude de production : mini maxi ",QMIN," ",QMAX R *u
 
 S MAXICNT=500,STOP=0
 
 S NBPB=$$NBPB
 D:MESURER FIN^%SGMESU("%TXPRSLV : initialisation ")
 
 I NBPB=0 D:MESURER DEB^%SGMESU("%TXPRSLV : pas de pbs "),FIN^%SGMESU("%TXPRSLV : pas de pbs ") G FINTOT
 
 I NBPB=1 D:MESURER DEB^%SGMESU("%TXPRSLV: un seul pb") D UNSEUL^%TXPRSL1 D:MESURER FIN^%SGMESU("%TXPRSLV: un seul pb") G FINTOT
 D:MESURER DEB^%SGMESU("%TXPRSLV: preparation parcours")
 S NATPB="TXP2RB"
 
 S LISTEPB="^[QUI]TEMPORAI(""LPB"")"
 S CARGEN="^[QUI]TEMPORAI(""CARGEN"")"
 
 S LISTATT="^[QUI]TEMPORAI(""ATT"")"
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S LPBCOUR=$$TEMP^%SGUTIL
 
 S TIMOUT=60*60
 
 
 S WAITOTH=1E-1
 
 D:MESURER FIN^%SGMESU("%TXPRSLV: preparation parcours")
 D:MESURER DEB^%SGMESU("%TXPRSLV: parcours de construction")
 
 D DEBCRIT
 S:($D(@LISTEPB)#10)=0 @LISTEPB=0
 
 S qx=QMIN,count=0
 S dlot=$$MULT(d,lot)
MKFI2 S SAVPB=PB
 
 S q=qx*qlot I (r+q)<dlot G MKFI22
 S cout=$$COUT(t,q,r,d)
 I (t+1)>PMAX S fmi=0 G retf
 I (t+1)>TMAX S PB=@tapb@(PB),TMAX=@tmax@(PB)
 S r1=(((r+q)-d)\lot)*lot
LZA L +@PRD@(t+1,r1):1 E  D M^%TXP1RD("tentative de prise sur @PRD@("_(t+1)_","_r1_")") G LZA
 I $D(@PRD@(t+1,r1)),@PRD@(t+1,r1)'="" S fmi=@prd@(@PRD@(t+1,r1),9) L -@PRD@(t+1,r1) G retf
 L -@PRD@(t+1,r1)
 D STOPB
 G MKFI22
retf S Cqd=cout+fmi D:(VISU#2)=1 print^%TXPRSL1 S:Cqd<f f=Cqd,qopt=q,fmx=fmi,count=0
 S count=count+1
 I (count>MAXICNT)&(qopt>-1) D FINCRIT G MAXICNT
MKFI22 S PB=SAVPB,qx=qx+1
 G:qx'>QMAX MKFI2
TRTPB2 D FINCRIT
 D:MESURER FIN^%SGMESU("%TXPRSLV: parcours de construction")
 
 D:MESURER DEB^%SGMESU("%TXPRSLV: parcours de resolution")
 G:'($D(@LPBCOUR)) FIN
RESOLU S IPB=""
NXRESO S IPB=$O(@LISTRES@(IGEN,IPB)) G:IPB="" SUITE D EPIPB G:'($D(@LPBCOUR)) FIN G NXRESO
SUITE 
 
GET S IPB=$ZP(@LISTATT@(IGEN,"")) I IPB="" G:$D(@LISTRES@(IGEN)) RESOLU D M^%SGCOSLV("en attente des cosolveurs") F  I $D(@LISTRES@(IGEN)) D M^%SGCOSLV("") G RESOLU
 S %R=$$DEBCRITB(IPB) G:'(%R) GET K:IPB'="" @LISTATT@(IGEN,IPB) D FINCRITB(IPB)
 D DEB^%SGMESU("TXP: pb elementaire partageable")
 D SOLVEPB^%TXPRSL1
 D FIN^%SGMESU("TXP: pb elementaire partageable")
 D EPIPB G:'($D(@LPBCOUR)) FIN G:$D(@LISTRES@(IGEN)) RESOLU
 G GET
 
 
FIN 
 D:MESURER FIN^%SGMESU("%TXPRSLV: parcours de resolution")
 D M^%SGCOSLV("")
 K:STOGEN @CARGEN@(IGEN)
 
FINTOT 
 
 D:MESURER DEB^%SGMESU("%TXPRSLV: epilogue")
 S ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN
 I qopt'<0 S a(4)=$$COUTPRD(t,qopt),a(5)=$$COUTSTK((r+qopt)-d)
 S @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx
 S @prd@(ILIGN,9)=f
 I (VISU#2)=1 W !," periode ",t," stock init ",r," production ",qopt," valeur ",f\1," dont st ",a(5)," dont cpr ",a(4)
 D:MESURER FIN^%SGMESU("%TXPRSLV: epilogue")
 Q
 
 
MAXICNT 
 
 I '($D(@LPBCOUR)) D:MESURER FIN^%SGMESU("%TXPRSLV: parcours de construction") G FINTOT
 S IPB=""
MAXIB1 S IPB=$O(@LISTRES@(IGEN,"")) I IPB'="" K @LISTEPB@(IPB),@LPBCOUR@(IPB),@LISTRES@(IGEN,IPB) G MAXIB1
MAXIB2 S IPB=$O(@LISTATT@(IGEN,"")) G:IPB="" MAXICNT
 S %R=$$DEBCRITB(IPB) G:'(%R) MAXIB2 K:IPB'="" @LISTATT@(IGEN,IPB) D FINCRITB(IPB)
 K @LISTEPB@(IPB),@LPBCOUR@(IPB)
 G MAXIB2
 
 
TIMEOUT 
 I '($D(@LISTEPB@(IPB))) S @LISTEPB@(IPB)="ATTENTE" Q
 S H=$H,J=$P(H,","),M=$P(H,",",2),H2=@LISTEPB@(IPB,"DEBUT"),J2=$P(H2,","),M2=$P(H2,",",2),D=(((J-J2)*86400)+M)-M2
 I D>TIMOUT S @LISTEPB@(IPB)="ATTENTE"
 Q
 
 
 
NBPB() Q:QMIN>QMAX 0 Q:(QMIN+1)>QMAX 1 Q 2
 
 
 
STOPB 
 G:STOGEN STOPBS
 
 D DEBCRIT S:'($D(@CARGEN)) @CARGEN=0 S (IGEN,@CARGEN)=@CARGEN+1 D FINCRIT
 D STOGEN^%TXPRSL1
 S STOGEN=1
STOPBS S (@LISTEPB,IPB)=@LISTEPB+1
 D M^%SGCOSLV("construction du pb "_IPB)
 S @LISTEPB@(IPB,"TYPE")=NATPB,@LISTEPB@(IPB,"CARGEN")=IGEN
 S @LPBCOUR@(IPB)=""
 
 S @LISTEPB@(IPB,"CARSPE","t")=t+1
 S @LISTEPB@(IPB,"CARSPE","r")=(r+q)-d
 S @LISTEPB@(IPB,"CARSPE","PB")=PB
 S @LISTEPB@(IPB,"CARSPE","r1")=r1
 S @LISTEPB@(IPB,"CARSPE","TMAX")=TMAX
 S @LISTEPB@(IPB,"CARSPE","q")=q
 S @LISTEPB@(IPB,"CARSPE","cout")=cout
 S @LISTEPB@(IPB,"CARSPE","apb")=apb
 
 S @LISTATT@(IGEN,IPB)=""
 Q
 
 
 
EPIPB 
 S fmi=@LISTEPB@(IPB,"CARSPE","fmi"),Cqd=@LISTEPB@(IPB,"CARSPE","cout")+fmi
 I f>Cqd S f=Cqd,qopt=@LISTEPB@(IPB,"CARSPE","q"),fmx=fmi,count=0
 S count=count+1 S:(count>MAXICNT)&(qopt>0) STOP=1
 
 
 
 K @LISTEPB@(IPB),@LPBCOUR@(IPB),@LISTRES@(IGEN,IPB)
 Q
 
 
DEBCRIT 
 L +^[QUI]SEMASOL("FILEPB"):2 E  W !,"PROBLEME POUR PRENDRE LE SEMAPHORE" G DEBCRIT
 Q
FINCRIT 
 L -^[QUI]SEMASOL("FILEPB")
 Q
 
DEBCRITB(IPB) 
 L +^[QUI]SEMASOL("FILEATTB",IPB):0 Q $T Q
FINCRITB(IPB) 
 L -^[QUI]SEMASOL("FILEATTB",IPB)
 Q
 
 
 
COUT(t,q,r,d) 
 S CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d)
 Q CT
 
COUTPRD(t,q) Q:q=0 0
 I $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" Q:q=0 0 Q (cprix*q)+stp
 S h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 S xcp1=cp1*h1,xcp2=cp2*h2
 S cp=xcp1+xcp2,xstp=stp
 Q cp+xstp
 
COUTSTK(r) Q:r<0 0 Q (r*cprix)*(cst/100)
MAX(a,b) Q $S(a>b:a,1:b)
MIN(a,b) Q $S(a<b:a,1:b)
 
MULT(a,b) 
 N m1 S m1=a\b I (m1*b)<a S m1=m1+1
 Q m1*b
 
t S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S IGEN=0
tf K @LISTRES@(IGEN)
 S IGEN=IGEN+1
 G:$D(@LISTRES@(IGEN)) tf D M^%SGCOSLV("attente des cosolveurs ("_IGEN_")") F  I $D(@LISTRES@(IGEN)) D M^%SGCOSLV("done") G tf
 ;
 ;

