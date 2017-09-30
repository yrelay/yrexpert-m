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

;%QUCHOYX^INT^1^59547,73884^0
ZCHOIX ;
 
 
 
 
 
 
 N DUREE,TIME,TEMPO S DUREE=10,TEMPO=0,TIME=0
GO N %F,I,%I,NBOBJ,NBPAGE,NC,NL,NOPAGE,NP,OPS,P,PS,SE,SY,X1
 S NBOBJ=0,I=-1 F %I=0:0 S I=$N(@%T@(I)) Q:I=-1  S:@%T@(I)'="z" NBOBJ=NBOBJ+1
 S (PS,P)=1,NC=80\(%L+2),NL=15,NP=NL*NC,SY=7,SE=1,NOPAGE=1,NBPAGE=((NBOBJ-1)\NP)+1
DEB D CLEPAG^%VVIDEO,CAD
LL D PAG
L0 D HELP
L1 D:SE POS D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU:'(TIME),ZFLECHET^%VZATOU(DUREE):TIME,ECHON^%VVIDEO
 I TIME&TEMPO S %C="" Q
 G:%F'="" @%F F I=1,6,13,18,80,83 G:X1=I @I
 D ^%VSQUEAK G L1
H G:'(SE) H2 I '($D(@%T@(PS-1))) D ^%VSQUEAK G L1
 I @%T@(PS-1)="z" D ^%VSQUEAK G L1
 I PS=P S PS=PS-1 G B2
 S OPS=PS,PS=PS-1 D NET G L1
H2 I '($D(@%T@(P+NP))) D ^%VSQUEAK G L1
 I @%T@(P+NP)="z" D ^%VSQUEAK G L1
 S NOPAGE=NOPAGE+1
 S P=P+NP G LL
B G:'(SE) B2 I '($D(@%T@(PS+1))) D ^%VSQUEAK G L1
 I @%T@(PS+1)="z" D ^%VSQUEAK G L1
 I PS=(((NL*NC)+P)-1) S PS=PS+1 G H2
 S OPS=PS,PS=PS+1 D NET G L1
B2 I P=1 D ^%VSQUEAK G L1
 S NOPAGE=NOPAGE-1
 S P=P-NP G LL
G I '(SE) D ^%VSQUEAK G L1
 I (PS-NL)<P D ^%VSQUEAK G L1
 S OPS=PS,PS=PS-NL D NET G L1
D G:'(SE) G I ('($D(@%T@(PS+NL))))!((PS+NL)>(((NC*NL)+P)-1)) D ^%VSQUEAK G L1
 I @%T@(PS+NL)="z" D ^%VSQUEAK G L1
 S OPS=PS,PS=PS+NL D NET G L1
1 I SE S OPS=PS D NET S SE=0 G L0
 S %C="" Q
6 I SE S %C=PS Q
 S %C="" Q
13 G:'(SE) L1 G:SE 6
18 G DEB
80 D POCLEPA^%VVIDEO W "Page : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA!(Y1="") L0
 I ((Y1'?.N)!(Y1=0))!(Y1>NBPAGE) D ^%VSQUEAK G 80
 S (PS,P)=((Y1-1)*NP)+1,NOPAGE=Y1 G LL
83 I SE D ^%VSQUEAK G L1
 S SE=1,PS=P D HELP G L1
HELP D POCLEPA^%VVIDEO W "(^),(v),(P)age" W:'(SE) ",(S)election" Q
CAD S DXG=0,DXD=39,DYH=0,DYB=4,MSG=$S($D(%TIT):%TIT,1:"Faites votre choix"),GRAPH=1 D 4^%VZCD Q
PAG S DX=0,DY=SY-2 D CLEBAS^%VVIDEO
 S DX=70,DY=SY-2 X XY W "Page ",NOPAGE,"/",NBPAGE
 F I=P:1:((NL*NC)+P)-1 D DXY X XY W $S('($D(@%T@(I))):$J("",%L),@%T@(I)="z":$J("",%L),1:$E(@%T@(I),1,%L))
 Q
NET Q:'(SE)  S I=OPS D DXY X XY W $E(@%T@(OPS),1,%L) Q
POS Q:'(SE)  S I=PS D DXY X XY D REV^%VVIDEO,BLD^%VVIDEO X XY W $E(@%T@(PS),1,%L) D NORM^%VVIDEO Q
DXY S C=((I-P)\NL)+1,DX=(%L+1)*(C-1),DY=((SY+I)-P)-((C-1)*NL) Q
 
 
 
 
 
 
PAR(%T,%L) N %C D ZCHOIX Q %C

