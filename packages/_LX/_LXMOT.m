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

;%LXMOT^INT^1^59547,73870^0
LEXMOT(MOT,PX,PY,OK,FULL) 
 S OK=1,FULL="" K TBF,UNK F %U=1:1 S PCH=$P(MOT,"~",%U) Q:PCH=""  D ABR
 I OK S %V="" F %U=1:1 S %V=$O(TBF(%V)) Q:%V=""  S FULL=FULL_$S(FULL="":"",1:"~")_TBF(%V)
 G:(PX="")!(PY="") FIN
AFF S DX=PX,DY=PY X XY W $J("",$L(MOT)) X XY F %U=1:1 S PCH=$P(MOT,"~",%U) Q:PCH=""  D ECR
FIN Q
ECR W:%U>1 "~" S DX=$X,DY=$Y I $D(UNK(%U)) D BLD^%VVIDEO X XY W UNK(%U) S DX=$X,DY=$Y D NORM^%VVIDEO X XY Q
 W TBF(%U) Q
ABR D ^%LXABR I CONCUR=1 S TBF(%U)=PCHCOMP Q
 S UNK(%U)=PCH,TBF(%U)=PCH,OK=0 Q
TEST W !,$$^%QZCHW("A tester : ") S AX=$X,AY=$Y R X Q:$A(X)<32  D ^%LXMOT(X,AX,AY,.OK,.F) G TEST

