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

;TODELGAM^INT^1^59547,74871^0
TODELGAM ;
 
QU K ^T($I)
QUES D CLEPAG^%VVIDEO S DEL="DEL",TWREF=0,DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Suppression des archives de la gamme No ( ou de/a ) : ") S DX=$X D ^%VLEC G END:CTRLA,END:CTRLF,QUES:Y1="" S NODEVI=Y1
 I NODEVI'["/" S NDV2=NODEVI G SUP0
 S NODEV=NODEVI,NODEVI=$P(NODEV,"/",1),NDV2=$P(NODEV,"/",2),NU1=+($E(NODEVI,8,11)),NU2=+($E(NDV2,8,11)),MO1=+($E(NODEVI,6,7)),MO2=+($E(NDV2,6,7)),AN1=+($E(NODEVI,4,5)),AN2=+($E(NDV2,4,5))
 D VALID G:'(VALID) QUES
 F %NN=1:1 Q:(NODEVI[NDV2)!(NODEVI=-1)  S:NODEVI'="z" ^T($I,NODEVI)=1,NODEVI=$N(^[QUI]ANTETUDE("LAF",NODEVI)) S NU1=+($E(NODEVI,8,11)),MO1=+($E(NODEVI,6,7)),AN1=+($E(NODEVI,4,5)) D VALID Q:'(VALID)
SUP0 F %NN=1:1 Q:(NODEVI'[NDV2)!(NODEVI=-1)  S:NODEVI'="z" ^T($I,NODEVI)=1 S NODEVI=$N(^[QUI]ANTETUDE("LAF",NODEVI))
 S NODEVI=-1 F %VW=1:1 S NODEVI=$N(^T($I,NODEVI)) Q:NODEVI=-1  D SUP
 G QUES
VALID S VALID=1 I (NODEVI'["GAM")!(NDV2'["GAM") S VALID=0 Q
 S:AN2<AN1 VALID=0 I AN1=AN2 S:MO1>MO2 VALID=0 I MO1=MO2 S:NU1>NU2 VALID=0
 Q
SUP Q:'($D(^[QUI]ANTETUDE("LAF",NODEVI)))  S DY=5,DX=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Suppression de "),NODEVI," en cours...."
 S CLE=^[QUI]ANTETUDE("LAF",NODEVI)
 K ^[QUI]ANTETUDE("LAF",NODEVI),^[QUI]GAMLAF(CLE)
DEL1 F %U=0:1 S LI=$T(KIL+%U) Q:LI=""  S LI=$P(LI,";;",2) Q:LI=""  F %V=1:1 S GLO=$P(LI,",",%V) Q:GLO=""  S KGL="^[QUI]"_GLO K @KGL@(NODEVI)
 K %U,%V,LI,GLO,KGL,CLE
FIN Q
END D ^TOCLARCH K ^T($I),AN1,AN2,MO1,MO2,NU1,NU2,NODEVI,NDV2,NODEV,Y1,SFA,ARFA,NOMTAB,VALCLE,LI,PPAGE,%RS,ADR,STOP,VALID,DEL,TWREF,CTRLA,CTRLF,%NN,%VW
 Q
KIL ;;GAMLAF,TVPAR,PHAS,SECT,CONS,DIM,RAISON,COUT,DUREE,TREEWORK,,DEJAFAB,RAISMAT,ORDEVAL,PAREFLAT,PARMAT

