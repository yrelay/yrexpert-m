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

;TO42COMP^INT^1^59547,74870^0
TO42COMP ;
 
TRAIT S %ACCEPAR=0
 I '($D(^TOZE($I,"TRACOMP"))) S ^TOZE($I,"TRACOMP")=0
 I ^TOZE($I,"TRACOMP")=1 W !,$$^%QZCHW("Parametre : "),PAR," VSOURCE=",VSOURCE," VCOMP=",VCOMP
 I (VSOURCE="")!(VCOMP="") G ACCEPT
 S %PCH=VCOMP D ^%QZNBN1 S:ISNUM VCOMP=VCOMP*1 S NUCOMP=ISNUM,%PCH=VSOURCE D ^%QZNBN1 S:ISNUM VSOURCE=VSOURCE*1 S NUSOUR=ISNUM
 I (VCOMP'[",")&(VSOURCE'[",") G NOINT
 S CINT=0,SINT=0
 I VCOMP["," S CINT=1,%VCOMP=VCOMP D ^TO42INTE S CVMIN=%VMIN,CVMAX=%VMAX,CGCO=%FCO,CDCO=%DCO
 I VSOURCE["," S SINT=1,%VCOMP=VSOURCE D ^TO42INTE S SVMIN=%VMIN,SVMAX=%VMAX,SGCO=%FCO,SDCO=%DCO
 I (CINT'=1)!(SINT'=1) G S1
 I (SVMIN="")&(CVMIN="") S EXX="SVMAX"_CDCO_"CVMAX",@("RESINT="_EXX) G AL
 I SVMIN="" S RESINT=0 G AL
 I CVMIN="" S EXX="SVMAX"_CDCO_"CVMAX",@("RESINT="_EXX) G AL
 S EXX="SVMAX"_CDCO_"CVMAX&(SVMIN"_CGCO_"CVMIN)",@("RESINT="_EXX) G AL
S1 I CINT=0 G S2
 I CVMIN="" S EXX="VSOURCE"_CDCO_"CVMAX",@("RESINT="_EXX) G AL
 S EXX="VSOURCE"_CDCO_"CVMAX&(VSOURCE"_CGCO_"CVMIN)",@("RESINT="_EXX) G AL
S2 I SVMIN="" S EXX="",EXX="VCOMP"_SCDO_"SVMAX",@("RESINT="_EXX) G AL
 S EXX="VCOMP"_SDCO_"SVMAX&(VCOMP"_SGCO_"SVMIN)",@("RESINT="_EXX) G AL
ZZZ D DESAC G END
NOINT I VSOURCE=VCOMP G ACCEPT
 
 I (VSOURCE="")!(VCOMP="") G ACCEPT
 I $D(^[QUI]COMPARAT(YA,PAR,VCOMP,VSOURCE)) S REFCOM="YA,PAR,VCOMP,VSOURCE",CTAB="^[QUI]COMPARAT("_REFCOM_")" D SUIT G END
 I $D(^[QUI]COMPARAT(YA,PAR,PAR_"'REALISATION",PAR)) S REFCOM="YA,PAR,PAR_""'REALISATION"",PAR",CTAB="^[QUI]COMPARAT("_REFCOM_")" D SUIT G FIN
 S %ACCEPAR=0 D DESAC G END
ACCEPT S %ACCEPAR=1 G END
SUIT S NUCOND=-1,%ACCEPAR=0
SU0 S $ZT="ERR",NUCOND=$N(@CTAB@(NUCOND)) G:NUCOND=-1 SU1 S ATEST="^[QUI]CCOMPARA("_REFCOM_","_NUCOND_")",@("%ACCEPAR="_@ATEST) G:%ACCEPAR=1 FIN G SU0
SU1 D DESAC
FIN S $ZT="" Q
ERR G SU0
END K PAR,WWA,WWR,VSOURCE,VCOMP,REFCOM,CTAB,NUCOND,ATEST,%PCH,%CROC1,%CROC2,CTAB,%DCO,EXX,%FCO,ISNUM,NUCOMP,NUSOUR,REFCOM,RESINT,%VMAX,%VMIN,WWA,SVMAX,SVMIN,ADCO,SGCO,CVMAX,CVMIN,CGCO,CDCO Q
DESAC S ^CHDESAC($I,%NDESAC)=PAR_"("_VCOMP_")" G FIN
AL W:^TOZE($I,"TRACOMP")=1 " ==> ",RESINT G:RESINT'=1 ZZZ S %ACCEPAR=1 G END

