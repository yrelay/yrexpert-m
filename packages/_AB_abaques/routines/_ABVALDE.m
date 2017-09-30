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

;%ABVALDE^INT^1^59547,73864^0
%ABVALDE ;
 
DEB D POCLEPA^%VVIDEO W $$^%QZCHW("valeur par defaut (? pour lister les valeurs existantes)")
 S AMPASY=MPASY,ALCHP=LCHP,AESPC=ESPC,(LCHP,ESPC)=LARCOL,DY=PY-%D,DX=10 X XY D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S C=Y1 G:C="?" DEF S ^[QU]STRUCT(NOMG,2,%V,PY,2)=C,^[QU]STRUCT(NOMG,2,%V,PY,3,C)=1
FIN X XY W CNULI S MPASY=AMPASY,LCHP=ALCHP,ESPC=AESPC Q
DEF I '($D(^[QU]STRUCT(NOMG,2,%V,PY,2))) X XY W CNULI G DEB
 S ADX=DX,ADY=DY D POCLEPA^%VVIDEO W $$^%QZCHW("(S)uppression,(RETURN) Fin") S DX=ADX,DY=ADY X XY W ^[QU]STRUCT(NOMG,2,%V,PY,2) R *RET K:RET=83 ^[QU]STRUCT(NOMG,2,%V,PY,2) X XY W CNULI G DEB

