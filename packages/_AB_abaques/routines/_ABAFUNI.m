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

;%ABAFUNI^INT^1^59547,73863^0
%ABAFUNI ;
 
 S DXG=11,DXD=10+LCHP,DYH=5,DYB=PSEP D LWIN^%VVIDEO S DXG=11,DXD=10+LCHP,DYH=PSEP+2,DYB=21 D LWIN^%VVIDEO
 S LI=-1,TOC="^[QUW]OCUNIT(NOMG,%NORM,%IDENT)" D BLD^%VVIDEO
 F %V="P","R" S %W=$S(%V="P":"R",1:"P"),DA=$S(%V="P":%DH,1:%DB),DB=DA+$S(%V="P":3,1:PSEP),LI=DB,FN=$S(%V="P":%PH,1:%PB)+DB D AFF
 D NORM^%VVIDEO S DX=10,DY=2 X XY W $$^%QZCHW("Ecrite en/Utilisee en") S DXG=12+LCHP,DXD=79,DYH=3,DYB=22 D LWIN^%VVIDEO S DX=45,DY=12 X XY D BLK^%VVIDEO,BLD^%VVIDEO X XY W $$^%QZCHW("UNITES") D NORM^%VVIDEO,POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLB balayage") K EXICOM,DA,DB,LI,FN,II,TOC,COLO,JJ Q
AFF F II=1:1 S LI=$N(@TOC@(%V,LI)) Q:LI=-1  Q:LI>FN  S DY=LI-DA,DX=10,MSG=^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%V,LI) X XY W MSG
 Q

