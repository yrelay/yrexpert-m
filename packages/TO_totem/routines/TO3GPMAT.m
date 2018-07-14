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

;TO3GPMAT^INT^1^59547,74870^0
TO3GPMAT ;
 
 S %LIEU=$$^%QZCHW("Mat en stock"),%TABRA="^RAIS($I,MSS)",%TABTV="^V($I,YA)" D ^TO3WLIEU K ^M($I,MSS),^RAIS($I,MSS),^V($I,SFMAT) S ^CPTPAR(2)="^CPTEUR($I,TWREF,MSS)",@^CPTPAR(2)=1
 S %NOM="^[QUI]MATSTOCK(MSS,FMS,IMT(""NF""))",IMT("YA2")=YA,YA=SFMAT S:'($D(^[QUI]TRI(YA))) YA=FMS
 S ^V($I,YA,$$^%QZCHW("ARTICLE"))=IMT("YA2")
 G:'($D(^VBIS($I,IMT("YA2"),$$^%QZCHW("MATIERE")))) S20
 S IMT("NF")=-1 F IMT("%FF")=1:1 S IMT("NF")=$N(^VBIS($I,IMT("YA2"),$$^%QZCHW("MATIERE"),IMT("NF"))) Q:IMT("NF")=-1  S ^V($I,YA,IMT("NF"))=^VBIS($I,IMT("YA2"),$$^%QZCHW("MATIERE"),IMT("NF")),^RAIS($I,YA,IMT("NF"))="IMPLICIMODIFICATION",%POR=IMT("NF") D ORD,INCR
S20 G:'($D(^VBIS($I,IMT("YA2"),SFMAT))) S30
 S IMT("NF")=-1 F IMT("%FF")=1:1 S IMT("NF")=$N(^VBIS($I,IMT("YA2"),SFMAT,IMT("NF"))) Q:IMT("NF")=-1  S ^V($I,YA,IMT("NF"))=^VBIS($I,IMT("YA2"),SFMAT,IMT("NF")),^RAIS($I,YA,IMT("NF"))="IMPLICIMODIFICATION",%POR=IMT("NF") D ORD,INCR
S30 S IMT("NF")=-1 F IMT("%FF")=1:1 S IMT("NF")=$N(^[QUI]MATSTOCK(MSS,FMS,IMT("NF"))) Q:IMT("NF")=-1  D S1
 F IMT("III")=$$^%QZCHW("PRIX"),$$^%QZCHW("QTE.STOCK"),$$^%QZCHW("UNITE.STOCK") I '($D(^V($I,YA,IMT("III")))) S ^V($I,YA,IMT("III"))="",%POR=IMT("III") D ORD,INCR
 K RS,RRS,%RS G S2
S1 K %RS I $D(@%NOM)=10 D ^%VKMULNG G SUIT
 S RS=@%NOM D ^%VKMULC
SUIT K RRS S IMT("III")=-1 F IMT("%FF")=1:1 S IMT("III")=$N(%RS(IMT("III"))) Q:IMT("III")=-1  S RRS(IMT("III"))=%RS(IMT("III"))
 K %RS F IMT("III")=1:3:13 I $D(RRS(IMT("III"))),RRS(IMT("III"))'="",'($D(^V($I,YA,RRS(IMT("III"))))) D S40
 G S41
S40 S ^V($I,YA,RRS(IMT("III")))=RRS(IMT("III")+1),(%POR,PARA)=RRS(IMT("III")),VPA=RRS(IMT("III")+1) D ORD I $D(^[QUI]EXPGIMP(PARA,VPA))!$D(^[QUI]IGNORER(YA,PARA,VPA)) S %MODA="MAT" D ^TO3PASYS K %MODA
 D INCR Q
S41 S IMT("JJJ")=15 F IMT("III")=$$^%QZCHW("PRIX"),$$^%QZCHW("QTE.STOCK"),$$^%QZCHW("UNITE.STOCK") S IMT("JJJ")=IMT("JJJ")+1 I '($D(^V($I,YA,IMT("III")))),$D(%RS(IMT("JJJ"))),%RS(IMT("JJJ"))'="" S ^V($I,YA,IMT("III"))=%RS(IMT("JJJ")),%POR=IMT("III") D ORD,INCR
 S ^V($I,YA,$$^%QZCHW("MATIERE"))=MSS
 Q
S2 K %RS G:'($D(^[QUI]TRI(YA))) FIN S IMT("TOZEC")=^TOZE($I,"C"),IMT("TOZEA")=^TOZE($I,"A")
 S NTABN=$$^%QZCHW("MATIERE EN STOCK"),NCLE=3,PNUM=2,F1=18,NFOR=1,IMT("NTRI")="",IMT("PARA")=$$^%QZCHW(" "),IMT("CONDIT")=0
LOPAR S IMT("NTRI")=$O(^[QUI]TRI(YA,IMT("NTRI"))) G:%ABEND=1 FIN G:IMT("NTRI")="" FIN
 S IMT("PRXX")=^[QUI]TRI(YA,IMT("NTRI")),SOURCE=$E(IMT("PRXX"),2,$L(IMT("PRXX"))-1),IMT("PARA")=$P(IMT("PRXX"),",",2),IMT("PARAP")=$P(IMT("PARA"),"""",2) G:$D(^V($I,YA,IMT("PARAP"))) LOPAR
 I (IMT("PARAP")'["$ARG")&(IMT("PARAP")'["%VAL") S ANC=IMT("PARAP") D ^TOEVCOUR
TESCOND 
RETERR Q:%ABEND=1  S $ZT=IMT("TOZEC") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S IMT("CONDIT")=RES1 G ROLO
NOLO S IMT("ATEST")="^[QUI]CIMPMAT"_IMT("PRXX"),IMT("CATEST")=@IMT("ATEST"),@("IMT(""CONDIT"")="_IMT("CATEST"))
ROLO G:IMT("CONDIT")=0 LOPAR K IMT("CATEST")
 S $ZT=IMT("TOZEA"),IMT("AFFECT")="^[QUI]AIMPMAT"_IMT("PRXX") D SIFON G:IMT("SIF") SIF1
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S IMT("AFFECT")="%RESULT",%RESULT="RES1"
SIF1 G:%ABEND=1 LOPAR S @("^V($I,YA,IMT(""PARAP""))="_@IMT("AFFECT"))
 I IMT("PARAP")=$$^%QZCHW("ARRET"),^V($I,YA,IMT("PARAP"))=1 D ABEND G LOPAR
 G:(IMT("PARAP")["$ARG")!((IMT("PARAP")["%ARGI")!(IMT("PARAP")["%VALAB")) LOPAR S ^RAIS($I,MSS,IMT("PARAP"))="^[QUI]IMPMAT"_IMT("PRXX")
 S %POR=IMT("PARAP") D TRI
 G:$D(^[QUI]EXPGIMP(IMT("PARAP"),^V($I,YA,IMT("PARAP"))))!$D(^[QUI]IGNORER(YA,IMT("PARAP"),^V($I,YA,IMT("PARAP")))) ABXY
 K IMT("AOPARA") S:$D(PARA) IMT("AOPARA")=PARA S %MODA="MAT",PARA=IMT("PARAP"),VPA=^V($I,YA,IMT("PARAP")) D ^TO3PASYS S:$D(IMT("AOPARA")) PARA=IMT("AOPARA") K IMT("AOPARA")
ABXY D INCR G LOPAR
FIN D ^TO3IMABI
FIN1 S IMT("PMAT")=-1 F IMT("UU")=0:0 S IMT("PMAT")=$N(^V($I,YA,IMT("PMAT"))) G:IMT("PMAT")=-1 END S ^M($I,MSS,IMT("PMAT"))=^V($I,YA,IMT("PMAT"))
END S ^M($I,MSS,$$^%QZCHW("ARTICLE"))=IMT("YA2") D LIST K ^V($I,YA) S YA=IMT("YA2") K IMT,^V($I,SFMAT),%NOM,%RS,ARTICLE,%POR,PARA,%MODA,VPA,PARA Q
LIST Q
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",IMT("PARA")," * non defini, nous aurons peut-etre des problemes" H 3 Q
SIFON S IMT("SIF")=0 Q:@IMT("AFFECT")'["$"  S CONTAF=@IMT("AFFECT") G:CONTAF'["$$" FORD S IMT("SIF")=1,CONTAF=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF)
 S EXPFONC=CONTAF,ROUTI="^"_$E($P(CONTAF,"/",1),3,299) D @ROUTI S IMT("AFFECT")="%RESUL",%RESUL="%RESULTAT"
 K CONTAF,EXPFONC,ROUTI Q
ORD S $ZT="G FORD",^ORDEVAL($I,TWREF,MSS,@^CPTPAR(2))=%POR_"^^"_^V($I,YA,%POR)
FORD Q
INCR S $ZT="G FORD",@^CPTPAR(2)=@^CPTPAR(2)+1 G FORD
TRI S $ZT="G FORD",^ORDEVAL($I,TWREF,MSS,@^CPTPAR(2))=%POR_"^"_IMT("NTRI")_"^"_^V($I,YA,%POR) G FORD
ABEND D ^%VSQUEAK,POCLEPA^%VVIDEO S %ABEND=1 W $$^%QZCHW("ARRET de l'etude matiere "),YA R:BATCH=0 *%POR:10 D POCLEPA^%VVIDEO Q
YAERR S zzz=xxx Q

