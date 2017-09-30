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

;TODUPTAB^INT^1^59547,74872^0
TODUPTAB ;
 
DUPTR 
 K ^[QUI]TREEWORK(NUFAC) S NOMTREE="^[QUI]TREEWORK("""_NUFA_"""",%TREECOP="^[QUI]TREEWORK("""_NUFAC_"""" D ^%QCAGLC
END K DATAC,%TAD,NOMTREE,%TREECOP G FIN
DUPRA 
21 K ^[QUI]RAISON(NUFAC) S NOMTREE="^[QUI]RAISON("""_NUFA_"""",%TREECOP="^[QUI]RAISON("""_NUFAC_"""" D ^%QCAGLC
END1 K %TAD,NOMTREE,%TREECOP,%TREFC,DATAC G FIN
DUPOA 
 K ^[QUI]ORDEVAL(NUFAC) S NOMTREE="^[QUI]ORDEVAL("""_NUFA_"""",%TREECOP="^[QUI]ORDEVAL("""_NUFAC_"""" D ^%QCAGLC
 K ^[QUI]CPTEUR(NUFAC) S NOMTREE="^[QUI]CPTEUR("""_NUFA_"""",%TREECOP="^[QUI]CPTEUR("""_NUFAC_"""" D ^%QCAGLC
END2 K %TAD,NOMTREE,%TREFC,DATAC,%TREECOP G FIN
DUPTV 
 K ^[QUI]TVPAR(NUFAC) S NOMTAB="^[QUI]TVPAR(NUFA)"
 S B2=-1 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) G:B2=-1 END3 S B3=-1 F QU=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  D TRAIT3
TRAIT3 S ^[QUI]TVPAR(NUFAC,B2,B3)=@NOMTAB@(B2,B3)
 G FIN
END3 K NOMTAB,B2,UQ,B3 G FIN
DUPRL 
 K ^[QUI]PAREFLAT(NUFAC) S NOMTAB="^[QUI]PAREFLAT(NUFA)"
 S B2=-1 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) G:B2=-1 END4 S B3=-1 F QU=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  D TRAIT4
TRAIT4 S ^[QUI]PAREFLAT(NUFAC,B2,B3)=@NOMTAB@(B2,B3)
 G FIN
END4 K NOMTAB,B2,UQ,B3 G FIN
DUPPM 
 K ^[QUI]PARMAT(NUFAC) S NOMTAB="^[QUI]PARMAT(NUFA)"
 S B2=-1 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) G:B2=-1 END5 S B3=-1 F QU=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  D TRAIT5
TRAIT5 S ^[QUI]PARMAT(NUFAC,B2,B3)=@NOMTAB@(B2,B3)
 G FIN
END5 K NOMTAB,B2,B3,UQ G FIN
PORDMT 
 G:'($D(^ORDEVAL($I))) END6
 S TWREF=$N(^ORDEVAL($I,-1)) G:TWREF=-1 END6 G:'($D(^ORDEVAL($I,TWREF,TAM))) END6
 S DATAC="^ORDEVAL($I,TWREF,TAM)"
 S %1N=-1 F %1U=1:1 S %1N=$N(@DATAC@(%1N)) Q:%1N=-1  S ^[QUI]ORDEVAL(NUFAC,TWREF,"MAT",%1N)=@DATAC@(%1N) I $D(@DATAC)=11 D DEP
 K @(DATAC)
END6 K %1N,%2N,%1U,%2U G FIN
DEP S %2N=-1 F %2U=1:1 S %2N=$N(@DATAC@(%1N,%2N)) Q:%2N=-1  S ^[QUI]ORDEVAL(NUFAC,TWREF,"MAT",%1N,%2N)=@DATAC@(%1N,%2N)
 G FIN
DUPBIS 
 K ^BISIMP($I,NUFAC),^INDEF($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^BISIMP("_K1_","""_NUFA_"""",%TREECOP="^BISIMP("_K1_","""_NUFAC_"""" D ^%QCAGLC
 S %TB="^INDEF($I,NUFA)",%NB1=-1
L1 S %NB1=$N(@%TB@(%NB1)) G:%NB1=-1 END7 S %NB2=-1
L2 S %NB2=$N(@%TB@(%NB1,%NB2)) G:%NB2=-1 L1 S %NB3=-1
L3 S %NB3=$N(@%TB@(%NB1,%NB2,%NB3)) G:%NB3=-1 L2 S %NB4=-1
L4 S %NB4=$N(@%TB@(%NB1,%NB2,%NB3,%NB4)) G:%NB4=-1 L3 S %NB5=-1
L5 S %NB5=$N(@%TB@(%NB1,%NB2,%NB3,%NB4,%NB5)) G:%NB5=-1 L4
 I ($D(@%TB@(%NB1,%NB2,%NB3,%NB4,%NB5))#10)=1 S ^INDEF($I,NUFAC,%NB1,%NB2,%NB3,%NB4,%NB5)=1
 G L5
END7 K %TREECOP,K1,%TAD,DATAC,%TB,%NB1,%NB2,%NB3,%NB4,%NB5 G FIN
DUPFA 
 S TB=$P($T(TB),";;",2) F %U=1:1 S TBT=$P(TB,";",%U) Q:TBT=""  S TBC="^[QUI]"_TBT_"(NUFAC)",NOMTAB="^[QUI]"_TBT_"(NUFA)" D T0
 S TBT="DIM",TBC="^[QUI]"_TBT_"(NUFAC)",NOMTAB="^[QUI]"_TBT_"(NUFA)" K @(TBC) S B2=-1
 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) Q:B2=-1  S B3=-1 F UQ=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  S:($D(@NOMTAB@(B2,B3))#10)=1 @TBC@(B2,B3)=@NOMTAB@(B2,B3) S B4=-1 F UQ=0:0 S B4=$N(@NOMTAB@(B2,B3,B4)) Q:B4=-1  S @TBC@(B2,B3,B4)=@NOMTAB@(B2,B3,B4)
 G END8
T0 K @(TBC) S B2=-1 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) Q:B2=-1  S B3=-1 F UQ=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  S @TBC@(B2,B3)=@NOMTAB@(B2,B3)
 G FIN
END8 K NOMTAB,B2,UQ,B3,B4,TB,TBT,TBC G FIN
DUPHAD 
29 K ^PHASADM($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^PHASADM("_K1_","""_NUFA_"""",%TREECOP="^PHASADM("_K1_","""_NUFAC_"""" D ^%QCAGLC
END9 K %TAD,NOMTREE,%TREFC,DATAC,%TREECOP G FIN
TB ;;PHAS;SECT;CONS;COUT;DUREE
DUPGLO 
210 K ^GLOETUD($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^GLOETUD("_K1_","""_NUFA_"""",%TREECOP="^GLOETUD("_K1_","""_NUFAC_"""" D ^%QCAGLC
END10 K %TAD,K1,%TREECOP,NOMTREE,%TREFC,DATAC G FIN
DUPTEN 
211 K ^TENTATIV($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^TENTATIV("_K1_","""_NUFA_"""",%TREECOP="^TENTATIV("_K1_","""_NUFAC_"""" D ^%QCAGLC
END11 K %TREECOP,K1,%TAD,NOMTREE,%TREFC,DATAC G FIN
DUPREV 
 K ^NBRGLEV($I,NUFAC) S TBC="^NBRGLEV($I)" F IT="COUR","OLD" S @TBC@(NUFAC,IT)=$S($D(@TBC@(NUFA,IT)):@TBC@(NUFA,IT),1:0)
END12 K IT,TBC G FIN
DUPMAC 
 K ^[QUI]PARMAC(NUFAC) S NOMTAB="^[QUI]PARMAC(NUFA)"
 S B2=-1 F UQ=0:0 S B2=$N(@NOMTAB@(B2)) G:B2=-1 END13 S B3=-1 F QU=0:0 S B3=$N(@NOMTAB@(B2,B3)) Q:B3=-1  S B4=-1 F QU=0:0 S B4=$N(@NOMTAB@(B2,B3,B4)) Q:B4=-1  D TRAIT13
TRAIT13 S ^[QUI]PARMAC(NUFAC,B2,B3,B4)=@NOMTAB@(B2,B3,B4)
 G FIN
END13 K NOMTAB,B4,B2,UQ,B3 G FIN
DUPHSU 
214 K ^PHASE($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^PHASE("_K1_","""_NUFA_"""",%TREECOP="^PHASE("_K1_","""_NUFAC_"""" D ^%QCAGLC
 K ^BLOCPHAS($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^BLOCPHAS("_K1_","""_NUFA_"""",%TREECOP="^BLOCPHAS("_K1_","""_NUFAC_"""" D ^%QCAGLC
 K ^GLOETUPH($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^GLOETUPH("_K1_","""_NUFA_"""",%TREECOP="^GLOETUPH("_K1_","""_NUFAC_"""" D ^%QCAGLC
 K ^PARINDEF($I,NUFAC) S PCH=$I D TO^%QZNBN1 S K1=$S(ISNUM:$I,1:""""_$I_""""),NOMTREE="^PARINDEF("_K1_","""_NUFA_"""",%TREECOP="^PARINDEF("_K1_","""_NUFAC_"""" D ^%QCAGLC
END14 K %TREECOP,K1,%TAD,NOMTREE,%TREFC,DATAC G FIN
FIN Q

