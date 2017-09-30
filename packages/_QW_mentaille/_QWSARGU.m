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

;%QWSARGU^INT^1^59547,73886^0
QWSARGU ;
 
 
 
 
AFFHEAD(DOM,REG) 
 D CARSP^%VVIDEO(0,0,3,80,1)
 S DX=3,DY=1 X XY W $$^%QZCHW("Domaine")," : " S DX=13 X XY W DOM S DX=42 X XY W $$^%QZCHW("Regle")," : " S DX=50 X XY W REG
 Q
 
GETPAR(GLOREG,FOND,AJOUT,ADOM,AREG) 
 N Y1,Y2,CTR
 S (Y1,Y2)=""
 G:'(FOND) BC2
 D CARSP^%VVIDEO(0,0,3,80,1)
 D REV^%VVIDEO,XY^%VVIDEO(60,0) W:'(AJOUT) $$^%QZCHW("Consulter") W:AJOUT $$^%QZCHW("Ajouter") D NORM^%VVIDEO
 S DX=3,DY=1 X XY W $$^%QZCHW("Domaine")," : "
 S DX=42,DY=1 X XY W $$^%QZCHW("Regle")," : "
 
BC2 D LIRE2^%VREAD("",Y1,12,30,0,0,"REAF^%QWSARGU","$$UCDOM^%QWSARGU",.CTR,.Y1)
 I (CTR="A")!(CTR="F") S @ADOM=Y1,@AREG=Y2 Q CTR
 D LIRE2^%VREAD("",Y2,49,79,0,0,"REAF^%QWSARGU","$$UCREG^%QWSARGU",.CTR,.Y2)
 I (CTR="A")!(CTR="F") S @ADOM=Y1,@AREG=Y2 Q CTR
 G BC2
 
UCDOM(YY1,REAF) 
 N YCH
 S REAF=0
 I YY1="" Q 1-AJOUT
 I YY1="?" S YY1=$$CHOIX^%QWDMU,REAF=1 Q:YY1="" 1-AJOUT Q 1
 I '($D(^[QUI]RQSDON("QW","CD",YY1))) D ^%VZEAVT($$^%QZCHW("Domaine inconnu")) S YY1=$$CHOIX^%QWDMU,REAF=1 Q:YY1="" 1-AJOUT Q 1
 Q 1
 
UCREG(YY1,REAF) 
 N IDM,%IRG
 I YY1="" Q 1-AJOUT
 G:AJOUT UC1
 I '($D(@GLOREG@(Y1,YY1))) D ^%VZEAVT($$^%QZCHW("Regle inconnue")) Q 0
 Q 1
UC1 I $D(@GLOREG@(Y1,YY1)) D ^%VZEAVT($$^%QZCHW("Regle existante")) Q 0
 Q 1
 
REAF 
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,0,3,40,1)
 S DX=3,DY=1 X XY W $$^%QZCHW("Domaine")," : ",Y1
 D CARSP^%VVIDEO(40,0,3,40,1)
 S DX=42,DY=1 X XY W $$^%QZCHW("Regle")," : ",Y2
 Q

