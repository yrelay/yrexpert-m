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

;%ABDELG1^INT^1^59547,73864^0
%ABDELG1 ;
 
 S TIT=$$^%QZCHW("Suppression du CONTENU d'ABAQUES "),PROGTRA="^%ABDLCOL" D ^%ABPRESA
FIN Q
DEO 
 S NBC=3 D ^%ABCOLON S DX=9 F DY=2:1:20 X XY W LIMC
 S ^[QU]STRUCT(NOMG,1,5)=NBC,^[QU]STRUCT(NOMGC,1,5)=NBC,^[QU]STRUCT(NOMG,1,5,2)=LIMC,^[QU]STRUCT(NOMGC,1,5,2)=LIMC,^[QU]STRUCT(NOMG,1,5,1)=LCHP,^[QU]STRUCT(NOMGC,1,5,1)=LCHP,(^[QU]STRUCT(NOMG,1,5,3),^[QU]STRUCT(NOMGC,1,5,3),LIG2)=LIMS,LIG3=LIMC
HORIZ S MPASX=0,MPASY=1,NXI=8,NXS=10,NYI=2,NYS=21 D POCLEPA^%VVIDEO W $$L3^%QSLIB1 S DX=9,DY=10 X XY
MOV D ^%VZECUR G:(X1'=13)&(X1'=1) MOV S PPY=$S(X1=1:0,1:$Y),^[QU]STRUCT(NOMG,1,6)=PPY,^[QU]STRUCT(NOMGC,1,6)=0,DX=9,DDY=$S(PPY=0:3,1:PPY) F DY=3,DDY,21 X XY W LIMS
DPLA S NOST=1
 S VPMIN=1,^[QU]STRUCT(NOMG,NOST,1)=VPMIN,^[QU]STRUCT(NOMGC,NOST,1)=VPMIN
UNIT D POCLEPA^%VVIDEO
 S ^[QU]STRUCT(NOMG,NOST,4)="NH",^[QU]STRUCT(NOMGC,NOST,4)="NH"
FREQ 
 S PVAR=1,(^[QU]STRUCT(NOMGC,NOST,2),^[QU]STRUCT(NOMG,NOST,2))=PVAR,YY=1,VAL=VPMIN,DY=4 I VPMIN'="?" D ^%ABSCIS
VCOL 
 S NVC=49,(^[QU]STRUCT(NOMGC,NOST,3),^[QU]STRUCT(NOMG,NOST,3))=$C(NVC),(^[QU]STRUCT(NOMG,1,3,1),^[QU]STRUCT(NOMGC,1,3,1))=$S($C(NVC)=2:VC2,1:LCHP) S:($C(NVC)=2)&(PPY=0) (^[QU]STRUCT(NOMGC,1,6),^[QU]STRUCT(NOMG,1,6))=21
 F WWE=4:1:20 S ^[QU]STRUCT(NOMGC,2,"R",WWE)="        "
 D ^%ABSTRUS,^%QMDAK0,ZD^%QMDATE4 S ^[QU]SCRC(NOMG,"Dernier acces")=$$^%QZCHW("le ")_%DAT_$$^%QZCHW(" a ")_HEURE
 Q

