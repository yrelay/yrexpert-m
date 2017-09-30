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

;TOCLARCH^INT^1^59547,74871^0
TOCLARCH ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=79,DYH=0,DYB=4,GRAPH=0,MSG=$$^%QZCHW("Nettoyage de l'archivage des etudes") D TO4^%VZCD S DX=0,DY=5 X XY W $$^%QZCHW("Nettoyage en cours...")
 S NOMTREE="^[QUI]REFANTET",%TAD="TR1^TOCLARCH" D ^%QCAGTW G SUIT
TR1 W "." S RS=$P(%T,"(",2,500) K T,P S @("T($I,"_RS)=1,RF=""""_$I_"""" F %U=1:1 S TB="T("_RF_")",IT=$N(@TB@(-1)) Q:IT=-1  S P(%U)=IT,RF=RF_","""_IT_""""
 S OBJ=$S($D(P(1)):P(1),1:1),NRO=$S($D(P(%U-2)):P(%U-2),1:1) Q:P(1)="z"  K:'($D(^[QUI]ANTETUDE(OBJ,NRO))) @(%T) Q
SUIT K ^%ANT($I) S OBJ=-1 F I=1:1 S OBJ=$N(^[QUI]ANTETUDE(OBJ)) Q:OBJ=-1  S NRO=-1 F J=1:1 S NRO=$N(^[QUI]ANTETUDE(OBJ,NRO)) Q:NRO=-1  D EXI I DAC=1 S ^%ANT($I,NRO)=OBJ
 S XX=$T(GLO),XX=$P(XX,";;",2)
 F I=1:1 S GLOB=$P(XX,",",I),NUM=-1 Q:GLOB=""  S GLOBAL="^[QUI]"_GLOB F J=1:1 S NUM=$N(@GLOBAL@(NUM)) Q:NUM=-1  W "." I NUM'="z",'($D(^%ANT($I,NUM))) K @GLOBAL@(NUM)
FIN K DXG,DXD,DYH,DYB,GRAPH,MSG,^%ANT($I),I,J,GLO,GLOB,GLOBAL,NUM,XX,NRO,OBJ
 Q
EXI S DAC=1 I ('($D(^[QUI]TVPAR(NRO))))!('($D(^[QUI]RAISON(NRO)))) S DAC=0 K ^[QUI]ANTETUDE(OBJ,NRO) G FEXI
 S OK=0,NOMTREE="^[QUI]REFANTET("""_OBJ_"""",%TAD="TR^TOCLARCH" D ^%QCAGTW I OK=0 S DAC=0 K ^[QUI]ANTETUDE(OBJ,NRO)
FEXI Q
TR G:%T'[NRO FEXI S (STOP,OK)=1 G FEXI
GLO ;;SECT,DIM,RESTEST,CONS,COUT,DUREE,PAREFLAT,PARMAT,PARMAC,PHAS,RAISON,TVPAR,TREEWORK,RAISMAT,ORDEVAL

