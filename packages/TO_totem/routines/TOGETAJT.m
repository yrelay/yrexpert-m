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

;TOGETAJT^INT^1^59547,74872^0
TOGETAJT ;
 
 K ABREV
 I $D(^[QUI]FULL(YA,PARAM)) S REFUSE=1 G FIN
 F FG=1:1 Q:$P(PARAM,"'",FG)=""  S ABREV(FG)=$P(PARAM,"'",FG)
 S REFUSE=0 F FG=1:1 Q:'($D(ABREV(FG)))  S PCH=ABREV(FG) D TRAIT G:REFUSE=1 FIN
 S PARAM="",FPARAM="" F FG=1:1 Q:'($D(ABREV(FG)))  S PARAM=PARAM_$S(PARAM="":"",1:"'")_ABREV(FG),FPARAM=FPARAM_$S(FPARAM="":"",1:"'")_FABREV(FG)
 S DX=2,DY=PY X XY F FG=1:1:38 W " "
 X XY W PARAM
 S ^POSENR($I,PAGE,PY)=PARAM,^VALPAR($I,PARAM)=VAL,^POSFUL($I,PAGE,PY)=FPARAM
 K PARAM,FPARA,ABREV,FABREV,FG,PCH,PCHCOMP,APCH,VAL
FIN Q
TRAIT D ^%LXABR
 I CONCUR=0 D POCLEPA^%VVIDEO W PCH,$$^%QZCHW(" est inconnu [RETURN]") R *RET S REFUSE=1 G FIN
 I CONCUR'<2 D POCLEPA^%VVIDEO W PCH,$$^%QZCHW(" est ambigu [RETURN]") R *RET S REFUSE=1 G FIN
 I $D(^[QUI]TOSYNONY(PCHCOMP)) S APCH=PCHCOMP,PCHCOMP=$N(^[QUI]TOSYNONY(PCHCOMP,-1)),ABREV(FG)=PCHCOMP D POCLEPA^%VVIDEO W APCH,$$^%QZCHW(" est synonoyme de "),PCHCOMP," [RETURN] " R *RET
 S FABREV(FG)=PCHCOMP G FIN

