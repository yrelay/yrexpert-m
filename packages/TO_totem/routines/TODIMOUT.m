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

;TODIMOUT^INT^1^59547,74871^0
TODIMOUT ;
 
 S GMACT=1,%NOUT=1,NTABN=$$^%QZCHW("DIMENSIONS A L'OUTIL"),NCLE=6,PNUM=1,F1=17,NFOR=1,PARA=-2,COND=-1
 Q:'($D(^PHASADM($I,NUFA,TWREF,"DIM")))  S TB0="^PHASADM($I,NUFA,TWREF,""DIM"")",NPH=-1,TBC="^GLOETUD($I,NUFA,TWREF,""DIM"")",TBG="^GLOETUD($I,NUFA,TWREF,""DIM"",%N11,YA)",%N11=0,%LIEU=$$^%QZCHW("Dim. a l'outil") D ^TO3WLIEU
LNPH S NPH=$N(@TB0@(NPH)) G:NPH=-1 BIS S NMA=-1,VM=0
LNMA S VM=1,RMA=@TB0@(NPH),MAC=$P(RMA,"|",1),PH=$P(RMA,"|",2),OP=$P(RMA,"|",3) K RMA D GETMAC I '(GMACT) K @TB0@(NPH) G LNPH
 S OG=^PHASADM($I,NUFA,TWREF,"PHAS","OK",PH,OP),%NOUT=$S(($D(^[QUI]DIM(NUFA,TWREF,OP_"/"_OG))#10)=1:^[QUI]DIM(NUFA,TWREF,OP_"/"_OG),1:1),ANC=$E(OG_"   "_PH_"   "_OP,1,60) D ^TOEVCOUR
LOPAR S $ZT=^TOZE($I,"C"),PARA=$N(@TBG@(PH,OP,MAC,PARA)) G:%ABEND=1 END G:PARA'=-1 LOPS G:%N11=0 LNPH K:('($D(@TBC@(0,YA,PH,OP))))&('($D(@TBC@(1,YA,PH,OP)))) @TB0@(NPH) G LNPH
LOPS S COND=-1
LOCOND S COND=$N(@TBG@(PH,OP,MAC,PARA,COND)) Q:%ABEND=1  G:COND=-1 LOPAR D SUITE G:CONDIT=0 LOCOND S %ON11=%N11 F %N11=0,1 K @TBG@(PH,OP,MAC,PARA)
 S %N11=%ON11 K %ON11 G LOPAR
BIS G:(%N11=1)!(%N10=0) END S %N11=1 G:'($D(@TBG)) END G LNPH
END K %NOUT,TB0,TBG,NPH,NMA,VM,RMA,MAC,PH,OP,OG,COND,CHP,TBC,GMACT,RBIS,%TBL,CONS,NU,NBCAR,GST,GSTP,CAR Q
SUITE S CONDIT=0,SOURCE=""""_YA_""","""_PH_""","""_OP_""","""_MAC_""","""_PARA_""","""_COND_"""",RBIS="("_SOURCE_")",TSDEF=1 D:%N11=1 ^TOTSDEFA("DIMOUT") Q:'(TSDEF)
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=RES1 G ROLO
NOLO S COND1=^[QUI]CDIMOUT(YA,PH,OP,MAC,PARA,COND),@("CONDIT="_COND1)
ROLO I CONDIT=0 K @TBG@(PH,OP,MAC,PARA,COND) Q
 S $ZT=^TOZE($I,"A"),PRX="("_SOURCE_")",AFFECT="^[QUI]ADIMOUT"_PRX I @AFFECT="" S CONDIT=0 K @TBG@(PH,OP,MAC,PARA,COND) Q
 D ^TO3SIFON G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 Q:%ABEND=1  S @("CONS="_@AFFECT),^[QUI]DIM(NUFA,TWREF,OP_"/"_OG,%NOUT)=PARA_"|"_CONS,%NOUT=%NOUT+1,^[QUI]DIM(NUFA,TWREF,OP_"/"_OG)=%NOUT
 S ^[QUI]RAISON(NUFA,TWREF,PARA_"/"_OG)="^[QUI]DIMOUT("""_YA_""","""_PH_""","""_OP_""","""_MAC_""","""_PARA_""","""_COND_""")",ZW=1,$ZT=^TOZE($I,"A")
 Q
GETMAC K ^GMACT($I) S (CAR,%CAR)=" ",RS=MAC,GMACT=0 D ^%QZCHNBC S NBCAR=%NBCAR+1
GST S NU=NBCAR,GST="" F SS=1:1:NBCAR S GSTP=$P(MAC,CAR,SS),GST=GST_$S(GST="":"",1:CAR)_GSTP,^GMACT($I,NU)=GST,NU=NU-1
 F SS=1:1:NBCAR S GSTP=^GMACT($I,SS) I $D(^[QUI]DIMOUT(YA,PH,OP,GSTP)) S GMACT=1,MAC=GSTP G FMACT
 I CAR=" " K ^GMACT($I) S (CAR,%CAR)=".",RS=MAC D ^%QZCHNBC S NBCAR=%NBCAR+1 G GST
FMACT Q  K ^GMACT($I),CAR,%CAR,SS,NBCAR,%NBCAR,GSTP,NU Q
YAERR S xxx=zzz Q

