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

;%SCODDO2^INT^1^59547,73888^0
SCODDO2 ;
 
 
 
 
 
AFF1 
 N SCR S SCR="SCODOM"
 D ^%VAFIGRI,^%VAFISCR
 I %AJM="A" S DX=55,DY=0 D REV^%VVIDEO X XY W " Ajout " D NORM^%VVIDEO Q
 S DX=55,DY=0 D REV^%VVIDEO X XY W " Modification "
 D NORM^%VVIDEO
 Q
 
AFF2 
 N GLOBAL,CAG S CAG=1
 D CARSA^%VVIDEO(1,7,79,8) S DX=55,DY=7 D REV^%VVIDEO X XY W $$^%QZCHW(" Repertoires references ") D NORM^%VVIDEO
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP.SOURCE") K @(GLOBAL)
 S REP="" F I=1:1 S REP=$O(@GLO@(DOM,"REP.SOURCE",REP)) Q:REP=""  S @GLOBAL@(I)=REP
 D REAFF^%QULIMO3(1,1,GLOBAL,1,7,79,8)
 K @(GLOBAL)
 Q
 
AFF3 
 N GLOBAL,CAG S CAG=1
 D CARSA^%VVIDEO(1,15,79,7) S DX=55,DY=15 D REV^%VVIDEO X XY W $$^%QZCHW(" Repertoires cibles ") D NORM^%VVIDEO
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP.CIBLE") K @(GLOBAL)
 S REP="" F I=1:1 S REP=$O(@GLO@(DOM,"REP.CIBLE",REP)) Q:REP=""  S @GLOBAL@(I)=REP
 D REAFF^%QULIMO3(1,1,GLOBAL,1,15,79,7)
 K @(GLOBAL)
 Q
 
EFF 
 F I=1:1:^%SCRE("SCODOM") S RESUL(I)=""
 S DOM=""
 D AFF1
 Q
 
REAFF 
 D AFF1,AFF2,AFF3
 Q
 
MENU1(MN) 
 S @MN@(1)=$$^%QZCHW("Ajouter")_"^AJ2"
 S @MN@(2)=$$^%QZCHW("Repertoires.references")_"^SOURCE"
 S @MN@(3)=$$^%QZCHW("Repertoires.cibles")_"^CIBLE"
 Q
MENU2(MN) 
 S @MN@(1)=$$^%QZCHW("+")_"^"_"PLUS"
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 S @MN@(3)=$$^%QZCHW("Rep.references")_"^SOURCE"
 S @MN@(4)=$$^%QZCHW("Rep.cibles")_"^CIBLE"
 S @MN@(5)=$$^%QZCHW("Modification")_"^MODIF"
 S @MN@(6)=$$^%QZCHW("Suppression")_"^SUPRES"
 S @MN@(7)=$$^%QZCHW("Duplication")_"^DUP"
 Q

