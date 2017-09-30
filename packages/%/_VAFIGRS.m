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

;%VAFIGRS^INT^1^59547,74034^0
AFIGRSCR ;
 
 
 D CLEPAG^%VVIDEO
BEG D CUROF^%VVIDEO,^%VATYPA
LOOP D:'($D(s)) MEM I $D(s(0,"TITRE")) S DY=0,DX=40-($L(s(0,"TITRE"))\2) D BLD,REV X XY W s(0,"TITRE") D NORM
 S (SCR2,SCR1)=SCR_",COMMENT" I $D(s(1)) F ICC=1:1:s(1) S C=s(1,ICC,1),DX=s(1,ICC,2),DY=s(1,ICC,3) D XY,W
 F ICC=1:1:s(0) S DX=s(0,ICC,2),DY=s(0,ICC,3) D XY D:$D(s(0,ICC,"MODAFF")) MOD W s(0,ICC,1) D BLD W RESUL(ICC) D NORM
 D CURON^%VVIDEO Q
MOD S MOD=s(0,ICC,"MODAFF") D @MOD Q
XY 
 S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY
FIN Q
MEM S NOMTREE="^%SCRE("""_SCR_"""",%TREECOP="s(0" D ^%QCAGLC S SCR1=SCR_",COMMENT",NOMTREE="^%SCRE("""_SCR1_"""",%TREECOP="s(1" D ^%QCAGLC S SCR1=SCR_",COMMENT"
 K NOMTREE,%TREECOP Q
NORM W *27,"[0m" Q
W S AFF=^%SCRE(SCR2,ICC,1) G:$E(AFF,1)="~" W1 W AFF Q
W1 S D=$P(AFF,"~",2) G @D
L S TL=$P(AFF,"~",3),@("L"_TL)=$P(AFF,"~",4),DXG=DX,DYH=DY D @("TR"_TL_"^%VVIDEO") Q
K S DXG=DX,DYH=DY,LH=$P(AFF,"~",3),LV=$P(AFF,"~",4) D CARS^%VVIDEO Q
KL S %U1=3 F IT="DXG","DXD","DYH","DYB","BLD" S @IT=$P(AFF,"~",%U1),%U1=%U1+1
 S:BLD="" BLD=0 D CARL^%VVIDEO Q
KSP S TGR="^%SCRE(SCR1,ICC,4)" D FIG^%VVIDEO Q
REV D REV^%VVIDEO Q
BLD D BLD^%VVIDEO Q
BLK D BLK^%VVIDEO Q
MOY D CAG^%VVIDEO Q
GRD S DXG=DX,DYH=IL,MSG=AFF,ECR=1 D BIG^%VVIDEO,NORM^%VVIDEO Q
UDL D UDL^%VVIDEO Q

