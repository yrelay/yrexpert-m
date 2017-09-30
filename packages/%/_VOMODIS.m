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

;%VOMODIS^INT^1^59547,74035^0
GEMODISC ;
 
B S:'($D(%AJM)) %AJM="C" D:'($D(^GCURGRIL($I,SCR))) ^%VCURWAY(SCR) D OABRES I '($D(^%SCRE(SCR))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$ZW("DESOLE !! NON ENCORE DISPONIBLE... ") H 3 D POCLEPA^%VVIDEO G FIN
 I ^%SCRE(SCR)=0 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("DESOLE !! NON ENCORE DISPONIBLE... ") H 3 D POCLEPA^%VVIDEO G FIN
 S ABENDSCR=0,CTRLF=0,SCR1=SCR_",COMMENT"
BEG S ICC=$$INIT^%VCURGRI G FIN:ICC=0
LOP S REFUSE=0,ESCMV="" G FIN:CTRLF'=0 I ICC=0 G BEG
 G FIN:'($D(^%SCRE(SCR,ICC)))
 
ICCP1 D LOP3,NORM^%VVIDEO G ABEND:ABENDSCR=1,LOP:ESCMV=1
 S ICC=$$^%VCURGRI(ICC,67) G LOP
FIN Q
LOP3 S DEP=0,C=$$^%QZCHW(^%SCRE(SCR,ICC,1)),DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY I $D(^%SCRE(SCR,ICC,"MODAFF")) S MOD=^%SCRE(SCR,ICC,"MODAFF") D @MOD X XY
 W C D DIM,^%VGETFLD(RESUL(ICC),$X,$Y,LXG,LXD,.CTRLF,.Y1) Q:DEP=1  S:(CTRLF="K")&(%AJM="C") X1=1 S:(CTRLF=1)!(CTRLF="L") RESUL(ICC)=Y1 Q:(CTRLF=1)!(CTRLF="L")  G ABEND:X1<2,ESCMV:X1=27,VDP:CTRLF="K"
 S LL=$L(RESUL(ICC)),RESUL(ICC)=$S(Y1'="":Y1,$D(^%SCRE(SCR,ICC,5)):$$^%QZCHW(^%SCRE(SCR,ICC,5)),1:"")
 I $E(RESUL(ICC),1,1)="@" S RZZ=$E(RESUL(ICC),2,299),RESUL(ICC)=@RZZ,TAB(ICC)=RESUL(ICC) D ^%VAFFICH
 I $D(^%SCRE(SCR,ICC,5)) S TAB(ICC)=RESUL(ICC) D ^%VAFFICH:RESUL(ICC)=$$^%QZCHW(^%SCRE(SCR,ICC,5))
 F LI=$L(RESUL(ICC))+1:1:LL W " "
 D VERIF G REFULOP:REFUSE>0 S STOPUC=0 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" K FRESU(ICC) F UYT=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC D @UCONT G REFULOP:REFUSE>0 Q:STOPUC=1
 Q
ABEND S ABENDSCR=1 Q
UCONT Q:'($D(^%SCRE(SCR,ICC,4)))  Q:^%SCRE(SCR,ICC,4)=""  S UCONT=^%SCRE(SCR,ICC,4) Q:UCONT=""  S IC=ICC D @UCONT Q
ESCMV S ESCMV=1,ICC=$$^%VCURGRI(ICC,XG3) Q
65 S %DIFL=-1,DYC=$Y,DYV=$O(^IGCURGRI($I,SCR,-(DYC))) I DYV="" S ESCMV=1 D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,-(DYV),-1)),ICC=^GCURGRIL($I,SCR,-(DYV),DXV),DEJALU(ICC)="",ESCMV=1 Q
66 S %DIFL=1,DYC=$Y,DYV=$O(^GCURGRIL($I,SCR,DYC)) I DYV="" S ESCMV=1 D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,DYV,-1)),ICC=^GCURGRIL($I,SCR,DYV,DXV),DEJALU(ICC)="",ESCMV=1 Q
67 S %DIFL=1,ICC=ICC+1,DEJALU(ICC)="",ESCMV=1 Q
68 S %DIFL=-1,ICC=ICC-1,DEJALU(ICC)="",ESCMV=1 Q
VERIF Q:'($D(^%SCRE(SCR,ICC,6)))  S NVLEG=^%SCRE(SCR,ICC,6) Q:NVLEG'>0
 F IV=1:1:NVLEG S VLEG=$$^%QZCHW(^%SCRE(SCR,ICC,6+IV)) G FVER:VLEG=RESUL(ICC)
 S REFUSE=1 Q
FVER Q
REFULOP D:REFUSE=1 ^%VREFUSE S DEJALU(ICC)="" G LOP
DIM I '($D(^%SCRE(SCR,ICC,"ESPACE"))) S LXG=%LIXG,LXD=%LIXD Q
 S LXG=^%SCRE(SCR,ICC,"ESPACE"),LXD=$P(LXG,",",2),LXG=$P(LXG,",",1) Q
REV D REV^%VVIDEO Q
BLD D BLD^%VVIDEO Q
BLK D BLK^%VVIDEO Q
MOY D CAG^%VVIDEO Q
GRD S DXG=DX,DYH=IL,MSG=AFF,ECR=1 D BIG^%VVIDEO,NORM^%VVIDEO Q
UDL D UDL^%VVIDEO Q
OABRES K ^OABRES($I) S YK=-1 F ZK=1:1 S YK=$N(RESUL(YK)) Q:YK=-1  S ^OABRES($I,YK)=RESUL(YK)
 K YK,ZK Q
VDP D ^%VVISDUP S ABENDSCR=1 Q

