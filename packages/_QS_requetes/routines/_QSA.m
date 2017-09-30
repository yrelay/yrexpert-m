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

;%QSA^INT^1^59547,73880^0
RQSA ;
 
 
 
 
 
 
INIT 
 K ^[QUI]RQSA S ^[QUI]RQSA=0 Q
NEW() 
 S ^[QUI]RQSA=^[QUI]RQSA+1 Q ^[QUI]RQSA
SET(N,A,V) 
 S ^[QUI]RQSA(N,A)=V Q
RED(N,A) 
 Q:'($D(^[QUI]RQSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]RQSA(N,A)
KILL(T) 
 Q:T=0  N I F I=1:1 Q:'($D(^[QUI]RQSA(T,I)))  D KILL(^[QUI]RQSA(T,I))
 K ^[QUI]RQSA(T) Q
RECOP(A) 
 Q:A=0 0 N I,%I,N S N=$$NEW
 S I=-1 F %I=0:0 S I=$N(^[QUI]RQSA(A,I)) Q:I=-1  D RA:I?.N,RV:I'?.N
 Q N
RA S ^[QUI]RQSA(N,I)=$$RECOP(^[QUI]RQSA(A,I)) Q
RV S ^[QUI]RQSA(N,I)=^[QUI]RQSA(A,I) Q
PRINT(T) 
 D P(T,0) Q
P(T,I) Q:T=0  W !
 N J,%J S J=-1 F %J=0:0 S J=$N(^[QUI]RQSA(T,J)) Q:J=-1  W:J'?.N !,$J("",I),J," --> ",^[QUI]RQSA(T,J)
 F J=1:1 Q:'($D(^[QUI]RQSA(T,J)))  D P(^[QUI]RQSA(T,J),I+4)
 Q

