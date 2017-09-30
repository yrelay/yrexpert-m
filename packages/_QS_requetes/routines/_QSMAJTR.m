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

;%QSMAJTR^INT^1^59547,73882^0
RQSMAJTR ;
 
 
 
 
 
ADD(B,O,A,V,D) 
 
 Q
 N ARB,CTX,E,OK,R,%R,VAR
 S R=-1 F %R=0:0 S R=$N(^[QUI]RQS4(B,A,R)) Q:R=-1  D TR2,TR
 Q
TR S ARB=^[QUI]RQS4(B,A,R,"ARBRE")
 S VAR=$$RED^%ANA(ARB,"VAR") S:VAR="" VAR="@"
 S CTX(VAR,"BASE")=B,CTX(VAR,"OBJET")=O
 S E=$$SUBST^%ANARBR2(ARB,.CTX,"",.OK)
 
 Q:'(OK)
 
 Q:'(E)
 
 S ^[QUI]RQS3($J,B,R,"CARD")=^[QUI]RQS3($J,B,R,"CARD")+1
 S ^[QUI]RQS3($J,B,R,"OBJET",O)="" Q
DEL(B,O,A,V,D) 
 Q
 N R,%R
 S R=-1 F %R=0:0 S R=$N(^[QUI]RQS4(B,A,R)) Q:R=-1  D TR2
 Q
TR2 
 Q:'($D(^[QUI]RQS3($J,B,R,"OBJET",O)))
 
 S ^[QUI]RQS3($J,B,R,"CARD")=^[QUI]RQS3($J,B,R,"CARD")-1
 K ^[QUI]RQS3($J,B,R,"OBJET",O) Q

