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

;%QS4^INT^1^59547,73880^0
%QS4(R) 
 
 
 
 
 
 D INIT(R),^%QSACTRE(R,BASE) G:RQSRESUL="" FIN S ^DERLISTE($I)=RQSRESUL
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Le resultat est dans ") D BLD^%VVIDEO W RQSRESUL_" ("_^[QUI]RQS2(RQSRESUL,"CARD")_") " D NORM^%VVIDEO W $$^%QZCHW(" ... [RETURN]") R *BID G FIN
L0 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous exploiter le resultat tout de suite ? :"),"O")=1 G 79
 G FIN
79 D REQU^%QS0D G FIN
FIN K BASE,BID,BLD,COMM,CONT,DX,DXD,DXG,DY,DYB,DYH,GRAPH,I,LH,LV,MSG,NOLC,NOLV,REQ,RQSRESUL,VAR Q
INIT(R) 
 N I K VAR,CONT S NOLV=1,NOLC=1,REQ=R,BASE=^[QUI]RQS1(R,"BASE")
 S COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 F I=1:1 Q:'($D(^[QUI]RQS1(R,"VARIABLES",I)))  S VAR(I)=^[QUI]RQS1(R,"VARIABLES",I),VAR(I,"TETE")=^[QUI]RQS1(R,"VARIABLES",I,"TETE")
 F I=1:1 Q:'($D(^[QUI]RQS1(R,"CONTRAINTES",I)))  S CONT(I)=^[QUI]RQS1(R,"CONTRAINTES",I),CONT(I,"TETE")=^[QUI]RQS1(R,"CONTRAINTES",I,"TETE"),CONT(I,"TABATT")=$S($D(^[QUI]RQS1(R,"CONTRAINTES",I,"TABATT")):^[QUI]RQS1(R,"CONTRAINTES",I,"TABATT"),1:"")
 D REAFF^%QSQUEST Q

