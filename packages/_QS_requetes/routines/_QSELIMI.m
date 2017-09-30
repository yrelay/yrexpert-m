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

;%QSELIMI^INT^1^59547,73881^0
RQSELIMI ;
 
 
 
 
 N B,%B,BID,DXD,DXG,DYB,DYH,F,%F,GRAPH,I,MSG
 D CLEPAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1
 S MSG=$$^%QZCHW("ELIMINATION DES MINI-REQUETES") D 4^%VZCD
L0 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous eliminer les minies-requetes deja calculees ? : "),"N")=1 G 79
 Q
79 D POCLEPA^%VVIDEO W $$^%QZCHW("OK elimination en cours ...") H 2
 S B=-1 F %B=0:0 S B=$N(^[QUI]RQS3($J,B)) Q:B=-1  S F=-1 F %F=0:0 S F=$N(^[QUI]RQS3($J,B,F)) Q:F=-1  D POCLEPA^%VVIDEO W B,"  ",F H 1 K ^[QUI]RQS3($J,B,F)
 S B=-1 F %B=0:0 S B=$N(^[QUI]RQS4(B)) Q:B=-1  S F=-1 F %F=0:0 S F=$N(^[QUI]RQS4(B,F)) Q:F=-1  D POCLEPA^%VVIDEO W B,"  ",F H 1 K ^[QUI]RQS4(B,F)
 Q

