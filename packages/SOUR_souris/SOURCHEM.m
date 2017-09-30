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
;! Nomprog     : SOURCHEM                                                     !
;! Module      : SOUR (SOURIS)                                                !
;! But         : Afficher le chemin                                           !
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
;! HL002 ! HL     ! 16/07/12 ! S pour Souris                                  !
;! HL003 ! HL     ! 16/07/12 ! PB caractères parasites                        !
;! HL004 ! HL     ! 18/07/12 ! Améliorer la saisie dans SOURFROM (HL004)      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

SOURCHEM ;
 
 S %NCH=1,%TS=$$^%QZCHW("S") D CUROF^%VVIDEO K ^SOURCH($I),^SOURSYM($I),DIR S PR=1 F AV=$$^%QZCHW("NORD"),$$^%QZCHW("EST"),$$^%QZCHW("SUD"),$$^%QZCHW("OUEST") S DIR(PR)=AV,DIR(AV)=PR,PR=PR+1
 S PREM=0,OXC=XDEP,OYC=YDEP,DIR=$R(4)+1,^DEJAPASS($I,XDEP,YDEP)=1,AV=1 K ^DIR($I) I (XDEP=XF)&(YDEP=YF) G TROUVE
BEG D:'($D(%CHRONO)) DEB^SOURCHRO G:AV AV G AR
FIN K %CHRONO
END Q
;HL004 AV S AV=1 R *REP:0 G:REP=1 ABEND D:REP'=-1 TAF D ^SOURCHSF Q:%ABEND=1  S:DIR="?" DIR=$R(4)+1 D DIR G:'(AV) AR S XC=$S(DIR=1:OXC,DIR=2:OXC+1,DIR=3:OXC,1:OXC-1),YC=$S(DIR=1:OYC+1,DIR=2:OYC,DIR=3:OYC-1,1:OYC)
AV S AV=1 S:'$D(REP) REP=-1 G:REP=1 ABEND D:REP'=-1 TAF D ^SOURCHSF Q:%ABEND=1  S:DIR="?" DIR=$R(4)+1 D DIR G:'(AV) AR S XC=$S(DIR=1:OXC,DIR=2:OXC+1,DIR=3:OXC,1:OXC-1),YC=$S(DIR=1:OYC+1,DIR=2:OYC,DIR=3:OYC-1,1:OYC)
 D BARR I (STOP=1)!$D(^DEJAPASS($I,XC,YC)) G BEG
 D AFF1 S OXC=XC,OYC=YC,PREM=1 D AFF
 S ^DEJAPASS($I,XC,YC)=1,%NOMPIL="JEU",%VALPIL=DIR D ^%QCAPYE
 I (XC=XF)&(YC=YF) G TROUVE
 G BEG
AR S %NOMPIL="JEU" D ^%QCAPYD I %VIDE=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Cette farce est de mauvais gout... [RETURN] ") R *RET G:RET=$A("?") EXP G FIN
 S AV=1,DIR=%VALPIL D AFF2 S PREM=0,OXC=$S(DIR=1:OXC,DIR=2:OXC-1,DIR=3:OXC,1:OXC+1),OYC=$S(DIR=1:OYC-1,DIR=2:OYC,DIR=3:OYC+1,1:OYC) D AFF G BEG
TROUVE S:'($D(%CHRONO)) %CHRONO=0 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("temps: "),%CHRONO,$$^%QZCHW("...Merci pour le fromage ! mais ou sont le pain et l'eau ???...") R *RET G:RET=$A("?") EXP G FIN
 ;HL2 AFF S DX=OXC*4,DY=22-(OYC*2) X XY D WSOUR,TOP^SOURCHRO  Q
AFF S DX=OXC*4,DY=22-(OYC*2) X XY D WSOUR,TOP^SOURCHRO
 I %PAS="O" W $$^%QZCHW("(CTRLA)abandon pas à pas, (return)continuer") S DX=$X D ^%VLEC S:(CTRLA=1)!(CTRLF=1) %PAS="N" 
 Q
AFF1 
 ;HL003 S DX=OXC*4,DY=22-(OYC*2) I (OXC=XDEP)&(OYC=YDEP) X XY D REV^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("D") S ^SOURCH($I,%NCH)=DX_"/"_DY_"/"_$$^%QZCHW("D") D NORM^%VVIDEO Q
 S DX=OXC*4,DY=22-(OYC*2) I (OXC=XDEP)&(OYC=YDEP) X XY D REV^%VVIDEO,BLK^%VVIDEO X XY W $$^%QZCHW("D") S ($X,$Y)=0 S ^SOURCH($I,%NCH)=DX_"/"_DY_"/"_$$^%QZCHW("D") D NORM^%VVIDEO Q
 ;HL003 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY D REV^%VVIDEO W MSG D NORM^%VVIDEO S ^SOURCH($I,%NCH)=DX_"/"_DY_"/"_MSG,%NCH=%NCH+1 Q
 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY D REV^%VVIDEO X XY W MSG S ($X,$Y)=0 D NORM^%VVIDEO S ^SOURCH($I,%NCH)=DX_"/"_DY_"/"_MSG,%NCH=%NCH+1 Q
AFF2 
 ;HL003 S DX=OXC*4,DY=22-(OYC*2) I PREM=1 X XY W "X" Q
 S DX=OXC*4,DY=22-(OYC*2) I PREM=1 X XY W "X" S ($X,$Y)=0 Q
 ;HL003 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY W MSG Q
 S MSG=$S(DIR=1:"^",DIR=2:">",DIR=3:"v",1:"<") X XY W MSG S ($X,$Y)=0 Q
BARR S STOP=0
 I (((XC<1)!(XC>19))!(YC<1))!(YC>10) S STOP=1 G END
 I $D(^STOP($I,XC,YC))&(%NBDTS>0) S (%NBDTS,^V($I,$$^%QZCHW("SOURIS"),$$^%QZCHW("NOMBRE.DE.DENTS")))=%NBDTS-1 G END
 I $D(^STOP($I,XC,YC))&(^V($I,$$^%QZCHW("SOURIS"),$$^%QZCHW("NOMBRE.DE.DENTS"))'>0) S STOP=1
 G END
DIR I $D(^DIR($I,OXC,OYC)),^DIR($I,OXC,OYC)=4 S AV=0 G FDIR
 G:'($D(^DIR($I,OXC,OYC,DIR))) ADIR
DIRS S DIR=DIR+1 I DIR>4 S DIR=0 G DIRS
 I $D(^DIR($I,OXC,OYC,DIR)) G DIRS
ADIR S ^DIR($I,OXC,OYC,DIR)=1,^DIR($I,OXC,OYC)=$S(($D(^DIR($I,OXC,OYC))#10)=0:1,1:^DIR($I,OXC,OYC)+1)
FDIR Q
EXP S (X,DX)=4,(Y,DY)=2 X XY S MPASX=4,MPASY=2,NXI=3,NXS=77,NYI=1,NYS=21
EXPS S DX=X,DY=Y X XY D ^%VZECUR G:(X1=1)!(X1=6) FIN S X=$X,Y=$Y,XC=$X/4,YC=11-($Y/2),MSG=$S($D(^FLAIR($I,XC,YC)):^FLAIR($I,XC,YC),1:0)_"  (",IF=1,YL=YC F XL=XC+1,XC-1 D FL S IF=IF+1
 S XL=XC F YL=YC+1,YC-1 D FL S IF=IF+1
 S MSG=MSG_")" D POCLEPA^%VVIDEO W MSG R *RET D POCLEPA^%VVIDEO G EXPS
FL S CO=$S(IF=1:$$^%QZCHW("Est"),IF=2:$$^%QZCHW("Ouest"),IF=3:$$^%QZCHW("Nord"),1:$$^%QZCHW("Sud")),MSG=MSG_CO_":"_$S($D(^FLAIR($I,XL,YL)):^FLAIR($I,XL,YL),1:0)_", " Q
TAF S REP=$C(REP) Q:(REP'=$$^%QZCHW("O"))&((REP'=$$^%QZCHW("S"))&(REP'=$$^%QZCHW("A")))  Q:REP=%TS  S:REP'=$$^%QZCHW("A") %TS=REP I REP=$$^%QZCHW("A") R *REP G FDIR
 G:%TS'=$$^%QZCHW("O") TAFS
 S %X=-1 F %U=1:1 S %X=$N(^FLAIR($I,%X)) Q:%X=-1  S %Y=-1 F %V=1:1 S %Y=$N(^FLAIR($I,%X,%Y)) Q:%Y=-1  S %XX=(%X*4)+1,%YY=22-(%Y*2),%LI=^FLAIR($I,%X,%Y) D AFFV
 G FDIR
TAFS S %X=-1 F %U=1:1 S %X=$N(^FLAIR($I,%X)) Q:%X=-1  S %Y=-1 F %V=1:1 S %Y=$N(^FLAIR($I,%X,%Y)) Q:%Y=-1  S %XX=(%X*4)+1,%YY=22-(%Y*2),%LI="  " D AFFV
 
 S %LABY="^XYBAR($I)" D BEG^SOURAIRJ,DES^SOURLABY G FDIR
;HL002 AFFV S DX=%XX,DY=%YY X XY W %LI Q
AFFV S DX=%XX,DY=%YY X XY W %LI S ($X,$Y)=0 Q
ABEND D POCLEPA^%VVIDEO W $$^%QZCHW("Abandon ! ") H 2 G FDIR
AIRJEU Q:$D(%FRESH)  D CLEPAG^%VVIDEO,^SOURAIRJ,^SOURLABY Q
;HL002 WSOUR O $I D BLD^%VVIDEO,^%CGW($$^%QZCHW("SOURIS"),$$^%QZCHW("S")),NORM^%VVIDEO O $I Q
WSOUR O $I D BLD^%VVIDEO X XY W $$^%QZCHW("S") S ($X,$Y)=0 D NORM^%VVIDEO Q
 ;

