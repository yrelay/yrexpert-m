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
;! Nomprog     : %VACTVER                                                     !
;! Module      : VIDEO                                                        !
;! But         : Gestion des versions d'Yexpert                               !
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

;%VACTVER^INT^1^59861,82681^0
%VACTVER ;;01:57 PM  30 Sep 1993; 24 Jun 92  8:50 AM ; 02 Nov 93  4:24 PM
 
 
 
 
 
 
 
MOZ N VERCOUR,ROUSUP,SAV
 S VERCOUR="V3.2 release 19"
 S VERCOUR="V4.0 release 0"
 S VERCOUR="V4.0 release 1"
 S VERCOUR="V4.0 release 2"
 S VERCOUR="V4.0 release 3"
 S VERCOUR="V4.0 release 4"
 S VERCOUR="V4.0 release 5"
 S VERCOUR="V4.0 release 6"
 
 
 
 
 I '($D(^INCONNE("VERSION"))) G M3P2V0
 Q:^INCONNE("VERSION")=VERCOUR
 G:^INCONNE("VERSION")="V3.2 release 1" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 2" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 3" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 4" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 5" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 6" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 7" M3P2V7
 G:^INCONNE("VERSION")="V3.2 release 8" M3P2V8
 G:^INCONNE("VERSION")="V3.2 release 9" M3P2V12
 G:^INCONNE("VERSION")="V3.2 release 10" M3P2V12
 G:^INCONNE("VERSION")="V3.2 release 11" M3P2V12
 G:^INCONNE("VERSION")="V3.2 release 12" M3P2V12
 G:^INCONNE("VERSION")="V3.2 release 13" M3P2V14C
 G:^INCONNE("VERSION")="V3.2 release 14" M3P2V14C
 G:^INCONNE("VERSION")="V3.2 release 14 (C)" M3P2V19
 G:^INCONNE("VERSION")="V3.2 release 15" M3P2V19
 G:^INCONNE("VERSION")="V3.2 release 16" M3P2V19
 G:^INCONNE("VERSION")="V3.2 release 17" M3P2V19
 G:^INCONNE("VERSION")="V3.2 release 18" M3P2V19
 G:^INCONNE("VERSION")="V3.2 release 18 (A)" M3P2V19
 
M3P2V0 D LOAD^%UTSTCS
 D TUERALL^%VACT
 K ^RQSGLU("GLOJOB"),^TTLEXTER
 K ^%PIMEN,^%QMKAFAC,^ENVIRON
 K ^ARCSIN,^ARCCOS,^TANG,^COTG,^ARCTG,^ARCCTG,^PRECSTCT
 D MAKEMN
 
M3P2V7 K ^RQSGLO("VERBE")
 
M3P2V8 D READ^%UTSTCA("%SGNM")
M3P2V12 
 D INT^%DIR,CURRENT^%IS,VARSYS^%QCSAP
 K ^%PKREAD,^%PK
 D LOAD^%LXMRINS
M3P2V14C 
 D MAKEMN
M3P2V19 
 D TUERALL^%VACT
 D ^%TLOUMK
 D REINIT^%SGGLOB
MZFIN S ^INCONNE("VERSION")=VERCOUR
 Q
 
 
 
 
QUI ;Analyse all
 N VERCOUR,VALANSA,%I,%J,I,J
 S VERCOUR="V3.2 release 19"
 S VERCOUR="V4.0 release 0"
 S VERCOUR="V4.0 release 1"
 S VERCOUR="V4.0 release 2"
 S VERCOUR="V4.0 release 3"
 S VERCOUR="V4.0 release 4"
 S VERCOUR="V4.0 release 5"
 S VERCOUR="V4.0 release 6"
 I $D(^[QUI]VERSION) Q:^[QUI]VERSION=VERCOUR  G QUI2
 
 
 G QR33G
 
QUI2 
 G:^[QUI]VERSION="V2.3 release 33 (F)" QR33G
 G:^[QUI]VERSION="V2.3 release 33 (G)" QR33G
 G:^[QUI]VERSION="V2.3 release 33 (H)" QR34D
 G:^[QUI]VERSION="V2.3 release 33 (I)" QR34D
 G:^[QUI]VERSION="V2.3 release 34 (A)" QR34D
 G:^[QUI]VERSION="V2.3 release 34 (B)" QR34D
 G:^[QUI]VERSION="V2.3 release 34 (C)" QR34D
 G:^[QUI]VERSION="V2.3 release 34 (D)" QR34D
 G:^[QUI]VERSION="V2.3 release 34 (E)" QR34F
 G:^[QUI]VERSION="V2.3 release 34 (F)" QR34F
 G:^[QUI]VERSION="V3 release 1 (A)" QR3
 G:^[QUI]VERSION="V3.1 release 1" QR3V1
 G:^[QUI]VERSION="V3.1 release 2" Q3P2V2
 G:^[QUI]VERSION="V3.1 release 3" Q3P2V2
 G:^[QUI]VERSION="V3.2 release 1" Q3P2V2
 G:^[QUI]VERSION="V3.2 release 2" Q3P2V2
 G:^[QUI]VERSION="V3.2 release 3" Q3P2V7
 G:^[QUI]VERSION="V3.2 release 4" Q3P2V7
 G:^[QUI]VERSION="V3.2 release 5" Q3P2V7
 G:^[QUI]VERSION="V3.2 release 6" Q3P2V7
 G:^[QUI]VERSION="V3.2 release 7" Q3P2V7
 G:^[QUI]VERSION="V3.2 release 8" Q3P2V8
 G:^[QUI]VERSION="V3.2 release 9" Q3P2V10
 G:^[QUI]VERSION="V3.2 release 10" Q3P2V10
 G:^[QUI]VERSION="V3.2 release 11" Q3P2V11
 G:^[QUI]VERSION="V3.2 release 12" Q3P2V13
 G:^[QUI]VERSION="V3.2 release 13" Q3P2V13
 G:^[QUI]VERSION="V3.2 release 14" Q3P2V15
 G:^[QUI]VERSION="V3.2 release 14 (C)" Q3P2V15
 G:^[QUI]VERSION="V3.2 release 15" Q3P2V18
 G:^[QUI]VERSION="V3.2 release 16" Q3P2V18
 G:^[QUI]VERSION="V3.2 release 17" Q3P2V18
 G:^[QUI]VERSION="V3.2 release 18" Q3P2V18A
 G:^[QUI]VERSION="V3.2 release 18 (A)" Q3P2V19
 
 G QR3V1
 
QR33G D ^%VZEATT
 S VALANSA=$ZP(^[QUI]ANSA(""))
 S ^[QUI]RQSGLO("ANSA")=$S(VALANSA="":0,VALANSA="z":0,1:VALANSA)
 K ^[QUI]QUERY1("%"),^[QUI]QUERY2("%"),^[QUI]QUERY3("%"),^[QUI]QUERY4("%"),^[QUI]QUERY1("TRAITEMENT"),^[QUI]QUERY2("TRAITEMENT"),^[QUI]QUERY3("TRAITEMENT"),^[QUI]QUERY4("TRAITEMENT"),^[QUI]ANSA
 D OFF^%VZEATT
 D ^%VZEAVT("Vous devez reanalyser traitements,modeles,formats,variables actives,noeuds hevea,regles savoir-comparer")
 D ^%VZEAVT("Vous devez aussi reinstaller votre schema de donnees")
 D ^%VZEAVT("Modification du stockage")
 D NEW^%UTSTCB
 G QUIFIN
 
 
QR34D S %I="" F %J=0:0 S %I=$O(^[QUI]RQSGLO("QULEL",%I)) Q:%I=""  S ^[QUI]RQSGLO("QULEL",%I)=^[QUI]RQSGLO("QULEL",%I)_"^^"
 
QR34F D ^%VZEAVT("Attention, nouvelle gestion de l'orientation dans GDX")
QR3 K ^[QUI]RQSDON("COMPTRT") D ^%VZEAVT("Vous devez reanalyser traitements et requetes")
QR3V1 D ^%VZEAVT("Modification du stockage")
 D NEW^%UTSTCB
 
Q3P2V2 D ^%VZEAVT("Vous devez reanalyser vos predicats")
 
Q3P2V7 D ^%VZEAVT("Verification des listes")
 D CORRLIS,ZLIGT^%SGNETQI
Q3P2V8 D ^%VZEAVT("Vous devez regenerer la compilation de vos dessins")
 
Q3P2V10 
 D ^%VZEAVT("Vous devez recompiler vos traitements")
Q3P2V11 
 D ^%VZEAVT("Nettoyage de donnees parasites (TOTEM)")
 D ^%VZEATT
 D SUPETTO^%SGNETQI
 D OFF^%VZEATT
Q3P2V13 
 D ^%VZEAVT("Achivage de vos reseaux dans le fichier HV"_QUI_".ARD")
 D ON^%VZEATT
 D OUT^%QMEXTRF("HV"_QUI_".ARD")
 D OFF^%VZEATT
 D ^%VZEAVT("Vous devez verifier et reinstaller votre schema de donnees")
 D ^%VZEAVT("Puis restaurer vos reseaux semantiques (menu restauration de donnees et de connaissances)")
 
 S I="" F %I=0:0 S I=$O(^[QUI]QUERYT("SAISIE.I",I)) Q:I=""  S J="" F %J=0:0 S J=$O(^[QUI]QUERYT("SAISIE.I",I,J)) Q:J=""  D PARAM^%QSNOTE3("SAISIE.I",I,J)
 
Q3P2V14C 
Q3P2V15 
 
 D PKA^%QSGESTI("TRAITEMENT","DER.ACCES")
 
 D ^%VZEAVT("Suppression de l'attribut AVEC.TECHNOLOGIE.techonologie")
 D ^%UTSTCN
 
 D MAJ^%QMDRCAL
Q3P2V18 
 D ^%VZEAVT("Vous devez reanalyser vos traitements et refaire une comprehension des reseaux semantiques")
Q3P2V18A 
 D MSG^%VZEATT("stockage des predicats"),MAJ^%PSPRGES,OFF^%VZEATT
 K ^[QUI]RQSGLU("QMDA")
Q3P2V19 
 D DEF^%INCOIN2
QUIFIN S ^[QUI]VERSION=VERCOUR
 Q
 
 
 
MAKEMN N MN,%MN
 S MN="" F %MN=0:0 S MN=$O(^MN(MN)) Q:MN=""  I $D(^MN(MN,"STATUT")),^MN(MN,"STATUT")="RESERVE" K ^MN(MN)
 D COPY^%QCAGLC("^%MN","^MN")
 Q
 
CORRLIS 
 N LIS,%L,ADTRI,ADRES,IX,%IX,IND
 S LIS="" F %L=0:0 S LIS=$$NXTRI^%QSTRUC8("L0",LIS) Q:LIS=""  I $$OAIR^%QSGE5("L0",LIS,"TRIEE",1) S ADTRI=$$VALEUR^%QSTRUC8("L0",LIS,"TRIEE",1),ADRES=$$VALEUR^%QSTRUC8("L0",LIS,"ADRESSE",1) D CORRL2
 Q
CORRL2 
 S IX="" F %IX=0:0 S IX=$O(@ADTRI@(IX)) Q:IX=""  S IND=@ADTRI@(IX) I $D(@ADRES@(IND)) S @ADRES@(IND)=IX
 Q

