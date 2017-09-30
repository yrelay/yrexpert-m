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

;%VCHOSCR^INT^1^59547,74034^0
GECHOSCR ;
0 K ^GRC($J) S %V=^%SCRE(SCR) F %U=1:1:%V S LI=$S($D(RESUL(%U)):$L(RESUL(%U)),1:0),XC=^%SCRE(SCR,%U,2)+$L($$^%QZCHW(^%SCRE(SCR,%U,1))),YC=^%SCRE(SCR,%U,3),^GRC($J,%U)=LI_"^"_XC_"^"_YC
 G FIN
1 K ^GRC($J) S %V=^%SCRE(SCR) F %U=1:1:%V S LI=$L(RESUL(%U)),XC=^%SCRE(SCR,%U,2)+$L($$^%QZCHW(^%SCRE(SCR,%U,1))),YC=^%SCRE(SCR,%U,3),^GRC($J,%U)=LI_"^"_XC_"^"_YC
 G FIN
DECH D CUROF^%VVIDEO S %CHC="" F %V=1:1 S %CHC=$O(^GRC($J,%CHC)) Q:%CHC=""  S %W=^GRC($J,%CHC),LI=$P(%W,"^",1),XCP=$P(%W,"^",2),YCP=$P(%W,"^",3) D ECR(%CHC)
 D CURON^%VVIDEO G FIN
ECR(IK) 
 I $D(^%SCRE(SCR,IK,"ESPACE")) S LXG=^%SCRE(SCR,IK,"ESPACE"),LXD=$P(LXG,",",2),LXG=$P(LXG,",",1) G SUIT
 S LXG=%LIXG,LXD=%LIXD
SUIT D ^%VCRIFLD($J("",LI),XCP,YCP,LXG,LXD) Q
FIN K XC,YC,LXG,LXD,%W,%CHC Q

