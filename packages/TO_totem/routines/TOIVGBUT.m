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

;TOIVGBUT^INT^1^59547,74872^0
TOIVGBUT ;
 
QU S DX=0,DY=6,NBT=1,^BUT6($J)=0 D CLEBAS^%VVIDEO
 K ^BUT1($J),^BUT4($J),BUT2($J),^BUT3($J),^BUT($J)
 F %U=1:1 W !,$$^%QZCHW("But No "),NBT," : " S (DXC,DX)=$X,(DYC,DY)=$Y D ^%VLEC G:CTRLA=1 STOP G:Y1="" FIN D QUA
 
QUA S PCH=Y1 D ^%LXABR G:CONCUR'=1 QUA1
 S ^BUT($J,NBT)="IMPLICI~"_PCHCOMP,^BUT4($J,"IMPLICI",PCHCOMP)=NBT,NBT=NBT+1,DX=DXC,DY=DYC X XY W PCHCOMP I $Y>21 S DX=0,DY=6 D CLEBAS^%VVIDEO
 Q
QUA1 D ^%VSQUEAK W $S(CONCUR=0:$$^%QZCHW(" Inconnu"),1:$$^%QZCHW(" Ambigu")) I $Y>21 S DX=0,DY=6 D CLEBAS^%VVIDEO
 Q
STOP K ^BUT($J)
FIN Q
ORD S ^BUT6($J)=^BUT6($J)+1,%TE="^TE($J)",%TS="^TS($J)",%TC="^TC($J)",%TR="^TR($J)" K @(%TE),@(%TC),@(%TS),@(%TR)
 S TB="^BUT4($J,""IMPLICI"")",TB1="^[QUI]TOIVDEF(YA,""IMPLICI"",P1,YA,""IMPLICI"",P2)",TB2="^[QUI]TOIVDEF(YA,""IMPLICI"",P2,YA,""IMPLICI"",P1)"
 S P1=-1 F %U=0:0 S P1=$N(@TB@(P1)) Q:P1=-1  S @%TC@(P1)=0
 F %U=0:0 S P1=$N(@TB@(P1)) Q:P1=-1  S P2=P1 F %U=0:0 S P2=$N(@TB@(P2)) Q:P2=-1  D T0
 D ^TO4TRITO S P1=-1 F %U=1:1 S P1=$N(@%TR@(P1)) Q:P1=-1  S ^BUT1($J,-(P1))="IMPLICI~"_@%TR@(P1)
 K %TE,%TS,%TC,%TR,TB,TB1,TB2,P1,P2,%U,%V G FIN
T0 I $D(@TB1)&$D(@TB2) G FIN
 I $D(@TB1) S:'($D(@%TS@(P1,P2))) @%TS@(P1,P2)=1,@%TE@(P2,P1)=1,@%TC@(P1)=@%TC@(P1)+1 G FIN
 I $D(@TB2) S:'($D(@%TS@(P2,P1))) @%TS@(P2,P1)=1,@%TE@(P1,P2)=1,@%TC@(P2)=@%TC@(P2)+1 G FIN
 G FIN
BUT K ^BUT3($J),^BUT2($J) S P1="" F %U=1:1 S P1=$O(^BUT1($J,P1)) Q:P1=""  S BUT=^BUT1($J,P1),^BUT3($J,P1)=BUT,^BUT2($J,$P(BUT,"~",1),$P(BUT,"~",2))=P1
 Q

