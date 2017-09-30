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

;TOINVMAC^INT^1^59547,74872^0
TOINVMAC ;
 
MATSTOCK S CPT=0,(YY,SFMAT)=ARTI,LSFMAT=$L(SFMAT),AN=$C($A($E(SFMAT,LSFMAT))-1),MATINI=$E(SFMAT,1,LSFMAT-1)_AN_"z",(MSS,MATAS)=MATINI
LMC S MSS=$N(^[QUI]DESMACH(MSS)) G:MSS=-1 END S FMS=-1
LSF S FMS=$N(^[QUI]DESMACH(MSS,FMS)) G:FMS=SFMAT SUIT G:FMS=-1 LMC G LSF
SUIT S CPTS=$S($D(^[QUI]FULL(ARTI)):2,1:0),^[QUI]CARDINAL(ART,"MAC",ARTI,"EXPLICI.SYS")=2
 S NUM=-1 F UI=0:0 S NUM=$N(^[QUI]PEXPMACH(MSS,NUM)) Q:NUM=-1  D GET
 S ^[QUI]CARDINAL(ART,"MAC",ARTI,"EXPLICI")=CPT G SUI2
GET S %NOM="^[QUI]PEXPMACH(MSS,NUM)" I $D(@%NOM)=10 D ^%VKMULNG G SUI
 S RS=@%NOM D ^%VKMULC
SUI K RRS S III=-1 F %GG=1:1 S III=$N(%RS(III)) Q:III=-1  S RRS(III)=%RS(III)
 K %RS F III=1:3:22 I $D(RRS(III)),RRS(III)'="" S CPT=CPT+1
 Q
SUI2 S ^PARAM($I,"IMPL")=0,NOMTREE="^[QUI]IMPMAC(ARTI",%TAD="CPT^TOINVMAC,IMPL^TOINVMAC",CPT=0 D ^%QCAGTU5 S CPTI=^PARAM($I,"IMPL")
 S RTOT=RTOT+CPT,^[QUI]CARDINAL(ART,"MAC",ARTI,"R.IMPLICI")=CPT,^[QUI]CARDINAL(ART,"MAC",ARTI,"IMPLICI.DIR")=^PARAM($I,"IMPL"),CPT=0,PI=-1
 F %U=1:1 S PI=$N(^[QUI]EXPL(ARTI,PI)) Q:PI=-1  I ^[QUI]EXPL(ARTI,PI)="ABAC" D CPT S ^PARAM($I,"IMPL",PI)=1,^PARAM($I,"PARA",PI)=1
 S CPTI=CPTI+CPT,^[QUI]CARDINAL(ART,"MAC",ARTI,"IMPLICI.ABAC")=CPT,CPT=0,PI=-1 F %U=1:1 S PI=$N(^[QUI]FULL(ARTI,PI)) Q:PI=-1  I (PI'["$ARG")&((PI'["%ARG")&((PI'["%VAL")&('($D(^PARAM($I,"PARA",PI)))))) S CPT=CPT+1
 S ^[QUI]CARDINAL(ART,"MAC",ARTI,"IMPLICI.ASS")=CPT-CPTS,CPTI=(CPTI+CPT)-CPTS,^[QUI]CARDINAL(ART,"MAC",ARTI,"IMPLICI")=CPTI,CPT=0,ARL=-1
 F %U=1:1 S ARL=$N(^[QUI]REFLATER(ARTI,ARL)) Q:ARL=-1  I ARL'=ARTI S PI=-1 F %V=1:1 S PI=$N(^[QUI]REFLATER(ARTI,ARL,PI)) Q:PI=-1  I (PI'["$ARG")&((PI'="%ARG")&(PI'["%VAL")) S CPT=CPT+1
 S ^[QUI]CARDINAL(ART,"MAC",ARTI,"REF.LATER")=CPT,COL="^[QUI]CARDINAL(ART,""MAC"",""ABAC"")" D ^TOINVABA
END K LSFMAT,%NOM,A,AN,SFMAT,MATAS,MATINI,MSS,FMS,RS,%GG,%FF,NF,III,PRX,RRS,%CP,%TYPEX Q
IMPL S PI=$P(%TREFC,"""",2) I '($D(^PARAM($I,"IMPL",PI))) S ^PARAM($I,"IMPL")=^PARAM($I,"IMPL")+1
 S ^PARAM($I,"PARA",PI)=1,^PARAM($I,"IMPL",PI)=1 Q
CPT S CPT=CPT+1 Q

