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

;%QS0HIST^INT^1^59547,73879^0
ZLIGHIST(GLO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S DYORIG=@GLO@("DYO"),DXORIG=@GLO@("DXO"),MARGE=@GLO@("M"),HAUT=@GLO@("H"),LARGEUR=@GLO@("L"),YMIN=@GLO@("YMIN"),YMAX=@GLO@("YMAX"),NBCOL=$ZP(@GLO@(99999))
 S:'($D(DYORIG)) DYORIG=19 S:'($D(DXORIG)) DXORIG=0
 S:'($D(MMECH)) MMECH=0 G FFBLY:MMECH
 G:'($D(@GLO)) FIN K POS S NMAXLIB=9
 S IM=(YMAX-YMIN)/NMAXLIB,PASY=10000000 I IM=0 S PASY=1,YA=0,YB=1 G FFBLY
LBLY S U=PASY/5 G:U<IM FLBLY S PASY=U,U=PASY/2 G:U<IM FLBLY S PASY=U G LBLY
FLBLY S YA=(YMIN\PASY)*PASY,YB=((YMAX\PASY)+1)*PASY
FFBLY G:(((LARGEUR-MARGE)-2)/2)<NBCOL FIN S ECRAN=LARGEUR ;;;=$S((80-MARGE-2)/2<NBCOL:132,1:80)
CADRE D CLEPAG^%VVIDEO,CUROF^%VVIDEO S DXG=DXORIG+MARGE,DYH=(DYORIG-HAUT)+1,LV=HAUT,LH=ECRAN-MARGE,LCOL=((LH-2)/NBCOL)\1 D CARS^%VVIDEO
GRADY S DX=DXORIG,Y=YA,PASE=((HAUT*PASY)/(YB-YA))\1 F DY=DYORIG:-(PASE):(DYORIG-HAUT)+2 X XY W Y S Y=Y+PASY
 S YMAXI=Y-PASY
CAPA 
COL O $I D CUROF^%VVIDEO,REV^%VVIDEO O $I
 
 F COL=1:1:NBCOL S DEP=0,BLD=1,DXG=((((COL-1)*LCOL)+MARGE)+DXORIG)+1,Y=@GLO@(COL,"Y")-YMIN S:Y<0 Y=YA S:Y>YMAXI Y=YMAXI,DEP=1 S NBCAR=((((Y*PASE)/PASY)+5E-1)\1)+DEP,POS(DXG)=NBCAR,LV=NBCAR-1,DYH=(DYORIG-LV)-1 S:DYH<0 LV=DYORIG-1,DYH=0 D VERT
COL2 D G0OFF^%VVIDEO,NORM^%VVIDEO F COL=1:1:NBCOL S DX=((((COL-1)*LCOL)+MARGE)+DXORIG)+1,DY=DYORIG+1 D COL3
 G FCOL
COL3 S LC=-1 F U=0:0 S LC=$N(@GLO@(COL,"L",LC)) Q:LC=-1  S L=@GLO@(COL,"L",LC) D:(@GLO@(COL,"Y")-YMIN)>0 BLD^%VVIDEO X XY W $E(L,($L(L)-LCOL)+2,$L(L)) D:(@GLO@(COL,"Y")-YMIN)>0 NORM^%VVIDEO S DY=DY+1
 Q
FCOL D NORM^%VVIDEO,CURON^%VVIDEO
FIN S GLOBAL=GLO K NMAXLIB,U,IM,Y,COL,BIDON,MMECH
 Q
VERT S DX=DXG,DY=DYH X XY F C1=0:1:LV S DX=DXG,DY=DYH+C1 X XY W $J("",LCOL-1)
 K BLD,DXG,DYH,C1,LH,LV Q
 
REAFF 
 S MMECH=1 D ^%QUHIST(GLO) Q
 
MOVE 
 
 
 
 
 
 
 
 D CURUDL^%VVIDEO,CURIMO^%VVIDEO
 S NYI=DYORIG-HAUT,NYS=DYORIG,NXS=$ZP(POS(""))+1,NXI=MARGE+DXORIG,MPASY=1,MPASX=LCOL
 S DX=(DXORIG+MARGE)+1,DY=DYORIG-1 X XY D ^%VZECUR
 S COL=((((DX-MARGE)-1)-DXORIG)/LCOL)+1,LBL=$$^%QCAZG($$CONCAS^%QZCHAD(GLOBAL,COL_",L,1")),PSY=DYORIG-DY,INOUT=$S(POS(DX)'<PSY:1,1:0),Y=((((PSY*PASY)/PASE)+YA)+5E-1)\1
 D CURBLO^%VVIDEO,CURBLK^%VVIDEO Q
 
TEST W !,"YMAX : " R IGMM Q:IGMM=""  W !,"Y MAXI COLONNES : " R IGM Q:IGM=""
 K X F I=1:1:5 S X(I,"L",1)=$C(60+I),X(I,"L",2)=$C(65+I),X(I,"Y")=(IGM/4)*(I-1)
 S X("M")=3,X("L")=30,X("H")=10,X("DXO")=14,X("DYO")=19,X("YMIN")=0,X("YMAX")=IGMM
 D ^%QS0HIST("X") R *REP G TEST
 D MOVE^%QS0HIST
 D POCLEPA^%VVIDEO,CAG^%VVIDEO W "X1=",X1,"  COL=",COL,"  LBL=""",LBL,"""  Y=",Y,"  INOUT=",INOUT
 Q:X1=1  H 2 D POCLEPA^%VVIDEO G TEST

