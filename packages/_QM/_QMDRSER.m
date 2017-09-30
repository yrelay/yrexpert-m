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

;%QMDRSER^INT^1^59547,73877^0
QMDRSER(%REG) 
 S %JO=$J
BEG S %REG="" D CURRENT^%IS K ^LISM($J),^SELEC(%JO),^POSENR(%JO),^POSID(%JO) S %ORD=1,R=0,PG=1,LI=14,LIM=21 F %U=1:1 S R=$N(^[QUI]PLCAREGI(R)) Q:R=-1  S PX=(((%U-1)#2)*40)+7,^POSID(%JO,PG,LI,PX)=R I (%U#2)=0 S LI=LI+1 I LI>LIM S LI=14,PG=PG+1
 S NBPG=$ZP(^POSID(%JO,"")),PG=1 D AFF
QU D POCLEPA^%VVIDEO W "Page ",PG,"/",NBPG," +,-,page,CTRLE (Acces),CTRLA " S DX=$X D ^%VLEC G AC:CTRLE,FIN:CTRLA,QU:Y1="",PL:Y1="=",PL:Y1="+",MS:Y1="-" S %PCH=Y1 D ^%QZNBN1 G QU:'(ISNUM),QU:Y1=PG S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
FIN S %ORD=-1 F %U=1:1 S %ORD=$N(^SELEC(%JO,%ORD)) Q:%ORD=-1  S ^LISM($J,%U)=^SELEC($J,%ORD)
END S DX=0,DY=13 D CLEBAS^%VVIDEO K ^POSENR($J),^POSID($J),^SELEC($J),%ORD,ORD,NPG,PG,%PCH,Y1,%JO Q
AC D POCLEPA^%VVIDEO W "[RETURN] sur regime selectionne, CTRLA"
 S PY=$O(^POSID(%JO,1,"")) G FIN:PY="" S PX=$O(^POSID(%JO,1,PY,"")),TBMOV="^POSID(%JO,PG)"
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G LEC:'($D(^POSID(%JO,PG,PY,PX))),QU:X1=1,OK:X1=13,LEC
OK G LEC:$D(^POSENR(%JO,PG,PY,PX)) S %REG=^POSID(%JO,PG,PY,PX) G END
AFF S DX=0,DY=13 D CLEBAS^%VVIDEO S DXG=5,DYH=13,LH=71,LV=10,BLD=1 D CARS^%VVIDEO
 S DY=-1 F %U=0:0 S DY=$N(^POSID(%JO,PG,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(^POSID(%JO,PG,DY,DX)) Q:DX=-1  X XY W $E(^POSID(%JO,PG,DY,DX),1,34)
 I $D(^POSENR(%JO,PG,DY,DX)) S DX=DX-2 D REV^%VVIDEO,BLD^%VVIDEO X XY W ^POSENR(%JO,PG,DY,DX) D NORM^%VVIDEO S DX=DX+2
 Q
 ;

