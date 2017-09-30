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

;TODELDEV^INT^1^59547,74871^0
TODELDEV ;
 
 
QUES K ^T($I) D CLEPAG^%VVIDEO S GSM=$$^%QZCHW("SUPPRESSION PAR No D'ETUDE") D REV^%VVIDEO S DX=40-($L(GSM)\2),DY=2 X XY W GSM D NORM^%VVIDEO
 S DEL="DEL",TWREF=0,DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Suppression de (? aide ) : ") S DX=$X D ^%VLEC G END:CTRLA,END:CTRLF,QUES:Y1="",HELP:Y1="?" S NODEVI=Y1
 G:NODEVI="" FIN I NODEVI'["/" S NDV2=NODEVI G SUP0
 S NODEV=NODEVI,NODEVI=$P(NODEV,"/",1),NDV2=$P(NODEV,"/",2),NU1=+($E(NODEVI,8,11)),NU2=+($E(NDV2,8,11)),MO1=+($E(NODEVI,6,7)),MO2=+($E(NDV2,6,7)),AN1=+($E(NODEVI,4,5)),AN2=+($E(NDV2,4,5))
 I $E(NDV2,11)="" S NU2=NU2_9
 I $E(NDV2,10)="" S NU2=NU2_9
 I $E(NDV2,9)="" S NU2=NU2_9
 I $E(NDV2,8)="" S NU2=NU2_9
 D VALID G:'(VALID) QUES
 F %NN=1:1 Q:(NODEVI[NDV2)!(NODEVI=-1)  S:NODEVI'="z" ^T($I,NODEVI)=1,NODEVI=$N(^[QUI]TREEWORK(NODEVI)) S NU1=+($E(NODEVI,8,11)),MO1=+($E(NODEVI,6,7)),AN1=+($E(NODEVI,4,5)) D VALID Q:'(VALID)
SUP0 F %NN=1:1 Q:(NODEVI'[NDV2)!(NODEVI=-1)  S:NODEVI'="z" ^T($I,NODEVI)=1 S NODEVI=$N(^[QUI]TREEWORK(NODEVI))
 S NODEVI=-1 F %VW=1:1 S NODEVI=$N(^T($I,NODEVI)) Q:NODEVI=-1  D SUP
 G QUES
VALID S VALID=1 I (NODEVI["GAM")!(NDV2["GAM") S VALID=0 Q
 S:AN2<AN1 VALID=0 I AN1=AN2 S:MO1>MO2 VALID=0 I MO1=MO2 S:NU1>NU2 VALID=0
 Q
 
 
SUPEX(NODEVI) 
 N TWREF
 N %U,%V,LI,GLO,KGL,RS,T,P,RF,TB,IT
 Q:'($D(^[QUI]TREEWORK(NODEVI)))
 S TWREF=0
 G DEL
 
SUP Q:'($D(^[QUI]TREEWORK(NODEVI)))  S DY=5,DX=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Suppression de "),NODEVI," en cours...."
DEL S YA=$P(^[QUI]TREEWORK(NODEVI,0),"^",1)
XDEL S YB=$P(^[QUI]TREEWORK(NODEVI,0),"^",2),IDTOT=$P(^[QUI]TREEWORK(NODEVI,0),"^",4) D ^TO3ARTHE S COMP=-1,TANT="^[QUI]ANTETUDE(COMP,NODEVI)"
 F WW=0:0 S COMP=$N(^COMPNOM($I,YA,COMP)) Q:COMP=-1  S NUFA=NODEVI,ARTCT=COMP K ^[QUI]ANTETUDE(COMP,NODEVI)
DEL1 F %U=0:1 S LI=$T(KIL+%U) Q:LI=""  S LI=$P(LI,";;",2) Q:LI=""  F %V=1:1 S GLO=$P(LI,",",%V) Q:GLO=""  S KGL="^[QUI]"_GLO K @KGL@(NODEVI)
 
 
 
 
 G:'($D(^[QUI]TREEWORK(NODEVI))) SUIT
 S NOMTREE="^[QUI]TREEWORK("_""""_NODEVI_""","_TWREF,%TAD="TR1^TODELDEV" D ^%QCAGTW K ^[QUI]TREEWORK(NODEVI) G SUIT
 
 
TR1 N IDNTIF,OBJIF,S1,S0,S2,S3,T,P,RS,%U
 W "." S RS=$P(%T,"(",2,500),@("T($I,"_RS)=1,RF=""""_$I_""""
 F %U=1:1 S TB="T("_RF_")",IT=$N(@TB@(-1)) Q:IT=-1  S P(%U)=IT,RF=RF_","""_IT_""""
 I %U>3 S %ETD="/"_TWREF F I=3:1:%U-1 S %ETD=%ETD_"."_P(I)
 S %ETD=$S($D(P(3)):NODEVI_%ETD,1:NODEVI) D:$$CNX^TORQXIN SUP^TORQXIN(%ETD)
 S IDNTIF=$P(@%T,"^",4),OBJIF=$P(IDNTIF,"/")
 S:OBJIF="" OBJIF=$P(@%T,"^",1)
 
 
 S S1="^[QUI]REFANTET("_""""_OBJIF_""""_")",S0=$E(S1,1,$L(S1)-1)
LP S S2=$Q(@S1),S3=S2 G:S2="" FINTR1
 I $F(S2,NODEVI,1)>0 S S2="^[QUI]"_$E(S2,2,512) K @(S2)
 S S1="^[QUI]"_$E(S3,2,512) I $F(S1,S0,0) G LP
FINTR1 Q
 
SUIT K %U,%V,LI,GLO,KGL,RS,T,P,RF,TB,IT
FIN Q
END D ^TOCLARCH K ^T($I) Q
QUAR K ^T($I) D CLEPAG^%VVIDEO S DEL="XDEL",GSM=$$^%QZCHW("SUPPRESSION PAR ARTICLE") D REV^%VVIDEO S DX=40-($L(GSM)\2),DY=2 X XY W GSM D NORM^%VVIDEO
 W !,!,$$^%QZCHW("Nom de l'article dont vous voulez supprimer certaines etudes(fin=RETURN) : ") S DX=0,DY=5 X XY S DX=$X D ^%VLEC G:Y1="" END S YA=Y1
 G FIN:YA="" S NODEVI=-1,KTB="^[QUI]ANTETUDE(YA,NODEVI)"
 F %88ZZ=0:1 S NODEVI=$N(@KTB) Q:NODEVI=-1  S DX=0,DY=4 D CLEBAS^%VVIDEO S DX=5,DY=10 X XY W $$^%QZCHW(" Voulez-vous supprimer l'etude "),NODEVI,$$^%QZCHW(" de "),YA,"  (O/N)" R *X G QUAR:(X=1)!(X=6) S:$C(X)=$$^%QZCHW("O") ^T($I,NODEVI)=1
 S NODEVI=-1 F %VW=1:1 S NODEVI=$N(^T($I,NODEVI)),TWREF=$N(^[QUI]TREEWORK(NODEVI,-1)) Q:NODEVI=-1  D SUP
 G QUAR
HELP D CLEPAG^%VVIDEO W !,$$^%QZCHW("Quelques exemples : "),!,!
 W !,$$^%QZCHW("TOT86070002             : suppression de l'etude No TOT86070002 ")
 W !,!,$$^%QZCHW("TOT860701               : suppression de l'etude No TOT86070100 jusqu'a l'etude")
 W !,$$^%QZCHW("                          No TOT86070199")
 W !,!,$$^%QZCHW("TOT8607                 : suppression des etudes faites en juillet 86")
 W !,!,$$^%QZCHW("TOT86                   : suppression des etudes faites en 86")
 W !,!,$$^%QZCHW("TOT86060010/TOT86071200 : suppression de l'etude No TOT86060010 jusqu'a l'etude")
 W !,$$^%QZCHW("                          No TOT86071200")
 W !,!,$$^%QZCHW("TOT850302/TOT86071      : suppression de l'etude No 200 de mars 85 jusqu'a")
 W !,$$^%QZCHW("                          l'etude No 1999 de juillet 86")
 W !,!,$$^%QZCHW("TOT8603/TOT8605         : suppression des etudes faites de mars a mai 86")
 W !,!,$$^%QZCHW("TOT86/TOT87             : suppression des etudes faites de 86 a 87")
 D POCLEPA^%VVIDEO W "[RETURN]" S DX=$X D ^TOLECONE K X1
 G QUES
KIL ;;TVPAR,PHAS,SECT,DEJAFAB,CONS,RAISMAT,ORDEVAL,DIM,RAISON,COUT,DUREE,PAREFLAT,PARMAT,CARATPC

