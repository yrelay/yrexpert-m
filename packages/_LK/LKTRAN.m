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

;LKTRAN^INT^1^59547,74867^0
LKTRAN ;
 
 
 
 
 
 
 
 
 
 
 
 
TRANS(TAB,A,ER) 
 I A="" S ER=0 Q ""
 I ($D(@TAB@(A))#10)=1 S ER=0 Q @TAB@(A)
 S ER=1
 Q " "
 
 
 
TRAN(TAB,V) 
 N I,A
 
 S TAB=$$CONCAS^%QZCHAD(LOCAL,TAB)
 S A=$O(V(""))
 F I=0:0 Q:A=""  D TRAN1 S A=$O(V(A))
 Q 0
TRAN1 S V(A)=$$TRANS(TAB,V(A),.ER) Q
 
CON(V) 
 N I,A
 S V=""
 S A=$O(V(""))
 F I=0:0 Q:A=""  S V=V_V(A),A=$O(V(A))
 Q 0
 
 
 
CHAR(V) 
 N I,A
 S A=$O(V(""))
 F I=0:0 Q:A=""  S V(A)=$C(V(A)),A=$O(V(A))
 Q 0
 
 
 
HD(V) 
 N I,A
 S A=$O(V(""))
 F I=0:0 Q:A=""  S V(A)=$$HD^%QZNBCV(V(A)),A=$O(V(A))
 Q 0

