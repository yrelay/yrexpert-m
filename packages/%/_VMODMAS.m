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

;%VMODMAS^INT^1^59547,74035^0
GEMODMAS(FLAG) 
 
B 
BEG S ABEND=0,ICC=$$INIT^%VMOVMAS(%PI) G FIN:ICC=0
LOP S REFUSE=0,ESCMV="" I ICC=0 G BEG
ICCP1 D LOP3,NORM^%VVIDEO G ABEND:ABEND=1,LOP:ESCMV=1
 S ICC=$$^%VMOVMAS(ICC,67) G LOP
FIN Q
LOP3 S DEP=0,(%DX,DX)=^MASQUE(SCR,"DESCC",%PI,ICC,2),(%DY,DY)=^MASQUE(SCR,"DESCC",%PI,ICC,3) X XY S MOD=$$XY^%VVIDEO1(DX,DY),@%GLS@(%PG,%BP,"MOD",ICC)=""
 I $D(^MASQUE(SCR,"DESCC",%PI,ICC,"MODAFF")) S MODA=^MASQUE(SCR,"DESCC",%PI,ICC,"MODAFF") D @MODA W MOD
 S ^%FLDC($I)=$S($D(@%GLS@(%PG,%BP,"VAL",ICC)):@%GLS@(%PG,%BP,"VAL",ICC),1:"")
 D DIM,GET^%VLECFLD(^%FLDC($I),DX,DY,LXG,LXD,.CTRL,.Y1) Q:DEP=1  G CTRL:CTRL'=""
 D DEF^%VAFCHMA(ICC,Y1)
 S LL=$L(Y1),Y1=$S(Y1'="":Y1,$D(^MASQUE(SCR,"DESCC",%PI,ICC,5)):$$^%QZCHW(^MASQUE(SCR,"DESCC",%PI,ICC,5)),1:"")
 I $D(^MASQUE(SCR,"DESCC",%PI,ICC,5)) D ^%VAFCHMA(Y1):Y1=$$^%QZCHW(^MASQUE(SCR,"DESCC",%PG,ICC,5))
 W $J("",LL-$L(Y1))
 D VERIF G REFULOP:REFUSE>0 S STOPUC=0 I $D(^MASQUE(SCR,"DESCC",%PI,ICC,4)),^MASQUE(SCR,"DESCC",%PI,ICC,4)'="" F UYT=1:1 S UCONT=$P(^MASQUE(SCR,"DESCC",%PI,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC D @UCONT G REFULOP:REFUSE>0 Q:STOPUC=1
 Q
CTRL I $E(CTRL)="*" S XG3=$P(CTRL,"*",2) G ESCMV
CTRLR I CTRL="R" D ^%VAFIMAS(SCR,%PG,%TB),CONT^%VAFIMAS(SCR,%PG,%BP,%TB) G LOP3
 S ABEND=1 Q
ABEND S ABENDSCR=1 Q
ESCMV S ESCMV=1,ICC=$$^%VMOVMAS(ICC,XG3) Q
VERIF Q:'($D(^MASQUE(SCR,"DESCC",%PI,ICC,6)))  S NVLEG=^MASQUE(SCR,"DESCC",%PI,ICC,6) Q:NVLEG'>0
 F IV=1:1:NVLEG S VLEG=$$^%QZCHW(^%SCRE(SCR,ICC,6+IV)) G FVER:VLEG=Y1
 S REFUSE=1 Q
FVER Q
REFULOP I REFUSE=1 D ^%VAFCHMA("")
 G LOP
DIM S LXG=^MASQUE(SCR,"DESCC",%PI,ICC,"ESPACE"),LXD=$P(LXG,",",2),LXG=$P(LXG,",",1) Q
REV S MOD=MOD_$$REV^%VVIDEO1 Q
BLD S MOD=MOD_$$BLD^%VVIDEO1 Q
BLK S MOD=MOD_$$BLK^%VVIDEO1 Q
MOY S MOD=MOD_$$CAG^%VVIDEO1 Q
GRD S DXG=DX,DYH=IL,MSG=AFF,ECR=1 D BIG^%VVIDEO,NORM^%VVIDEO Q
UDL S MOD=MOD_$$UDL^%VVIDEO1 Q

