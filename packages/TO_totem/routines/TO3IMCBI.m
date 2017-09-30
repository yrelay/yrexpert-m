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

;TO3IMCBI^INT^1^59547,74870^0
TO3IMCBI ;
 
 G:'($D(^[QUI]IMPBIS(YA))) END D ^TOPREPBI
 S GPM("TOZEC")=^TOZE($I,"C"),GPM("TOZEA")=^TOZE($I,"A"),NTABN="Parametres MACHINE",NCLE=3,PNUM=2,F1=18,NFOR=1,GPM("NTRI")="",PARA=$$^%QZCHW(" "),GPM("CONDIT")=0,GPM("PRGDEF")="TSDEF1"
 S GPM("%MORDEF")=0
 S GPM("TSDEF")=1,GPM("PRGDEF")="TSDEF" D LOPAR K ^BISIMP($I,NUFA,TWREF,YA),^INDEF($I,NUFA,TWREF,YA) G FIN
LOPAR S GPM("NTRI")=$O(^BISIMP($I,NUFA,TWREF,YA,GPM("NTRI"))) G:%ABEND=1 END G:GPM("NTRI")="" END S GPM("RBIS")=^BISIMP($I,NUFA,TWREF,YA,GPM("NTRI")),GPM("PBIS")=$P(GPM("RBIS"),"""",4)
 I $D(^V($I,YA,GPM("PBIS"))) K ^BISIMP($I,NUFA,TWREF,YA,GPM("NTRI")) G LOPAR
 S SOURCE=$E(GPM("RBIS"),2,$L(GPM("RBIS"))-1) D @GPM("PRGDEF") D:GPM("TSDEF") TESCOND G LOPAR
TESCOND S ANC=GPM("PBIS") I (ANC'="$ARG")&(ANC'="%VAL") D ^TOEVCOUR
RETERR Q:%ABEND=1  S $ZT=GPM("TOZEC") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S GPM("CONDIT")=RES1 G ROLO
NOLO S GPM("ATEST")="^[QUI]CIMPMAC"_GPM("RBIS"),@("GPM(""CONDIT"")="_@GPM("ATEST"))
ROLO Q:GPM("CONDIT")=0  S $ZT=GPM("TOZEA"),GPM("AFFECT")="^[QUI]AIMPMAC"_GPM("RBIS") D SIFON G:GPM("SIF") SIF1
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S GPM("AFFECT")="%RESUL",%RESUL="RES1"
SIF1 S @("^V($I,YA,GPM(""PBIS""))="_@GPM("AFFECT")),GPM("%MORDEF")=GPM("%MORDEF")+1,%POR=GPM("PBIS") D ORD
 I GPM("PBIS")=$$^%QZCHW("ARRET"),^V($I,YA,GPM("PBIS"))=1 D ABEND G FIN
 G:^V($I,YA,GPM("PBIS"))="" S20 I ('($D(^[QUI]EXPGIMP(GPM("PBIS"),^V($I,YA,GPM("PBIS"))))))&('($D(^[QUI]IGNORER(YA,GPM("PBIS"),^V($I,YA,GPM("PBIS")))))) G S20
 K GPM("AOPARA") S:$D(PARA) GPM("AOPARA")=PARA S PARA=GPM("PBIS"),VPA=^V($I,YA,GPM("PBIS")),%MODA="MAT" D ^TO3PASYS S:$D(GPM("AOPARA")) PARA=GPM("AOPARA") K GPM("AOPARA")
S20 D INCR
FIN Q
AVERTI Q
SIFON S GPM("SIF")=0 Q:@GPM("AFFECT")'["$"  S CONTAF=@GPM("AFFECT"),GPM("FIS")=$S($E(CONTAF,1)="(":$E(CONTAF,1,3),1:$E(CONTAF,1,2)) G:(GPM("FIS")'="($$")&(GPM("FIS")'="$$") FIN
 S CONTAF=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF)
 S GPM("SIF")=1,ROUTI="^"_$E($P(CONTAF,"/",1),3,299),EXPFONC=CONTAF D @ROUTI S GPM("AFFECT")="%RESUL",%RESUL="%RESULTAT"
 Q
ORD 
FORD Q
INCR 
 G FORD
TRI S $ZT="FORD",^ORDEVAL($I,TWREF,MSS,@^CPTPAR(2))=%POR_"^"_GPM("NTRI")_"^"_^V($I,YA,%POR)
 G FORD
TSDEF S GPM("NU")=1,GPM("TSDEF")=1,TDEF="^INDEF($I,NUFA,TWREF,"_SOURCE_")",GPM("PND")=-1
 F GPM("UU")=0:0 S GPM("PND")=$N(@TDEF@(GPM("PND"))) G:GPM("PND")=-1 FIN D TEST
 Q
TEST 
 S GPM("YA3")=$P(GPM("PND"),"""",2),GPM("PAR3")=$P(GPM("PND"),"""",4) I GPM("YA3")'=$$^%QZCHW("ARTICLE") G SSS I '($D(^V($I,GPM("YA2"),GPM("PAR3")))) S:GPM("PAR3")["$" GPM("TSDEF")=0 I $E(GPM("PAR3"),1)'="$" D U1 G FIN
 S GPM("TSDEF")=0 G FIN
U1 G:BATCH=0 U10 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Parametres indefinis dans matiere"),^CSTEST($I,"UNDEF",GPM("PAR3")_$$^%QZCHW(" de ")_GPM("YA2"))=1 G FIN
U10 D POCLEPA^%VVIDEO W GPM("PAR3"),$$^%QZCHW(" de "),GPM("YA2")," ? " R GPM("VA3") G:GPM("VA3")="" TEST S ^V($I,GPM("YA2"),GPM("PAR3"))=GPM("VA3") G FIN
SSS I '($D(^V($I,GPM("YA3"),GPM("PAR3")))),$E(GPM("PAR3"),1)'="$" D U2 G FIN
 G FIN
U2 G:BATCH=0 U20 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW($$^%QZCHW("Parametres indefini dans machine")),^CSTEST($I,"UNDEF",GPM("PAR3")_$$^%QZCHW(" de ")_GPM("YA3"))=1 G FIN
U20 D POCLEPA^%VVIDEO W GPM("PAR3"),$$^%QZCHW(" de "),GPM("YA3")," ? " R GPM("VA3") G:GPM("VA3")="" TEST S ^V($I,GPM("YA3"),GPM("PAR3"))=GPM("VA3") G FIN
 Q
TSDEF1 S GPM("TSDEF")=1,TDEF="^INDEF($I,NUFA,TWREF,"_SOURCE_")",GPM("PND")=-1
 F GPM("UU")=0:0 S GPM("PND")=$N(@TDEF@(GPM("PND"))) G:GPM("PND")=-1 FINT D TEST1 I GPM("TSDEF")=0 G FINT
FINT K TDEF Q
TEST1 
 I '($D(@GPM("PND"))) S GPM("TSDEF")=0 Q
 K @TDEF@(GPM("PND")) Q
 Q
ABEND S %ABEND=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("ARRET de l'etude machine "),YA R:BATCH=0 *%POR:10 D POCLEPA^%VVIDEO Q
YAERR S GPM("zzz")=GPM("xxx") Q
END K %POR,PARA,%MODA,VPA,TDEF Q

