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

;%DLFLU2^INT^1^59547,73868^0
DLFLU2 ;
 
 
 
 
 
 
 
 S (XC,XI)=%X,(YC,YI)=%Y
 S DIR="",XG=0,XD=79,YH=0,YB=22,F=0 K ^FLUX($J)
 I '($D(^[QUI]DLFLUX(%FLU,"FLUX"))) S ^[QUI]DLFLUX(%FLU,"FLUX")=0
 D POCLEPA^%VVIDEO W $$^%QZCHW("Dessinez le trajet du flux avec le curseur, puis CTRLF")
L1 S DX=XC,DY=YC X XY D ZFLECHE^%VZATOU G:%F'="" OKF
 F I=1,6,18 G:I=X1 @I
 D ^%VSQUEAK G L1
1 S F=""
 F %F=0:0 S F=$O(^FLUX($J,F)) Q:F=""  S DX="" F %F=0:0 S DX=$O(^FLUX($J,F,DX)) Q:DX=""  S DY="" F %FF=0:0 S DY=$O(^FLUX($J,F,DX,DY)) Q:DY=""  X XY W " "
 K ^FLUX($J) S F=0 D REV^%VVIDEO,BLD^%VVIDEO
 S DX="" F %F=0:0 S DX=$O(PLAN(DX)) Q:DX=""  S DY="" F %FF=0:0 S DY=$O(PLAN(DX,DY)) Q:DY=""  X XY W "*"
 D NORM^%VVIDEO I (XC=XI)&(YC=YI) G FIN
 S XC=XI,YC=YI G L1
6 I '($D(PLAN(XC,YC))) D ^%VSQUEAK G L1
 S CAR="" D AFF S P1X=XC,P1Y=YC
 D POCLEPA^%VVIDEO W $$^%QZCHW("Positionnez avec le curseur le libelle du volume du flux, puis CTRLF")
L2 S DX=XC,DY=YC X XY D ZFLECHE^%VZATOU
 G:%F'="" @("L2"_%F) F I=1,6 G:X1=I @("L2"_I)
 D ^%VSQUEAK G L2
L21 G 1
L26 G S2
L2H I YC=1 D ^%VSQUEAK G L2
 S YC=YC-1 G L2
L2B I YC=21 D ^%VSQUEAK G L2
 S YC=YC+1 G L2
L2G I XC=1 D ^%VSQUEAK G L2
 S XC=XC-1 G L2
L2D I XC=78 D ^%VSQUEAK G L2
 S XC=XC+1 G L2
S2 S (NF,^[QUI]DLFLUX(%FLU,"FLUX"))=^[QUI]DLFLUX(%FLU,"FLUX")+1,F=""
 F %F=0:0 S F=$O(^FLUX($J,F)) Q:F=""  S DX="" F %DX=0:0 S DX=$O(^FLUX($J,F,DX)) Q:DX=""  S DY="" F %DY=0:0 S DY=$O(^FLUX($J,F,DX,DY)) Q:DY=""  S ^[QUI]DLFLUX(%FLU,"FLUX",NF,F,DX,DY)=^FLUX($J,F,DX,DY)
 S ^[QUI]DLFLUX(%FLU,"POSQUA",NF)=XC_"^"_YC
 D REV^%VVIDEO,BLD^%VVIDEO W "#" D NORM^%VVIDEO
 G FIN
18 D ECR^%DLFPLAC G L1
OKF G @%F
H I (YC-1)=YH D ^%VSQUEAK G L1
 I (YC=YI)&(XC=XI) S CAR="" D AFF G SH
 I DIR="" S CAR="" D AFF G SH
 I DIR="HAUT" S CAR=120 D AFF G SH
 I DIR="BAS" D ^%VSQUEAK G L1
 I DIR="GAUCHE" S CAR=109 D AFF G SH
 I DIR="DROITE" S CAR=106 D AFF G SH
SH S DIR="HAUT",YC=YC-1 G L1
B I (YC+1)=YB D ^%VSQUEAK G L1
 I (YC=YI)&(XC=XI) S CAR="" D AFF G SB
 I DIR="" S CAR="" D AFF G SB
 I DIR="HAUT" D ^%VSQUEAK G L1
 I DIR="BAS" S CAR=120 D AFF G SB
 I DIR="GAUCHE" S CAR=108 D AFF G SB
 I DIR="DROITE" S CAR=107 D AFF G SB
SB S DIR="BAS",YC=YC+1 G L1
G I (XC-1)=XG D ^%VSQUEAK G L1
 I (YC=YI)&(XC=XI) S CAR="" D AFF G SG
 I DIR="" S CAR="" D AFF G SG
 I DIR="HAUT" S CAR=107 D AFF G SG
 I DIR="BAS" S CAR=106 D AFF G SG
 I DIR="GAUCHE" S CAR=113 D AFF G SG
 I DIR="DROITE" D ^%VSQUEAK G L1
SG S DIR="GAUCHE",XC=XC-1 G L1
D I (XC+1)=XD D ^%VSQUEAK G L1
 I (YC=YI)&(XC=XI) S CAR="" D AFF G SD
 I DIR="" S CAR="" D AFF G SD
 I DIR="HAUT" S CAR=108 D AFF G SD
 I DIR="BAS" S CAR=109 D AFF G SD
 I DIR="GAUCHE" D ^%VSQUEAK G L1
 I DIR="DROITE" S CAR=113 D AFF G SD
SD S DIR="DROITE",XC=XC+1 G L1
FIN K BX,DIR,DX,%DX,DY,%DY,F,%F,%FF,^FLUX($J),NF,X1,XC,XD,Y1,YB,YC,YH Q
AFF S F=F+1,^FLUX($J,F,XC,YC)=CAR,DX=XC,DY=YC
 I CAR'="" D G0ON^%VVIDEO X XY W $$CARSPE^%VVIDEO($C(CAR)) D G0OFF^%VVIDEO
 Q

