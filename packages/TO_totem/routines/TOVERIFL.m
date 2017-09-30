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

;TOVERIFL^INT^1^59547,74876^0
TOVERIFL ;
 
 K ^OABRES($I) D CLEPAG^%VVIDEO W $$^%QZCHW("Verification existence FULL MATCH <=> non FULL MATCH de l'article : "),!,?5,$$^%QZCHW("- ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S (YART,ARTI)=Y1 D TRAITM
 S DEV="" I $D(WHOIS),$D(^TABIDENT(WHOIS,"PRINTER")) S DEV=^TABIDENT(WHOIS,"PRINTER")
 W !,!,$$^%QZCHW("Sur (E)cran ou (I)mprimante ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("I"))&(REP'=$$^%QZCHW("E")) FIN I REP=$$^%QZCHW("I"),DEV="" W !,!,$$^%QZCHW("Sur quelle imprimante : ") R DEV G:DEV="" FIN
 S IMPR=$S(REP=$$^%QZCHW("I"):DEV,1:0) D CLEPAG^%VVIDEO S DOLARI=$I
 S N=1 F IT=$$^%QZCHW("IMPLICITE"),"IMPLICITE MATIERE","COMPOSANT","PHASE","CONSIGNE","FORMULE",$$^%QZCHW("MATIERE"),"SELECTION MATIERE","SELECTION MACHINE","SAISIE MULTIPLE",$$^%QZCHW("TRIPLET") S ^TBSAIS($I,N)=IT,N=N+1
 W ! S N=-1 F UU=1:1 S N=$N(^TBSAIS($I,N)) Q:N=-1  W !,?$S(N<10:11,1:10),N,?15,^TBSAIS($I,N)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix (ex:1,2,4) : ") S DX=$X D ^%VLEC Q:(CTRLA=1)!((CTRLF=1)!(Y1=""))  S ^TBSAIS($I)=Y1
 D SIMON^%VTOZE,CLEPAG^%VVIDEO S %UCATT=0,%NARTI=-1 W:IMPR'=0 $$^%QZCHW("Impression en cours...") O IMPR U IMPR
 F UU=0:0 S %NARTI=$N(^TACOMPIL(DOLARI,%NARTI)) Q:%NARTI=-1  S ARTI=^TACOMPIL(DOLARI,%NARTI) D DEB
 W:IMPR'=0 # C:IMPR'=0 IMPR D SIMOFF^%VTOZE Q
DEB S %ADR="TRAIT0^TOVERIFL" F %XXX=1:1 S %EX=$P(^TBSAIS(DOLARI),",",%XXX) Q:%EX=""  S PCH=%EX D TO^%QZNBN1 Q:'(ISNUM)  D @%EX
 Q
1 K NONUC F WA=1:1:4 S NONUC(WA)=1
 S ETUD="IMPL",NCLE=3,%NOMTAB="^[QUI]IMPLICI(ARTI",SCR=$$^%QZCHW("IMPLICI"),NOMTAB="^[QUI]IMPLICI" D ^%VKGTENR Q
2 K NONUC F WA=1:1:4 S NONUC(WA)=1
 S ETUD="IMPMAT",NCLE=3,%NOMTAB="^[QUI]IMPMAT(ARTI",SCR="IMPMAT",NOMTAB="^[QUI]IMPMAT" D ^%VKGTENR Q
3 K NONUC S NONUC(3)=1,NONUC(1)=1,NONUC(2)=1,ETUD="NOME",NCLE=3,%NOMTAB="^[QUI]NOMENC(ARTI",SCR="NOMENC",NOMTAB="^[QUI]NOMENC" D ^%VKGTENR Q
4 K NONUC F WA=1,2,3,4,21,22,23,24,25,26,27,28 S NONUC(WA)=1
 S NONUC(3)=1,ETUD="PHAS",%NOMTAB="^[QUI]PHASE(ARTI",NCLE=4,SCR="PHASE",NOMTAB="^[QUI]PHASE" D ^%VKGTENR Q
5 F WA=1:1:5 S NONUC(WA)=1
 S NONUC(22)=1,ETUD="OUTCO",%NOMTAB="^[QUI]OUTCONS(ARTI",SCR="OUTCONS",NOMTAB="^[QUI]OUTCONS" D ^%VKGTENR Q
6 K NONUC F WA=1:1:5 S NONUC(WA)=1
 S ETUD="FORMULE",%NOMTAB="^[QUI]FORMULE(ARTI",SCR="FORMULE",NOMTAB="^[QUI]FORMULE" D ^%VKGTENR Q
7 K NONUC S NONUC(1)=1,NONUC(2)=1,ETUD=$$^%QZCHW("MATIERE"),%NOMTAB="^[QUI]MATIERE(ARTI",SCR=$$^%QZCHW("MATIERE"),NOMTAB="^[QUI]MATIERE" D ^%VKGTENR Q
8 K NONUC F WA=1:1:4 S NONUC(WA)=1
 S ETUD="SELMAT",%NOMTAB="^[QUI]SELMAT(ARTI",SCR="SELMAT",NOMTAB="^[QUI]SELMAT" D ^%VKGTENR Q
9 K NONUC F WA=1:1:4 S NONUC(WA)=1
 S ETUD="SELMAC",%NOMTAB="^[QUI]MACSEL(ARTI",SCR="MACSEL",NOMTAB="^[QUI]MACSEL" D ^%VKGTENR Q
10 K NONUC F WA=1:1:3 S NONUC(WA)=1
 S ETUD="ABAC",%NOMTAB="^[QUI]ESSABAC(ARTI",SCR="ESSABAC",NOMTAB="^[QUI]ESSABAC" D ^%VKGTENR Q
11 S ETUD=$$^%QZCHW("TRIPLET") D ^TOVFLTRI
FIN Q
TRAIT0 W !,$P(NOMTAB,$S(NOMTAB["]":"]",1:"^"),2),!,?5 F %GG=2:1:NCLE W @("%B"_%GG),$$^%QZCHW(" ")
 D ^%VTNAMFU G:%NFU="" FIN S TABFUL=%NFU_"("_$P(%1NOM,"(",2) I '($D(@TABFUL)) W !,$$^%QZCHW("Full match correspondant inexistant.")
 W ! G FIN
TRAITM N (QUI,ARTI) D CURRENT^%IS,VARSYS^%QCSAP K ^COMPILVU($I),^SAISIMU($I),^TACOMPIL($I) I ARTI'["*" S ^TACOMPIL($I,1)=ARTI G FIN2
 S %NARTI=1,ARTI=$P(ARTI,"*",1),YA=ARTI D ^TO3ARTHE S NOMTREE="^ARBTHEO($I,ARTI",ADR="TRAIT2^TO3COMPR" D ^%QCAGTU1
 
 G FIN2
TRAIT2 I '($D(^COMPILVU($I,@NOM))) S ^TACOMPIL($I,%NARTI)=@NOM,^COMPILVU($I,@NOM)=1,%NARTI=%NARTI+1
FIN2 Q

