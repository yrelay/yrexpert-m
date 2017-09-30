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

;%TXOPTPAS4^INT^1^59547,74032^0
%TXOPTPAS4 ;
 
 k ^les14,^poicout
 o 12:("r":"sortie.art")
loop1 u 12 r x u 0 w !,x
 i $l(x)>0 s ^les14($p(x," ",1))=$p(x,"     ",2) g loop1
 c 12
 o 12:("r":"yxpart.txt")
loop2 u 12 r x u 0 w !,x
 i $l(x)>0 s x1=$e(x,1,10),x2=$e(x,11,32),x3=$e(x,37,48),x1=$$GETLBLAN^%VTLBLAN(x1),x2=$$GETLBLAN^%VTLBLAN(x2),x3=$$GETLBLAN^%VTLBLAN(x3),^poicout($e(x1,1,6))=x3_"~"_x2 g loop2
 c 12
 s etud="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"")"
 o 10:("r":"bi71w56.dat")
loop u 10 r x1,x
 u 0 w x1,!,x,!
 i (x1="")&(x="") c 10 q
 s ARTICLE=$e(x1,1,17),ATELIER=$e(x1,20,23),qtof=0,qt=1
 i $d(^qtof(ARTICLE)) s qtof=$p(^qtof(ARTICLE),"~",1),qt=$p(^qtof(ARTICLE),"~",2)
 s ARTICLE=$e(ARTICLE,1,6) u 0 w ARTICLE,"<<<",! i '($d(^les14(ARTICLE))) g loop
 u 0 w !,"l'article",ARTICLE," ",qtof," ",qt," existe dans les 14 "
 
 
 
 s @etud@(ARTICLE,"Commentaire")=^les14(ARTICLE)
 s @etud@(ARTICLE,"Quantite moyenne horaire")=$$GETLBLAN^%VTLBLAN(qtof)/$$GETLBLAN^%VTLBLAN(qt)
 i $d(^poicout(ARTICLE)) s @etud@(ARTICLE,"Poids")=$p(^poicout(ARTICLE),"~",1),@etud@(ARTICLE,"Prix de Revient")=$p(^poicout(ARTICLE),"~",2) u 0 w !,"on prend ",x1,!
 f i=1:1:16 s q=$e(x,((i-1)*6)+1,i*6),@etud@(ARTICLE,"DMD","DEMANDE","Periode "_i)=$$GETLBLAN^%VTLBLAN(q)
 g loop

