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

;%QSQUES1^INT^1^59547,73883^0
QSQUES1 ;
 
 
 
 
 N %QUE,%R,YGB
 D POCLEPA^%VVIDEO I DEJACONT!DEJAVARI D ^%VSQUEAK W $$^%QZCHW("Impossible ... les criteres et/ou les objets intermediaires en dependent") H 3 D POCLEPA^%VVIDEO Q
 S Y1=BASE
L0 
 D LIRE2^%VREAD("",Y1,51,78,11,9,"","",.CTR,.Y1) G:CTR="A" END
 S:Y1="" Y1=^[QUI]RQSDEFAU G:Y1'="?" S0
L2 D ^%QSCHQUE D:%R REAFF^%QSQUEST I %QUE="" G L0
 S BASE=%QUE G END
S0 I '($D(^[QUI]RQSAUTOR(WHOIS,Y1))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Inconnu ... refuse") H 3 D POCLEPA^%VVIDEO G L0
 S BASE=Y1
END S LBA("@")=$$NOMINT^%QSF(BASE)
 S DX=52,DY=10 X XY W "   " X XY W BASE
 K CTRLA,PCY,Y1,YG Q
 
L1 S (PCX,DX)=52,(PCY,DY)=10,YGB=YG X XY W YG X XY D BEG^%VLEC I CTRLA!(Y1="") S Y1=YGB G END
 G:Y1="?" L2 G S0

