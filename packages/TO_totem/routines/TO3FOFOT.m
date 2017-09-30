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

;TO3FOFOT^INT^1^59547,74870^0
TO3FOFOT ;
 
PREPA D INIT W "$" F FOR=1:1:NFOR D TRAIT
 K %CHP Q
TRAIT I ETUD'="IMPL" G NOME
 S RS=%RS(18),%PF=18,%TYBL="PARA" G:$E(RS,1)="""" END G:RS'[":" SUIT S %TBL="^[QUI]BLOCIMPL(ARTI,B2,B3)",RFI=%TYBL_"|"_""""_ARTI_"""" F %U=2:1:3 S RFI=RFI_","""_@($$^%QZCHW("B")_%U)_""""
 D TRAIT5 G SUIT
NOME I ETUD="NOME",%RS(1)'="" S %CHP=1 D TRAIT2 G SUIT
 G:ETUD'="FORM" AUTR S %PF=@("F"_FOR),%RS=%RS(%PF),%TYBL=$S(%PF=17:"PREP",1:"USIN") G:%RS'[":" SUIT S %BL=$P(%RS,":",1) I (%BL'["'")&(%PF=17) D TRAIT3
 S %TBL="^[QUI]BLOCIMPL(ARTI,B2,B3,B4,B5,%TYBL)",RFI=%TYBL_"|"_""""_ARTI_"""" F %U=2:1:5 S RFI=RFI_","""_@($$^%QZCHW("B")_%U)_""""
 S RFI=RFI_","""_%TYBL_"""" D TRAIT5 G SUIT
AUTR G:ETUD'="AUTREFO" PH S %PF=@("F"_FOR),%RS=%RS(%PF),%TYBL=ETUD G:%RS'[":" SUIT S %BL=$P(%RS,":",1)
 S %TBL="^[QUI]BLOCIMPL(ARTI,B2,B3,B4,B5,B6)",RFI=%TYBL_"|"_""""_ARTI_"""" F %U=2:1:6 S RFI=RFI_","""_@($$^%QZCHW("B")_%U)_""""
 D TRAIT5 G SUIT
PH I ETUD="PHAS" G:'($D(%RS(25))) END G:%RS(25)'[":" END S %CHP=25 D TRAIT4 G END
SUIT S FTAB=FONTAB,POSF=@("F"_FOR),%CHP=POSF Q:$E(B2,1)="$"  Q:%RS(POSF)'["$"  S EXPARG=%RS(POSF),EXP5=$E(EXPARG,1,5) D:(ETUD="IMPL")&((((EXP5="$EXIS")!(EXP5="$COUT"))!(EXP5="$DURE"))!(EXP5="$MACH")) EXIS D ^TO3GARG F RF=2:1:NCLE S FTAB=FTAB_",B"_RF
 S FTAB=FTAB_","_POSF_")",@FTAB=EXPARG Q:ETUD'="CTREV"  S NF=$N(^[QUI]FLIMPLI(ARTI,EXPARG,-1)) I NF=-1 K ^[QUI]FLIMPLI(ARTI,EXPARG) Q
 S RF=$P(^[QUI]FLIMPLI(ARTI,EXPARG,NF),"^",18) K ^[QUI]FLIMPLI(ARTI,EXPARG) S @FTAB=RF
 Q
TRAIT2 S %CAR=",",RS=%RS(1) D ^%QZCHNBC F WRE=1:1:%NBCAR+1 S PVIR=$P(RS,",",WRE),^[QUI]VEXTRANS(ARTI,B2,B3,WRE)=PVIR I PVIR["$" S EXPARG=PVIR D ^TO3GARG S ^[QUI]VEXTRANS(ARTI,B2,B3,WRE)=EXPARG
 Q
TRAIT3 S %CAR=",",RS=$P(%RS(17),":",2) D ^%QZCHNBC F WRE=1:1:%NBCAR+1 S PVIR=$P(RS,",",WRE),^[QUI]BLOCOPER(ARTI,B2,B3,B4,B5,WRE)=PVIR I PVIR["$" S EXPARG=PVIR D ^TO3GARG S ^[QUI]BLOCOPER(ARTI,B2,B3,B4,B5,WRE)=EXPARG
 Q
TRAIT4 S %CAR=",",RS=$P(%RS(25),":",2) D ^%QZCHNBC F WRE=1:1:%NBCAR+1 S PVIR=$P(RS,",",WRE),^[QUI]BLOCPHAS(ARTI,B2,B3,B4,WRE)=PVIR I PVIR["$" S EXPARG=PVIR D ^TO3GARG S ^[QUI]BLOCPHAS(ARTI,B2,B3,B4,WRE)=EXPARG
 S RS=$P(%RS(25),":",1),YAS=$S(RS["]":$P(RS,"]",2),1:RS),USER=$S(RS["]":$P($P(RS,"]",1),"[",2),1:"")
 S WHO=USER,USER=$S(USER="":QUI,1:$S($D(^TABIDENT(USER,$$^%QZCHW("MACHINE"))):^TABIDENT(USER,$$^%QZCHW("MACHINE")),1:QUI)),^[QUI]BLOCPHAS(ARTI,B2,B3,B4,0)=YAS_"|"_USER_"|"_WHO
 Q
TRAIT5 S %CAR=",",RS=$P(%RS(%PF),":",2) D ^%QZCHNBC F WRE=1:1:%NBCAR+1 S PVIR=$P(RS,",",WRE),@%TBL@(WRE)=PVIR I PVIR["$" S EXPARG=PVIR D ^TO3GARG S @%TBL@(WRE)=EXPARG
 S RS=$P(%RS(%PF),":",1),%CAR="'" D ^%QZCHNBC S %CAR="" F WRE=1:1:%NBCAR S %CAR=%CAR_$S(%CAR="":"",1:"'")_$P(RS,"'",WRE)
 S RS=$P(RS,"'",%NBCAR+1),YAS=$S(RS["]":$P(RS,"]",2),1:RS),USER=$S(RS["]":$P($P(RS,"]",1),"[",2),1:"")
 S WHO=USER,USER=$S(USER="":QUI,1:$S($D(^TABIDENT(USER,$$^%QZCHW("MACHINE"))):^TABIDENT(USER,$$^%QZCHW("MACHINE")),1:QUI)),@%TBL@(0)=%CAR_"|"_YAS_"|"_USER_"|"_WHO
 I $D(^[QUI]BLOCIMPL(ARTI,"%GR",USER,YAS)) S RGR=^[QUI]BLOCIMPL(ARTI,"%GR",USER,YAS),NGR=$P(RGR,"/",1),NS=$P(RGR,"/",2),$P(RGR,"/",2)=NS+1,^[QUI]BLOCIMPL(ARTI,"%GR",USER,YAS)=RGR G BS
 S NGR=^[QUI]BLOCIMPL(ARTI,"%GR"),^[QUI]BLOCIMPL(ARTI,"%GR")=NGR+1,NS=1,^[QUI]BLOCIMPL(ARTI,"%GR",USER,YAS)=NGR_"/2"
BS S ^[QUI]BLOCIMPL(ARTI,"%GR",USER,YAS,NS)=RFI
 K YAS,NGR,NS,RGR,USER,WHO Q
INIT I '($D(%RS(%RSMIN))) F WT=1:1:%RSMIN I '($D(%RS(WT))) S %RS(WT)=""
 G END:PNUM>%RSMIN S %COND="",$P(%COND,"^",18)="",PFIN=PNUM+15,%J=2 F %I=PNUM:1:PFIN S $P(%COND,"^",%J)=%RS(%I),%J=%J+1
END Q
EXIS S ^[QUI]RANG(ARTI,B2)=1 Q

