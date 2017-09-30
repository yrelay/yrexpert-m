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

;%LXTEST^INT^1^59547,73871^0
LEXTEST ;
 
 
 
 
 
 D CLEPAG^%VVIDEO,BLD^%VVIDEO
 S DX=1,DY=1 X XY W $$^%QZCHW("Test : ajout du mot TEST.AJOUT") D NORM^%VVIDEO
 S DX=5,DY=2 X XY W $$^%QZCHW("Existence du mot TEST.AJOUT : ")
 D SUP("TEST.AJOUT")
 S REP=$$EXIST^%LXSTOCK("TEST.AJOUT"),REPF=$S(REP=1:"existe",1:"n'existe pas"),DX=35,DY=2 X XY W REPF
 I REP=1 D PB(5,3) Q
 D OK(5,3),MOT("TEST.AJOUT")
 S DX=5,DY=4 X XY W $$^%QZCHW("Existence de TEST.AJOUT apres insertion : ")
 S REP=$$EXIST^%LXSTOCK("TEST.AJOUT"),REPF=$S(REP=1:"existe",1:"n'existe pas"),DX=47,DY=4 X XY W REPF
 I REP=0 D PB(5,5) Q
 D OK(5,5),BLD^%VVIDEO S DX=1,DY=6 X XY W $$^%QZCHW("Test : ajout d'une liste de mots") D NORM^%VVIDEO
 D SUP("ESSAI.LISTE.1"),SUP("ESSAI.LISTE9"),SUP("VERIFICATION")
 S DX=5,DY=7 X XY W $$^%QZCHW("Existence de ces mots : ESSAI.LISTE.1 ESSAI.LISTE9 VERIFICATION")
 S REP=$$EXIST^%LXSTOCK("ESSAI.LISTE.1")
FIN I REP=1 S REPF="existent",DX=70,DY=7 W REPF D PB(5,8) Q
 S REP=$$EXIST^%LXSTOCK("ESSAI.LISTE9") G:REP=1 FIN
 S REP=$$EXIST^%LXSTOCK("VERIFICATION") G:REP=1 FIN
 S DX=70,DY=7 X XY W "n'existent pas" D OK(5,8),LISTE
 S DX=5,DY=9 X XY W $$^%QZCHW("Existence de ces mots apres insertion au lexique : ")
 S REP=$$EXIST^%LXSTOCK("ESSAI.LISTE.1")
FIN1 I REP=0 S REPF="n'existent pas",DX=75,DY=9 X XY W REPF D PB(5,10) Q
 S REP=$$EXIST^%LXSTOCK("ESSAI.LISTE9") G:REP=0 FIN1
 S REP=$$EXIST^%LXSTOCK("VERIFICATION") G:REP=0 FIN1
 S DX=65,DY=9 X XY W "existent" D OK(5,10)
 
 D BLD^%VVIDEO S DX=1,DY=11 X XY W $$^%QZCHW("Test : suppression du mot TEST.AJOUT") D NORM^%VVIDEO
 S DX=5,DY=12 X XY W $$^%QZCHW("Existence du mot TEST.AJOUT : ")
 D MOT("TEST.AJOUT")
 S REP=$$EXIST^%LXSTOCK("TEST.AJOUT"),REPF=$S(REP=1:"existe",1:"n'existe pas"),DX=35,DY=12 X XY W REPF
 I REP=0 D PB(5,13) Q
 D OK(5,13),SUP("TEST.AJOUT")
 S DX=5,DY=14 X XY W $$^%QZCHW("Existence de TEST.AJOUT apres suppression : ")
 S REP=$$EXIST^%LXSTOCK("TEST.AJOUT"),REPF=$S(REP=1:"existe",1:"n'existe pas"),DX=47,DY=14 X XY W REPF
 I REP=1 D PB(5,15) Q
 D OK(5,15)
 
 D BLD^%VVIDEO S DX=1,DY=16 X XY W $$^%QZCHW("Test : recherche du mot le plus proche de ESSAI.LIS") D NORM^%VVIDEO
 S REP=$$LEX^%LXSTOCK("ESSAI.LIS",.D)
 S REPF=$S(REP=0:"AUCUN MOT CORRESPONDANT",REP=1:"OK UN SEUL MOT CORRESPOND",1:"AMBIGU")
 S DX=5,DY=17 X XY W $$^%QZCHW("Resultat : ")_REPF
 I REP=1 S DX=5,DY=18 X XY W $$^%QZCHW("Le mot correspondant a ESSAI.LIS est ")_D_" OK"
 Q
MOT(MM) 
 D MOT^%LXSTOCK(MM) Q
PB(X,Y) 
 S DX=X,DY=Y X XY W "ERREUR" Q
OK(X,Y) 
 S DX=X,DY=Y X XY W "OK" Q
LISTE 
 S GL("ESSAI.LISTE.1")="",GL("ESSAI.LISTE9")="",GL("VERIFICATION")=""
 D LISTE^%LXSTOCK("GL") Q
SUP(MOT) 
 D DEL^%LXSTOCK(MOT) Q

