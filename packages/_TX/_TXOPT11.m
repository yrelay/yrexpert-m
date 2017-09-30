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

;%TXOPT11^INT^1^59547,74031^0
%TXOPT11(PB,ATELIER,ARTICLE,printer) 
 
 
 s PRD="^[QUI]OPTPRD(PB,ATELIER,ARTICLE)",prd="^[QUI]OPTprd(PB,ATELIER,ARTICLE)",dmd="^[QUI]demande(PB,ATELIER,ARTICLE)"
 s qmh=^[QUI]qmh(ATELIER,ARTICLE)
 o printer
loop w !,!," periode : " r tdeb
 q:tdeb=0
 w !,!," niveau de stock initial : " r rdeb
 g:rdeb="" loop
 s t1=tdeb d PERIODE(t1,rdeb)
 q
PERIODE(t,r) 
 u printer w !,!,"****"," periode :",t,!,?3,"st in",?13,"dde r",?23,"dde l",?33,"qt pr",?43,"st f",?53,"cout total"
 
loop1 
 s ILIGN=@PRD@(t,r)
 s qopt=@prd@(ILIGN,3),d=@prd@(ILIGN,4),r1=@prd@(ILIGN,5),cprd=@prd@(ILIGN,6),cstk=@prd@(ILIGN,7),cfinh=@prd@(ILIGN,8),total=@prd@(ILIGN,9)
 s D=^[QUI]DEMANDE(ATELIER,ARTICLE,t)
 d print
 s t=t+1,r=r1 q:t>PMAX  g loop1
 q
print 
 s d2=D*qmh
 s total=total\1,cfinh=cfinh\1,cstk=cstk\1,cprd=cprd\1
 u printer w !,t,?3,r,?13,d2,?23,d,?33,qopt,?43,r1,?53,total
 q

