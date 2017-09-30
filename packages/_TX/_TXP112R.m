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

;%TXP112R^INT^1^59547,74032^0
%TXP112R(ETUDE,ARB,NOEUD,pb,apb,ATELIER,ARTICLE,PMAX,demd,printer,VISU) ;;01:10 PM  3 May 1993; 14 Jan 93  4:39 PM ; 10 Mar 93  9:13 AM
 
 
 n PB,H,M,S
 
 i VISU#2 s printer=0 ;;s printer=32
 i VISU#2 w !,"112R et printer visu",printer," ",VISU r *x
 
 d CLEPAG^%VVIDEO
 s PRD="^[QUI]OPTPRD(ETUDE,PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(ETUDE,PB,ATELIER,ARTICLE)"
 
 s PB=pb
 
 s dt=0,DT=0,il=""
loop s tdeb=1,TMAX=@tmax@(PB),PB=$$PROBLEME(tdeb)
 i VISU#2 w !,"112R debut",VISU r *x
 i VISU#2 w !," niveaux initiaux possibles pour ",tdeb
 i '($d(@PRD@(tdeb))) w "*** aucun " q
 s rdeb="" f z=1:1 s rdeb=$o(@PRD@(tdeb,rdeb)) q:rdeb=""  s il=@PRD@(tdeb,rdeb) i @prd@(il,9)<VLIMI q  ;;on a trouve un rdeb
 q:il=""
 i VISU#2 r *uuu w !,!,!
 
 s @etuata@("Valeur Jauge")=@prd@(il,9)
 i @prd@(il,9)<VLIMI d FIN^%VTIME,AFFTIME s @etuata@("Etat de cet article")=PB_"~duree : "_DELTA1 d loop1 i VISU#2 u printer w !,!,"total reel :",dt," total en lots: ",DT
 
 i VISU#2,printer>0 u printer w # ;;c printer
 g construc
loop1 s dt=0,DT=0,POLL=0,lot=@etuata@("capacite d'un conteneur")
 i tdeb=1,'($d(@SOL@("NIVEAU.INITIAL"))) s @SOL@("NIVEAU.INITIAL")=rdeb,POLL=1
 s t1=tdeb d PERIODE(t1,rdeb)
 q
PERIODE(t,r) 
 s PB=$$PROBLEME(t),TMAX=@tmax@(PB)
 s r=(r\lot)*lot
 q:'($d(@PRD@(t,r)))  s il=@PRD@(t,r) q:@prd@(il,9)>VLIMI
 i VISU#2 w !,!,"****",ETUDE,!,?3,ATELIER,?13,ARTICLE,?23," valeur :",@prd@(il,9)\1
 i VISU#2 w !,!,"****"," periode :",t,!,?3,"st in",?13,"dde r",?23,"dde l",?33,"qt prd",?43,"st f",?53,"cf",?63,"cst",?71,"cprd" ;; ,?53,"total"
 
loop11 
 s PB=$$PROBLEME(t),TMAX=@tmax@(PB)
 s r=(r\lot)*lot
 q:'($d(@PRD@(t,r)))
 s ILIGN=@PRD@(t,r)
 
 s total=@prd@(ILIGN,9)
 s qopt=@prd@(ILIGN,"VAL")
 s d=$p(qopt,"^",2),r1=$p(qopt,"^",3),cprd=$p(qopt,"^",4),cstk=$p(qopt,"^",5),cfinh=$p(qopt,"^",6)
 s qopt=$p(qopt,"^")
 i POLL s @SOL@("Periode "_t)=qopt
 s D=@dmd@("Periode "_t)
 d print
 s t=t+1,r=r1 q:t>PMAX  g loop11
 q
print 
 s d2=D
 s total=total\1,cfinh=cfinh\1,cstk=cstk\1,cprd=cprd\1
 i VISU#2 w !,t,?3,r,?13,d2,?23,d,?33,qopt,?43,r1,?53,cfinh,?63,cstk,?71,cprd
 ;; ,?53,total
 s dt=dt+d2,DT=DT+d
 q
PROBLEME(t) 
 i t>TMAX q @tapb@(PB)
 q PB
 
construc 
 
 f t=1:1:PMAX i $d(@SOL@("Periode "_t)) d PUSHMAT^%TXPPRIM(ARB,NOEUD,"Q",t,ARTICLE,@SOL@("Periode "_t))
 
 f t=1:1:PMAX s @SOL@("demd",t)=@dmd@("Periode "_t)
 s @SOL@("NOEUD")=NOEUD,@SOL@("pb")=pb,@SOL@("apb")=apb
 s @SOL@("ARB")=ARB,@SOL@("PMAX")=PMAX
 d PUSHVAL^%TXPPRIM(ARB,NOEUD,"NOM.PB",ARTICLE,pb)
 d PUSHVAL^%TXPPRIM(ARB,NOEUD,"APB",ARTICLE,apb)
 i $d(@SOL@("NIVEAU.INITIAL")) d PUSHVAL^%TXPPRIM(ARB,NOEUD,"STOCK.INITIAL",ARTICLE,@SOL@("NIVEAU.INITIAL"))
 d PUSHVAL^%TXPPRIM(ARB,NOEUD,"VALEUR.JAUGE",ARTICLE,@etuata@("Valeur Jauge"))
AFFTIME 
 i '($d(DELTA1)) s DELTA1=0,DELTA=0,nomprob=0,totprob=0
 
 
 s nomprob=nomprob+1,totprob=totprob+(DELTA-DELTA1),moy=totprob/nomprob
 
 s DELTA1=DELTA
 q

