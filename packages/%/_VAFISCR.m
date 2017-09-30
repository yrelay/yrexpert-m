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

;%VAFISCR^INT^1^59547,74034^0
GEAFISCR ;
 
 
 N ICC G:$D(^%SCREC(SCR,"RES")) ^%VAFISCQ
LOOP D CUROF^%VVIDEO,BLD^%VVIDEO S %IGR="^%SCRE" S:'($D(@%IGR@(SCR))) %IGR="^[QU]SCRC" G:'($D(@%IGR@(SCR))) FIN
 F ICC=1:1 Q:'($D(@%IGR@(SCR,ICC)))  S DX=$L($$^%QZCHW(@%IGR@(SCR,ICC,1)))+@%IGR@(SCR,ICC,2),DY=@%IGR@(SCR,ICC,3) I $D(RESUL(ICC)) D XY S MOD=0 D:$D(^%SCRE(SCR,ICC,"MODAFF")) MOD D:'($D(^%SCRE(SCR,ICC,"INVISIBLE"))) ECR(ICC,DX,DY) D:MOD'=0 NORM
 D NORM^%VVIDEO,CURON^%VVIDEO Q
ECR(IK,XCP,YCP) 
 G:RESUL(IK)="" FIN I $D(^%SCRE(SCR,IK,"ESPACE")) S LXG=^%SCRE(SCR,IK,"ESPACE"),LXD=$P(LXG,",",2),LXG=$P(LXG,",",1) G SUIT
 S LXG=%LIXG,LXD=%LIXD
SUIT D ^%VCRIFLD(RESUL(IK),XCP,YCP,LXG,LXD)
FIN Q
XY 
 X XY Q
 S $X=250 W *27,*91,DY+1,*59,DX+1,*72 S $X=DX,$Y=DY G FIN
NORM D NORM^%VVIDEO Q
MOD S MOD=^%SCRE(SCR,ICC,"MODAFF") D @MOD Q
REV D REV^%VVIDEO,XY Q
BLD D BLD^%VVIDEO,XY Q
BLK D BLK^%VVIDEO,XY Q
MOY D CAG^%VVIDEO,XY Q
GRD S DXG=DX,DYH=IL,MSG=AFF,ECR=1 D BIG^%VVIDEO,NORM^%VVIDEO Q
UDL D BLD^%VVIDEO,XY Q

