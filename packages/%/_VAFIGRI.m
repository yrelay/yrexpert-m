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
;! HL002 ! HL     ! 01/07/12 ! PB caratères parasites terminal-gnome (^%SCREC)!
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VAFIGRI^INT^1^59547,74033^0
GEAFIRGI ;
 
 
 N ICC,XDTM,LXDTM
BEG S XDTM=$S(DTM:"X ",1:"W ")
 ;HL002 S PL=$S($D(^%SCRE(SCR,"POLICE")):^%SCRE(SCR,"POLICE"),1:80) D LIM(SCR) G:$D(^%SCREC(SCR)) NAFF
 S PL=$S($D(^%SCRE(SCR,"POLICE")):^%SCRE(SCR,"POLICE"),1:80) D LIM(SCR)
BEGS D @(PL_"^%VVIDEO"),CUROF^%VVIDEO,^%VATYPA,^%VEFFSCR(%LIXG+1,%LIYH+1,%LIXD-1,%LIYB-1)
LOOP S %IRG="^%SCRE" S:'($D(@%IRG@(SCR))) %IRG="^[QU]SCRC" I '($D(@%IRG@(SCR))) G FIN
 ;HL003 S SCR2=SCR,LXDTM="W $$^%QZCHW(@%IRG@(SCR,ICC,1))" F ICC=1:1:@%IRG@(SCR) S MOD=0,DX=@%IRG@(SCR,ICC,2),DY=@%IRG@(SCR,ICC,3) D XY D:$D(^%SCRE(SCR,ICC,"MODAFF")) MOD X:'($D(^%SCRE(SCR,ICC,"INVISIBLE"))) LXDTM D:MOD'=0 NORM
 S SCR2=SCR,LXDTM="W $$^%QZCHW(@%IRG@(SCR,ICC,1))" F ICC=1:1:@%IRG@(SCR) S MOD=0,DX=@%IRG@(SCR,ICC,2),DY=@%IRG@(SCR,ICC,3) D XY D:$D(^%SCRE(SCR,ICC,"MODAFF")) MOD X:'($D(^%SCRE(SCR,ICC,"INVISIBLE"))) XY,LXDTM D:MOD'=0 NORM
 S (SCR2,SCR1)=SCR_",COMMENT" I $D(@%IRG@(SCR1)) F ICC=1:1:@%IRG@(SCR1) S C=@%IRG@(SCR1,ICC,1),DX=@%IRG@(SCR1,ICC,2),DY=@%IRG@(SCR1,ICC,3) D XY,W
 D CURON^%VVIDEO K SCR2,%IRG Q
MOD S MOD=^%SCRE(SCR2,ICC,"MODAFF") D @MOD Q
XY 
 I DTM W /C(DX,DY) S $X=DX,$Y=DY Q
 S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY
FIN Q
LIM(SC) 
 S PS=$S($D(^%SCRE(SC,"POSITION")):^%SCRE(SC,"POSITION"),1:"-1,-1,80,24"),%LIXG=$P(PS,",",1),%LIYH=$P(PS,",",2),%LIXD=$P(PS,",",3),%LIYB=$P(PS,",",4)
 D:MODTM CONTLIM^%VCMS
 Q
W S ECR=0,MOD=0,IL=DY,AFF=^%SCRE(SCR1,ICC,1) D:$D(^%SCRE(SCR1,ICC,"MODAFF")) MOD I $E(AFF,1)="~" D W1 D:MOD'=0 NORM Q
 ;HL003 W:'(ECR) $$^%QZCHW(AFF) D:MOD'=0 NORM Q
 X XY W:'(ECR) $$^%QZCHW(AFF) D:MOD'=0 NORM Q
W1 S D=$P(AFF,"~",2) G @D
L S TL=$P(AFF,"~",3),@("L"_TL)=$P(AFF,"~",4),DXG=DX,DYH=DY D @("TR"_TL_"^%VVIDEO") Q
K S DXG=DX,DYH=DY,LH=$P(AFF,"~",3),LV=$P(AFF,"~",4) D CARS^%VVIDEO Q
KL S %U1=3 F IT="DXG","DXD","DYH","DYB","BLD" S @IT=$P(AFF,"~",%U1),%U1=%U1+1
 S:BLD="" BLD=0 D CARL^%VVIDEO Q
KSP S TGR="^%SCRE(SCR1,ICC,4)" D FIG^%VVIDEO Q
NORM D NORM^%VVIDEO,XY Q
REV D REV^%VVIDEO,XY Q
BLD D BLD^%VVIDEO,XY Q
BLK D BLK^%VVIDEO,XY Q
MOY D CAG^%VVIDEO,XY Q
GRD S DXG=DX,DYH=IL,MSG=AFF,ECR=1 D BIG^%VVIDEO,NORM^%VVIDEO Q
UDL D UDL^%VVIDEO,XY Q
NAFF O $I S DX=0,DY=0,LXDTM=XDTM_"^%SCREC(SCR,""EFF"",%V)" X XY S %V="" F %U=1:1 S %V=$O(^%SCREC(SCR,"EFF",%V)) Q:%V=""  S $X=250 X LXDTM
 
 S DX=0,DY=0,LXDTM=XDTM_"^%SCREC(SCR,%U)",%V=^%SCREC(SCR) F %U=1:1:%V S $X=250 X LXDTM
 Q
ADR(SCR) G BEG

