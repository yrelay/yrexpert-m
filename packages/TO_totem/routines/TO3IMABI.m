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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3IMABI^INT^1^59547,74870^0
TO3IMABI ;
 
 G:'($D(^[QUI]IMPBIS(YA))) FIN D ^TOPREPBI
 S IMT("TOZEC")=^TOZE($I,"C"),IMT("TOZEA")=^TOZE($I,"A"),NTABN=$$^%QZCHW("MATIERE EN STOCK"),NCLE=3,PNUM=2,F1=18,NFOR=1,IMT("NTRI")="",IMT("PARA")=$$^%QZCHW(" "),IMT("CONDIT")=0,IMT("PRGDEF")="TSDEF1"
 S IMT("%MORDEF")=0
 S IMT("TSDEF")=1,IMT("PRGDEF")="TSDEF" D LOPAR K ^BISIMP($I,NUFA,TWREF,YA),^INDEF($I,NUFA,TWREF,YA) G FIN
LOPAR S PNUM=2,IMT("NTRI")=$O(^BISIMP($I,NUFA,TWREF,YA,IMT("NTRI"))) G:%ABEND=1 END G:IMT("NTRI")="" END S IMT("RBIS")=^BISIMP($I,NUFA,TWREF,YA,IMT("NTRI")),IMT("PBIS")=$P(IMT("RBIS"),"""",4)
 I $D(^V($I,YA,IMT("PBIS"))) K ^BISIMP($I,NUFA,TWREF,YA,IMT("NTRI")) G LOPAR
 I (IMT("PBIS")'["$ARG")&(IMT("PBIS")'["%VAL") S ANC=IMT("PBIS") D ^TOEVCOUR
 S SOURCE=$E(IMT("RBIS"),2,$L(IMT("RBIS"))-1) D @IMT("PRGDEF") D:IMT("TSDEF") TESCOND G LOPAR
TESCOND 
RETERR Q:%ABEND=1  S $ZT=IMT("TOZEC") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S IMT("CONDIT")=RES1 G ROLO
NOLO S IMT("ATEST")="^[QUI]CIMPMAT"_IMT("RBIS"),@("IMT(""CONDIT"")="_@IMT("ATEST"))
ROLO K %TBL Q:IMT("CONDIT")=0  S $ZT=IMT("TOZEA"),IMT("AFFECT")="^[QUI]AIMPMAT"_IMT("RBIS") D SIFON G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1
 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S IMT("AFFECT")="%RESUL",%RESUL="RES1"
SIF1 S @("^V($I,YA,IMT(""PBIS""))="_@IMT("AFFECT")),IMT("%MORDEF")=IMT("%MORDEF")+1,^RAIS($I,MSS,IMT("PBIS"))="^[QUI]IMPMAT"_IMT("RBIS"),%POR=IMT("PBIS") D ORD
 I IMT("PBIS")=$$^%QZCHW("ARRET"),^V($I,YA,IMT("PBIS"))=1 D ABEND G FIN
 G:$D(^[QUI]EXPGIMP(IMT("PBIS"),^V($I,YA,IMT("PBIS"))))!$D(^[QUI]IGNORER(YA,IMT("PBIS"),^V($I,YA,IMT("PBIS")))) ABXK
 K IMT("AOPARA") S:$D(PARA) IMT("AOPARA")=PARA S PARA=IMT("PBIS"),VPA=^V($I,YA,IMT("PBIS")),%MODA="MAT" D ^TO3PASYS S:$D(IMT("AOPARA")) PARA=IMT("AOPARA") K IMT("AOPARA")
ABXK D INCR
FIN Q
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",PARA," * non defini, nous aurons peut-etre des problemes" H 3 Q
SIFON S SIF=0 Q:@IMT("AFFECT")'["$"  S CONTAF=@IMT("AFFECT") G:CONTAF'["$$" FIN S SIF=1,CONTAF=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF)
 S ROUTI="^"_$E($P(CONTAF,"/",1),3,299),EXPFONC=CONTAF D @ROUTI S IMT("AFFECT")="%RESUL",%RESUL="%RESULTAT"
 K CONTAF,EXPFONC,ROUTI Q
ORD S $ZT="G FORD",^ORDEVAL($I,TWREF,MSS,@^CPTPAR(2))=%POR_"^^"_^V($I,YA,%POR)
FORD Q
INCR S $ZT="G FORD",@^CPTPAR(2)=@^CPTPAR(2)+1 G FORD
TRI S $ZT="G FORD",^ORDEVAL($I,TWREF,MSS,@^CPTPAR(2))=%POR_"^"_IMT("NTRI")_"^"_^V($I,YA,%POR) G FORD
TSDEF S IMT("NU")=1,IMT("TSDEF")=1,IMT("TDEF")="^INDEF($I,NUFA,TWREF,"_SOURCE_")",IMT("PND")=-1
 F IMT("UU")=0:0 S IMT("PND")=$N(@IMT("TDEF")@(IMT("PND"))) G:IMT("PND")=-1 FIN D TEST
 Q
TEST 
 S IMT("YA3")=$P(IMT("PND"),"""",2),IMT("PAR3")=$P(IMT("PND"),"""",4) I IMT("YA3")'=$$^%QZCHW("ARTICLE") G SSS I '($D(^V($I,IMT("YA2"),IMT("PAR3")))) S:IMT("PAR3")["$" IMT("TSDEF")=0 I $E(IMT("PAR3"),1)'="$" D U1 G FIN
 S IMT("TSDEF")=0 G FIN
U1 G:BATCH=0 U10 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Parametres indefinis dans matiere"),^CSTEST($I,"UNDEF",IMT("PAR3")_$$^%QZCHW(" de ")_IMT("YA2"))=1 G FIN
U10 D POCLEPA^%VVIDEO W IMT("PAR3"),$$^%QZCHW(" de "),IMT("YA2")," ? " R IMT("VA3") G:IMT("VA3")="" TEST S ^V($I,IMT("YA2"),IMT("PAR3"))=IMT("VA3") G FIN
SSS I '($D(^V($I,IMT("YA3"),IMT("PAR3")))),$E(IMT("PAR3"),1)'="$" D U2 G FIN
 G FIN
U2 G:BATCH=0 U20 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Parametres indefini dans matiere"),^CSTEST($I,"UNDEF",IMT("PAR3")_$$^%QZCHW(" de ")_IMT("YA3"))=1 G FIN
U20 D POCLEPA^%VVIDEO W IMT("PAR3"),$$^%QZCHW(" de "),IMT("YA3")," ? " R IMT("VA3") G:IMT("VA3")="" TEST S ^V($I,IMT("YA3"),IMT("PAR3"))=IMT("VA3") G FIN
 Q  I @IMT("PND")="1??" S IMT("TSDEF")=0 Q
 Q
TSDEF1 S IMT("TSDEF")=1,IMT("TDEF")="^INDEF($I,NUFA,TWREF,"_SOURCE_")",IMT("PND")=-1
 F IMT("UU")=0:0 S IMT("PND")=$N(@IMT("TDEF")@(IMT("PND"))) G:IMT("PND")=-1 FINT D TEST1 I IMT("TSDEF")=0 G FINT
FINT Q
TEST1 
 I '($D(@IMT("PND"))) S IMT("TSDEF")=0 Q
 K @IMT("TDEF")@(IMT("PND")) Q
 Q
ABEND S %ABEND=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("ARRET de l'etude matiere "),YA R:BATCH=0 *%POR:10 D POCLEPA^%VVIDEO Q
YAERR S zzz=xxx Q
END Q

