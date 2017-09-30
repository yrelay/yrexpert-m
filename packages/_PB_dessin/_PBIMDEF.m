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

;%PBIMDEF^INT^1^59547,73873^0
PTIDEFOB ;
 D ^%PBIPINS
DEB D CLEPAG^%VVIDEO,CAD
DEB2 S DX=0,DY=5 X XY D CLEBAS^%VVIDEO S Y1=""
 S DX=12,DY=10 X XY W "Objet  : " S DX=$X,DY=$Y W $J("",$L(Y1)) X XY
 D ^%VLEC G:CTRLA!(Y1="") FIN G:Y1'="?" S0
 S Y1=$$^%QUCHOYO("^[QUI]GRAPHE2",.R,3) G:Y1="" FIN G @R
0 S DX=12,DY=10 X XY W "Objet  : ",Y1 G S0
1 D POCLEPA^%VVIDEO G 0
2 D CLEPAG^%VVIDEO,CAD S DX=12,DY=10 X XY W "Objet  : ",Y1 G S0
S0 S OBJET=Y1,Y1=""
 S DX=12,DY=12 X XY W "Version : " S DX=$X,DY=$Y W $J("",$L(Y1)) X XY
 D ^%VLEC G:CTRLA!(Y1="") DEB G:Y1'="?" S1
 S Y1=$$^%QUCHOYO("^[QUI]GRAPHE2(OBJET)",.R,3) G:Y1="" FIN G @("X"_R)
X0 S DX=12,DY=12 X XY W "Version : ",Y1 G S1
X1 D POCLEPA^%VVIDEO G X0
X2 D CLEPAG^%VVIDEO,CAD S DX=12,DY=10 X XY W "Objet  : ",OBJET
 S DX=12,DY=12 X XY W "Version : ",Y1 G S1
S1 S VERSION=Y1,Y1=""
 G @("D"_$$EXIST^%PBSOV(OBJET,VERSION))
FIN K AD,CO,CTRLA,DX,DXD,DXG,DY,DYB,DYH,GRAPH,MEN1,MSG,OBJET,R,VERSION,Y1 Q
 
D0 
L1 D POCLEPA^%VVIDEO W "Cet objet n'existe pas, voulez-vous le creer (O/N) ? [O] : " R *BID
 F I=1,6,13,78,79 G:I=BID @("L1"_I)
 D ^%VSQUEAK G L1
L11 G DEB2
L16 G DEB2
L113 G L179
L178 G DEB2
L179 D ^%PBIMCR2(OBJET,VERSION) G DEB
 
D1 
L0 S MEN1(1)="Modifier^MODIF"
 S MEN1(2)="Visualiser^VISUA"
 S MEN1(3)="Redefinir^REDEF"
 S MEN1(4)="Supprimer^SUPPR"
 S MEN1(5)="Dupliquer^DUPLI"
 S MEN1(6)="Interpreter^INTER"
 
L00 D POCLEPA^%VVIDEO,^%VQUIKMN(1,79,23,"MEN1",.AD,.CO) G:AD'="" @AD
 I "AF"[CO G DEB2
 D ^%VSQUEAK G L00
INTER D ^%PBIMINT(OBJET,VERSION) G DEB
MODIF D MODIF^%PBIMCR2(OBJET,VERSION) G DEB
REDEF D POCLEPA^%VVIDEO S I=$$CONFIRM^%VZEOUI($$^%QZCHW("confirmation")_" : ")
 I I'=1 G L0
 D KILL^%PBSOV(OBJET,VERSION),^%PBIMCR2(OBJET,VERSION) G DEB
SUPPR D ^%PBIMSUP(OBJET,VERSION) G DEB2
VISUA D ^%PBIMVOI(OBJET,VERSION) G DEB
DUPLI D ^%PBIMDUP(OBJET,VERSION) G DEB2
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="OBJETS GRAPHIQUES" D 4^%VZCD Q

