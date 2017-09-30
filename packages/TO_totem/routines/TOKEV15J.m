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

;TOKEV15J^INT^1^59547,74872^0
TOKEV15J ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,MSG=$$^%QZCHW("Suppression d'etudes par dates"),GRAPH=1 D TO4^%VZCD,ZD^%QMDATE4 S DAAT=%DAT D ^%QMDAK1 S %DN=DATH-15 D GETDAT^%QMDAK1 S DTK=DT D POCLEPA^%VVIDEO
 W $$^%QZCHW("CTRLF pour accord, "),$$L24^%QSLIB2," pour abandon, ou introduire une date"
QU S DX=0,DY=6 X XY W $$^%QZCHW("Suppression des etudes anterieures au : ")
 S DXD=$X,DYD=$Y D BLD^%VVIDEO S DX=DXD,DY=DYD X XY W DTK D NORM^%VVIDEO X XY S DX=$X D ^%VLEC G FIN:CTRLA,OK:CTRLF S IC=1,RESUL(IC)=Y1 D ^%VYDAT G:REFUSE=1 QU D BLD^%VVIDEO X XY W DAAT D NORM^%VVIDEO
QU1 S DX=0,DY=8 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("OK pour la suppression des etudes anterieures au "),DAAT,$$^%QZCHW(" (O/N) ? ") R *DXG S DXG=$C(DXG) G:(DXG'=$$^%QZCHW("N"))&(DXG'=$$^%QZCHW("O")) QU1 I DXG=$$^%QZCHW("N") X XY D CLEBAS^%VVIDEO G QU
 S DTK=DAAT
OK S DAAT=DTK D ^%QMDAK1 S DTKN=DATH,NOMTREE="^[QUI]REFANTET",%TAD="TR1^TOKEV15J" D ^%QCAGTW G SUIT
TR1 W "." S RS=$P(%T,"(",2,500) K T,P S @("T($I,"_RS)=1,RF=""""_$I_"""" F %U=1:1 S TB="T("_RF_")",IT=$N(@TB@(-1)) Q:IT=-1  S P(%U)=IT,RF=RF_","""_IT_""""
 S OBJ=$S($D(P(1)):P(1),1:1),NRO=$S($D(P(%U-2)):P(%U-2),1:1),%ETD=$S(P(%U-1)'=0:NRO_"/"_$TR(P(%U-1),",","."),1:NRO) Q:P(1)="z"  S DAAT=$P(@%T,"^",1) G:(DAAT="")!(DAAT'["/") KIL D ^%QMDAK1 Q:DATH'<DTKN
KIL Q:NRO["GAM"  K ^[QUI]ANTETUDE(OBJ,NRO),@(%T)
 D:$$CNX^TORQXIN SUP^TORQXIN(%ETD)
 Q
SUIT D SUIT^TOCLARCH
FIN Q

