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

;%QSVSIGN^INT^1^59547,73883^0
RQSVSIGN ;
 
 
 
 
 N ERR,OLDSIGN,SIGN S ERR=0
 D CLEPAG^%VVIDEO,^%VZCD0("CODE SECRET")
 S DX=0,DY=5 X XY D CLEBAS^%VVIDEO
S S DX=10,DY=10 X XY S Y1=$$^%VZAME1($$^%QZCHW("Signataire  : "))
 I CTRLA!(Y1="") Q
 S SIGN=Y1
 I $$^%QCAZG("^[QUI]RQSVSIGN(SIGN)")="" K ^[QUI]RQSVSIGN(SIGN)
 I $D(^[QUI]RQSVSIGN(SIGN)) D ^%VZEAVT($$^%QZCHW("Modification de votre code secret")) G MD
 D ^%VZEAVT($$^%QZCHW("Creation de votre code secret"))
C D MM S DX=10,DY=12 X XY W $$^%QZCHW("Code secret : ")
 S DX=$X,DY=$Y D ECHOFF^%VVIDEO R Y1 D ECHON^%VVIDEO
 I Y1="" D ^%VZEAVT($$^%QZCHW("Abandon, pas de code secret pour ")_SIGN) Q
 S ^[QUI]RQSVSIGN(SIGN)=$$ADR^%QZCHNET(Y1)
 D ^%VZEAVT($$^%QZCHW("Code secret OK pour ")_SIGN) Q
MD S ERR=ERR+1
 S DX=0,DY=12 X XY D CLEBAS^%VVIDEO
 D MM S DX=10,DY=12 X XY W $$^%QZCHW("Ancien code secret : ")
 S DX=$X,DY=$Y D ECHOFF^%VVIDEO R Y01 D ECHON^%VVIDEO
 I Y01="" D ^%VZEAVT($$^%QZCHW("Abandon, code secret non modifie pour ")_SIGN) Q
 S OLDSIGN=^[QUI]RQSVSIGN(SIGN)
 I Y01'=OLDSIGN G:ERR<3 AGAIN H
 D MM S DX=10,DY=14 X XY W $$^%QZCHW("Nouveau code secret : ")
 S DX=$X,DY=$Y D ECHOFF^%VVIDEO R Y1 D ECHON^%VVIDEO
 I Y1="" D ^%VZEAVT($$^%QZCHW("Code secret inchange pour ")_SIGN) Q
 S ^[QUI]RQSVSIGN(SIGN)=$$ADR^%QZCHNET(Y1)
 D ^%VZEAVT($$^%QZCHW("Code secret modifie pour ")_SIGN) K Y1,Y01 Q
AGAIN D ^%VZEAVT($$^%QZCHW("Veuillez recommencer S.V.P.")) G MD
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M," ... " H 1 D POCLEPA^%VVIDEO Q
MM D POCLEPA^%VVIDEO W "[RETURN]: "_$$^%QZCHW("abandonner") Q

