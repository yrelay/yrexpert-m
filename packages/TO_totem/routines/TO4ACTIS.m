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

;TO4ACTIS^INT^1^59547,74871^0
TO4ACTIS ;
 
 S LEX=$L(%EXPERT),DX=40-(LEX\2),DY=0 X XY D BLD^%VVIDEO W %EXPERT D NORM^%VVIDEO
B S ABENDSCR=0,CTRLF=0 K RESUL S DX=0,DY=^%SCRE(SCR,1,3)
 S SCR1=SCR_",COMMENT",DY1=25 S:$D(^%SCRE(SCR1)) DY1=^%SCRE(SCR1,1,3)
 S:DY>DY1 DY=DY1
 D CLEBAS^%VVIDEO
SUITE K ^IGCURGRI($I,SCR),^GCURGRIL($I,SCR) F ICC=1:1:^%SCRE(SCR) S XX=^%SCRE(SCR,ICC,2),YY=^%SCRE(SCR,ICC,3),^GCURGRIL($I,SCR,YY,XX)=ICC,^IGCURGRI($I,SCR,-(YY),XX)=1
 F ICC=1:1:^%SCRE(SCR) S RESUL(ICC)="",DEJALU(ICC)=""
 S SCR1=SCR_",COMMENT" F ICC=1:1 Q:'($D(^%SCRE(SCR1,ICC)))  S C=^%SCRE(SCR1,ICC,1),DX=^%SCRE(SCR1,ICC,2),DY=^%SCRE(SCR1,ICC,3) X XY W C
BEG S ICC=1
LOP S REFUSE=0,ESCMV=""
 G FIN:('($D(^%SCRE(SCR,ICC))))!(CTRLF'=0)
 I DEJALU(ICC)="" D LOP3 G ABEND:ABENDSCR=1,LOP:ESCMV=1
 S ICC=ICC+1 G LOP
FIN K DEJALU Q
LOP3 S YG=RESUL(ICC) D POCLEPA^%VVIDEO W:ICC>%DRES $S($D(^TO4GEXPL($I,ICC-%DRES)):^TO4GEXPL($I,ICC-%DRES),1:" ??? ") S C=^%SCRE(SCR,ICC,1),DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY
 W C D ^%VTFLD G ABEND:X1<2,ESCMV:X1=27
 S LL=$L(RESUL(ICC)),RESUL(ICC)=$S(Y1'="":Y1,$D(^%SCRE(SCR,ICC,5)):^%SCRE(SCR,ICC,5),1:"")
 I $E(RESUL(ICC),1,1)="@" S RZZ=$E(RESUL(ICC),2,299),RESUL(ICC)=@RZZ,TAB(ICC)=RESUL(ICC) D ^%VAFFICH
 I $D(^%SCRE(SCR,ICC,5)) S TAB(ICC)=RESUL(ICC) D ^%VAFFICH:RESUL(ICC)=^%SCRE(SCR,ICC,5)
 F LI=$L(RESUL(ICC))+1:1:LL W " "
 S STOPUC=0 D VERIF G REFULOP:REFUSE=1 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" F UVU=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UVU) Q:UCONT=""  S IC=ICC D @UCONT G REFULOP:REFUSE=1 Q:STOPUC=1
 Q
ABEND S ABENDSCR=1 Q
UCONT Q:'($D(^%SCRE(SCR,ICC,4)))  Q:^%SCRE(SCR,ICC,4)=""  S UCONT=^%SCRE(SCR,ICC,4) Q:UCONT=""  S IC=ICC D @UCONT Q
ESCMV G @XG3
65 S DYC=$Y,DYV=$O(^IGCURGRI($I,SCR,-(DYC))) I DYV="" S ESCMV=1 D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,-(DYV),-1)),ICC=^GCURGRIL($I,SCR,-(DYV),DXV),DEJALU(ICC)="",ESCMV=1 Q
66 S DYC=$Y,DYV=$O(^GCURGRIL($I,SCR,DYC)) I DYV="" S ESCMV=1 D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,DYV,-1)),ICC=^GCURGRIL($I,SCR,DYV,DXV),DEJALU(ICC)="",ESCMV=1 Q
67 S ICC=ICC+1,DEJALU(ICC)="",ESCMV=1 Q
68 S ICC=ICC-1,DEJALU(ICC)="",ESCMV=1 Q
VERIF Q:'($D(^%SCRE(SCR,ICC,6)))  S NVLEG=^%SCRE(SCR,ICC,6) Q:NVLEG'>0
 F IV=1:1:NVLEG S VLEG=^%SCRE(SCR,ICC,6+IV) G FVER:VLEG=RESUL(ICC)
 S REFUSE=1 Q
FVER Q
REFULOP D ^%VREFUSE S DEJALU(ICC)="" G LOP

