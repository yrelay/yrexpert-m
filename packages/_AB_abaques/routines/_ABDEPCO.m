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

;%ABDEPCO^INT^1^59547,73864^0
%ABDEPCO ;
 
 K ^POSVAL($J) S %VV="^[QUW]STRUCT(NOMG,2,%D)" F %D="P","R" S DZC=-1 F WW=0:0 S DZC=$N(@%VV@(DZC)) Q:DZC=-1  S ^POSVAL($J,%D,DZC)=1
 S PLC=^PLUCOL($I),COL1=$P(PLC,"^",1),COL2=$P(PLC,"^",2),IDP1=$P(COL1,"/",1),IDX1=$P(COL1,"/",2),IDP2=$P(COL2,"/",1),IDX2=$P(COL2,"/",2)
 S %DNOM=$P(PLC,"^",3),%DNORM=$P(PLC,"^",4),%DIDEN=$P(PLC,"^",5),QUC=$S($P(PLC,"^",6)["C":^TABIDENT($I,"%UCI"),1:QUI)
 S DPDEB=$S(IDP1<IDP2:IDP1,1:IDP2),DPFIN=$S(DPDEB=IDP1:IDP2,1:IDP1),DXDEB=$S(DPDEB=IDP1:IDX1,1:IDX2),DXFIN=$S(DXDEB=IDX1:IDX2,1:IDX1),COLC=($X-9)\(ESPC+1),XCOUR=((ESPC+1)*COLC)+10,XDUPC=DXDEB,XLIM=((ESPC+1)*NBC)+9,DPCOUR=DPDEB-1,YCOUR=-1
LOODP S DPCOUR=$N(^[QUC]OCGRIL(%DNOM,%DNORM,DPCOUR)) G:DPCOUR=-1 FIN G:DPCOUR>DPFIN FIN
 S YCOUR=-1
LOOPY F %VV="P","R" S YCOUR=-1 F WW=0:0 S YCOUR=$N(^[QUC]OCGRIL(%DNOM,%DNORM,DPCOUR,%VV,YCOUR)) Q:YCOUR=-1  D ECRI
 G:(DPCOUR=DPFIN)&(XDUPC=DXFIN) FIN S XCOUR=(XCOUR+ESPC)+1,XDUPC=(XDUPC+ESPC)+1
 I XCOUR>XLIM D 43 S XCOUR=10
 I XDUPC>XLIM G:DPCOUR=DPFIN FIN S XDUPC=10 G LOODP
 G LOOPY
ECRI Q:'($D(^[QUW]OCGRIL(NOMG,%NORM,DPCOUR,%VV,YCOUR,XDUPC)))
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR))),$D(^POSVAL($J,%VV,YCOUR)) S ^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR)=^[QUC]OCGRIL(%DNOM,%DNORM,DPCOUR,%VV,YCOUR,XDUPC)
 S DX=XCOUR,DY=YCOUR-$S(%VV="P":%DH,1:%DB)
 I %VV="P",(DY<PSEP)&(DY>3) X XY W:$D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR)) ^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR) S DXC=DX,DYC=DY G END
 I %VV="R",(DY<21)&(DY>PSEP) X XY W:$D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR)) ^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YCOUR,XCOUR) S DXC=DX,DYC=DY G END
END Q
FIN S PX=XCOUR D ^%ABMJDPX Q
 G LOOPY
43 D MORE^%ABCALDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG,AFFICH^%ABGRPAG S DX=10,DY=4 X XY Q

