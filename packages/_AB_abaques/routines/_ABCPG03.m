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

;%ABCPG03^INT^1^59547,73864^0
%ABCPG03 ;
TRAIT S AVORT=0,PARA=^[QUW]STRUCT(NOMG,2,%VV,LIG),PCH=PARA I $D(^[QUW]STRUCT(NOMG,2,%VV,LIG,"FULL")) S (PARA,PCHCOMP)=^[QUW]STRUCT(NOMG,2,%VV,LIG,"FULL") G WAA
 D ^%LXABR G:CONCUR'=1 AVORT
 S PARA=$S($D(^[QUW]TOSYNONY(PCHCOMP)):$N(^[QUW]TOSYNONY(PCHCOMP,-1)),1:PCHCOMP),^[QUW]STRUCT(NOMG,2,%VV,LIG,"FULL")=PARA
WAA S ^LIGSCRC($I,%VV,LIG,"P")=PARA I %VV="R" G WQQ
 S NBPAR=NBPAR+1,^[QUW]PARAGRIL(NUGR,PARA)=^LIGSCRC($I,%VV,LIG),^LIGPARA($I,%VV,LIG)=PARA,^[QUW]EVALGRIL(NUGR,EVAL)=PARA,EVAL=EVAL+1
 S ^[QUW]PARAGRIL(NUGR,PARA,"ECR")=$S($D(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG)):$P(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG),"/",1),1:"")
 S ^[QUW]PARAGRIL(NUGR,PARA,"EXP")=$S($D(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG)):$P(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG),"/",2),1:"") G WQR
WQQ S ^[QUW]RESUGRIL(NUGR,LIG)=PARA,^[QUW]GRILRESU(NUGR,PARA)=LIG,^[QUW]GRILRESU(NUGR,PARA,"ECR")=$S($D(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG)):$P(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG),"/",1),1:"")
 S ^[QUW]GRILRESU(NUGR,PARA,"EXP")=$S($D(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG)):$P(^[QUW]OCUNIT(NOMG,NORM,IDENT,%VV,LIG),"/",2),1:"")
WQR Q
AVORT D ^%VSQUEAK S AVORT=1 W !,$$^%QZCHW("Comprehension avortee ! "),PARA,$S(CONCUR=0:$$^%QZCHW(" est inconnu"),1:$$^%QZCHW(" est ambigu")) S ^[QUW]GRILEROR(NOMG,NORM,IDENT,PARA)=$S(CONCUR=0:$$^%QZCHW("Inconnu"),1:$$^%QZCHW("Ambigu")) Q

