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

;%QUHIST^INT^1^59547,73885^0
ZHISTO(TITRE,YMIN,YMAX,NBCOL,GLO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S:'($D(MMECH)) MMECH=0 G FFBLY:MMECH
 G:'($D(@GLO)) FIN K POS S NMAXLIB=9
 S IM=(YMAX-YMIN)/NMAXLIB,PASY=10000000 I IM=0 S PASY=1,YA=0,YB=1 G FFBLY
LBLY S U=PASY/5 G:U<IM FLBLY S PASY=U,U=PASY/2 G:U<IM FLBLY S PASY=U G LBLY
FLBLY S YA=(YMIN\PASY)*PASY,YB=((YMAX\PASY)+1)*PASY
FFBLY S MARGE=8 G:(((132-MARGE)-2)/2)<NBCOL FIN S ECRAN=$S((((80-MARGE)-2)/2)<NBCOL:132,1:80)
CADRE D CLEPAG^%VVIDEO,@ECRAN^%VVIDEO,CUROF^%VVIDEO S DXG=MARGE,DYH=1,LV=DYORIG,LH=ECRAN-MARGE,LCOL=((LH-2)/NBCOL)\1 D CARS^%VVIDEO
GRADY S DX=0,Y=YA,PASE=(((DYORIG-1)*PASY)/(YB-YA))\1 F DY=DYORIG:-(PASE):1 X XY W Y S Y=Y+PASY
TITRE D CUROF^%VVIDEO,REV^%VVIDEO S DX=0,DY=0 X XY W "                                                                                " I ECRAN=132 W "                                                    "
 S TIT=$E(TITRE,1,ECRAN-2),DX=((ECRAN-$L(TIT))\2)-1 X XY W TIT D NORM^%VVIDEO
CAPA 
COL O $I D CUROF^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO O $I
 S YMAXI=(((PASY*DYORIG)/PASE)+5E-1)\1
 F COL=1:1:NBCOL S BLD=1,DXG=(((COL-1)*LCOL)+MARGE)+1,Y=@GLO@(COL,"H")-YMIN S:Y<0 Y=YA S:Y>YMAXI Y=YMAXI S NBCAR=(((Y*PASE)/PASY)+5E-1)\1,POS(DXG)=NBCAR,LV=NBCAR-1,DYH=(DYORIG-LV)-1 S:DYH<0 LV=DYORIG-1,DYH=0 D VERT
COL2 D G0OFF^%VVIDEO,NORM^%VVIDEO F COL=1:1:NBCOL S DX=(((COL-1)*LCOL)+MARGE)+1,DY=DYORIG+1,L=@GLO@(COL,"L") D:(@GLO@(COL,"H")-YMIN)>0 BLD^%VVIDEO X XY W $E(L,($L(L)-LCOL)+2,$L(L)) D:(@GLO@(COL,"H")-YMIN)>0 NORM^%VVIDEO
 
 D NORM^%VVIDEO,CURON^%VVIDEO
FIN 
 S GLOBAL=GLO K NMAXLIB,U,IM,Y,COL,BIDON,MMECH
 Q
VERT S DX=DXG,DY=DYH X XY F C1=0:1:LV S DX=DXG,DY=DYH+C1 X XY W *32
 K BLD,DXG,DYH,C1,LH,LV Q
 
REAFF 
 S MMECH=1 D ^%QUHIST(TITRE,YMIN,YMAX,NBCOL,GLO) Q
 
MOVE 
 
 
 
 
 
 
 
 D CURUDL^%VVIDEO,CURIMO^%VVIDEO
 S NYI=0,NYS=DYORIG,NXS=$ZP(POS(""))+1,NXI=MARGE,MPASY=1,MPASX=LCOL
 D ECHON^%VVIDEO
 S DX=MARGE+1,DY=DYORIG-1 X XY D ^%VZECUR
 S COL=(((DX-MARGE)-1)/LCOL)+1,LBL=@GLOBAL@(COL,"L"),PSY=DYORIG-DY,INOUT=$S(POS(DX)'<PSY:1,1:0),Y=((((PSY*PASY)/PASE)+YA)+5E-1)\1
 D CURBLO^%VVIDEO,CURBLK^%VVIDEO Q
 
TEST K X
 F I=1:1:45 S X(I,"L")=$C(60+I),X(I,"H")=$R(200)
 S DYORIG=10
 D ^%QUHIST("VENTES PREVUES 2EME SEMESTRE 1987",0,200,45,"X")
 D MOVE^%QUHIST
 D POCLEPA^%VVIDEO,CAG^%VVIDEO W "X1=",X1,"  COL=",COL,"  LBL=""",LBL,"""  Y=",Y,"  INOUT=",INOUT
 Q:X1=1  H 2 D POCLEPA^%VVIDEO G TEST

