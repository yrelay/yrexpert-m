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

;%DLFPLAC^INT^1^59547,73868^0
DLFPLAC ;
 
 
 
 
 
 
S11 S P1X=40,P1Y=12
 D INIT
AFF D CLEPAG^%VVIDEO,CAD,ECR
L0 D ^%VZCFLE W $$^%QZCHW("Commande, CTRLF"),", ",$S('(DTM):"CTRLA",MODTM:"ESCP",1:"BREAK"),", ",$$^%QZCHW("CTRLH: Liste des commandes et selection")
L1 D MOUV F I=1,6,8,18,68,69,70,76,79,80,83,84,86 G:I=X1 @I
 D ^%VSQUEAK G L1
1 G FIN
6 K ^[QUI]DLFLUX(%FLU,"POINTS")
 S X=""
 F %X=0:0 S X=$O(PLAN(X)) Q:X=""  S Y="" F %Y=0:0 S Y=$O(PLAN(X,Y)) Q:Y=""  S ^[QUI]DLFLUX(%FLU,"POINTS",X,Y)=""
 G FIN
18 G AFF
68 I '($D(PLAN(P1X,P1Y))) D ^%VSQUEAK G L1
L2 D POCLEPA^%VVIDEO W $$^%QZCHW("Pointez la nouvelle place avec le curseur, puis (P)lacez")
 S SX=P1X,SY=P1Y D MOUV F I=1,6,80 G:I=X1 @("68"_I)
 D ^%VSQUEAK G L2
681 G L0
686 G L0
6880 S M=""
 F %M=0:0 S M=$O(^[QUI]DLFLUX(%FLU,"POINTS",SX,SY,M)) Q:M=""  S ^[QUI]DLFLUX(%FLU,"POINTS",P1X,P1Y,M)=""
 K ^[QUI]DLFLUX(%FLU,"POINTS",%X,%Y)
 D KILL(SX,SY),NORM(SX,SY),ADD(P1X,P1Y),REV(P1X,P1Y) G L0
69 D KILL(P1X,P1Y),NORM(P1X,P1Y) G L1
70 I '($D(PLAN(P1X,P1Y))) D ^%VSQUEAK G L1
 S %X=P1X,%Y=P1Y D ^%DLFLU2 G L0
76 I '($D(PLAN(P1X,P1Y))) D ^%VSQUEAK G L1
 S %X=P1X,%Y=P1Y D ^%DLFLPOI G AFF
79 K ^[QUI]DLFLUX(%FLU,"FLUX"),^[QUI]DLFLUX(%FLU,"POSQUA")
 G AFF
80 D ADD(P1X,P1Y),REV(P1X,P1Y) G L1
83 I '($D(^[QUI]DLFLUX(%FLU,"TEXTE",P1X,P1Y))) D ^%VSQUEAK G L1
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de ce texte")_" ?")=1 K ^[QUI]DLFLUX(%FLU,"TEXTE",P1X,P1Y) G AFF
 D POCLEPA^%VVIDEO G L0
84 D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez votre texte, puis [RETURN]")
 S (DX,X)=P1X,(DY,Y)=P1Y X XY D ^%VLEC G:(CTRLA=1)!(Y1="") L0
 S ^[QUI]DLFLUX(%FLU,"TEXTE",X,Y)=Y1 G L0
86 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous reellement tout effacer")_" ? ")'=1 G L0
 K ^[QUI]DLFLUX(%FLU),PLAN
 G AFF
 
FIN K %A,%B,BID,BLD,CTRLA,DX,%DX,DXG,DY,%DY,DYH,F,%FLU,I,LH,LV,M,%M,MPASX,MPASY,NF,%NF,NXI,NXS,NYI,NYS,O,%O,P1X,P1Y,PLAN,POS,%POS,Q,SX,SY,X,%X,Y,%Y,Y1
 Q
 
MOUV S DX=P1X,DY=P1Y X XY
 S MPASX=1,MPASY=1,NXI=0,NXS=79,NYI=0,NYS=22 D ^%VZECUR
 S P1X=DX,P1Y=DY Q
 
REV(X,Y) S DX=X,DY=Y D REV^%VVIDEO,BLD^%VVIDEO X XY W "*" D NORM^%VVIDEO Q
NORM(X,Y) S DX=X,DY=Y X XY W " " Q
 
CAD D CARSP^%VVIDEO(0,0,23,80,1) S DX=2,DY=0 X XY W " ",%FLU," " Q
 
ECR D REV^%VVIDEO,BLD^%VVIDEO
 F DX=1:1:78 F DY=1:1:21 I $D(PLAN(DX,DY)) X XY W "*"
 D NORM^%VVIDEO
 S N="",F=%FLU,Q=QUI D G0ON^%VVIDEO
EC2 S N=$O(^[Q]DLFLUX(F,"FLUX",N)) G:N="" EC3
 S O=""
 F %O=0:0 S O=$O(^[Q]DLFLUX(F,"FLUX",N,O)) Q:O=""  S DX="" F %A=0:0 S DX=$O(^[Q]DLFLUX(F,"FLUX",N,O,DX)) Q:DX=""  S DY="" F %B=0:0 S DY=$O(^[Q]DLFLUX(F,"FLUX",N,O,DX,DY)) Q:DY=""  X XY D CAR
 G EC2
EC3 
 D G0OFF^%VVIDEO,REV^%VVIDEO,BLD^%VVIDEO
 S NF=""
 F %NF=0:0 S NF=$O(^[QUI]DLFLUX(%FLU,"POSQUA",NF)) Q:NF=""  S DX=^[QUI]DLFLUX(%FLU,"POSQUA",NF),DY=$P(DX,"^",2),DX=$P(DX,"^",1) X XY W "#"
 D NORM^%VVIDEO
 S DX=""
 F %DX=0:0 S DX=$O(^[QUI]DLFLUX(%FLU,"TEXTE",DX)) Q:DX=""  S DY="" F %DY=0:0 S DY=$O(^[QUI]DLFLUX(%FLU,"TEXTE",DX,DY)) Q:DY=""  X XY W ^[QUI]DLFLUX(%FLU,"TEXTE",DX,DY)
 Q
 
Q S DX=$O(^[QUI]DLFLUX(F,"FLUX",0,"")),DY=$O(^[QUI]DLFLUX(F,"FLUX",0,DX,""))
 X XY D REV^%VVIDEO,BLD^%VVIDEO X XY W "#" D NORM^%VVIDEO Q
 
KILL(X,Y) K PLAN(X,Y) Q
ADD(X,Y) S PLAN(X,Y)="" Q
 
INIT K PLAN S X=""
 F %X=0:0 S X=$O(^[QUI]DLFLUX(%FLU,"POINTS",X)) Q:X=""  S Y="" F %Y=0:0 S Y=$O(^[QUI]DLFLUX(%FLU,"POINTS",X,Y)) Q:Y=""  S PLAN(X,Y)=""
 Q
CAR S C=^[Q]DLFLUX(F,"FLUX",N,O,DX,DY) W:C'="" $$CARSPE^%VVIDEO($C(C)) Q
 
8 
 K ^PLH($J)
 I '(DTM) S MEN=$P($T(MEN),";;",2)_$P($T(MEN+1),";;",2) G AIDE
 I MODTM S MEN=$P($T(MENI),";;",2)_$P($T(MENI+1),";;",2) G AIDE
 S MEN=$P($T(MEND),";;",2)_$P($T(MEND+1),";;",2)
AIDE F %U=1:1 S %V=$P(MEN,"/",%U) Q:%V=""  S ^PLH($J,%U)=%V
 D ^%VGENMEN(5,6,5,"^PLH($J)"),CLEPAG^%VVIDEO
 S DYH=2,MSG="Commandes",DXG=20-($L(MSG)\2) D BIG^%VVIDEO
 D SEL^%VGENMEN(.ADR,.CTRL) D:ADR'=18 FRESH
 G:ADR'="" @ADR G 6:CTRL="F",1:CTRL="A",L1
 
FRESH D CLEPAG^%VVIDEO,CAD,ECR
 D ^%VZCFLE W $$^%QZCHW("Commande, CTRLF"),", ",$S('(DTM):"CTRLA",MODTM:"ESCP",1:"BREAK"),", ",$$^%QZCHW("CTRLH: Liste des commandes et selection")
 Q
 
MEN ;;CTRLR reafficher le schema^18/(V)ider l'ecran^86/(P)lacer un point^80/(E)ffacer un point^69/(D)eplacer un point^68/acceder a la (L)iste des machines du point courant^76/tracer le (F)lux entre deux points^70/
 ;;(O)ter tous les flux dessines^79/inserer du (T)exte^84/(S)upprimer un texte^83/CTRLF finir^6/CTRLA abandonner^1/
 
MENI ;;CTRLW reafficher le schema^18/(V)ider l'ecran^86/(P)lacer un point^80/(E)ffacer un point^69/(D)eplacer un point^68/acceder a la (L)iste des machines du point courant^76/tracer le (F)lux entre deux points^70/
 ;;(O)ter tous les flux dessines^79/inserer du (T)exte^84/(S)upprimer un texte^83/CTRLF finir^6/ESCP abandonner^1/
 
MEND ;;CTRLW reafficher le schema^18/(V)ider l'ecran^86/(P)lacer un point^80/(E)ffacer un point^69/(D)eplacer un point^68/acceder a la (L)iste des machines du point courant^76/tracer le (F)lux entre deux points^70/
 ;;(O)ter tous les flux dessines^79/inserer du (T)exte^84/(S)upprimer un texte^83/CTRLF finir^6/BREAK abandonner^1/

