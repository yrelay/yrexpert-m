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
;! Nomprog     : SOURFROM                                                     !
;! Module      : Souris (SOUR)                                                !
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
;! HL002 ! HL     ! 16/07/12 ! S pour Souris et F pour Fromage                !
;! HL003 ! HL     ! 18/07/12 ! PB caractères parasites sur terminal-gnome     !
;! HL004 ! HL     ! 18/07/12 ! Amélorer la saisie                             !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

SOURFROM ;
 
 S %ABEND=0 K ^XYBAR($I) I '($D(^[QUI]PILE("JEU",0))) S ^[QUI]PILE("JEU",0)=$$^%QZCHW("LA SOURIS ET LE FROMAGE^")
 D CLEPAG^%VVIDEO S JEU=^[QUI]PILE("JEU",0) K ^DEJAPASS($I),^STOP($I),^[QUI]PILE("JEU") S ^[QUI]PILE("JEU",0)=JEU
 D ^SOURAIRJ
 F X=1:1:19 S ^STOP($I,X,11)=1,^STOP($I,X,0)=1
 F Y=1:1:10 S ^STOP($I,20,Y)=1,^STOP($I,0,Y)=1
CB D POCLEPA^%VVIDEO W $$^%QZCHW("(C)hoix des barrieres,(G)eneration aleatoire,(L)abyrinthe existant ") R *REP G:REP=1 FIN G:(REP'=67)&((REP'=71)&(REP'=76)) CB G @$C(REP)
C I REP=67 D ^SOURCBAR G PXS
G F LOP=1:1 D POCLEPA^%VVIDEO W $$^%QZCHW("(RETURN) pour ajouter une barriere ; (CTRLA) pour fin ") R *RET Q:RET=1  D BAR
 D POCLEPA^%VVIDEO W $$^%QZCHW("Desirez-vous en rajouter manuellement (O/N) ? ") R *REP I REP=79 D ^SOURCBAR
 G PXS
L D POCLEPA^%VVIDEO W $$^%QZCHW("Libelle du labyrinthe existant : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" CB I '($D(^[QUI]SOURJEUX(Y1))) D POCLEPA^%VVIDEO W $$^%QZCHW("Labyrinthe "),Y1,$$^%QZCHW(" inconnu    [RETURN] ") R *RET G L
 S %LAB=Y1,%LABY="^[QUI]SOURJEUX(%LAB)" D ^SOURLABY G PXSS
PXS D POCLEPA^%VVIDEO W $$^%QZCHW("Voulez-vous stocker ce labyrinthe (O/N) ? ") R *REP G:REP=1 FIN S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) PXS G:REP=$$^%QZCHW("N") PXSS
LILA D POCLEPA^%VVIDEO W $$^%QZCHW("Libelle de ce labyrinthe : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" LILA I $D(^[QUI]SOURJEUX(Y1)) D POCLEPA^%VVIDEO W $$^%QZCHW("Labyrinthe "),Y1,$$^%QZCHW(" deja existant !  [RETURN] ") R *RET G LILA
 D STOC
PXSS D POCLEPA^%VVIDEO W $$^%QZCHW("(P)ointer la souris ") D POS S XDEP=X,YDEP=Y
 I $D(^STOP($I,XDEP,YDEP)) D ^%VSQUEAK G PXS
 S DX=$X,DY=$Y D WSOUR
PXF D POCLEPA^%VVIDEO W $$^%QZCHW("(P)ointer le fromage ") D POS S XF=X,YF=Y
 I $D(^STOP($I,XF,YF)) D ^%VSQUEAK G PXF
 S DX=$X,DY=$Y D WFROM
OD D POCLEPA^%VVIDEO W $$^%QZCHW("Capacite odoriferante du fromage ([0,20] ou ?:aleatoire) : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S:Y1="" Y1="?" I Y1="?" S %FL=$R(21) G PO
 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) OD G:(Y1<0)!(Y1>20) OD S %FL=Y1
PO D POCLEPA^%VVIDEO W $$^%QZCHW("Permeabilite des obstacles a l'odeur ([0,20] ou ?:aleatoire) : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S:Y1="" Y1="?" I Y1="?" S %PO=$R(21) G SO
 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) PO G:(Y1<0)!(Y1>20) PO S %PO=Y1
 ;HL002 SO D POCLEPA^%VVIDEO W $$^%QZCHW("Nombre de dents de la souris ([0,10] ou ?:aleatoire) : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S:Y1="" Y1="?" I Y1="?" S %NBDTS=$R(11) G SU
SO D POCLEPA^%VVIDEO W $$^%QZCHW("Nombre de dents de la souris ([0,10] ou ?:aleatoire) : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S:Y1="" Y1="?" I Y1="?" S %NBDTS=$R(11) G PAS
 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) SO G:(Y1<0)!(Y1>10) SO S %NBDTS=Y1
PAS D POCLEPA^%VVIDEO W $$^%QZCHW("Affichage du parcours pas à pas (O/N)[O] : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) FIN S %PAS="O" I Y1="N" S %PAS="N" ;HL2
 ;HL004 SU D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^SOURFLAI,POCLEPA^%VVIDEO W $$^%QZCHW("repartition de l'(O)deur,(A)rret,(CTRLA)abandon"),*-1 H 2 X XY D ^SOURCHEM
SU D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^SOURFLAI,POCLEPA^%VVIDEO W $$^%QZCHW("repartition de l'(O)deur,(A)rret,(CTRLA)abandon") R *REP X XY D ^SOURCHEM
FIN D CURON^%VVIDEO K %PCH,^DEJAPASS($I),^STOP($I),X,Y,X1,Y1,LOP,XDEP,YDEP,XF,YF,D,ISNUM
END Q
BAR S X=$R(20) G:X=0 BAR
BAR1 S Y=$R(11) G:Y=0 BAR1
 S ^STOP($I,X,Y)=1,^XYBAR($I,4*X,22-(2*Y))=1
;HL003 AFFBAR D REV^%VVIDEO S DY=21-(Y*2),DX=(4*X)-2 F YY=1:1:3 X XY W "     " S DY=DY+1
AFFBAR D REV^%VVIDEO S DY=21-(Y*2),DX=(4*X)-2 F YY=1:1:3 X XY W "     " S ($X,$Y)=0 S DY=DY+1
 D NORM^%VVIDEO G END
POS S NON=0,DX=4,DY=2,MPASX=4,MPASY=2,NXI=3,NXS=77,NYI=1,NYS=21 X XY D ^%VZECUR S X=$X/4,Y=11-($Y/2)
 G END
 
STOC S X=-1 F %U=1:1 S X=$N(^XYBAR($I,X)) Q:X=-1  S Y=-1 F %V=1:1 S Y=$N(^XYBAR($I,X,Y)) Q:Y=-1  S ^[QUI]SOURJEUX(Y1,X,Y)=1
 Q
 ;HL002 WFROM O $I D BLK^%VVIDEO,BLD^%VVIDEO,^%CGW($$^%QZCHW("SOURIS"),"F"),NORM^%VVIDEO O $I Q
WFROM O $I D BLK^%VVIDEO,BLD^%VVIDEO X XY W $$^%QZCHW("F") D NORM^%VVIDEO Q
 ;HL002 WSOUR O $I D BLD^%VVIDEO,^%CGW($$^%QZCHW("SOURIS"),$$^%QZCHW("S")),NORM^%VVIDEO O $I Q
WSOUR O $I D BLD^%VVIDEO X XY W $$^%QZCHW("S") D NORM^%VVIDEO Q

