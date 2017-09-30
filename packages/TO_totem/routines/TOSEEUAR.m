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

;TOSEEUAR^INT^1^59547,74875^0
TOSEEUAR ;
 
 D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("USINAGE ARTICLE") D TO4^%VZCD S DX=0,DY=10 X XY W $$^%QZCHW("Un instant...")
 K ^NBUSART($I),^POSENR($I) S PAGE=0,LG=21,NFI=-1,NUMUS=0 F %NN=1:1 S NFI=$N(^[QUI]USINART(YA,NFI)) Q:NFI=-1  D TR
 G:'($D(^POSENR($I))) END S DX=0,DY=6 D CLEBAS^%VVIDEO W $$^%QZCHW("Nombre    Usinages possibles") S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=7 D CLEBAS^%VVIDEO G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets") S PAG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=5 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1=$$^%QZCHW("-")
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
65 D ^TOTRUART G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  X XY S LIGNE=^POSENR($I,PAGE,DY) W $P(LIGNE,"^",1),?10,$P(LIGNE,"^",2)
 G SUIT
END K ^POSENR($I),PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP,NFI,LG,%NN,TYPUS,%TT,DATA Q
FIN Q
TR S DATA=^[QUI]USINART(YA,NFI) F %TT=1:1:10 S TYPUS=$P(DATA,"^",%TT) I TYPUS'="" S LG=LG+1 S:LG>21 PAGE=PAGE+1,LG=8 S NUMUS=NUMUS+1,^POSENR($I,PAGE,LG)=1_"^"_TYPUS_"^"_NUMUS,^NBUSART($I,NUMUS,TYPUS)=1
 Q

