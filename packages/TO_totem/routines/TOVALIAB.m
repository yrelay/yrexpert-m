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

;TOVALIAB^INT^1^59547,74876^0
TOVALIAB ;
 S $ZT="" K TVL,%NBDEF
 K ^DOLDMD($I) S %RESULTAT=0,TVL("%NBDEF")=0,TVL("%NBSOL")=1,TVL("TRACE")=0 K ^GRSOL($I) S %RESULTAT=0
 S @("TVL(""NUGROU"")="_$P(EXPFONC,"/",2)),@("TVL(""SSGRO"")="_$P(EXPFONC,"/",3)),@("TVL(""TYP"")="_$P(EXPFONC,"/",4)),TVL("TYPN")=$P(EXPFONC,"/",5) S:TVL("TYPN")=0 TVL("TYPN")=$$^%QZCHW("SANS") S QUW=$S(TVL("TYP")=0:^TABIDENT($I,"%UCI"),1:QUI)
 I TVL("TYPN")=$$^%QZCHW("SANS") G TT
RETN S TVL("CTYPN")=TVL("TYPN"),TVL("TYPN")=$P($P(TVL("TYPN"),",",3),"""",2) I $D(@TVL("CTYPN")) S TVL("NORM")=@TVL("CTYPN") G T0
 K ^TBPARV($I) S ^TBPARV($I,TYPN)="???" G N^TOERRAB2
RET1 G:%ABEND=1 FIN S TVL("NORM")=@TVL("CTYPN") S:(TVL("NORM")=$$^%QZCHW("TOUTES"))!((TVL("NORM")=$$^%QZCHW("TOUS"))!(TVL("NORM")=$$^%QZCHW("SANS"))) TVL("TYPN")=$$^%QZCHW("SANS") G:TVL("TYPN")=$$^%QZCHW("SANS") TT G T0
TT S TVL("NORM")=-1
T0 S QUW=$S(TVL("TYP")=0:^TABIDENT($I,"%UCI"),1:QUI) G:TVL("NORM")=-1 PLUS
 S NUGR=-1 F TVL("%TW")=1:1 S NUGR=$N(^[QUW]SSGRGRI(TVL("NUGROU"),TVL("SSGRO"),NUGR)) Q:NUGR=-1  I $D(^[QUW]GRTYPN(NUGR,TVL("TYPN"),TVL("NORM"))) Q
 G:NUGR=-1 FIN D T1 G FIN
PLUS S NUGR=-1
PLUS1 S NUGR=$N(^[QUW]SSGRGRI(TVL("NUGROU"),TVL("SSGRO"),NUGR)) G:NUGR=-1 FIN S TVL("VN")=-1
PLUS2 S TVL("VN")=$N(^[QUW]GRTYPN(NUGR,TVL("TYPN"),TVL("VN"))) G:TVL("VN")=-1 PLUS1
 D T1 G:%ABEND=1 FIN G:%RESULTAT=1 FIN G PLUS2
T1 G:'($D(^[QUW]PARAGRIL(NUGR))) END S TVL("%NBPAR")=^[QUW]PARAGRIL(NUGR) K ^GRIL($I),^VPAR($I)
 S TVL("%SCPR")=$S($D(^[QUW]GROUGRIL(NUGR)):$P(^[QUW]GROUGRIL(NUGR),"|",3),1:"N"),TVL("%SCPR")=$E(TVL("%SCPR"),1) S:TVL("%SCPR")="" TVL("%SCPR")="N"
 S TVL("PPGR")=-1 F TVL("QQ")=0:0 S TVL("PPGR")=$N(^[QUW]PARAGRIL(NUGR,TVL("PPGR"))) Q:TVL("PPGR")=-1  S ^GRIL($I,TVL("PPGR"))="?"
RETERR Q:%ABEND=1  K ^TBPARV($I),^VPAR($I) S %LL=6,TVL("PPGR")=-1,TVL("IND")=0,TVL("%REFD")=NUGR
LPR S TVL("PPGR")=$N(^GRIL($I,TVL("PPGR"))) G:TVL("PPGR")=-1 LPRS
 S:'($D(^V($I,YA,TVL("PPGR")))) TVL("IND")=1 S TVL("VPAR")=$S($D(^V($I,YA,TVL("PPGR"))):^V($I,YA,TVL("PPGR")),1:"???"),^VPAR($I,TVL("PPGR"))=TVL("VPAR"),^TBPARV($I,TVL("PPGR"))=TVL("VPAR"),TVL("%REFD")=TVL("%REFD")_","""_TVL("VPAR")_""""
 I TVL("VPAR")'["??" S TVL("VAL")=^VPAR($I,TVL("PPGR")),TVL("UNI")="E" D UNITE S ^TBPARV($I,TVL("PPGR"))=TVL("VAL"),^VPAR($I,TVL("PPGR"))=TVL("VAL")
 G LPR
LPRS I $D(^[QUW]GROUGRIL(NUGR)) S ANC="Abaque : "_$P($P(^[QUW]GROUGRIL(NUGR),"|",2),"^",1) D ^TOEVCOUR
 I TVL("IND")=1 G P^TOERRAB2 Q:%ABEND=1
 G:'($D(@("^[QUW]ABDEJEV("_TVL("%REFD")_")"))) LPRS1 S %RESULTAT=1,TVL("REF")=@("^[QUW]ABDEJEV("_TVL("%REFD")_")") G:TVL("REF")="?" NONOK G OK3
LPRS1 G:'($D(^[QUW]EVALGRIL(NUGR))) END D ^TO6SAVTR S %TAD="^TOPDPTV2",NOMTREE="^[QUW]GRUPLET(NUGR",TVL("ACCEPT")=0 D TREEWAYR S:STOP'=1 TVL("ACCEPT")=0 S ^SAVE($I,"ACCEPT")=TVL("ACCEPT") D RES^TO6SAVTR
 I TVL("ACCEPT")=1 G OK
 I '($D(^GRSOL($I))) G NONOK S @("^[QUW]ABDEJEV("_TVL("%REFD")_")")="?" G NONOK
 S TVL("%NBDEF")=$N(^GRSOL($I,-1)),TVL("%NBSOL")=$N(^GRSOL($I,TVL("%NBDEF"),-1)),%TAB="^[QUW]GRUPLET("_^GRSOL($I,TVL("%NBDEF"),TVL("%NBSOL"))_")" G OK2
NONOK S %RESULTAT=0 G END
OK S %RESULTAT=1,TVL("REF")=NUGR,TVL("PRESU")=-1 F TVL("%TW")=1:1 S TVL("PRESU")=$N(^[QUW]EVALGRIL(NUGR,TVL("PRESU"))) Q:TVL("PRESU")=-1  S B=^[QUW]EVALGRIL(NUGR,TVL("PRESU")),TVL("REF")=TVL("REF")_","""_^GRIL($I,B)_""""
 S @("^[QUW]ABDEJEV("_TVL("%REFD")_")")=TVL("REF")
OK3 S %TAB="^[QUW]GRUPLET("_TVL("REF")_")"
OK2 S TVL("RG")=$S($D(^[QUI]GROUGRIL(NUGR)):$P(^[QUI]GROUGRIL(NUGR),"|",2),1:"???"),TVL("BGR")="" F TVL("%R")=1:1:3 S TVL("BGR")=TVL("BGR")_$P(TVL("RG"),"^",TVL("%R"))_"#"
 S %RESULTAT=1,TVL("PRESU")=-1 F TVL("IU")=1:1 S TVL("PRESU")=$N(@%TAB@(TVL("PRESU"))) Q:TVL("PRESU")=-1  I '($D(^V($I,YA,TVL("PRESU")))) D AFF
 I $D(^DOLDMD($I)) D ^TOABDMD,^TOTCADRE G:%ABEND=1 END
 G END
AFF S TVL("PPGR")=TVL("PRESU"),TVL("%VV")=@%TAB@(TVL("PRESU")),TVL("VAL")=$P(TVL("%VV"),"|",1),TVL("UNI")="S" D UNITE S TVL("%VAL")=TVL("VAL"),TVL("%PG")=$P(TVL("%VV"),"|",2)
 S ^V($I,YA,TVL("PRESU"))=TVL("%VAL"),@%TABTV@(TVL("PRESU"))=TVL("%VAL"),@%TABRA@(TVL("PRESU"))="ABAQUE^"_TVL("%PG")_"^"_TVL("BGR")_"^"_TVL("TYP") D GETDEP Q
AAFF 
 G END
FIN K TVL,%NBDEF,%POR,VPA,%INT,%MODA
 K %TAB,%TAD Q
END Q
GETDEP I %TABTV["TVPAR" S %POR=TVL("PRESU") D ^TORDEVAR G GETA
 S %POR=TVL("PRESU") D ^TORDEVMT
GETA I $D(^[QUI]EXPGIMP(TVL("PRESU"),TVL("%VAL")))!$D(^[QUI]IGNORER(YA,TVL("PRESU"),TVL("%VAL"))) G GETB
GETC I %TABTV["TVPAR" D INCR^TORDEVAR G END
 D INCR^TORDEVMT G END
GETB K TVL("AOPARA") S:$D(PARA) TVL("AOPARA")=PARA S:'($D(%LIEU)) %LIEU="" S VPA=TVL("%VAL"),%MODA=$S(%LIEU["Mat":"MAT",1:"ART") D ^TO3PASYS S:$D(TVL("AOPARA")) PARA=TVL("AOPARA") G GETC
UNITE I TVL("VAL")["$DMD" S ^DOLDMD($I,TVL("PRESU"))=1 G FUNIT
 I ('($D(^[QUI]UNITECR(YA,TVL("PPGR"),NUGR))))!('($D(^[QUI]UNITEXP(YA,TVL("PPGR"),NUGR)))) G FUNIT
 I (^[QUI]UNITECR(YA,TVL("PPGR"),NUGR)="")!(^[QUI]UNITEXP(YA,TVL("PPGR"),NUGR)="") G FUNIT
 S TVL("UNECR")=^[QUI]UNITECR(YA,TVL("PPGR"),NUGR),TVL("UNEXP")=^[QUI]UNITEXP(YA,TVL("PPGR"),NUGR),^[QUI]UNITE(YA,TVL("PPGR"))=TVL("UNEXP") G FUNIT:TVL("UNECR")=TVL("UNEXP")
 I $D(^[QUI]CONVUNIT(TVL("UNEXP"),TVL("UNECR"))) S TVL("CONV")=$P(^[QUI]CONVUNIT(TVL("UNEXP"),TVL("UNECR")),"^",1),TVL("VAL")=$S(TVL("UNI")="E":TVL("VAL")*TVL("CONV"),1:TVL("VAL")/TVL("CONV")) G FUNIT
 I $D(^[QUI]CONVUNIT(TVL("UNECR"),TVL("UNEXP"))) S TVL("CONV")=$P(^[QUI]CONVUNIT(TVL("UNECR"),TVL("UNEXP")),"^",1),TVL("VAL")=$S(TVL("UNI")="E":TVL("VAL")/TVL("CONV"),1:TVL("VAL")*TVL("CONV"))
FUNIT Q
TREEWAYR 
 S STOP=0,%WT("%2I")=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE) I ($D(@%WT("%2I"))#10)=1 S (%WT("%1C"),%TREFC)="" D @%TAD Q:STOP'=0
 S %WT("%2I")=$S(NOMTREE["(":NOMTREE_",",1:NOMTREE),%WT("%2V")=0,%WT("%2P")=1 F %WT("%2Z")=0:0 S %WT("%2P")=$F(%WT("%2I"),",",%WT("%2P")) Q:%WT("%2P")=0  S %WT("%2V")=%WT("%2V")+1
 S %WT("%2IPR")=%WT("%2V")+1 K %WT("%2V"),%WT("%2P"),%WT("%2I"),%WT("%2Z")
 S %1G=NOMTREE_$S(NOMTREE["(":")",1:""),%WT("%2G")=NOMTREE_$S(%1G[")":",",1:"(")_"%WT(""%2""),",%WT("%2")="" F %WT("%1")=1:1 S (%PR,%WT("%2R"))=%WT("%2IPR"),%WT("%2")=$O(@%1G@(%WT("%2"))) Q:%WT("%2")=""  D AFFR Q:STOP=1
 K %WT,%0,%WT("%2IPR"),%WT("%1C"),%WT("%2G"),%2,%WT("%1"),%WT("%2P"),%1G,%2S,%3S,%WT("%1Z"),%2L Q
AFFR I $D(@%1G@(%WT("%2")))#10 D TR S %TREFC=""""_%WT("%LIB1")_"""",%WT("%1C")=%WT("%2") D @%TAD G:STOP'=0 FRES G:'($D(@%1G@(%WT("%2")))\10) FRES S (%PR,%WT("%2R"))=%PR+1 D ARRAY2 G FRES
 S (%PR,%WT("%2R"))=%PR+1 D ARRAY2
FRES S:STOP="F" STOP=0 Q
ARRAY2 S %2S="%3S)"
DESCEN2 Q:STOP=1  N %2L,%3S,%PR S %PR=%WT("%2R"),%2L=$L(%2S)-4,%3S="" F %WT("%1Z")=0:0 S %3S=$O(@(%WT("%2G")_%2S)) Q:%3S=""  D SUBS2 Q:STOP=1
 Q
SUBS2 I $D(@(%WT("%2G")_%2S))#10 D TR S %TREFC=""""_%WT("%LIB1")_""","_%2S,%WT("%21")=%WT("%2"),%WT("%2")=%3S D TR S %WT("%2")=%WT("%21"),%TREFC=$P(%TREFC,"%3S",1)_""""_%WT("%LIB1")_"""",%WT("%1C")=%3S D @%TAD Q:STOP=1  I STOP="F" S STOP=0 Q
 I $D(@(%WT("%2G")_%2S))\10 S %2S=$E(%2S,1,%2L)_""""_%3S_""""_",%3S)",%WT("%2R")=%PR+1 D DESCEN2 Q:STOP'=0  S %2S=$E(%2S,1,%2L)_"%3S)"
 Q
TR S %WT("%LIB1")=$P(%WT("%2"),"""",1) Q:%WT("%LIB1")=%WT("%2")  S %CAR="""",RS=%WT("%2") D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %WT("%U")=2:1:%NBCAR S %WT("%LI")=$P(%WT("%2"),"""",%WT("%U")),%WT("%LIB1")=%WT("%LIB1")_""""""_%WT("%LI")
FINT K %WT,%NBCAR Q

