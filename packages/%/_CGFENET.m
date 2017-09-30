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
;! Module      : Caractères graphiques (CG)                                   !
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

;%CGFENET^INT^1^59547,73867^0
CGFENETR ;
INIT 
 S P1X=12,P1Y=7
 K POS S IL=7,IC=10,L=-1 F %L=0:0 S L=$N(^CAGRAPH(ENS,"LETTRES",L)) Q:L=-1  D INCR S POS(IL,IC)=L
 Q
INCR S IC=IC+2 I IC>50 S IC=10,IL=IL+2
 Q
CLEG S DY=-1 F %DY=0:0 S DY=$N(POS(DY)) Q:DY=-1  S DX=-1 F %DX=0:0 S DX=$N(POS(DY,DX)) Q:DX=-1  X XY W " "
 Q
AFFG S DY=-1 F %DY=0:0 S DY=$N(POS(DY)) Q:DY=-1  S DX=-1 F %DX=0:0 S DX=$N(POS(DY,DX)) Q:DX=-1  X XY D ^%CGW(ENS,POS(DY,DX))
 Q
CLEAR 
 F DX=57:3:75 F DY=1:2:19 X XY W "  "
 Q
AFFD D REV^%VVIDEO
 F DX=57:3:75 F DY=1:2:19 I $D(FEN(DX,DY)) X XY W "  "
 D NORM^%VVIDEO Q
CHLETR 
 D POCLEPA^%VVIDEO W "Choisissez un caractere avec le curseur puis [RETURN]"
 I $D(POS(P1Y,P1X)) D REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO S DX=13,DY=19 X XY W POS(P1Y,P1X) D NORM^%VVIDEO
DEPL S DX=P1X,DY=P1Y X XY S MPASX=2,MPASY=2,NXI=11,NXS=52,NYI=6,NYS=16
 D ^%CGMOVCU S P1X=DX,P1Y=DY F I=1,6,13 G:X1=I @I
 D ^%VSQUEAK G DEPL
1 S %LETR="" Q
6 I '($D(POS(DY,DX))) D ^%VSQUEAK G DEPL
 S %LETR=POS(DY,DX) Q
13 G 6
ADD 
 S MOD=0 D CLEAR K FEN S DX=13,DY=19 D REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO X XY W LETTRE D NORM^%VVIDEO
AD S P2X=57,P2Y=1 D POCLEPA^%VVIDEO W "Dessinez votre caractere avec le curseur"
DEP S DX=P2X,DY=P2Y X XY S MPASX=3,MPASY=2,NXI=56,NXS=76,NYI=0,NYS=20
 D ^%VZECUR S P2X=DX,P2Y=DY F I=1,6,13 G:I=X1 @("ADD"_I)
 D ^%VSQUEAK G DEP
ADD1 Q
ADD6 I MOD K POS(P1Y,P1X) S ^("CARD")=^CAGRAPH(ENS,"CARD")-1
 D ^%CGADCAR,AFFG Q
ADD13 G @("ADD13"_$D(FEN(DX,DY)))
ADD130 S FEN(DX,DY)=1 D REV^%VVIDEO W "  " X XY D NORM^%VVIDEO G ADDS
ADD131 K FEN(DX,DY) W "  " X XY G ADDS
ADDS G:((NXS-1)=P2X)&((NYS-1)=P2Y) DEP S P2X=P2X+3 S:P2X>NXS P2X=NXI+1,P2Y=P2Y+2 G DEP
MOD 
 S MOD=1,LETTRE=POS(DY,DX) D CLEAR,^%CGLODCA,AFFD G AD
 Q
SUP 
 S MOD=0 X XY W " " K ^CAGRAPH(ENS,"LETTRES",POS(DY,DX)),POS(DY,DX)
 S ^("CARD")=^CAGRAPH(ENS,"CARD")-1
 S DX=13,DY=19 X XY W $J("",37) Q

