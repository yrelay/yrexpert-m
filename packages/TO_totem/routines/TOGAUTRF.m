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

;TOGAUTRF^INT^1^59547,74872^0
TOGAUTRF ;
 
 S NCONS=1,NTABN="AUTREFO",NCLE=6,PNUM=4,F1=2,NFOR=1,COND=-1
 Q:'($D(^PHASADM($I,NUFA,TWREF,"AUTREFO")))  S TB0="^PHASADM($I,NUFA,TWREF,""AUTREFO"")",NPH=-1,%LIEU=$$^%QZCHW("Carac. Temps & Couts") D ^TO3WLIEU
LNPH S NPH=$N(@TB0@(NPH)) G:NPH=-1 END S CAR=-1
LCAR S CAR=$N(@TB0@(NPH,CAR)) G:CAR=-1 LNPH S REF=@TB0@(NPH,CAR),%U=1 F IT="PH","OP","OG","MAC","COND","PH(1)","OP(1)","OG(1)" S @IT=$P(REF,"^",%U),%U=%U+1
 G:'($D(@TB0@(NPH,CAR,"IND"))) PMC K ^INDPH($J) S IN=-1 F %U=1:1 S IN=$N(@TB0@(NPH,CAR,"IND",IN)) Q:IN=-1  S VIN=@TB0@(NPH,CAR,"IND",IN),^V($I,YA,IN)=VIN,^INDPH($J,IN)=VIN
 
PMC S OPOG=OP_"/"_OG G:'($D(^[QUI]PARMAC(NUFA,TWREF,OPOG))) S0 S ^V($I,YA,$$^%QZCHW("%MACHINE"))=^[QUI]PARMAC(NUFA,TWREF,OPOG,$$^%QZCHW("%MACHINE")),PP=-1,MC=^V($I,YA,$$^%QZCHW("%MACHINE"))
 F %U=1:1 S PP=$N(^[QUI]PARMAC(NUFA,TWREF,OPOG,PP)) Q:PP=-1  S ^S($I,MC,PP)=^[QUI]PARMAC(NUFA,TWREF,OPOG,PP)
 
S0 S ANC=$E(OG_"  "_PH_"  "_CAR,1,60) D ^TOEVCOUR
LOCOND S $ZT=^TOZE($I,"A"),%ABEND=0
RETERR Q:%ABEND=1  S SOURCE=""""_YA_""","""_PH(1)_""","""_OP(1)_""","""_MAC_""","""_COND_""","""_CAR_"""",RBIS="("_SOURCE_")" D ^TOTSDEFA("AUTREFO") G:'(TSDEF) LCAR S $ZT=^TOZE($I,"A")
 G:'($D(@("^[QUI]BLOCIMPL("_SOURCE_")"))) NOBLO S TBB="^PHASADM($I,NUFA,TWREF,""BLAUOK"","_SOURCE_")" I $D(@TBB) S CONS=@TBB G OKAU
 S RBL="("_SOURCE_")" D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM S CONS=$S($D(@TBB):@TBB,1:"???") G OKAU
NOBLO S PRX="("_SOURCE_")",AFFECT="^[QUI]AAUTREFO"_PRX I @AFFECT="" K @TB0@(NPH,CAR) G LCAR
 D ^TO3SIFON Q:%ABEND=1  G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 S @("CONS="_@AFFECT)
OKAU S ^[QUI]CARATPC(NUFA,TWREF,OP_"/"_OG,CAR)=CONS
 S $ZT=^TOZE($I,"A") K @TB0@(NPH,CAR) G LCAR
GETMAC K ^GMACT($I) S (CAR,%CAR)=$$^%QZCHW(" "),RS=MAC,GMACT=0 D ^%QZCHNBC S NBCAR=%NBCAR+1
GST S NU=NBCAR,GST="" F SS=1:1:NBCAR S GSTP=$P(MAC,CAR,SS),GST=GST_$S(GST="":"",1:CAR)_GSTP,^GMACT($I,NU)=GST,NU=NU-1
 F SS=1:1:NBCAR S GSTP=^GMACT($I,SS) I $D(^[QUI]OUTCONS(YA,PH,OP,GSTP)) S GMACT=1,MAC=GSTP G FMACT
 I CAR=$$^%QZCHW(" ") K ^GMACT($I) S (CAR,%CAR)=".",RS=MAC D ^%QZCHNBC S NBCAR=%NBCAR+1 G GST
FMACT Q  K ^GMACT($I),CAR,%CAR,SS,NBCAR,%NBCAR,GSTP,NU Q
YAERR S xxx=zzz Q
END K TB0,TBG,NPH,NMA,VM,RMA,MAC,PH,OP,OG,COND,CHP,TBC,GMACT,RBIS,%TBL,CONS,NU,GST,NBCAR,GSTP,CAR Q
BLIMP S %ABEND=2,FOR("ET")=^PILETUD($I,0),^PILETUD($I,FOR("ET"))=NUFA_"^"_TWREF_"^"_(%N10+1)_"^AUTRF^^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^1^1" Q

