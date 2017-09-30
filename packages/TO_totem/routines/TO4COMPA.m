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

;TO4COMPA^INT^1^59547,74871^0
TO4COMPA ;
 
 S NAPAR=-1,%ACCECH=1,%ACCEPAR=0 F WWR=0:0 S %ACCEPAR=0,NAPAR=$N(^V($I,YA,NAPAR)) G:NAPAR=-1 END S VSOURCE=^V($I,YA,NAPAR),VCOMP=$P(%CHPAR,"/",^ITO4GEXP($I,NAPAR)) D TRAIT I (%ACCEPAR=0)&(%NDESAC>%DESAC) S %ACCECH=0 G END
TRAIT I $D(^TOZE($I,"TRACOMP")),^TOZE($I,"TRACOMP")=1 W !,$$^%QZCHW("Parametre : "),NAPAR,$$^%QZCHW(" VSOURCE="),VSOURCE,$$^%QZCHW(" VCOMP="),VCOMP
 S %PCH=VCOMP D ^%QZNBN1 S NUCOMP=ISNUM,%PCH=VSOURCE D ^%QZNBN1 S NUSOUR=ISNUM
 I VCOMP'["," G NOINT
 S VMIN=$P(VCOMP,",",1),VMAX=$P(VCOMP,",",2)
 S CROC1=$E(VMIN,1),CROC2=$E(VMAX,$L(VMAX)),FCO="'>",DCO="'<"
 I (CROC1="[")!(CROC1="]") S VMIN=$E(VMIN,2,299),FCO=$S(CROC1="[":"'<",1:">")
 I (CROC2="[")!(CROC2="]") S VMAX=$E(VMAX,1,$L(VMAX)-1),DCO=$S(CROC2="]":"'>",1:"<")
 I VMIN="" S EXX="VSOURCE"_DCO_"VMAX",@("RESINT="_EXX) G:RESINT'=1 ZZZ S %ACCEPAR=1 G FIN
 S EXX="VSOURCE"_DCO_"VMAX&(VSOURCE"_FCO_"VMIN)",@("RESINT="_EXX) I RESINT=1 S %ACCEPAR=1 G FIN
ZZZ S %NDESAC=%NDESAC+1 D DESAC G FIN
NOINT I VSOURCE=VCOMP G ACCEPT
 
 I (VSOURCE="")!(VCOMP="") G ACCEPT
 I $D(^[QUI]COMPARAT(YA,NAPAR,VCOMP,VSOURCE)) S REFCOM="YA,NAPAR,VCOMP,VSOURCE",CTAB="^[QUI]COMPARAT("_REFCOM_")" D SUIT G FIN
 I $D(^[QUI]COMPARAT(YA,NAPAR,NAPAR_"'REALISATION",NAPAR)) S REFCOM="YA,NAPAR,NAPAR_""'REALISATION"",NAPAR",CTAB="^[QUI]COMPARAT("_REFCOM_")" D SUIT G FIN
 S %ACCEPAR=0,%NDESAC=%NDESAC+1 G FIN
ACCEPT S %ACCEPAR=1 G FIN
SUIT S NUCOND=-1,%ACCEPAR=0 F WWA=0:0 S NUCOND=$N(@CTAB@(NUCOND)) Q:NUCOND=-1  S ATEST="^[QUI]CCOMPARA("_REFCOM_","_NUCOND_")",@("%ACCEPAR="_@ATEST) G:%ACCEPAR=1 FIN
 S %NDESAC=%NDESAC+1 D DESAC
FIN Q
END K NAPAR,WWA,WWR,VSOURCE,VCOMP,REFCOM,CTAB,NUCOND,ATEST Q
DESAC S ^DESACOR($I,NUEQ)=$S($D(^DESACOR($I,NUEQ)):^DESACOR($I,NUEQ),1:"")_NAPAR_"("_VCOMP_")"_"^" G FIN

