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

;%VACTUSE^INT^1^59547,74033^0
ACTUSER(DEV,AD) 
 I '($D(^TOLISRAM(DEV,30))) S AD="%%%" G FIN
 D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,BIG=1,MSG=$$^%QZCHW("Menu libre sur terminal")_" "_$I D ^%VZCD0(MSG)
BEG S DXG=0,DYH=6,LV=12,LH=78,BLD=1 D:'(^TOZE($I,"NEWCADRE")) CARS^%VVIDEO S DXG=0,DYH=19,LV=4,LH=78,BLD=0 D CARS^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 K ^MNUS($J) S NU=0,LIB="",^MNUS($J)="20^3^77^1"
LP S NU=NU+1,LIB=$O(^TOLISRAM(DEV,30,LIB)) G:LIB="" FLQ S X="#"_LIB_"#"_$S($D(^TOLISRAM(DEV,30,LIB,"LIB")):" : "_$$^%QZCHW(^TOLISRAM($I,30,LIB,"LIB")),1:""),^MNUS($J,NU)=X_$J("",70-$L($TR(X,"#","")))_"^"_LIB
 S ^MNUS($J,NU,"EQU")=NU,^MNUS($J,NU,"COM")=$S($D(^TOLISRAM(DEV,30,LIB,"COM")):$$^%QZCHW(^TOLISRAM($I,30,LIB,"COM")),1:"") G LP
FLQ D POCLEPA^%VVIDEO W "CTRLG ",$$^%QZCHW("pour gommer")," CTRLL ",$$^%QZCHW("pour paginer"),*-1
FLP D CHM,^%VMENUPG("TBM",.AD,.%CTR) K TBM S ADC=$P(%CTR,"^",2),%CTR=$P(%CTR,"^",1) G FIN:(%CTR="A")!(%CTR="F"),GOM:%CTR="G",FLP:AD="",FIN
GOM K ^TOLISRAM(DEV,30,ADC) D KILL^%VGERMPG("%MNUS") S DX=0,DY=6 X XY D CLEBAS^%VVIDEO G:$D(^TOLISRAM(DEV,30)) BEG S AD="" G FIN
FIN K LIB,%CTR Q
CHM K TBM S TBM("PG")="%MNUS",CHM=$P($T(CHM0),";;",2) F %V=1:1 S %U=$P(CHM,";",%V) Q:%U=""  S TBM($P(%U,"=",1))=$P(%U,"=",2)
 K CHM Q
CHM0 ;;XG=5;XD=75;YH=7;YB=16;DL=1;MES=^MNUS($J)

