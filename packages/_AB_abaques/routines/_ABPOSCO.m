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

;%ABPOSCO^INT^1^59547,73864^0
%ABPOSCO ;
 
 I '($D(^COLDUP($I))) S ODX=DX,ODY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune valeur a dupliquer n'est connue ! [RETURN] ") R *RET D TOUCHE^%INCCLAV(RET,.RET),POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=ODX,DY=ODY G FIN
 K ^POSVAL($J) S %VV="^[QUW]STRUCT(NOMG,2,%D)" F %D="P","R" S DZC=-1 F WW=0:0 S DZC=$N(@%VV@(DZC)) Q:DZC=-1  S ^POSVAL($J,%D,DZC)=1
 F %VV="P","R" S %D=$S(%VV="P":%DH,1:%DB),DZC=-1 F WW=0:0 S DZC=$N(^COLDUP($I,%VV,DZC)) Q:DZC=-1  I $D(^POSVAL($J,%VV,DZC)),'($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,DZC,DXC))) S ^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,DZC,DXC)=^COLDUP($I,%VV,DZC),DY=DZC-%D D ECR
 S DX=DXC,DY=DYC K DZC,WW G FIN
ECR I %VV="P",(DY<PSEP)&(DY>3) G ECR2
 I %VV="R",(DY<21)&(DY>PSEP) G ECR2
END Q
ECR2 X XY W ^COLDUP($I,%VV,DZC) S DXC=DX,DYC=DY G END
FIN X XY Q

