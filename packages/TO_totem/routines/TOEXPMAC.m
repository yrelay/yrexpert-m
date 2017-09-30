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

;TOEXPMAC^INT^1^59547,74872^0
TOEXPMAC ;
 
MATSTOCK S NPAR=1,(YY,SFMAT)=ARTI,LSFMAT=$L(SFMAT),AN=$C($A($E(SFMAT,LSFMAT))-1),MATINI=$E(SFMAT,1,LSFMAT-1)_AN_"z",(MSS,MATAS)=MATINI
LMC S MSS=$N(^[QUI]DESMACH(MSS)) G:MSS=-1 FIN S FMS=-1
LSF S FMS=$N(^[QUI]DESMACH(MSS,FMS)) G:FMS=SFMAT SUIT G:FMS=-1 LMC G LSF
SUIT S ^[QUI]EXPL(ARTI,$$^%QZCHW("TAUX.HORAIRE"))=1,^[QUI]EXPL(ARTI,$$^%QZCHW("%MACHINE"))=1,^[QUI]FULL(ARTI,$$^%QZCHW("%MACHINE"))=1,^[QUI]FULL(ARTI,$$^%QZCHW("TAUX.HORAIRE"))=1,NPAR=NPAR+1,^[QUI]EXPL(ARTI,$$^%QZCHW("ARTICLE"))=NPAR,^[QUI]FULL(ARTI,$$^%QZCHW("ARTICLE"))=NPAR,NPAR=NPAR+1
 S NUM=-1 F UI=0:0 S NUM=$N(^[QUI]PEXPMACH(MSS,NUM)) Q:NUM=-1  D GET
 G FIN
GET S %NOM="^[QUI]PEXPMACH(MSS,NUM)" I $D(@%NOM)=10 D ^%VKMULNG G SUI
 S RS=@%NOM D ^%VKMULC
SUI K RRS S III=-1 F %GG=1:1 S III=$N(%RS(III)) Q:III=-1  S RRS(III)=%RS(III)
 K %RS F III=1:3:22 I $D(RRS(III)),RRS(III)'="" S PRX=RRS(III),^[QUI]EXPL(ARTI,RRS(III))=NPAR D GUNITE,^%ABBUILT S NPAR=NPAR+1 I $D(^[QUI]EXPGIMP(RRS(III))) S %CP=RRS(III),%TYEXP="%%" D ^%AB3GPSY
 Q
FIN K LSFMAT,RRS,%NOM,A,AN,SFMAT,MATAS,MATINI,MSS,FMS,RS,%GG,UI,%FF,NF,III,PRX,%CP,%TYPEX Q
GUNITE S ^[QUI]UNITE(SFMAT,RRS(III))=RRS(III+2) Q
 Q
TRTYP S AFF=0,SIGN="="
TRTYP1 
 
 I TYPNORM="" S TYPNORM=$$^%QZCHW("SANS")
 I TYPNORM["=" S SIGN=$S(TYPNORM["'=":"'=",1:"="),%NORM=$P(TYPNORM,SIGN,2),TYPNORM=$P(TYPNORM,SIGN,1) S:%NORM="" TYPNORM=$$^%QZCHW("SANS")
 I (TYPNORM=$$^%QZCHW("SANS"))!((TYPNORM=$$^%QZCHW("TOUTES"))!(TYPNORM=$$^%QZCHW("TOUTE"))) S AFF=1,NORM=0 G END
 I ('($D(^[QUI]FLIMPLI(ARTI,TYPNORM))))&('($D(^[QUI]EXPL(ARTI,TYPNORM)))) G END
 S AFF=1
 S NORM=1 G END
GETASS I '($D(^[QUI]EXPGIMP(RAB))) G END
 S %CP=RAB,%TYEXP="ABAC" D ^%AB3GPSY G END
UNIT S LIG=-1 F RR=0:0 S LIG=$N(^[QUW]RESUGRIL(NUGR,LIG)) Q:LIG=-1  S RAB=^[QUW]RESUGRIL(NUGR,LIG) D UNITZ
 G END
UNITZ I $D(^[QUW]GRILRESU(NUGR,RAB,"EXP")) S ^[QUI]UNITEXP(ARTI,RAB,NUGR)=^[QUW]GRILRESU(NUGR,RAB,"EXP")
 I $D(^[QUW]GRILRESU(NUGR,RAB,"ECR")) S ^[QUI]UNITECR(ARTI,RAB,NUGR)=^[QUW]GRILRESU(NUGR,RAB,"ECR")
 Q
 Q
UNITEP S QUW=$S(TYP="C":QUCOM,1:QUI),PARA=-1 F %WW=1:1 S PARA=$N(^[QUW]PARAGRIL(NUGR,PARA)) Q:PARA=-1  D UNITE2
 G END
UNITE2 I $D(^[QUW]PARAGRIL(NUGR,PARA,"ECR")) S ^[QUI]UNITECR(ARTI,PARA,NUGR)=^[QUW]PARAGRIL(NUGR,PARA,"ECR")
 
 I $D(^[QUW]PARAGRIL(NUGR,PARA,"EXP")) S ^[QUI]UNITEXP(ARTI,PARA,NUGR)=^[QUW]PARAGRIL(NUGR,PARA,"EXP")
 G END

