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

;TOP0XREC^INT^1^59547,74874^0
TOP0RECU ;
 D POCLEPA^%VVIDEO W "Un instant..." S %JO=$J,DT=-1 K ^UTILITY(%JO)
 F %U=1:1 S DT=$N(^[QUI]TOP0XGET(DT)) Q:DT=-1  S DAT=$E(DT,5,6)_"/"_$E(DT,3,4)_"/"_$E(DT,1,2),HE=-1 F %V=1:1 S HE=$N(^[QUI]TOP0XGET(DT,HE)) Q:HE=-1  S HH=$TR(HE,".","H"),^UTILITY(%JO,DAT_" "_HH)=1
BEG D CURRENT^%IS K ^SELEC(%JO),^POSENR(%JO),^POSID(%JO) S R=0,PG=1,LI=8,LIM=21 F %U=1:1 S R=$N(^UTILITY(%JO,R)) Q:R=-1  S PX=(((%U-1)#3)*20)+10,^POSID(%JO,PG,LI,PX)=R I (%U#3)=0 S LI=LI+1 I LI>LIM S LI=8,PG=PG+1
 S NBPG=$ZP(^POSID(%JO,"")),PG=1 D AFF
QU D POCLEPA^%VVIDEO W $$L17^%QSLIB1("CTRLE (Acces), (T)out") S DX=$X D ^%VLEC G AC:CTRLE,FIN:CTRLA,TOUT:Y1="T",QU:Y1="",PL:Y1="=",PL:Y1="+",MS:Y1="-" S %PCH=Y1 D ^%QZNBN1 G QU:'(ISNUM),QU:Y1=PG S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
FIN Q
TOUT K ^SELEC(%JO) S DT=-1 F %U=1:1 S DT=$N(^UTILITY(%JO,DT)) Q:DT=-1  S ^SELEC(%JO,DT)=1
 G FIN
AC S PX=10,PY=8,TBMOV="^POSID(%JO,PG)"
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G LEX:'($D(^POSID(%JO,PG,PY,PX))),QU:X1=1,OK:X1=13,INT:X1=63,DEL:(X1=7)!(X1=127),LEC
OK S DX=PX-1,DY=PY D REV^%VVIDEO,BLD^%VVIDEO X XY W " " S ^SELEC(%JO,^POSID(%JO,PG,PY,PX))=1,^POSENR(%JO,PG,PY,PX)=1 D NORM^%VVIDEO G LEC
DEL S DX=PX-1,DY=PY X XY W " " K ^SELEC(%JO,^POSID(%JO,PG,PY,PX)),^POSENR(%JO,PG,PY,PX) G LEC
INT D CLEPAG^%VVIDEO S PGM=^POSID(%JO,PG,PY,PX) X "ZL @PGM P  R !,!,""RETURN"",*R" D AFF G LEC
AFF D CLEPAG^%VVIDEO S DXG=8,DYH=7,LH=70,LV=16,BLD=1 D CARS^%VVIDEO S DY=6,MSG="Page "_PG_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG
 S DY=-1 F %U=0:0 S DY=$N(^POSID(%JO,PG,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(^POSID(%JO,PG,DY,DX)) Q:DX=-1  X XY W ^POSID(%JO,PG,DY,DX) I $D(^POSENR(%JO,PG,DY,DX)) S DX=DX-1 D REV^%VVIDEO,BLD^%VVIDEO X XY W " " D NORM^%VVIDEO S DX=DX+1
 Q

