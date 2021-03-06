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

;TO3OUTCO^INT^1^59547,74870^0
TO3OUTCO ;
 
 S NCONS=1,NTABN=$$^%QZCHW("CONSIGNES-OUTILLAGES"),NCLE=5,PNUM=1,F1=17,NFOR=1,COND=-1
 Q:'($D(^PHASADM($I,NUFA,TWREF,"CONS")))  S TB0="^PHASADM($I,NUFA,TWREF,""CONS"")",NPH=-1,TBC="^GLOETUD($I,NUFA,TWREF,""CONS"")",TBG="^GLOETUD($I,NUFA,TWREF,""CONS"",%N11,YA)",%N11=0,%LIEU=$$^%QZCHW("Consignes") D ^TO3WLIEU
LNPH S NPH=$N(@TB0@(NPH)) G:NPH=-1 BIS S NMA=-1,VM=0
LNMA S VM=1,RMA=@TB0@(NPH),MAC=$P(RMA,"|",1),PH=$P(RMA,"|",2),OP=$P(RMA,"|",3),PH(1)=$P(RMA,"|",4),OP(1)=$P(RMA,"|",5) K RMA D GETMAC I '(GMACT) K @TB0@(NPH) G LNPH
 G:'($D(@TB0@(NPH,"IND"))) LNMB S IN=-1 K ^INDPH($J) F %U=1:1 S IN=$N(@TB0@(NPH,"IND",IN)) Q:IN=-1  S VIN=@TB0@(NPH,"IND",IN),^V($I,YA,IN)=VIN,^INDPH($J,IN)=VIN
LNMB S OG=^PHASADM($I,NUFA,TWREF,"PHAS","OK",PH,OP),ANC=$E(OG_"   "_PH_"   "_OP,1,60) D ^TOEVCOUR
LOCOND S $ZT=^TOZE($I,"C"),COND=$N(@TBG@(PH(1),OP(1),MAC,COND)) Q:%ABEND=1  G:COND=-1 LOCS S CHP=^[QUI]OUTCONS(YA,PH(1),OP(1),MAC,COND) D SUITE G LOCOND
 Q
LOCS K:('($D(@TBC@(0,YA,PH(1),OP(1),MAC))))&('($D(@TBC@(1,YA,PH(1),OP(1),MAC)))) @TB0@(NPH) G LNPH
BIS G:(%N11=1)!(%N10=0) END S %N11=1 G:'($D(@TBG)) END G LNPH
END K TB0,TBG,NPH,NMA,VM,RMA,MAC,PH,OP,OG,COND,CHP,TBC,GMACT,RBIS,%TBL,CONS,NU,GST,NBCAR,GSTP,CAR Q
SUITE 
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C"),SOURCE=""""_YA_""","""_PH(1)_""","""_OP(1)_""","""_MAC_""","""_COND_"""",RBIS="("_SOURCE_")",COND1=^[QUI]COUTCONS(YA,PH(1),OP(1),MAC,COND),TSDEF=1 D ^TOTSDEFA("OUTCONS") Q:'(TSDEF)
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO
 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=RES1 G ROLO
NOLO S @("CONDIT="_COND1)
ROLO I CONDIT=0 K @TBG@(PH,OP,MAC,COND) Q
 S $ZT=^TOZE($I,"A"),PRX="("_SOURCE_")",AFFECT="^[QUI]AOUTCONS"_PRX I @AFFECT="" S CONDIT=0 Q
 D ^TO3SIFON Q:%ABEND=1  G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 S @("CONS="_@AFFECT),^[QUI]CONS(NUFA,TWREF,OP_"/"_OG)=$S($D(^[QUI]CONS(NUFA,TWREF,OP_"/"_OG)):^[QUI]CONS(NUFA,TWREF,OP_"/"_OG)_"|"_CONS,1:CONS)
 S ^[QUI]RAISON(NUFA,TWREF,CONS_"/"_OG)="^[QUI]OUTCONS("""_YA_""","""_PH_""","""_OP_""","""_MAC_""","""_COND_""")",ZW=1,$ZT=^TOZE($I,"A") K @TBG@(PH,OP,MAC,COND),@TB0@(NPH)
 Q
GETMAC K ^GMACT($I) S (CAR,%CAR)=" ",RS=MAC,GMACT=0 D ^%QZCHNBC S NBCAR=%NBCAR+1
GST S NU=NBCAR,GST="" F SS=1:1:NBCAR S GSTP=$P(MAC,CAR,SS),GST=GST_$S(GST="":"",1:CAR)_GSTP,^GMACT($I,NU)=GST,NU=NU-1
 F SS=1:1:NBCAR S GSTP=^GMACT($I,SS) I $D(^[QUI]OUTCONS(YA,PH(1),OP(1),GSTP)) S GMACT=1,MAC=GSTP G FMACT
 I CAR=" " K ^GMACT($I) S (CAR,%CAR)=".",RS=MAC D ^%QZCHNBC S NBCAR=%NBCAR+1 G GST
FMACT Q  K ^GMACT($I),CAR,%CAR,SS,NBCAR,%NBCAR,GSTP,NU Q
YAERR S xxx=zzz Q

