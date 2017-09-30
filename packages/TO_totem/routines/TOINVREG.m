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

;TOINVREG^INT^1^59547,74872^0
TOINVREG ;
 
 S ART=-1,TIT=$$^%QZCHW("Inventaire du Savoir-Faire") D ^TOGETAR2 G:'($D(^COMPILVU($I))) FIN
LART S ART=$N(^COMPILVU($I,ART)) G:ART=-1 FIN G:'($D(^[QUI]FULL(ART))) LART
 K ^ABAC($I),^[QUI]CARDINAL(ART),^PARAM($I) S CPT=0,RTOT=0,NOMTREE="^[QUI]EXPLICI(ART",%TAD="CPT^TOINVREG,EXP^TOINVREG" D ^%QCAGTU5 S ^[QUI]CARDINAL(ART,"EXPLICI")=CPT,CPTS=7,^[QUI]CARDINAL(ART,"EXPLICI.SYS")=CPTS
 S ^PARAM($I,"IMPL")=0,NOMTREE="^[QUI]IMPLICI(ART",%TAD="CPT^TOINVREG,IMPL^TOINVREG",CPT=0 D ^%QCAGTU5 S CPTI=^PARAM($I,"IMPL")
 S ^[QUI]CARDINAL(ART,"R.IMPLICI")=CPT,RTOT=RTOT+CPT,^[QUI]CARDINAL(ART,"IMPLICI.DIR")=^PARAM($I,"IMPL"),CPT=0,PI=-1 F %U=1:1 S PI=$N(^[QUI]EXPL(ART,PI)) Q:PI=-1  I ^[QUI]EXPL(ART,PI)="ABAC" D CPT S ^PARAM($I,"IMPL",PI)=1,^PARAM($I,"PARA",PI)=1
 S CPTI=CPTI+CPT,^[QUI]CARDINAL(ART,"IMPLICI.ABAC")=CPT,CPT=0,PI=-1 F %U=1:1 S PI=$N(^[QUI]FULL(ART,PI)) Q:PI=-1  I (PI'["$ARG")&((PI'["%ARG")&((PI'["%VAL")&('($D(^PARAM($I,"PARA",PI)))))) S CPT=CPT+1
 S RTOT=(RTOT+CPT)-CPTS,^[QUI]CARDINAL(ART,"IMPLICI.ASS")=CPT-CPTS,CPTI=(CPTI+CPT)-CPTS,^[QUI]CARDINAL(ART,"IMPLICI")=CPTI,CPT=0,ARL=-1
 F %U=1:1 S ARL=$N(^[QUI]REFLATER(ART,ARL)) Q:ARL=-1  I ARL'=ART S PI=-1 F %V=1:1 S PI=$N(^[QUI]REFLATER(ART,ARL,PI)) Q:PI=-1  I (PI'["$ARG")&((PI'="%ARG")&(PI'["%VAL")) S CPT=CPT+1
 S ^[QUI]CARDINAL(ART,"REF.LATER")=CPT,TAB=$P($T(TAB),";;",2) F %U=1:1 S IT=$P(TAB,"/",%U) Q:IT=""  S NOMTREE="^[QUI]"_IT_"(ART",%TAD="CPT^TOINVREG",CPT=0 D ^%QCAGTU5 S ^[QUI]CARDINAL(ART,"R."_IT)=CPT,RTOT=RTOT+CPT
 S TAB=$P($T(TAB2),";;",2) F %U=1:1 S IT=$P(TAB,"/",%U) Q:IT=""  S TB=$P(IT,":",1),TBI=$P(IT,":",2),TBI="^"_TBI_"($I)" K @(TBI) S NOMTREE="^[QUI]"_TB_"(ART",%TAD="CPT^TOINVREG,MCT^TOINVREG",CPT=0 D ^%QCAGTU5 S ^[QUI]CARDINAL(ART,"R."_TB)=CPT
TAB ;;PHASE/FORMULE/NOMENC/OUTCONS/DIMOUT/MATIERE/COMPARAT
TAB2 ;;SELMAT:IMAT/MACSEL:IMAC
TAB3 ;;IMAT:MATSTOCK/IMAC:DESMACH
 S PI=-1,CPT=0 F %U=1:1 S PI=$N(^[QUI]NOMENC(ART,PI)) Q:PI=-1  S CPT=CPT+1
 S ^[QUI]CARDINAL(ART,"COMPOSANT")=CPT
 S TAB=$P($T(TAB3),";;",2) F %U=1:1 S IT=$P(TAB,"/",%U) Q:IT=""  S TB="^[QUI]"_$P(IT,":",2),TBI="^"_$P(IT,":",1)_"($I)",CPT=0,PI=-1 F %V=1:1 S PI=$N(@TBI@("SFAM",PI)) D:PI=-1 AFF Q:PI=-1  D ETUP
 S ARTI=-1 F %U=1:1 S ARTI=$N(^IMAT($I,"FAM",ARTI)) Q:ARTI=-1  D ^TOINVMAT
 S ARTI=-1 F %U=1:1 S ARTI=$N(^IMAC($I,"FAM",ARTI)) Q:ARTI=-1  D ^TOINVMAC
 S COL="^[QUI]CARDINAL(ART,""ABAC"")",ARTI=ART D ^TOINVABA S ^[QUI]CARDINAL(ART,"TOTAL.REGLE")=RTOT
 G LART
AFF S PI1=$S(TB["MACH":$$^%QZCHW("MACHINE"),1:$$^%QZCHW("MATIERE"))_".POS",^[QUI]CARDINAL(ART,PI1)=CPT Q
ETUP S PI1=$E(PI,1,$L(PI)-1)_$C($A($E(PI,$L(PI)))-1)_"z" F %W=1:1 S PI1=$N(@TB@(PI1)) Q:PI1=-1  Q:$E(PI1,1,$L(PI))'=PI  S CPT=CPT+1
 Q
MCT S FAM=$P(%TREFC,"""",2),SFAM=$P(%TREFC,"""",4),@TBI@("FAM",FAM)=1,@TBI@("SFAM",SFAM)=1 Q
CPT S CPT=CPT+1 Q
EXP S ^PARAM($I,"PARA",%1C)=1,^PARAM($I,"EXPL",%1C)=1 Q
IMPL S PI=$P(%TREFC,"""",2) I '($D(^PARAM($I,"IMPL",PI))) S ^PARAM($I,"IMPL")=^PARAM($I,"IMPL")+1
 S ^PARAM($I,"PARA",PI)=1,^PARAM($I,"IMPL",PI)=1 Q
FIN K ^PARAM($I),^IMAT($I),^IMAC($I),^ABAC($I) Q

