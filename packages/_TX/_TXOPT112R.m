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

;%TXOPT112R^INT^1^59547,74031^0
%TXOPT112R(ETUDE,ARB,NOEUD,pb,apb,ATELIER,ARTICLE,PMAX,demd) ;;10:27 PM  2 Jun 1992
 
 
 
 n PB,H,M,S
 s printer=32 o 32
 s PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)"
 
 s PB=pb
 k @(SOL)
 s dt=0,DT=0
loop s tdeb=1,PB=$$PROBLEME(tdeb),TMAX=@tmax@(PB)
 
 s rdeb="" f z=1:1 s rdeb=$o(@PRD@(tdeb,rdeb)) q:rdeb=""  s il=@PRD@(tdeb,rdeb) i @prd@(il,9)>10000000
 
 s rdeb=@etuata@("Stock Initial"),il=@PRD@(tdeb,rdeb),@etuata@("Valeur Jauge")=@prd@(il,9) i @prd@(il,9)<10000000 d FIN^VTIME,AFFTIME s @etuata@("Etat de cet article")=PB_"~duree : "_DELTA1 d loop1 w !,!,"total reel :",dt," total en lots : ",DT
 
 g construc
loop1 s dt=0,DT=0,POLL=0
 i tdeb=1,'($d(@SOL@("NIVEAU.INITIAL"))) s @SOL@("NIVEAU.INITIAL")=rdeb,POLL=1
 s t1=tdeb d PERIODE(t1,rdeb)
 q
PERIODE(t,r) 
 s PB=$$PROBLEME(t),TMAX=@tmax@(PB)
 s r=(r\lot)*lot
 q:'($d(@PRD@(t,r)))  s il=@PRD@(t,r) q:@prd@(il,9)>10000000
 u printer w !,!,"****"," periode :",t,!,?3,"st in",?13,"dde r",?23,"dde l",?33,"qt prd",?43,"st f",?53,"total"
 
loop11 
 s PB=$$PROBLEME(t),TMAX=@tmax@(PB)
 s r=(r\lot)*lot
 i (t>4)&('($d(@PRD@(t,r)))) b
 q:'($d(@PRD@(t,r)))
 s ILIGN=@PRD@(t,r),qopt=@prd@(ILIGN,3),d=@prd@(ILIGN,4),r1=@prd@(ILIGN,5),cprd=@prd@(ILIGN,6),cstk=@prd@(ILIGN,7),cfinh=@prd@(ILIGN,8),total=@prd@(ILIGN,9)
 i POLL s @SOL@(t)=qopt
 s D=@demd@(t)
 d print
 s t=t+1,r=r1 q:t>PMAX  g loop11
 q
print 
 s d2=D
 s total=total\1,cfinh=cfinh\1,cstk=cstk\1,cprd=cprd\1
 u printer w !,t,?3,r,?13,d2,?23,d,?33,qopt,?43,r1,?53,total
 s dt=dt+d2,DT=DT+d
 q
PROBLEME(t) 
 i t>TMAX q @tapb@(PB)
 q PB
 
construc 
 
 
 
 f t=1:1:PMAX i $d(@SOL@(t)) d PUSHMAT^%TXOPTPRIM(ARB,NOEUD,"Q",t,ARTICLE,@SOL@(t))
 d PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"NOM.PB",ARTICLE,pb)
 d PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"APB",ARTICLE,apb)
 i $d(@SOL@("NIVEAU.INITIAL")) d PUSHVAL^%TXOPTPRIM(ARB,NOEUD,"STOCK.INITIAL",ARTICLE,@SOL@("NIVEAU.INITIAL"))
AFFTIME 
 s:'($d(DELTA1)) DELTA1=0 u 0 w !,ARTICLE,?40,DELTA-DELTA1," secondes"
 s:'($d(nomprob)) nomprob=0,totprob=0
 s nomprob=nomprob+1,totprob=totprob+(DELTA-DELTA1),moy=totprob/nomprob
 u 0 w " moyenne ",moy
 s DELTA1=DELTA
 q

