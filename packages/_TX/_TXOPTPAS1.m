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

;%TXOPTPAS1^INT^1^59547,74032^0
%TXOPTPAS1 ;
 k ^qtof s garde="",z=""
 o 10:("r":"bi71")
 o 11:("w":"bi71w.dat")
loop u 10 r x
 s STATUS=$zdev("R",10),ST=$p(STATUS,",",1) g:ST=3 fin g:$a(x)=26 fin i (x["SPM")&(x'["TOTAL") s spm=$p(x,"SPM ",2),spm=$p(spm," ",1) g loop
 s x=$$GETLBLAN^%VTLBLAN(x)
 i x["TOTAL SPM" u 10 r x g loop
 i $l(x)=0 g loop
 i ($e(x,1)+0)'=$e(x,1) s:garde="" garde=x d garde g loop
 s z=x i ($p(x," ",1)+0)>10000 s z=z_spm
 u 11 w z,! u 0 w z,! s garde=""
 u 10 r x
 s x=$$GETLBLAN^%VTLBLAN(x)
 i $l(x)>0 u 11 w x,! u 0 w x,! g loop
 g loop
fin c 10
 c 11
garde 
 s qtof=$e(garde,18,23)
 s qt=0 f ij=30:6:126 s qt=(qt+$$GETLBLAN^%VTLBLAN($e(garde,ij,ij+5)))+0
 i $l(z)>0 s ^qtof($e(z,1,17))=qtof_"~"_qt
 q

