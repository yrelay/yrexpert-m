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

;%QWSADMU^INT^1^59547,73886^0
QWSADMU ;
 
 
 
 
 
AFFHEAD(DOM) 
 D CARSP^%VVIDEO(0,0,3,80,1)
 S DX=23,DY=1 X XY W $$^%QZCHW("Domaine")," : "
 S DX=33,DY=1 X XY W DOM
 Q
 
 
GETPAR(FOND,AJOUT,ADOM) 
 N Y1,Y2,CTR
 S (Y1,Y2)=""
 G:'(FOND) BC2
 D CARSP^%VVIDEO(0,0,3,80,1)
 D REV^%VVIDEO,XY^%VVIDEO(60,0) W:'(AJOUT) $$^%QZCHW("Consulter") W:AJOUT $$^%QZCHW("Ajouter") D NORM^%VVIDEO
 S DX=23,DY=1 X XY W $$^%QZCHW("Domaine")," : "
BC2 D LIRE2^%VREAD("",Y1,32,70,0,0,"REAF^%QWSADMU","$$UCDOM^%QWSADMU",.CTR,.Y1)
 I (CTR="A")!(CTR="F") S @ADOM=Y1 Q CTR
 G BC2
 
UCDOM(YY1,REAF) 
 N YCH
 S REAF=0
 I YY1="" Q 1
 G:AJOUT UC2
 I YY1="?" S YY1=$$CHOIX^%QWDMU,REAF=1 Q:YY1="" 1-AJOUT Q 1
 I '($$EXISTE^%QWDMU(YY1)) D ^%VZEAVT($$^%QZCHW("Ce domaine n'existe pas")) S YY1=$$CHOIX^%QWDMU,REAF=1 Q 1
 Q 1
UC2 I $$EXISTE^%QWDMU(YY1) D ^%VZEAVT($$^%QZCHW("Ce domaine existe deja")) Q 0
 Q 1
 
REAF 
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,0,3,80,1)
 S DX=23,DY=1 X XY W $$^%QZCHW("Domaine")," : ",Y1
 D REV^%VVIDEO,XY^%VVIDEO(60,0) W:AJOUT $$^%QZCHW("Consulter") W:'(AJOUT) $$^%QZCHW("Ajouter") D NORM^%VVIDEO
 Q

