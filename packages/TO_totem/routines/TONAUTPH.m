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

;TONAUTPH^INT^1^59547,74873^0
TONAUTPH ;
 
 S:'($D(%PHSUP)) %PHSUP=0 S ^SAVE($I,"OK")=0,$ZT="",BLOCPH=0 G:%PHSUP=1 YABL G:'($D(^[QUI]BLOCPHAS(YA,PH,OG,OP))) END
YABL S RBL="("""_YA_""","""_PH_""","""_OG_""","""_OP_""")"
 I $D(^PHASADM($I,NUFA,TWREF,"BLOPH",RBL)) K ^BLOC($I) S BLOCPH=1,^SAVE($I,"OK")=1,^BLOC($I,1)=NUFA_"^"_TWREF_"^PH^^"_PH_"^"_OP_"^"_OG_"^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),^BLOC($I,3)=^PHASADM($I,NUFA,TWREF,"BLOPH",RBL) D ^TONGETBL G FEND
 S TBBP=$S(%PHSUP=1:"^PHASE($I,NUFA,TWREF)",1:"^[QUI]PHASE"),USER=WHOIS,SSET=$P(@TBBP@(YA,PH,OG,OP),"^",25),YASSET=$P(SSET,":",1) I YASSET["]" S USER=$P($P(YASSET,"]",1),"[",2),YASSET=$P(YASSET,"]",2) S:USER["""" USER=$P(USER,"""",2) S:YASSET["""" YASSET=$P(YASSET,"""",2)
 S US=$S(USER="":QUI,$D(^TABIDENT(USER,$$^%QZCHW("MACHINE"))):^TABIDENT(USER,$$^%QZCHW("MACHINE")),1:QUI)
 I ('($D(^[US]EXPLICI(YASSET))))&(('($D(^[US]IMPLICI(YASSET))))&(('($D(^[US]ESSABAC(YASSET))))&('($D(^[US]PHASE(YASSET)))))) G END
 S BLOCPH=1 D EXBPH G:%ABEND=1 FIN K BLOC($I) S ^BLOC($I,1)=NUFA_"^"_TWREF_"^PH^"_USER_"^"_PH_"^"_OP_"^"_OG_"^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),^BLOC($I,2)=GYA
 G GBLOC
EXBPH K DON S TACP=$S(%PHSUP=1:"^BLOCPHAS($I,NUFA,TWREF,",1:"^[QUI]BLOCPHAS(")_""""_YA_""","""_PH_""","""_OG_""","""_OP_""")",GYA=YASSET_":" S:'($D(USER)) USER=""
 S NUEX=0 F WWE=0:0 S NUEX=$N(@TACP@(NUEX)) Q:NUEX=-1  D AFF G:%ABEND=1 END
END K TACP,WWE,NUEX,DON Q
AFF S $ZT=^TOZE($I,"A")
RETERR Q:%ABEND=1  S AFFECT=@TACP@(NUEX) I AFFECT="" S DON(NUEX)=AFFECT G GYA
 S @("DON(NUEX)="_AFFECT)
GYA S GYA=GYA_DON(NUEX)_"/" Q
GBLOC S %LIEU=$$^%QZCHW("Sous-etudes") D ^TO3WLIEU
 K ^SAVAR($I),^BLOCVU($I) F IT="RBL","NUFA","TWREF","QUI","WHOIS","YA","YB",$$^%QZCHW("BATCH"),"TEMPO" S ^SAVAR($I,IT)=@IT
 D ^%QCAMEMS
LOOP K  D CURRENT^%IS S IT=-1 F Z=1:1 S IT=$N(^SAVAR($I,IT)) Q:IT=-1  S @IT=^SAVAR($I,IT)
TRAIT S BL1=^BLOC($I,1),BL2=^BLOC($I,2),USER=$P(BL1,"^",4),ONUF=NUFA,OQUI=QUI,OTW=TWREF,QUI=$S(USER="":QUI,1:USER),YASSET=$P(BL2,":",1),REFID=$P(BL2,":",2),TYPB=$P(BL1,"^",3),QTE=$P(BL1,"^",8)
 K DON S %CAR="/",RS=REFID D ^%QZCHNBC S %NBCAR=%NBCAR+1 F IT=1:1:%NBCAR S DON(IT)=$P(RS,"/",IT)
 K RS,%NBCAR,IT
 S:QUI'=OQUI QUI=$S($D(^TABIDENT(QUI,$$^%QZCHW("MACHINE"))):^TABIDENT(QUI,$$^%QZCHW("MACHINE")),1:OQUI) D ^TORECBLO
 I %GAM=1 S ^SAVE($I,"OK")=1,^BLOC($I,3)=INUFA_"^"_NUREF_"^"_QUI_"^"_TYPB D ^%QCAMEMR,^TONGETBL G FEND
 D ^TOTPOP S ^PHASADM($I,ONUF,OTW,"BLOPH",RBL)=NUFA_"^"_0_"^"_QUI_"^"_TYPB,ET=^PILETUD($I),^PILETUD($I)=ET+1,^PILETUD($I,ET)=NUFA_"^0^0^^^"_QUI_"^"_BL2_"^"_QTE_"^"_ARTET_"^"_YASSET_"^0^0",^SAVE($I,"OK")=0 D ^%QCAMEMR G FEND
KILL K QTE,TYPB,%GAM,%1EXIS,USER,REFID,YASSET,NBL,BL1,BL2,%NBCAR,IT,Z,ARTET,YASSET,RS,^ORDEVAL($I) Q
FEND K RBL,USER,TBBP,SSET,YASSET,US,GYA Q

