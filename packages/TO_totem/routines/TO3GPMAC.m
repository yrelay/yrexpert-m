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

;TO3GPMAC^INT^1^59547,74870^0
TO3GPMAC ;
 
 S %LIEU=$$^%QZCHW("Etude machine") D ^TO3WLIEU K ^S($I,MSS),^V($I,SFMA2) S GPM("SFMA3")=SFMA2,%NOM="^[QUI]DESMACH(MSS,GPM(""SFMA3""))",(%TABRA,%TABTV)="^V($I,""z"")" D GETSEC S GPM("YA2")=YA,YA=SFMA2 I $D(@%NOM)=10 D ^%VKMULNG G SUIT
 G:'($D(@%NOM)) END S RS=@%NOM D ^%VKMULC
SUIT S (TAUX,^V($I,YA,$$^%QZCHW("TAUX.HORAIRE")))=%RS(2),^V($I,YA,$$^%QZCHW("%MACHINE"))=MSS
 S ^V($I,YA,$$^%QZCHW("ARTICLE"))=GPM("YA2"),ARTICLE=GPM("YA2")
 S GPM("NUM")=-1 F GPM("JJ")=0:0 S GPM("NUM")=$N(^[QUI]PEXPMACH(MSS,GPM("NUM"))) Q:GPM("NUM")=-1  D GET
 K GPM("RRS") G S1
GET S %NOM="^[QUI]PEXPMACH(MSS,GPM(""NUM""))" I $D(@%NOM)=10 D ^%VKMULNG G S2
 S RS=^[QUI]PEXPMACH(MSS,GPM("NUM")) D ^%VKMULC
S2 K GPM("RRS") S GPM("RS")=-1 F GPM("IJ")=1:1 S GPM("RS")=$N(%RS(GPM("RS"))) Q:GPM("RS")=-1  S GPM("RRS",GPM("RS"))=%RS(GPM("RS"))
 K %RS F GPM("IJ")=1:3:22 I $D(GPM("RRS",GPM("IJ"))),GPM("RRS",GPM("IJ"))'="" D S20
 Q
S20 S ^V($I,YA,GPM("RRS",GPM("IJ")))=GPM("RRS",GPM("IJ")+1),PARA=GPM("RRS",GPM("IJ")),VPA=GPM("RRS",GPM("IJ")+1) I VPA'="",$D(^[QUI]EXPGIMP(PARA,VPA))!$D(^[QUI]IGNORER(YA,PARA,VPA)) S %MODA="MAC" D ^TO3PASYS
 Q
S1 G:'($D(^[QUI]TRI(YA))) FIN
 S NTABN=$$^%QZCHW("MACHINE"),NCLE=3,PNUM=2,F1=18,NFOR=1,GPM("NTRI")="",PARA=$$^%QZCHW(" "),GPM("CONDIT")=0
LOPAR S GPM("NTRI")=$O(^[QUI]TRI(YA,GPM("NTRI"))) G:GPM("NTRI")="" FIN
 S GPM("PRXX")=^[QUI]TRI(YA,GPM("NTRI")),SOURCE=$E(GPM("PRXX"),2,$L(GPM("PRXX"))-1) G:($P(GPM("PRXX"),",",2)=PARA)&(GPM("CONDIT")=1) LOPAR
 D:($P(GPM("PRXX"),",",2)'=PARA)&$D(^UNDEFCI(PARA)) AVERTI S ^UNDEFCI($P(GPM("PRXX"),",",2))=1,PARA=$P(GPM("PRXX"),",",2),PARAP=$P($P(GPM("PRXX"),",",2),"""",2) I (PARAP'["$ARG")&(PARAP'["%VAL") S ANC=PARAP D ^TOEVCOUR
 D TESCOND G LOPAR
TESCOND S NTABN="Parametres MACHINE",NCLE=3,PNUM=2,F1=18,NFOR=1
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C"),PARA=$P(GPM("PRXX"),",",2),GPM("PARAP")=$P(PARA,"""",2) G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S GPM("CONDIT")=RES1 G ROLO
NOLO S GPM("ATEST")="^[QUI]CIMPMAC"_GPM("PRXX"),@("GPM(""CONDIT"")="_@GPM("ATEST"))
ROLO Q:GPM("CONDIT")=0  K ^UNDEFCI(PARA)
 S $ZT=^TOZE($I,"A"),(AFFECT,GPM("AFFECT"))="^[QUI]AIMPMAC"_GPM("PRXX") D ^TO3SIFON Q:%ABEND=1  G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1
 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S (AFFECT,GPM("AFFECT"))="%RESUL",%RESUL="RES1"
SIF1 S @("^V($I,YA,GPM(""PARAP""))="_@AFFECT)
 Q:('($D(^[QUI]EXPGIMP(GPM("PARAP"),^V($I,YA,GPM("PARAP"))))))&('($D(^[QUI]IGNORER(YA,GPM("PARAP"),^V($I,YA,GPM("PARAP"))))))
 K GPM("AOPARA") S:$D(PARA) GPM("AOPARA")=PARA S %MODA="MAC",PARA=GPM("PARAP"),VPA=^V($I,YA,GPM("PARAP")) D ^TO3PASYS S:$D(GPM("AOPARA")) PARA=GPM("AOPARA") K GPM("AOPARA")
 Q
FIN D ^TO3IMCBI
 S GPM("PMAT")=-1,GPM("OPOG")=OP_"/"_OG F GPM("UU")=0:0 S GPM("PMAT")=$N(^V($I,YA,GPM("PMAT"))) G:GPM("PMAT")=-1 END S ^S($I,MSS,GPM("PMAT"))=^V($I,YA,GPM("PMAT")),^S($I,NUFA,TWREF,GPM("OPOG"),MSS,GPM("PMAT"))=^V($I,YA,GPM("PMAT"))
END S ^S($I,MSS,$$^%QZCHW("ARTICLE"))=GPM("YA2"),YA=GPM("YA2") K ^V($I,SFMA2),%CAR,%RESUL,%RESULTA,SIF,VPA,ARTICLE,F1,GPM Q
LIST Q
AVERTI Q
GETSEC K ^GSECT($I) S (GPM("CAR"),%CAR)=".",RS=SFMA2,GPM("GSECT")=0 D ^%QZCHNBC S GPM("NBCAR")=%NBCAR+1
GST S GPM("NU")=GPM("NBCAR"),GPM("GST")="" F GPM("SS")=1:1:GPM("NBCAR") S GPM("GSTP")=$P(SFMA2,GPM("CAR"),GPM("SS")),GPM("GST")=GPM("GST")_$S(GPM("GST")="":"",1:GPM("CAR"))_GPM("GSTP"),^GSECT($I,GPM("NU"))=GPM("GST"),GPM("NU")=GPM("NU")-1
 F GPM("SS")=1:1:GPM("NBCAR") S GPM("GSTP")=^GSECT($I,GPM("SS")) I $D(^[QUI]IMPMAC(GPM("GSTP"))) S GPM("GSECT")=1,SFMA2=GPM("GSTP") G FSECT
FSECT K ^GSECT($I),%CAR,%NBCAR Q
YAERR S GPM("xxx")=GPM("zzz") Q

