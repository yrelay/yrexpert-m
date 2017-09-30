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

;SOURJEU1^INT^1^59547,74868^0
SOURJEU1 ;
 
 K ^STOP($I) D ^SOURAIRJ F X1=1:1:19 S ^STOP($I,X1,11)=1,^STOP($I,X1,0)=1 I X1<11 S ^STOP($I,20,X1)=1,^STOP($I,0,X1)=1
 S LI="COR"_%J,LI=$P($T(@LI),";;",2) F %U=1:1 S CC=$P(LI,"/",%U) Q:CC=""  S X1=$P(CC,",",1),Y1=$P(CC,",",2) D T0
 S LI="SF"_%J,LI=$P($T(@LI),";;",2),CC=$P(LI,"/",1),CC1=$P(CC,"#",1),XDEP=$P(CC1,",",1),YDEP=$P(CC1,",",2),CC1=$P(CC,"#",2),DX=$P(CC1,",",1),DY=$P(CC1,",",2) D REV^%VVIDEO X XY W $$^%QZCHW("S")
 S CC=$P(LI,"/",2),CC1=$P(CC,"#",1),XF=$P(CC1,",",1),YF=$P(CC1,",",2),CC1=$P(CC,"#",2),DX=$P(CC1,",",1),DY=$P(CC1,",",2) D REV^%VVIDEO X XY W "F" D NORM^%VVIDEO
 S LI="PAR"_%J,LI=$P($T(@LI),";;",2),%U=1 D POCLEPA^%VVIDEO F X1=$$^%QZCHW("Odeur/%FL"),$$^%QZCHW("Porosite/%PO"),$$^%QZCHW("Nombre de dents/%NBDTS") W $P(X1,"/",1)," : ",$P(LI,"/",%U),"       " S CC=$P(X1,"/",2),@CC=$P(LI,"/",%U),%U=%U+1
FIN D ^SOURFLAI K LI,%U,CC,X1,Y1,CC1,X,Y,YY Q
T0 S X=X1/4,Y=11-(Y1/2),^STOP($I,X,Y)=1
 S DX=X1-2,DY=Y1-1 D REV^%VVIDEO F YY=1:1:3 X XY W "     " S DY=DY+1
 Q
COR1 ;;8,20/12,18/16,16/20,14/24,12/28,10/32,10/36,10/40,12/44,14/48,16/52,18/56,20
SF1 ;;1,1#4,20/19,1#76,20
PAR1 ;;0/20/0
COR2 ;;12,6/12,8/12,10/12,12/12,14/12,16/12,18/16,6/16,18/20,6/20,18/24,6/24,8/24,10/24,14/24,16/24,18/28,10/28,14/32,10/32,14/36,10/36,14/40,10/40,14/44,10/44,14/48,10/48,14/52,10/52,14/56,10/56,14/60,10/60,14/64,10/64,14
SF2 ;;2,5#8,12/5,3#20,16
PAR2 ;;20/0/0

