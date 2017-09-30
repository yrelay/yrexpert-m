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

;TOWDUPGA^INT^1^59547,74876^0
TOWDUPGA ;
 
 D CLEPAG^%VVIDEO S DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("DUPLICATION DE SCHEMAS") D TO4^%VZCD,ZD^%QMDATE4
 S DX=0,DY=6 X XY W $$^%QZCHW("Duplication en cours...") F NBR=1:1:NBDUP S RENS=^GAMADUP($I,NBR) D TRAIT
FIN K DXG,DXD,DYH,DYB,DEV,GRAPH,MSG,%DAT,NBR,%ALS,%ETS,%LAS,%EPS,%ALC,%ETC,%LAC,%EPC,RENS,P,%IT,NOMTREE,NOMTAB,RECUP,NEWEP,%TAD,ONOMTREE,E,EPAI,BINF,BSUP,NBINF,NBSUP,DELTDEP,B1,B2,B3,B4,B5,B6,B7
 K ETA,LAR,EPA,RS,SR,CLE,CLE1,NUGAMS,NUGAMC,NUM,NRO,NU,%TREFC,ENSCLE,PLC,CL,BB G END
END Q
TRAIT S P=0 F %IT="%ALS","%ETS","%LAS","%EPS","%ALC","%ETC","%LAC","%EPC" S P=P+1,@%IT=$P(RENS,"^",P)
 S NOMTREE="^[QUI]OCGRIL(""GAMLAC""" F %IT="%ALS","%ETS","%LAS" Q:@%IT=""  S NOMTREE=NOMTREE_","""_@%IT_""""
 S RECUP=0,NEWEP=%EPC,%TAD="DUPLI1^TOWDUPGA" G:%EPS["," TRAIT1 G:%EPS["-" TRAIT2 S:%EPS'="" NOMTREE=NOMTREE_","""_%EPS_"""" D ^%QCAGTU5 G END
TRAIT1 S ONOMTREE=NOMTREE F E=1:1 S EPAI=$P(%EPS,",",E) Q:EPAI=""  S NEWEP=$P(%EPC,",",E),NOMTREE=NOMTREE_","""_EPAI_"""" D ^%QCAGTU5 S NOMTREE=ONOMTREE
 G END
TRAIT2 S RECUP=1,BINF=$P(%EPS,"-",1),BSUP=$P(%EPS,"-",2),%TAD="DUPLIC^TOWDUPGA",NBINF=$P(%EPC,"-",1),NBSUP=$P(%EPC,"-",2) D ^%QCAGTU5
 G END
DUPLIC D RECUPC Q:(B5<BINF)!(B5>BSUP)  S DELTEP=$J((B5-BINF)*10,1,0),NEWEP=NBINF+(DELTEP/10)
DUPLI1 D:RECUP=0 RECUPC W "*"
 S RECUP=0,ETA=$S(%ETC="":B3,1:%ETC),LAR=$S(%LAC="":B4,1:%LAC),EPA=$S(NEWEP="":B5,1:NEWEP)
 I '($D(^[QUI]SAISIGAM(B1,%ALC,ETA,LAR))) S $P(SP,"^",13)=%DAT,^[QUI]SAISIGAM(B1,%ALC,ETA,LAR)=SP
 I EPA="zzNEXPOSI" S ^[QUI]OCGRIL(B1,%ALC,ETA,LAR,EPA)=RS G FINDUP
 S ^[QUI]OCGRIL(B1,%ALC,ETA,LAR,EPA,B6,B7)=RS,CLE="LAF/"_%ALC_"/"_ETA_"/"_LAR_"/"_EPA,CLE1="LAF/"_B2_"/"_B3_"/"_B4_"/"_B5 I '($D(^[QUI]GAMLAF(CLE1))) G FINDUP
 S NUGAMS=^[QUI]GAMLAF(CLE1) D ^TO6POP S NUGAMC=NUFA,^[QUI]GAMLAF(CLE)=NUGAMC
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]AUTOPLAF(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]AUTOPLAF(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]AUTOPLAF(NUGAMC,NUM,NRO)=^[QUI]AUTOPLAF(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]SECT(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]SECT(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]SECT(NUGAMC,NUM,NRO)=^[QUI]SECT(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]PHAS(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]PHAS(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]PHAS(NUGAMC,NUM,NRO)=^[QUI]PHAS(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]COUT(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]COUT(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]COUT(NUGAMC,NUM,NRO)=^[QUI]COUT(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]DUREE(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]DUREE(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]DUREE(NUGAMC,NUM,NRO)=^[QUI]DUREE(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]TVPAR(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]TVPAR(NUGAMS,NUM,NRO)) Q:NRO=-1  S ^[QUI]TVPAR(NUGAMC,NUM,NRO)=^[QUI]TVPAR(NUGAMS,NUM,NRO)
 S NUM=-1 F N=1:1 S NUM=$N(^[QUI]DIM(NUGAMS,NUM)) Q:NUM=-1  S NRO=-1 F NN=1:1 S NRO=$N(^[QUI]DIM(NUGAMS,NUM,NRO)) Q:NRO=-1  S NU=-1 F NNN=1:1 S NU=$N(^[QUI]DIM(NUGAMS,NUM,NRO,NU)) Q:NU=-1  S ^[QUI]DIM(NUGAMC,NUM,NRO,NU)=^[QUI]DIM(NUGAMS,NUM,NRO,NU)
 G FINDUP
FINDUP S (B1,B2,B3,B4,B5,B6,B7)="" G END
RECUPC S NOMTAB=NOMTREE_","_%TREFC_")",RS=@NOMTAB,ENSCLE=$P(NOMTAB,"(",2),ENSCLE=$P(ENSCLE,")",1),PLC=0 F BB=1:1 S PLC=PLC+2,CL=$P(ENSCLE,"""",PLC) Q:CL=""  S CL1="B"_BB,@CL1=CL
 G END

