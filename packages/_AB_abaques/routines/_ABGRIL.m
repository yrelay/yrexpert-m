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

;%ABGRIL^INT^1^59547,73864^0
%ABGRIL ;
 
 G NEW
 S LLI=$S(PSEP=0:3,1:PSEP)
 S DX=9 F DY=2:1:20 X XY W LIG3
 F DY=3,LLI,21 X XY W LIG2
 Q
NEW S DX=10 F DY=2:1:22 X XY D NET^%VVIDEO
 S LLI=$S(PSEP=0:3,1:PSEP),BLD=0,DXG=9,DYH=3,LH=70,LV=19,IX=22,IY=30 D DAMIER^%VVIDEO
 D G0ON^%VVIDEO,CUROF^%VVIDEO S DX=9,DY=LLI X XY W $$CARSPE^%VVIDEO("t") S DXG=10,DYH=LLI,LH=68 D TRH^%VVIDEO,G0ON^%VVIDEO,CUROF^%VVIDEO S DX=78,DY=LLI X XY W $$CARSPE^%VVIDEO("u") S DX=32 X XY W $$CARSPE^%VVIDEO("n") S DX=55 X XY W $$CARSPE^%VVIDEO("n") D G0OFF^%VVIDEO,CURON^%VVIDEO
 K LLI,BLD,DXG,DYH,LH,LV,IX,IY Q
SCH S DX=10 F DY=2:1:22 X XY D NET^%VVIDEO
 S LLI=$S(PSEP=0:3,1:PSEP),BLD=0,DXG=9,DYH=3,LH=71,LV=19,IX=80,IY=30 D DAMIER^%VVIDEO Q

