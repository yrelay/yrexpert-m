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
;! Nomprog     : %VMODISC                                                     !
;! Module      : VIDEO                                                        !
;! But         : Modifier une fiche                                           !
;!                                                                            !
;! Description : Permet de modiifer par exemple une fiche d'implicite dans    !
;! TOTEM.                                                                     !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 12/02/07 ! Label $$ZW                                     !
;! HL003 ! HL     ! 22/06/08 ! PB dans la mise en relation avec le lexique.   !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VMODISC ;

 N %XI,%YI,%XA
B S:'($D(%AJM)) %AJM="C" D:'($D(^GCURGRIL($I,SCR))) ^%VCURWAY(SCR) D OABRES
 G NDISP:($D(^%SCRE(SCR))#10)'=1,NDISP:^%SCRE(SCR)=0
 S ABENDSCR=0,CTRLF=0,SCR1=SCR_",COMMENT"
BEG S ICC=$$INIT^%VCURGRI G FIN:ICC=0
LOP S REFUSE=0,ESCMV="" G FIN:CTRLF=1 I ICC=0 G BEG
 G FIN:'($D(^%SCRE(SCR,ICC)))
ICCP1 D LOP3,NORM^%VVIDEO G ABEND:ABENDSCR=1,LOP:ESCMV=1
 S ICC=$$^%VCURGRI(ICC,67) G LOP
FIN Q
LOP3 S DEP=0,C=$$^%QZCHW(^%SCRE(SCR,ICC,1)),DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY I $D(^%SCRE(SCR,ICC,"MODAFF")) S MOD=^%SCRE(SCR,ICC,"MODAFF") D @MOD X XY
 W C D DIM S %XI=$X,%YI=$Y
 D GET^%VLECFL2(RESUL(ICC),%XI,%YI,LXG,LXD,.CTRLF,.Y1)
 S:CTRLF="F" CTRLF=1 S:(CTRLF="K")&(%AJM="C") X1=1 S:(CTRLF=1)!(CTRLF="L") RESUL(ICC)=Y1 Q:(CTRLF=1)!(CTRLF="L")  G VDP:CTRLF="K",ABEND:CTRLF="A"
 G ACQ:CTRLF="" I Y1'=RESUL(ICC) D ^%VCRIFLD($J("",$S($L(Y1)>$L(RESUL(ICC)):$L(Y1),1:$L(RESUL(ICC)))),%XI,%YI,LXG,LXD),^%VCRIFLD(RESUL(ICC),%XI,%YI,LXG,LXD)
 G ESCMV:$E(CTRLF)="*",@$$CTRL
ACQ S LL=$L(RESUL(ICC)),RESUL(ICC)=$S(Y1'="":Y1,$D(^%SCRE(SCR,ICC,5)):$$^%QZCHW(^%SCRE(SCR,ICC,5)),1:"")
 ;HL003 G FIN
 
 I $D(^%SCRE(SCR,ICC,5)) S TAB(ICC)=RESUL(ICC) D ^%VAFFICH:RESUL(ICC)=$$^%QZCHW(^%SCRE(SCR,ICC,5))
 F LI=$L(RESUL(ICC))+1:1:LL W " "
 D VERIF G REFULOP:REFUSE>0 S STOPUC=0 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" K FRESU(ICC) F UYT=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC D @UCONT G REFULOP:REFUSE>0 Q:STOPUC=1
 Q
ABEND S ABENDSCR=1 Q
UCONT Q:'($D(^%SCRE(SCR,ICC,4)))  Q:^%SCRE(SCR,ICC,4)=""  S UCONT=^%SCRE(SCR,ICC,4) Q:UCONT=""  S IC=ICC D @UCONT Q
ESCMV S ESCMV=1,ICC=$$^%VCURGRI(ICC,$P(CTRLF,"*",2)) Q
VERIF Q:'($D(^%SCRE(SCR,ICC,6)))  N NVLEG,IV S NVLEG=^%SCRE(SCR,ICC,6) Q:NVLEG'>0
 S REFUSE=1 F IV=1:1:NVLEG S VLEG=$$^%QZCHW(^%SCRE(SCR,ICC,6+IV)) I VLEG=RESUL(ICC) S REFUSE=0 G FVER
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
 ;HL002 NDISP D ^%VZEAVT($$ZW("DESOLE !! NON ENCORE DISPONIBLE... ")) G FIN
NDISP D ^%VZEAVT("DESOLE !! NON ENCORE DISPONIBLE... ") G FIN
CTRL() N CTR,%U,IT
 S CTR=$P($T(CTR),";;",2) F %U=1:1 S IT=$P(CTR,"/",%U) Q:IT=""  I $P(IT,":",1)=CTRLF G DCTR
 Q "LOP3"
DCTR S @("%XA="_$P(IT,":",2)) Q %XA
ZW Q
CTR ;;J:$$J^%VCTRLSC/E:$$E^%VCTRLSC/P:$$P^%VCTRLSC/D:$$D^%VCTRLSC/R:$$R^%VCTRLSC/H:$$H^%VCTRLSC
