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

;%VCREM01^INT^1^59547,74034^0
GECREM01(K1,K2) 
BEG D CURRENT^%IS S %JO=$J K ^SELEC(%JO),^POSENR(%JO),^POSID(%JO) S R=K1,PG=1,LI=8,LIM=21
 S %U=0 F %V=1:1 S R=$N(^MASQUE(R)) Q:R=-1  Q:(K2'="")&($E(R,1,$L(K2))'=K2)  S OK=1 I OK S %U=%U+1,PX=(((%U-1)#3)*20)+10,^POSID(%JO,PG,LI,PX)=R I (%U#3)=0 S LI=LI+1 I LI>LIM S LI=8,PG=PG+1
 S OK=0,NBPG=$ZP(^POSID(%JO,"")),PG=1 D AFF0
QU D POCLEPA^%VVIDEO W "+, -, page, CTRLE (Acces), ",$$L24^%QSLIB2 S DX=$X D ^%VLEC
 G AC:CTRLE,FIN:CTRLA,QU:Y1="",PL:Y1="=",PL:Y1="+",MS:Y1="-" S %PCH=Y1 D ^%QZNBN1 G QU:'(ISNUM),QU:Y1=PG S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^POSID(%JO,NPG))) QU S PG=NPG D AFF G QU
FIN Q
AC D POCLEPA^%VVIDEO W "[RETURN] sur masque selectionne, ",$$L24^%QSLIB2 S PX=10,PY=8,TBMOV="^POSID(%JO,PG)"
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G LEC:'($D(^POSID(%JO,PG,PY,PX))),QU:X1=1,INT:X1=63,OK:X1=13,LEC
INT S SCR=$P(^POSID(%JO,PG,PY,PX),",",1) D CLEPAG^%VVIDEO,^%VAFIMAS(SCR,PAGE,TB),^%VZEAVT(""),CLEPAG^%VVIDEO,AFF0 G LEC
OK S OK=1,SCR=$P(^POSID(%JO,PG,PY,PX),",",1) G FIN
AFF0 D CLEPAG^%VVIDEO S MSG="Masques existants",DYH=2,DXG=20-($L(MSG)\2) D BIG^%VVIDEO
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S DXG=8,DYH=7,LH=70,LV=16,BLD=1 D CARS^%VVIDEO S DY=6,MSG="Page "_PG_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG
 S DY=-1 F %U=0:0 S DY=$N(^POSID(%JO,PG,DY)) Q:DY=-1  S DX=-1 F %U=0:0 S DX=$N(^POSID(%JO,PG,DY,DX)) Q:DX=-1  X XY W ^POSID(%JO,PG,DY,DX)
 Q

