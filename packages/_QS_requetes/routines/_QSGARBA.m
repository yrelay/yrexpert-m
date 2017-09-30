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

;%QSGARBA^INT^1^59547,73881^0
RQSGARBA ;
 
 
 
 
 
 
 
 N C,%C,NC,%NC,R,%R
 S R=-1 F %R=0:0 S R=$N(^[QUI]RQS1(R)) Q:R=-1  S NC=-1 F %NC=0:0 S NC=$N(^[QUI]RQS1(R,"CONTRAINTES",NC)) Q:NC=-1  D MARQ(^[QUI]RQS1(R,"CONTRAINTES",NC,"TETE"))
 S R=-1 F %R=0:0 S R=$N(^[QUI]RQS1(R)) Q:R=-1  S NC=-1 F %NC=0:0 S NC=$N(^[QUI]RQS1(R,"VARIABLES",NC)) Q:NC=-1  D MARQ(^[QUI]RQS1(R,"VARIABLES",NC,"TETE"))
 S R=-1 F %R=0:0 S R=$N(^[QUI]TTLTTMTS(R)) Q:R=-1  S NC=-1 F %NC=0:0 S NC=$N(^[QUI]TTLTTMTS(R,"ANAL",NC)) Q:NC=-1  D MARQ(^[QUI]TTLTTMTS(R,"ANAL",NC))
 S R=-1 F %R=0:0 S R=$N(^[QUI]RQS4(R)) Q:R=-1  S NC=-1 F %NC=0:0 S NC=$N(^[QUI]RQS4(R,NC)) Q:NC=-1  S C=-1 F %C=0:0 S C=$N(^[QUI]RQS4(R,NC,C)) Q:C=-1  D MARQ(^[QUI]RQS4(R,NC,C,"ARBRE"))
 S R=-1 F %R=0:0 S R=$N(^[QUI]TTLTTTMT(R)) Q:R=-1  S NC=-1 F %NC=0:0 S NC=$N(^[QUI]TTLTTTMT(R,"LIGNES",NC)) Q:NC=-1  D MARQ(^[QUI]TTLTTTMT(R,"LIGNES",NC,"TETE"))
 D CLEAR Q
 
MARQ(A) Q:A=0  S ^[QUI]RQSA(A,"@@@@@")="" N I F I=1:1 Q:'($D(^[QUI]RQSA(A,I)))  D MARQ(^[QUI]RQSA(A,I))
 Q
 
CLEAR N A,%A S A=-1 F %A=0:0 S A=$N(^[QUI]RQSA(A)) Q:A=-1  K:'($D(^[QUI]RQSA(A,"@@@@@"))) ^[QUI]RQSA(A) K ^[QUI]RQSA(A,"@@@@@")
 Q

