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

;TOSAISIM^INT^1^59547,74875^0
TOSAISIM ;
 
 K ^OABRES($I) D CLEPAG^%VVIDEO W $$^%QZCHW("Simulation de saisie du S-F de l'article : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S (YART,ARTI)=Y1 D TRAITM
 W !,!,?20,$$^%QZCHW("(R)econstitution"),!,?20,$$^%QZCHW("(V)erification"),!,!,?20,$$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'="R")&(REP'=$$^%QZCHW("V")) FIN S %CHOIX=REP
 W !,!,?20,$$^%QZCHW("Confirmer votre choix ("),%CHOIX,") : " R *REP S REP=$C(REP) G:REP'=%CHOIX TOSAISIM
BEG D SIMON^%VTOZE S %UCATT=0,%NARTI=-1
LBEG S %NARTI=$N(^TACOMPIL($I,%NARTI)) G:%NARTI=-1 FBEG S ARTI=^TACOMPIL($I,%NARTI) D DEB,INT^%QMDAK0,ZD^%QMDATE4 S SARTI="SIMUL/"_ARTI,^[QUI]TIMCOMP(SARTI,^SIMDAT($I))=^[QUI]TIMCOMP(SARTI,^SIMDAT($I))_" ^ "_HEURE G LBEG
FBEG D SIMOFF^%VTOZE Q
DEB S SARTI="SIMUL/"_ARTI K ^[QUI]TIMCOMP(SARTI),^SIMDAT($I) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]TIMCOMP(SARTI,%DAT)=HEURE,^SIMDAT($I)=%DAT D:%CHOIX="R" TOSAISK(.ARTI) S %ADR="TRAIT0^TOSAISIM"
RECABR K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPL",NCLE=3,%NOMTAB="^[QUI]IMPLICI(ARTI",SCR=$$^%QZCHW("IMPLICI"),NOMTAB="^[QUI]IMPLICI" D ^%VKGTENR
IMPMAT K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPMAT",NCLE=3,%NOMTAB="^[QUI]IMPMAT(ARTI",SCR="IMPMAT",NOMTAB="^[QUI]IMPMAT" D ^%VKGTENR
IMPMAC K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPMAC",NCLE=3,%NOMTAB="^[QUI]IMPMAC(ARTI",SCR="IMPMAC",NOMTAB="^[QUI]IMPMAC" D ^%VKGTENR
NOME K ^NONUC($I) S ^NONUC($I,3)=1,^NONUC($I,1)=1,^NONUC($I,2)=1,ETUD="NOME",NCLE=3,%NOMTAB="^[QUI]NOMENC(ARTI",SCR="NOMENC",NOMTAB="^[QUI]NOMENC" D ^%VKGTENR
PHAS K ^NONUC($I) F WA=21:1:28 S ^NONUC($I,WA)=1
 S ^NONUC($I,3)=1,ETUD="PHAS",%NOMTAB="^[QUI]PHASE(ARTI",SCR="PHASE",NOMTAB="^[QUI]PHASE" D ^%VKGTENR
OUTCO F WA=1:1:5 S ^NONUC($I,WA)=1
 S ^NONUC($I,22)=1,ETUD="OUTCO",%NOMTAB="^[QUI]OUTCONS(ARTI",SCR="OUTCONS",NOMTAB="^[QUI]OUTCONS" D ^%VKGTENR
DIMO K ^NONUC($I) F WA=1:1:6 S ^NONUC($I,WA)=1
 S ETUD="DIM",%NOMTAB="^[QUI]DIMOUT(ARTI",SCR="DIMOUT",NOMTAB="^[QUI]DIMOUT" D ^%VKGTENR
FORM K ^NONUC($I) F WA=1:1:5 S ^NONUC($I,WA)=1
 S ETUD="FORMULE",%NOMTAB="^[QUI]FORMULE(ARTI",SCR="FORMULE",NOMTAB="^[QUI]FORMULE" D ^%VKGTENR
MATIER K ^NONUC($I) S ^NONUC($I,1)=1,^NONUC($I,2)=1,ETUD=$$^%QZCHW("MATIERE"),%NOMTAB="^[QUI]MATIERE(ARTI",SCR=$$^%QZCHW("MATIERE"),NOMTAB="^[QUI]MATIERE" D ^%VKGTENR
SELMAT K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="SELMAT",%NOMTAB="^[QUI]SELMAT(ARTI",SCR="SELMAT",NOMTAB="^[QUI]SELMAT" D ^%VKGTENR
SELMAC K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="SELMAC",%NOMTAB="^[QUI]MACSEL(ARTI",SCR="MACSEL",NOMTAB="^[QUI]MACSEL" D ^%VKGTENR
ABAC K ^NONUC($I) F WA=1:1:3 S ^NONUC($I,WA)=1
 S ETUD="ABAC",%NOMTAB="^[QUI]ESSABAC(ARTI",SCR="ESSABAC",NOMTAB="^[QUI]ESSABAC" D ^%VKGTENR
TRIP S ETUD=$$^%QZCHW("TRIPLET") D ^TOSITRIP
FIN Q
TRAIT0 W "|" G:%CHOIX="R" TRAIT D ^%VTNAMFU G:%NFU="" FIN S TABFUL=%NFU_"("_$P(%1NOM,"(",2) G:$D(@TABFUL) FIN
TRAIT K FRESU,AFRESU S ABENDSCR=0 D ^TOSIMRES K @(%1NOM) D ^%VKAUST K AFRESU
 Q
UC S STOPUC=0,CMS=0 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" F UYT=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC,REFUSE=0 D @UCONT,REFULOP:REFUSE=1 Q:STOPUC=1
 Q
REFULOP D POCLEPA^%VVIDEO W " ****** CHAMP ",ICC," REFUSE ********" Q
TOSAISK(ARTI) 
 D ^TOSAISK Q
TRAITM N (QUI,ARTI) D CURRENT^%IS,VARSYS^%QCSAP K ^COMPILVU($I),^SAISIMU($I),^TACOMPIL($I) I ARTI'["*" S ^TACOMPIL($I,1)=ARTI G FIN2
 S %NARTI=1,ARTI=$P(ARTI,"*",1),YA=ARTI D ^TO3ARTHE S NOMTREE="^ARBTHEO($I,ARTI",ADR="TRAIT2^TOSAISIM" D ^%QCAGTU1
 G FIN2
TRAIT2 I '($D(^COMPILVU($I,@NOM))) S ^TACOMPIL($I,%NARTI)=@NOM,^COMPILVU($I,@NOM)=1,%NARTI=%NARTI+1
FIN2 Q

