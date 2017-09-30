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

;%TXP1RD^INT^1^59547,74032^0
%TXP1RD(pb,apb,ATELIER,ARTICLE,PMAX,dmd,STOCKINI,VISU) ;;07:53 PM  17 May 1993; ; 25 Jun 93  5:33 PM
 N PB,TMAX,SAVPB
 I (VISU#2)=1 U 0 W #," etude du probleme"," ",pb,"   ",ATELIER," ",ARTICLE
 S PB=pb,TMAX=@tmax@(pb)
 
 K SIGMADT
 S qmh=@etuata@("Quantite moyenne horaire"),lot=@etuata@("capacite d'un conteneur")
 S qlot=@etuata@("taille d'un lot de lancement")
 S ratio=qlot\lot I ratio=0 S ratio=1
 
 S cst=@etuata@("cout de stockage(%)")
 S cprix=@etuata@("Prix de Revient")
 S stp=@etuata@("cout de lancement")
 S SIGMADT(PMAX+1)=0,RMAXI(PMAX+1)=0,@dmd@(PMAX+1)=0
 F t=PMAX:-1:1 S SIGMADT(t)=SIGMADT(t+1)+@dmd@(t)
 S ILIGN=0,@PRD=ILIGN
 F t=TMAX:-1:1 S AVORT=0 D PERIODE(t),diag(t,.AVORT) Q:AVORT=1
 Q
 
PERIODE(t) 
 S d=@dmd@(t)
 S RMIN=$$MAX($$MAX(@RMINCO@(t),@RMINP@(t)),d-@QMAXCO@(t))
 S RMAX=$$MIN($$MIN(@RMAXCO@(t),@RMAXP@(t)),SIGMADT(t)+qlot)
 S RMAXI(t)=RMAX
 I (VISU#2)=1 U 0 W !,"periode : ",t," etude de stock : mini,demande, maxi ",RMIN," ",d," ",RMAX R *u
 I t=1 S RMIN=STOCKINI,RMAX=STOCKINI
 
 S RMIN=$S(t=1:RMIN\lot,RMIN#lot:(RMIN\lot)+1,1:RMIN\lot)
 S RMAX=(RMAX\lot)+1
 I (RMAX*lot)<qlot S RMAX=qlot\lot I RMAX'>0 S RMAX=1
 I (VISU#2)=1 W !,"periode : ",t," etude de stock : mini,demande, maxi ",RMIN," ",@dmd@(t)," ",RMAX R *u
 
 F rlot=RMIN:ratio:RMAX S r=rlot*lot D DEB^%SGMESU("TXP: resolution %TXPRSLV"),^%TXPRSLV,FIN^%SGMESU("TXP: resolution %TXPRSLV")
 Q
 
 
RMIN(t,RMIN) 
 S RMIN=$$MAX(@RMINCO@(t),@RMINP@(t))
 S RMIN=$$MAX(RMIN,@dmd@(t)-@QMAXCO@(t))
 Q
RMAX(t,RMAX) 
 S RMAX=$$MIN(@RMAXCO@(t),@RMAXP@(t))
 S RMAX=$$MIN(RMAX,SIGMADT(t)+qlot)
 S RMAXI(t)=RMAX
 Q
 
 
COUT(t,q,r,d) 
 S CT=$$COUTPRD(t,q)+$$COUTSTK((r+q)-d)
 Q CT
 
 
 
COUTPRD(t,q) Q:q=0 0
 I $$TYPATE^%TXPDKB(ATELIER)="FOURNISSEUR" Q cprix*q
 S h=q/qmh,xcp1=0,xcp2=0,h0=h-nbhn,h1=$$MIN(h,nbhn),h2=$$MAX(0,h0)
 S xcp1=cp1*h1,xcp2=cp2*h2
 S cp=xcp1+xcp2,xstp=stp
 Q cp+xstp
 
COUTSTK(r) Q:r<0 0 Q (r*cprix)*(cst/100)
MAX(a,b) Q $S(a>b:a,1:b)
MIN(a,b) Q $S(a<b:a,1:b)
 
 
V(pb,apb,ATELIER,ARTICLE,PMAX,demd,STOCKINI,VISU) 
 N %V,PB,TMAX
 D CLEPAG^%VVIDEO,LINEUP^%TXPSUTI
 S PB=pb
 S tdeb=1,TMAX=@tmax@(pb)
 S PB=$S(tdeb>TMAX:apb,1:pb)
 S %V=VLIMI,TMAX=@tmax@(PB)
 D %TXP1RD(pb,apb,ATELIER,ARTICLE,PMAX,demd,STOCKINI,(VISU#2)=1)
 
 I '($D(@PRD@(tdeb))) S %V=VLIMI G FINV
 S rdeb="",rdeb=$O(@PRD@(tdeb,rdeb)),il=@PRD@(tdeb,rdeb) I @prd@(il,9)<VLIMI U 0 W:(VISU#2)=1 !,PB," ","r init= ",rdeb," v ",@prd@(il,9),! S %V=@prd@(il,9),@prd@("NIVEAU.INITIAL")=rdeb
 I (VISU#2)=1 U 0 R *uuu W !,!,!
FINV Q %V
diag(tdeb,AVORT) 
 S AVORT=0
 I TYPE'=0 Q
 I '($D(@PRD@(tdeb))) D recomm1 Q
 S rdeb=""
lodiag 
 S rdeb=$O(@PRD@(tdeb,rdeb)) I rdeb="" D recomm1 Q
 S il=@PRD@(tdeb,rdeb) I @prd@(il,9)<VLIMI G findiag
 G lodiag
findiag Q
recomm1 
 S AVORT=1,%V=VLIMI
 U 0 W !,!,!,"~~~~~~ echec de la resolution elementaire a la periode ~~~ ",tdeb
 W !," ceci veut dire que pour cette periode et les suivantes, les contraintes de NIVEAU de STOCK et/ou les contraintes de NIVEAU de PRODUCTION"
 W !,"sont trop serrees."
 W !,"Nous vous conseillons de RELAXER ces contraintes ,en desserrant d'abord les contraintes de niveau de STOCK de la periode ",tdeb
 W !," [RETURN]" R %xxx:^TOZE($I,"ATTENTE")
 Q
 
MULT(a,b) 
 N m1 S m1=a\b I (m1*b)<a S m1=m1+1
 Q m1*b
 
M(M) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                      ",1,74)_"*" D ^%PKPOP Q
M2(M,M2) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                               ",1,55)_$E(M2_"                 ",1,15)_"*" D ^%PKPOP Q
 ;

