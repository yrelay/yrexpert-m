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

;%MZTREL^INT^1^59547,73872^0
MOZTREL ;
 
 K ^DEJAVU($J),^RELSEL($J) D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Acces aux fiches de SF" D 4^%VZCD
 S PGE=1,LIC=8,PG=-1 F %U=0:0 S PG=$N(^SELEC($J,PG)) G:PG=-1 FPG S LI=-1 F %U=0:0 S LI=$N(^SELEC($J,PG,LI)) Q:LI=-1  D GPG
GPG S RF=^POSENR($J,PG,LI) K %V F %U1=1:1:3 S %V(%U1)=$P(RF,"^",%U1)
 K VALCLE S VALCLE(1)=%V(1) G @("T"_%V(3))
T0 G TR
T1 S VALCLE(2)=$P(%V(2),".",1) G TR
T2 S VALCLE(3)=$P(%V(2),".",2) G TR
T3 S VALCLE(2)=$P(%V(2),".",1),VALCLE(3)=$P(%V(2),".",2)
TR S NOMTAB="^[QUI]MOZREL",ADR="TR1^%MZTREL" D ^%VKMULG Q
TR1 Q:$D(^DEJAVU($J,B1,B2,B3,B4))  S ^RELSEL($J,PGE,LIC)=B1_"^"_B2_"^"_B3_"^"_B4,^DEJAVU($J,B1,B2,B3,B4)=1,LIC=LIC+1 I LIC>21 S PGE=PGE+1,LIC=8
 Q
FPG S:'($D(DEBY)) DEBY=8 S NBPGE=$S($D(^RELSEL($J,PGE)):PGE,1:PGE-1),PGE=1,DX=0,DY=DEBY D CLEBAS^%VVIDEO G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2($$^%QZCHW("a la grille")) S GAP="Page "_PGE_"/"_NBPGE
 S DX=40-($L(GAP)\2),DY=6 X XY W GAP S DX=(($X-$L(NBPGE))-1)-$L(PGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,5:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) SUIT S NGAP=Y1 G AFF
1 G END
5 D ^%MZGFIC G SUIT
43 G 61
45 S NGAP=PGE-1 G AFF
61 S NGAP=PGE+1 G AFF
AFF I '($D(^RELSEL($J,NGAP))) D ^%VSQUEAK G SUIT
 S PGE=NGAP,DX=0,DY=DEBY+2 D CLEBAS^%VVIDEO
AFF1 O 0 S PTS=" "
 S DY=-1 F %QY=1:1 S DY=$N(^RELSEL($J,PGE,DY)) Q:DY=-1  D AFF2
 K PTS,PS,PS1,PS2 G SUIT
AFF2 S DX=0 X XY S PS=^RELSEL($J,PGE,DY) W $P(PS,"^",1),?20,$E($P(PS,"^",2),1,25),?46,$E($P(PS,"^",3),1,25),?73,$P(PS,"^",4)
 Q
END S DX=0,DY=DEBY D CLEBAS^%VVIDEO K ^RELSEL($J),GAP,PGE,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NGAP,%QY,TIT Q

