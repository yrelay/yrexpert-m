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

;SOURFLAI^INT^1^59547,74868^0
SOURFLAI ;
 
 K ^FLAIR($I),^FLAIRVU($I) S ^FLAIR($I,XF,YF)=%FL,NC=1,^FLAIRVU($I,NC)=XF_"/"_YF,NC=NC+1,NI=-1 F %U=1:1 S NI=$N(^FLAIRVU($I,NI)) Q:NI=-1  D LC
FIN Q
LC S XX=^FLAIRVU($I,NI),XC=$P(XX,"/",1),YC=$P(XX,"/",2),FL=^FLAIR($I,XC,YC),XL=XC F YL=YC+1,YC-1 D LC0
 S YL=YC F XL=XC+1,XC-1 D LC0
END Q
LC0 Q:(XL<1)!((XL>19)!((YL<1)!(YL>10)))  S VU=$S($D(^FLAIR($I,XL,YL)):1,1:0),FLL=$S(VU=1:^FLAIR($I,XL,YL),1:0),DEC=$S($D(^STOP($I,XL,YL)):20-%PO,1:1),FLNN=FL-DEC S:FLNN<0 FLNN=0
 S:FLNN>FLL ^FLAIR($I,XL,YL)=FLNN,^FLAIRVU($I,NC)=XL_"/"_YL,NC=NC+1 Q

