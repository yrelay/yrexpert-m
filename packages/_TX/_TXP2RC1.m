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

;%TXP2RC1^INT^1^59547,74032^0
%TXP2RC1 ;;09:00 PM  14 Jan 1993; ; 14 Jan 93  8:13 PM
 
 
 
 
 
PBMETXP 
 G:ETATPB="A TERMINER" TERMTXP
 
TRTTXP 
 
 N d,RMIN,RMAX,rlot,f,qopt,QMIN,QMAX,qx,q,Cqd,ILIGN,PB,TMAX,fmi,fmx,a
 S PB=pb,TMAX=@tmax@(pb)
 S d=@demd@(t),RMIN="",RMAX=""
 S rlot=rfixe\lot
 D RMIN^%TXP2RB(t,.RMIN),RMAX^%TXP2RB(t,.RMAX)
 I (VISU#2)=1 W !,"***2*** etude de stock : mini,demande, maxi ",RMIN," ",@demd@(t)," ",RMAX," periode ",t
 S RMIN=RMIN\lot,RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 I (VISU#2)=1 W !," etude de stock : mini,demande, maxi ",RMIN," ",@demd@(t)," ",RMAX
 
 S r=rlot*lot
 S QMIN=$S(TYPE>0:$$MAX(@QMINCO@(t),@QMINP@(t)),1:$$MAX(@QMINCO@(t),@dmd@(t)-r))
 
 S QMAX=$$MIN(@QMAXCO@(t),@QMAXP@(t)),Q11=$$MULT^%TXP1R(SIGMADT(t)-r,qlot),Q22=$$MULT^%TXP1R((RMAXI(t+1)+@dmd@(t))-r,qlot)
 I TYPE'>0 S Q1=$$MAX(0,Q11),Q2=$$MAX(0,Q22),QMAX=$$MIN(QMAX,Q1),QMAX=$$MIN(QMAX,Q2)
 S f=30000000,qopt=-1,a(4)=f,a(5)=f,fmx=f
 I (rlot<RMIN)!(rlot>RMAX) G sol
 S QMIN=QMIN\qlot,QMAX1=QMAX\qlot
 
 S QMAX=QMAX1
 
 I (VISU#2)=1 W !," **2** etude de production : mini maxi ",QMIN," ",QMAX
 D DEBCRIT^%TXP2RCO
 S @LPB@(IPB,"ATTENTE")=0
 
 S qx=QMIN
BCLQX G:qx>QMAX FINQX
 S q=qx*qlot
 S cout=$$COUT^%TXP1R(t,q,r,d)
 
 S @LPB=@LPB+1
 S @LPB@(@LPB,"TYPE")="F"
 S @LPB@(@LPB,"ETAT")="A TRAITER"
 S @LPB@(@LPB,"PBPERE")=IPB
 S @LPB@(@LPB,"VAR","pb")=PB,@LPB@(@LPB,"VAR","t")=t+1,@LPB@(@LPB,"VAR","r")=(r+q)-d,@LPB@(@LPB,"VAR","q")=q
 S @LPB@(@LPB,"VAR","cout")=cout
 S @LPB@(@LPB,"VAR","TMAX")=TMAX
 S @LPB@(IPB,"ATTENTE")=@LPB@(IPB,"ATTENTE")+1
 S qx=qx+1
 G BCLQX
 
 
FINQX I @LPB@(IPB,"ATTENTE")=0 D FINCRIT^%TXP2RCO G sol
 S @LPB@(IPB,"ETAT")="ATTENTE"
 S @LPB@(IPB,"VAR","r")=r
 S @LPB@(IPB,"VAR","PB")=PB
 S @LPB@(IPB,"VAR","a4")=a(4)
 S @LPB@(IPB,"VAR","a5")=a(5)
 S @LPB@(IPB,"VAR","fmx")=fmx
 S @LPB@(IPB,"VAR","qopt")=qopt
 S @LPB@(IPB,"VAR","f")=f
 S @LPB@(IPB,"VAR","d")=d
 D FINCRIT^%TXP2RCO
 Q
 
 
sol D DEBCRIT^%TXP2RCO
 S ILIGN=@PRD+1,@PRD=ILIGN,@PRD@(t,r)=ILIGN
 I qopt'<0 S a(4)=$$COUTPRD^%TXP1R(t,qopt),a(5)=$$COUTSTK^%TXP1R((r+qopt)-d)
 S @prd@(ILIGN,"VAL")=qopt_"^"_d_"^"_((r+qopt)-d)_"^"_a(4)_"^"_a(5)_"^"_fmx
 S @prd@(ILIGN,9)=f
 I (VISU#2)=1 W !," **2** : solution ",t," ",r," ",qopt," ",f\1
 
 S @LPB@(IPB,"ETAT")="RESOLU"
 S numpbp=@LPB@(IPB,"PBPERE")
 
 I numpbp=-1 S @LPB@(IPB,"VAR","f")=f D FINCRIT^%TXP2RCO Q
 
 
 S @LPB@(numpbp,"VAR","FRES")=f
 
 S @LPB@(numpbp,"ETAT")="A TERMINER"
 
 D FINCRIT^%TXP2RCO
 
 Q
 
 
 
 
 
 
TERMTXP 
 S a(4)=a4,a(5)=a4
 G sol
 
 
print 
 I ('(VISU#2))=1 Q
 I qx=QMIN W !,!,"***2***"," periode :",t,!,?5,"qt pr",?10,"dde",?20,"stk",?30,"cout",?45,"opt"
 W !,?5,q,?10,d,?20,r,?30,Cqd\1,?55,f\1
 R *zzzz
 Q
 
MAX(a,b) 
 Q $S(a>b:a,1:b)
MIN(a,b) 
 Q $S(a<b:a,1:b)
 ;

