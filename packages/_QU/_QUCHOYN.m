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

;%QUCHOYN^INT^1^59547,73884^0
ZCHOIXN(LOBJ,LSEL) 
 
 
 
 
 
 
 
 
 
 
 N TITRE,MODE S TITRE="CHOISSISSEZ",MODE="SELECTION"
DEB N DERO,DX,DXD,DXG,DY,DYB,DYH,%F,GRAPH,I,%I,L,MSG,N,NBPAGE,O,PAGE,PILE,PY
 K @(LSEL) S I=MODE="DESELECTION" D 2^%CGW("RQS","RECOPIE",">")
 I '($D(@LOBJ)) D POCLEPA^%VVIDEO,^%VSQUEAK W "Je ne retrouve pas les objets de cette liste ... desole" H 3 D POCLEPA^%VVIDEO S ABEND=1 Q
 S N=0,O=-1 F %O=0:0 S O=$N(@LOBJ@(O)) Q:O=-1  S:'($D(L($L(O)))) L($L(O))=0 S N=N+1,L($L(O))=L($L(O))+1,@LSEL@(O)=I S:((N-1)#16)=0 PILE(((N-1)\16)+1)=O D:(N#100)=0 2^%CGW("RQS","OBJET","o")
 S I=-1,(T1,T2)=0 F %I=0:0 S I=$N(L(I)) Q:I=-1  S T1=T1+L(I),T2=(L(I)*I)+T2
 S L=(T2\T1)+1,NBPAGE=((N-1)\16)+1,PILE=0,PY=6 D CLEPAG^%VVIDEO,CAD,PAGP
L0 D POCLEPA^%VVIDEO W "(C)hanger de mode,(P)age,(^),(v),(+),(-)"
L1 S DX=1,DY=PY X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,6,13,18,43,61,67,80 G:X1=I @I
 D ^%VSQUEAK G L1
1 S ABEND=1 Q
6 S ABEND=0 Q
13 I @LSEL@(PAGE(PY)) G 68
 G 83
18 D CLEPAG^%VVIDEO,CAD,PAG G L0
43 G 61
45 G 95
61 D PAGP G L0
95 D PAGM G L0
67 D POCLEPA^%VVIDEO W "Un instant ..." D 2^%CGW("RQS","RECOPIE",">") S MODE=$S(MODE="SELECTION":"DESELECTION",1:"SELECTION"),N=0,I=-1 F %I=0:0 S I=$N(@LSEL@(I)) Q:I=-1  S N=N+1,@LSEL@(I)='(@LSEL@(I)) D:(N#100)=0 2^%CGW("RQS","OBJET","o")
 D PAG G L0
68 S @LSEL@(PAGE(PY))=0 D CL I $D(PAGE(PY+1)) S PY=PY+1 G L1
 G L1
80 D POCLEPA^%VVIDEO W "Page : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA!(Y1="") L0
 I '($D(PILE(Y1))) D ^%VSQUEAK G 80
 S PILE=Y1,PY=6 D PAG G L0
83 S @LSEL@(PAGE(PY))=1 D AF(PY) I $D(PAGE(PY+1)) S PY=PY+1 G L1
 G L1
 I PILE=1 D ^%VSQUEAK G L1
 D PAGM G L0
H G:$D(PAGE(PY-1)) H0 I '($D(PILE(PILE-1))) D ^%VSQUEAK G L1
 D PAGM G L0
H0 S PY=PY-1 G L1
B G:$D(PAGE(PY+1)) B0 I '($D(PILE(PILE+1))) D ^%VSQUEAK G L1
 D PAGP G L0
B0 S PY=PY+1 G L1
G D ^%VSQUEAK G L1
D G G
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=TITRE D 4^%VZCD Q
CL S DX=1,DY=PY X XY W " " Q
AF(PY) D REV^%VVIDEO,BLD^%VVIDEO S DX=1,DY=PY X XY W "*" D NORM^%VVIDEO Q
PAGP S PY=6,PILE=PILE+1 G PAG
PAGM S PY=6,PILE=PILE-1 G PAG
PAG S DX=0,DY=5 X XY D CLEBAS^%VVIDEO S DXG=0,DYH=5,LH=80,LV=18,BLD=1 D CARS^%VVIDEO S DX=5,DY=5 X XY W " Mode : " D BLK^%VVIDEO,BLD^%VVIDEO W MODE D NORM^%VVIDEO W " " S DX=65,DY=5 X XY W " Page ",PILE,"/",NBPAGE," " K PAGE S O=PILE(PILE)
 F DY=6:1:21 S DX=2 X XY W O S PAGE(DY)=O D:@LSEL@(O) AF(DY) S O=$N(@LOBJ@(O)) Q:O=-1
 S DERO=O Q
 
 
 
 
 
 
 
 
 
2(LOBJ,LSEL,TITRE,MODE) G DEB
DET(LOBJ,LSEL,TITRE,MODE) G DEB

