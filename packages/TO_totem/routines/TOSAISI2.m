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

;TOSAISI2^INT^1^59547,74875^0
TOSAISI2 ;
 
 K ^OABRES($I) D CLEPAG^%VVIDEO S TIT=$$^%QZCHW("Simulation de saisie du S-F de : ") D ^TOGETART G:'($D(^TACOMPIL($I))) FIN
 W !,!,?20,$$^%QZCHW("(R)econstitution"),!,?20,$$^%QZCHW("(V)erification"),!,!,?20,$$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'="R")&(REP'=$$^%QZCHW("V")) FIN S %CHOIX=REP
 W !,!,?20,$$^%QZCHW("Confirmer votre choix ("),%CHOIX,") : " R *REP S REP=$C(REP) G:REP'=%CHOIX TOSAISI2 K ^TBSAIS($I)
 S N=1 F IT=$$^%QZCHW("IMPLICI"),"IMPLICI MATIERE","COMPOSANT","PHASE","CONSIGNE","FORMULE",$$^%QZCHW("MATIERE"),"SELECTION MATIERE","SELECTION MACHINE","SAISIE MULTIPLE",$$^%QZCHW("TRIPLET"),"IMPLICI MACHINE",$$^%QZCHW("DIMENSIONS A L'OUTIL") S ^TBSAIS($I,N)=IT,N=N+1
 D CLEPAG^%VVIDEO W ! S N=-1 F UU=1:1 S N=$N(^TBSAIS($I,N)) Q:N=-1  W !,?$S(N<10:11,1:10),N,?15,^TBSAIS($I,N)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix (ex:1,2,4) : ") S DX=$X D ^%VLEC Q:(CTRLA=1)!((CTRLF=1)!(Y1=""))  S ^TBSAIS($I)=Y1 D CLEPAG^%VVIDEO
 D SIMON^%VTOZE S %UCATT=0,%NARTI=-1
 N TEMPREP S TEMPREP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KI") K @(TEMPREP)
 
LBEG S %NARTI=$N(^TACOMPIL($I,%NARTI)) G:%NARTI=-1 FBEG S ARTI=^TACOMPIL($I,%NARTI) D DEB,INT^%QMDAK0,ZD^%QMDATE4 S SARTI="SIMUL/"_ARTI,^[QUI]TIMCOMP(SARTI,%DAT)=^[QUI]TIMCOMP(SARTI,%DAT)_" ^ "_HEURE G LBEG
FBEG N TEMPREP S TEMPREP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KI") K @(TEMPREP)
 D SIMOFF^%VTOZE Q
 
DEB S SARTI="SIMUL/"_ARTI K ^[QUI]TIMCOMP(SARTI) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]TIMCOMP(SARTI,%DAT)=HEURE,%ADR="TRAIT0^TOSAISI2",%XXX=1
LDEB S %EX=$P(^TBSAIS($I),",",%XXX) G:%EX="" FDEB D @%EX S %XXX=%XXX+1 G LDEB
FDEB Q
1 K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPL",NCLE=3,%NOMTAB="^[QUI]IMPLICI(ARTI",SCR=$$^%QZCHW("IMPLICI"),NOMTAB="^[QUI]IMPLICI" D TOSAISK,^%VKGTENR Q
2 K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPMAT",NCLE=3,%NOMTAB="^[QUI]IMPMAT(ARTI",SCR="IMPMAT",NOMTAB="^[QUI]IMPMAT" D TOSAISK,^%VKGTENR Q
3 K ^NONUC($I) S ^NONUC($I,3)=1,^NONUC($I,1)=1,^NONUC($I,2)=1,ETUD="NOME",NCLE=3,%NOMTAB="^[QUI]NOMENC(ARTI",SCR="NOMENC",NOMTAB="^[QUI]NOMENC" D TOSAISK,^%VKGTENR Q
4 K ^NONUC($I) F WA=1,2,3,4,21,22,23,24,25,26,27,28 S ^NONUC($I,WA)=1
 S ^NONUC($I,3)=1,ETUD="PHAS",%NOMTAB="^[QUI]PHASE(ARTI",SCR="PHASE",NOMTAB="^[QUI]PHASE" D TOSAISK,^%VKGTENR Q
5 F WA=1:1:5 S ^NONUC($I,WA)=1
 S ^NONUC($I,22)=1,ETUD="OUTCO",%NOMTAB="^[QUI]OUTCONS(ARTI",SCR="OUTCONS",NOMTAB="^[QUI]OUTCONS" D TOSAISK,^%VKGTENR Q
6 K ^NONUC($I) F WA=1:1:5 S ^NONUC($I,WA)=1
 S ETUD="FORMULE",%NOMTAB="^[QUI]FORMULE(ARTI",SCR="FORMULE",NOMTAB="^[QUI]FORMULE" D TOSAISK,^%VKGTENR Q
7 K ^NONUC($I) S ^NONUC($I,1)=1,^NONUC($I,2)=1,ETUD=$$^%QZCHW("MATIERE"),%NOMTAB="^[QUI]MATIERE(ARTI",SCR=$$^%QZCHW("MATIERE"),NOMTAB="^[QUI]MATIERE" D TOSAISK,^%VKGTENR Q
8 K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="SELMAT",%NOMTAB="^[QUI]SELMAT(ARTI",SCR="SELMAT",NOMTAB="^[QUI]SELMAT" D TOSAISK,^%VKGTENR Q
9 K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="SELMAC",%NOMTAB="^[QUI]MACSEL(ARTI",SCR="MACSEL",NOMTAB="^[QUI]MACSEL" D TOSAISK,^%VKGTENR Q
10 K ^NONUC($I) F WA=1:1:3 S ^NONUC($I,WA)=1
 S ETUD="ABAC",%NOMTAB="^[QUI]ESSABAC(ARTI",SCR="ESSABAC",NOMTAB="^[QUI]ESSABAC" D TOSAISK,^%VKGTENR Q
11 S ETUD=$$^%QZCHW("TRIPLET") D ^TOSITRIP Q
12 K ^NONUC($I) F WA=1:1:4 S ^NONUC($I,WA)=1
 S ETUD="IMPMAC",NCLE=3,%NOMTAB="^[QUI]IMPMAC(ARTI",SCR="IMPMAC",NOMTAB="^[QUI]IMPMAC" D TOSAISK,^%VKGTENR Q
13 K ^NONUC($I) F WA=1:1:6 S ^NONUC($I,WA)=1
 S ETUD="DIMOUT",NCLE=6,%NOMTAB="^[QUI]DIMOUT(ARTI",SCR="DIMOUT",NOMTAB="^[QUI]DIMOUT" D TOSAISK,^%VKGTENR Q
FIN Q
TRAIT0 W "|" G:%CHOIX="R" TRAIT D ^%VTNAMFU G:%NFU="" FIN S TABFUL=%NFU_"("_$P(%1NOM,"(",2) G:$D(@TABFUL) FIN
TRAIT K FRESU,AFRESU S ABENDSCR=0 D ^TOSIMRES,^%VAFIGRI,^%VAFISCR K @(%1NOM) D ^%VKAUST K AFRESU
 Q
UC S STOPUC=0,CMS=0 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" F UYT=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC,REFUSE=0 D @UCONT,REFULOP:REFUSE=1 Q:STOPUC=1
 Q
REFULOP D ^%VSQUEAK,POCLEPA^%VVIDEO W " ****** CHAMP ",ICC," REFUSE ********" H 1 Q
 
TOSAISK Q:%CHOIX'="R"
 N TEMPREP
 S TEMPREP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KI")
 D ^%VTNAMFU I %NFU'="" S KTAB=%NFU_"("""_ARTI_""")" I '($D(@TEMPREP@(KTAB))) K @(KTAB) S @TEMPREP@(KTAB)=""
 Q

