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

;%ABOCGRI^INT^1^59547,73864^0
%ABOCGRI ;
 
 D MAJTAB S:'($D(%NUGR)) %NUGR=0 K ^[QUW]PARINGR(%NUGR,DP,PY,PX),^[QUW]GRCOND(%NUGR,DP,PY,PX),^PARCHGR($I) S REFUSE=0,RESUCONT=C S:C="" PX=$X,PY=$Y S %V=$S(PY<PSEP:"P",1:"R"),%PY=PY,PY=PY+$S(%V="P":%DH,1:%DB) D AFF S PY=%PY G FIN
AFF I (C=$$^%QZCHW("SINON"))!((C=$$^%QZCHW("TOUS"))!(C=$$^%QZCHW("TOUTES"))) G SUIT
 I C="?" D ^%ABLISEV S DX=PX,DY=PY,REFUSE=1 X XY W CNULI X XY G FIN
 I C["""" G IDEM
 
 I $D(^[QU]STRUCT(NOMG,2,%V,PY,4)),^[QU]STRUCT(NOMG,2,%V,PY,4)=$$^%QZCHW("O") G VCONT
SSS I $D(^[QU]STRUCT(NOMG,2,%V,PY,1)) D @^[QU]STRUCT(NOMG,2,%V,PY,1) G:REFUSE=1 REFUS
 
 I RESUCONT="",$D(^[QU]STRUCT(NOMG,2,%V,PY,2)) S (RESUCONT,C)=^[QU]STRUCT(NOMG,2,%V,PY,2)
 D ^%ABVERVA D:REFUSE=1 CONF G:REFUSE=1 REFUS S MRES=RESUCONT D REFUS S RESUCONT=MRES D ^%ABAFUCO
SUIT G:RESUCONT="" FIN S PCH=RESUCONT D TO^%QZNBN1 S LLEX=1
 
 
 
 
 I RESUCONT'="" S ^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,PX)=RESUCONT D ^%ABMJDPX S PAR=-1
 G FIN
RMAJ F ZZ=1:1 S PAR=$N(^PARCHGR($I,PAR)) Q:PAR=-1  S PARA=^PARCHGR($I,PAR) I '($D(^[QUW]PARINGR(%NUGR,DP,PY,PX,PARA))) S ^[QUW]PARINGR(%NUGR,DP,PY,PX,PARA)=1,^[QUW]PARGRPLU(%NUGR,PARA)=$S($D(^[QUW]PARGRPLU(%NUGR,PARA)):^[QUW]PARGRPLU(%NUGR,PARA)+1,1:1)
FIN Q
REFUS S RESUCONT=$S(PY'>PSEP:CNULS,1:CNULI) D ^%ABAFUCO X XY G FIN
CONF D POCLEPA^%VVIDEO W $$^%QZCHW("Valeur refusee ! Reecrivez la pour confirmer") S DX=$X+1 D ^%VLEC
 I Y1=C S ^[QU]STRUCT(NOMG,2,%V,PY,3,Y1)=1,REFUSE=0,MRES=RESUCONT D REFUS S RESUCONT=MRES
 D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide Memoire") D AFFICH^%ABGRPAG G FIN
 
 
VCONT S CGET=C,CROC1=$E(CGET,1),CROC2=$E(CGET,$L(CGET))
 I (CROC1="[")!(CROC1="]") S C=$E(CGET,2,$L(CGET))
 I (CROC2="[")!(CROC2="]") S C=$E(C,1,$L(C)-1)
 S CSCROC=C,C=$S(C[",":$P(C,",",2),1:C)
 
 I (CROC1'="[")&(CROC1'="]") S CROC1="["
 I (CROC2'="[")&(CROC2'="]") S CROC2="]"
 S COLC=($X-9)\(ESPC+1)
 I (COLC'=0)!(DP'=1) G VCS
 I CSCROC["," S CG=$P(CSCROC,",",1),CD=$P(CSCROC,",",2) G:CG="" ALOR S RESUCONT=CROC1_CG_","_CD_CROC2 D ^%ABAFUCO G SUIT
ALOR S RESUCONT="==> ,"_C_CROC2 D ^%ABAFUCO G SUIT
VCS G:CSCROC'["," ALOR I $P(CSCROC,",",1)'="" S RESUCONT=CROC1_CSCROC_CROC2 D ^%ABAFUCO G SUIT
 I (COLC=0)&(DP'=1) S ODP=DP-NBC,ODX=((ESPC+1)*(NBC-1))+10 G:'($D(^[QUW]OCGRIL(NOMG,%NORM,ODP,%V,PY,ODX))) REFUS D REFUS S ONUD=^[QUW]OCGRIL(NOMG,%NORM,ODP,%V,PY,ODX),RESUCONT=CROC1_$E($P(ONUD,",",2),1,$L($P(ONUD,",",2))-1)_","_C_CROC2 D ^%ABAFUCO G SUIT
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,PX-(ESPC+1)))) G REFUS
 S ODX=PX-(ESPC+1),ONUD=^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,ODX),RESUCONT=CROC1_$E($P(ONUD,",",2),1,$L($P(ONUD,",",2))-1)_","_C_CROC2 D ^%ABAFUCO G SUIT
IDEM S COLC=($X-9)\(ESPC+1)
 I (COLC=0)&(DP=1) G REFUS
 I (COLC=0)&(DP'=1) S ODP=DP-NBC,ODX=((ESPC+1)*(NBC-1))+10 G:'($D(^[QUW]OCGRIL(NOMG,%NORM,ODP,%V,PY,ODX))) REFUS D REFUS S RESUCONT=^[QUW]OCGRIL(NOMG,%NORM,ODP,%V,PY,ODX) D ^%ABAFUCO G SUIT
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,(PX-ESPC)-1))) G REFUS
 D REFUS S ODX=(PX-ESPC)-1,RESUCONT=^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,ODX) D ^%ABAFUCO G SUIT
MAJTAB 
 Q

