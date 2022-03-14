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
;! Nomprog     : %QSCALCU                                                     !
;! Module      : %QS - requete                                                !
;! But         : Calcul de la requete                                         !
;!                                                                            !
;! Description : $REQUETE                                                     !
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

;%QSCALCU^INT^1^59547,73880^0
%QSCALCU(R,BA,%QE,S,TRI,CARD) 
 
 
 
 
 
 
 
 
 
 
 N ADR,STOC,ARBRE,CL,LISTE,BID,OPR,OKECR
 S STOC=S,OKECR=$$GET^%SGVAR("ECR")
 I $D(^[QUI]RQS1(R,"COMPILATION")) S ARBRE=^[QUI]RQS1(R,"COMPILATION") G:$D(^[QUI]ANSA(ARBRE)) CALEFF
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Elaboration de la strategie de calcul ...")
 I '($$COMP^%QSCOMPI(R,.ARBRE)) D:OKECR POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Impossible de calculer cette requete, desole ")) Q 0
 S ^[QUI]RQS1(R,"COMPILATION")=ARBRE
CALEFF I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Calcul effectif en cours ...")
 D ^%QSACTIV(ARBRE,BA,%QE,.ADR,.CL)
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Intersection finale ")
 S CARD=0 G:CL=0 FIN
 I WHOIS("ETUDE")'=0 G EPIETU
 S CARD=0,OPR="",O="" F %O=0:0 S O=$O(@ADR@(O)) Q:O=""  S OPR=O,CARD=CARD+1,^[QUI]RQS2(STOC,"OBJET",O)=CARD,^[QUI]ZLIGTRIE(TRI,CARD)=O I OKECR W:(CARD#10)=0 "*"
 G FIN
EPIETU 
 S CARD=0,OPR="",O="" F %O=0:0 S O=$O(@ADR@(O)) Q:O=""  D AJOUT^%QS0XG1(STOC,O) S OPR=O,CARD=CARD+1 I OKECR D:(CARD#10)=0 AFFPT(CARD)
 
FIN I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Calcul termine --> "),CARD,$$^%QZCHW(" individu(s) selectionne(s) ...")
 K ^CXZ($J) Q 1
AFFPT(X) S DY=20,DX=30+((X\10)#45) X XY W "* "

