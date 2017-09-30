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

;SOURCHEI^INT^1^59547,74868^0
SOURCHEM ;
 
 S PREM=0,OXC=XDEP,OYC=YDEP,DIR=0,^DEJAPASS($I,XDEP,YDEP)=1 I (XDEP=XF)&(YDEP=YF) G TROUVE
BEG G:DIR<4 AV G AR
FIN 
END Q
AV S DIR=DIR+1,XC=$S(DIR=1:OXC,DIR=2:OXC+1,DIR=3:OXC,1:OXC-1),YC=$S(DIR=1:OYC+1,DIR=2:OYC,DIR=3:OYC-1,1:OYC)
 D BARR I (STOP=1)!$D(^DEJAPASS($I,XC,YC)) G BEG
 D AFF1 S OXC=XC,OYC=YC,PREM=1 D AFF
 S ^DEJAPASS($I,XC,YC)=1,%NOMPIL="JEU",%VALPIL=DIR D ^%QCAPYE
 I (XC=XF)&(YC=YF) G TROUVE
 S DIR=0 G BEG
AR S %NOMPIL="JEU" D ^%QCAPYD I %VIDE=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Il n'y a pas de chemin... [RETURN] ") R *RET G FIN
 S DIR=%VALPIL D AFF2 S PREM=0,OXC=$S(DIR=1:OXC,DIR=2:OXC-1,DIR=3:OXC,1:OXC+1),OYC=$S(DIR=1:OYC-1,DIR=2:OYC,DIR=3:OYC+1,1:OYC) D AFF G BEG
TROUVE D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("J'ai trouve le chemin et mange le fromage... [RETURN] ") R *RET G FIN
AFF S DX=OXC*4,DY=22-(OYC*2) X XY D REV^%VVIDEO W $$^%QZCHW("S") D NORM^%VVIDEO Q
AFF1 S DX=OXC*4,DY=22-(OYC*2) I (OXC=XDEP)&(OYC=YDEP) X XY D REV^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("D") D NORM^%VVIDEO Q
 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY D REV^%VVIDEO W MSG D NORM^%VVIDEO Q
AFF2 S DX=OXC*4,DY=22-(OYC*2) I PREM=1 X XY W "X" Q
 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY W MSG Q
BARR S STOP=0
 I (((XC<1)!(XC>19))!(YC<1))!(YC>10) S STOP=1 G END
 I $D(^STOP($I,XC,YC)) S STOP=1
 G END

