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

;%TXOPT112^INT^1^59547,74031^0
%TXOPT112(PB,ATELIER,ARTICLE,printer) ;;03:03 PM  16 Apr 1992
 
 
 
 s PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)",dmd="^[QUI]demande(PB,ATELIER,ARTICLE)",SOL="^[QUI]sol(PB,ATELIER,ARTICLE)"
 k @(SOL)
 o printer
 s dt=0,DT=0
loop w #,!,!," periode : " r tdeb
 q:tdeb=""
 w !," niveaux initiaux possibles pour ",tdeb i '($d(@PRD@(tdeb))) w "*** aucun " g loop
 w !,! s rdeb="" f z=1:1 s rdeb=$o(@PRD@(tdeb,rdeb)) q:rdeb=""  w !," ",rdeb s il=@PRD@(tdeb,rdeb) i @prd@(il,9)>10000000 w " ",@prd@(il,9),!
 r *uuu w !,!,!
 s rdeb="" f z=0:0 s rdeb=$o(@PRD@(tdeb,rdeb)) q:rdeb=""  s il=@PRD@(tdeb,rdeb) u 0 w !,!,@prd@(il,9) i @prd@(il,9)<10000000 d loop1 w !,!,"total reel :",dt," total en lots : ",DT u 0 r *vvv
 g loop
loop1 s dt=0,DT=0,POLL=0
 i tdeb=1,'($d(@SOL@("NIVEAU.INITIAL"))) s @SOL@("NIVEAU.INITIAL")=rdeb,POLL=1
 s t1=tdeb d PERIODE(t1,rdeb)
 q
PERIODE(t,r) 
 q:'($d(@PRD@(t,r)))  s il=@PRD@(t,r) q:@prd@(il,9)>10000000
 u printer w !,!,"****"," periode :",t,!,?3,"st in",?13,"dde r",?23,"dde l",?33,"qt prd",?43,"st f",?53,"total"
 
loop11 
 q:'($d(@PRD@(t,r)))
 s ILIGN=@PRD@(t,r),qopt=@prd@(ILIGN,3),d=@prd@(ILIGN,4),r1=@prd@(ILIGN,5),cprd=@prd@(ILIGN,6),cstk=@prd@(ILIGN,7),cfinh=@prd@(ILIGN,8),total=@prd@(ILIGN,9)
 i POLL s @SOL@(t)=qopt
 s D=^[QUI]DEMANDE(ATELIER,ARTICLE,t)
 d print
 s t=t+1,r=r1 q:t>PMAX  g loop11
 q
print 
 s d2=D*qmh
 s total=total\1,cfinh=cfinh\1,cstk=cstk\1,cprd=cprd\1
 u printer w !,t,?3,r,?13,d2,?23,d,?33,qopt,?43,r1,?53,total
 s dt=dt+d2,DT=DT+d
 q

