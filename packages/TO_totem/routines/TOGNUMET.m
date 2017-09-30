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

;TOGNUMET^INT^1^59547,74872^0
TOGNUMET ;
 D CLEPAG^%VVIDEO S DXG=0,DYH=0,DXD=39,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Etudes") D TO4^%VZCD
 S DXG=0,DYH=7,LH=79,LV=10,BLD=1 D CARS^%VVIDEO
 S DXG=0,DYH=18,LH=79,LV=3,BLD=1 D CARS^%VVIDEO
 S DXG=0,DYH=21,LH=79,LV=3,BLD=1 D CARS^%VVIDEO
 K ^%ANONC1($J),^%ANONC2($J) S PGE=1,(LI,LIC)=8,LIM=16
LEC D CLEBA W $$^%QZCHW("Etude : ") S DX=$X D ^%VLEC G SUIT:CTRLF,SUIT:CTRLA,LEC:Y1="",KN:$D(^[QUI]TREEWORK(Y1)) S %NTO=Y1 D ^TONUMTOT S Y1=%NTO I '($D(^[QUI]TREEWORK(Y1))) D ^%VSQUEAK G LEC
KN S NUFA=Y1 D STOC G LEC
STOC S (REF,RS)=NUFA
 S TB="^%ANONC2($J,"""_REF_""")" G:$D(@TB) FIN S @TB=PGE_"^"_LI,^%ANONC1($J,PGE,LI)=RS,IT=$P($T(POS),";;",2),LCH=$P(IT,"/",2),IT=$P(IT,"/",1),DX=IT,DY=LI X XY W $J("",LCH) X XY W $E(NUFA,1,LCH)
 S LI=LI+1 G FIN:LI<LIM S DX=1 F DY=8:1:LIM-1 X XY W $J("",76)
 S PGE=PGE+1,LI=LIC G FIN
SUIT G FIN:'($D(^%ANONC1($J)))
 S NPG=$ZP(^%ANONC1($J,"")),PGE=1 D AFF
QU S DX=1,DY=22 X XY W $J("",77) X XY W $$L17^%QSLIB1("CTRLE, CTRLF Fin et traitement ") S DX=$X D ^%VLEC G FIN:CTRLA,ANO:CTRLF,OPER:CTRLE,QU:Y1="",MS:Y1="-",PL:(Y1="+")!(Y1="="),QU:'($D(^%ANONC1($J,Y1))),QU:Y1=PGE S PGE=Y1 D AFF0 G QU
MS S NEW=PGE-1 G QU:'($D(^%ANONC1($J,NEW))) S PGE=NEW D AFF0 G QU
PL S NEW=PGE+1 G QU:'($D(^%ANONC1($J,NEW))) S PGE=NEW D AFF0 G QU
OPER S DX=1,DY=22 X XY W $J("",77) X XY W $$^%QZCHW("(S)uppression, "),$$L24^%QSLIB2 S PY=$O(^MOVC($J,"")) G QU:PY="" S PX=$O(^MOVC($J,PY,"")) G QU:PX="" S TBMOV="^MOVC($J)"
MOV S DX=PX,DY=PY X XY D ^%VZEREVS G QU:(X1=1)!(X1=6) S PX=$X,PY=$Y G MOD:X1=$A("M"),SUP:X1=$A("S"),MOV:'($D(^%ANONC1($J,PGE,PY))),MOV
SUP D CLEBA W $$^%QZCHW("Confirmer la (S)uppression ") R *X:60 S X=$C(X) I X'=$$^%QZCHW("S") D CLEBA G MOV
 D CLEBA S RS=^%ANONC1($J,PGE,PY),REF="" F %U=1:1 S IT=$P(RS,"^",%U) Q:IT=""  S REF=REF_$S(REF="":"",1:",")_""""_IT_""""
 K ^MOVC($J,PY),@("^%ANONC2($J,"_REF_")"),^%ANONC1($J,PGE,PY) S DX=1,DY=PY X XY W $J("",76) G MOV
AFF D CUROF^%VVIDEO S DX=0,DY=-1 F DY=7:1:16 X XY W $J("",79)
 S DXG=0,DYH=7,LH=79,LV=10,BLD=1 D CARS^%VVIDEO
AFF0 K ^MOVC($J) D CUROF^%VVIDEO S DX=1,DY=-1 F DY=8:1:15 X XY W $J("",77)
 S DX=0,DY=6 X XY W $J("",79) S MSG=$$^%QZCHW("Page ")_PGE_"/"_NPG,DY=6,DX=40-($L(MSG)\2) X XY W MSG S POS=$P($T(POS),";;",2),DX=2,DY=-1
 F %U=1:1 S DY=$N(^%ANONC1($J,PGE,DY)) Q:DY=-1  S RS=^%ANONC1($J,PGE,DY) F %U=1:1 S IT=$P(POS,",",%U) Q:IT=""  S LCH=$P(IT,"/",2),IT=$P(IT,"/",1),DX=IT X XY W $E($P(RS,"^",%U),1,LCH) I DX=2 S ^MOVC($J,DY,DX)=$P(RS,"^",%U)
 D CURON^%VVIDEO Q
FIN Q
CLEBA S DX=1,DY=19 X XY W $J("",77) X XY Q
ANO S %OK=1 G FIN
POS ;;2/25

