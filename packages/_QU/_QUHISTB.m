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

;%QUHISTB^INT^1^59547,73885^0
ZHISTBIG(GLO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N HT,LA,OZ,REX,FLAG
 S DYORIG=@GLO@("DYO"),DXORIG=@GLO@("DXO"),MARGE=@GLO@("M"),HAUT=@GLO@("H"),LARGEUR=@GLO@("L"),YMIN=@GLO@("YMIN"),YMAX=@GLO@("YMAX"),NBCOL=$ZP(@GLO@(99999)),LA=LARGEUR-1,OZ=DYORIG-HAUT,REX=0,FLAG=$D(@GLO@(1,"Z"))#10
 S HT=HAUT+1 S:($D(@GLO@("NC"))#10)=1 HT=HAUT+@GLO@("NC")
 S:($D(DX)#10)'=1 DX=0 S:($D(DY)#10)'=1 DY=0
 S:'($D(DYORIG)) DYORIG=19 S:'($D(DXORIG)) DXORIG=0
 S:'($D(MMECH)) MMECH=0 G FFBLY:MMECH
 G:'($D(@GLO)) FIN K POS S NMAXLIB=9
 S IM=(YMAX-YMIN)/NMAXLIB,PASY=10000000 I IM=0 S PASY=1,YA=0,YB=1 G FFBLY
LBLY S U=PASY/5 G:U<IM FLBLY S PASY=U,U=PASY/2 G:U<IM FLBLY S PASY=U G LBLY
FLBLY S YA=(YMIN\PASY)*PASY,YB=((YMAX\PASY)+1)*PASY
FFBLY 
 S ECRAN=LARGEUR ;;;=$S((80-MARGE-2)/2<NBCOL:132,1:80)
CADRE D EFF(DXORIG,OZ,LA,HT),CUROF^%VVIDEO,COM S DXG=DXORIG+MARGE,DYH=(DYORIG-HAUT)+1,LV=HAUT,LH=ECRAN-MARGE,LCOL=((LH-2)/NBCOL)\1 S:LCOL<2 LCOL=2 D CARS^%VVIDEO
GRADY S DX=DXORIG,Y=YA,PASE=((HAUT*PASY)/(YB-YA))\1 F DY=DYORIG:-(PASE):(DYORIG-HAUT)+2 X XY W Y S Y=Y+PASY
 S YMAXI=Y-PASY
CAPA D:FLAG ^%QUHISTC
COL O $I D CUROF^%VVIDEO,REV^%VVIDEO O $I
 
 F COL=1:1:NBCOL S DEP=0,BLD=1,DXG=((((COL-1)*LCOL)+MARGE)+DXORIG)+1,Y=@GLO@(COL,"Y")-YMIN S:Y<0 Y=YA S:Y>YMAXI Y=YMAXI,DEP=1 S NBCAR=((((Y*PASE)/PASY)+5E-1)\1)+DEP,POS(DXG)=NBCAR,LV=NBCAR-1,DYH=(DYORIG-LV)-1 S:DYH<0 LV=DYORIG-1,DYH=0 D VERT
COL2 D G0OFF^%VVIDEO,NORM^%VVIDEO F COL=1:1:NBCOL S DX=((((COL-1)*LCOL)+MARGE)+DXORIG)+1,DY=DYORIG+1 D COL3
 G FCOL
COL3 S LC=-1 F U=0:0 S LC=$N(@GLO@(COL,"L",LC)) Q:LC=-1  S L=@GLO@(COL,"L",LC) D:(@GLO@(COL,"Y")-YMIN)>0 BLD^%VVIDEO D REX X XY D WRITE D:((@GLO@(COL,"Y")-YMIN)>0)!REX NORM^%VVIDEO S DY=DY+1,REX=0
 Q
WRITE I $D(@GLO@(COL,"G",LC))=0 W $E(L,($L(L)-LCOL)+2,$L(L)) Q
 I @GLO@(COL,"G",LC)="" W $E(L,($L(L)-LCOL)+2,$L(L)) Q
 D ^%CGW(@GLO@(COL,"G",LC),L) Q
FCOL D NORM^%VVIDEO,CURON^%VVIDEO
FIN S GLOBAL=GLO K NMAXLIB,U,IM,Y,COL,BIDON,MMECH
 Q
VERT S DX=DXG,DY=DYH X XY F C1=0:1:LV S DX=DXG,DY=DYH+C1 X XY W $J("",LCOL-1)
 K BLD,DXG,DYH,C1,LH,LV Q
 
EFF(XG,YH,H,V) N OX,OY S OX=DX,OY=DY F J=0:1:V S DX=XG,DY=YH+J X XY F I=0:1:H W " "
 S DX=OX,DY=OY Q
COM N OX,OY,LX S OX=DX,OY=DY,LX=$O(@GLO@("C","")),DX=DXORIG,DY=DYORIG+1 F I=1:1 Q:LX=""  X XY W @GLO@("C",LX) S DY=DY+1,LX=$O(@GLO@("C",LX))
 S DX=OX,DY=OY Q
REX I $D(@GLO@(COL,"R",LC))'=0 D @(@GLO@(COL,"R",LC)_"^%VVIDEO") S REX=1 Q
 Q
 
REAFF 
 S MMECH=1 D ^%QUHIST(GLO) Q
 
MOVE 
 
 
 
 
 
 
 
 D CURUDL^%VVIDEO,CURIMO^%VVIDEO
 S NYI=DYORIG-HAUT,NYS=DYORIG,NXS=$ZP(POS(""))+1,NXI=MARGE+DXORIG,MPASY=1,MPASX=LCOL
 D ECHON^%VVIDEO
 S DX=(DXORIG+MARGE)+1,DY=DYORIG-1 X XY D ^%VZECUR
 S COL=((((DX-MARGE)-1)-DXORIG)/LCOL)+1,LBL=$$^%QCAZG($$CONCAS^%QZCHAD(GLOBAL,COL_",L,1")),PSY=DYORIG-DY,INOUT=$S(POS(DX)'<PSY:1,1:0),Y=((((PSY*PASY)/PASE)+YA)+5E-1)\1
 D CURBLO^%VVIDEO,CURBLK^%VVIDEO Q
 
TEST W !,"YMAX : " R IGMM Q:IGMM=""  W !,"Y MAXI COLONNES : " R IGM Q:IGM=""
 K X F I=1:1:5 S X(I,"L",1)=$C(60+I),X(I,"L",2)=$C(65+I),X(I,"Y")=(IGM/4)*(I-1)
 S X("M")=3,X("L")=30,X("H")=10,X("DXO")=14,X("DYO")=19,X("YMIN")=0,X("YMAX")=IGMM
 D ^%QUHISTB("X") R *REP G TEST
 D MOVE^%QUHISTB
 D POCLEPA^%VVIDEO,CAG^%VVIDEO W "X1=",X1,"  COL=",COL,"  LBL=""",LBL,"""  Y=",Y,"  INOUT=",INOUT
 Q:X1=1  H 2 D POCLEPA^%VVIDEO G TEST
TEST1 K ^X N R
 F I=1:1:5 S ^X(I,"L",1)=$C(60+I),^X(I,"Y")=1E-2*(I-1),^X(I,"L",2)=$C(65+I)
 S ^X(3,"L",2)="BLI",^X(3,"G",2)="SYMB"
 S ^X("M")=3,^X("L")=60,^X("H")=10,^X("DXO")=14,^X("DYO")=19,^X("YMIN")=0,^X("YMAX")=2E-1,^X("NC")=2,^X("C",1)="C1",^X("C",2)="C2"
 D ^%QUHISTB("^X")
 D MOVE^%QUHISTB
 D POCLEPA^%VVIDEO,CAG^%VVIDEO W "X1=",X1,"  COL=",COL,"  LBL=""",LBL,"""  Y=",Y,"  INOUT=",INOUT
 Q:X1=1  H 2 D POCLEPA^%VVIDEO R *R Q:$C(R)=1  G TEST1

