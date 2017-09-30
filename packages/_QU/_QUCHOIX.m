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

;%QUCHOIX^INT^1^59547,73884^0
%QUCHOIX(GL,MOD,DEB,XG,YH,DH,DV) 
 
 
 
 
 
 
 
 
 
 N COUR,%F,FIN,I,PAGE,PX,PY,SEL,X1
 S (SEL,COUR)=$S(MOD=1:$N(@GL@(-1)),1:$O(@GL@($ZP(@GL@(DEB)))))
 I COUR=-1 D POCLEPA^%VVIDEO,^%VSQUEAK W "Rien a lister actuellement ..." H 3 D POCLEPA^%VVIDEO Q ""
 S:(SUB="C-IBM PC")&((XG+DH)>79) DH=79-XG
 S PX=XG+2,PY=YH+1,PAGE=1,PAGE(1,PAGE)=COUR,PAGE(2,COUR)=PAGE D REAFF
HE D HELP
L0 D ECHOFF^%VVIDEO,POS,AFF,POS1,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F F I=1,6,13,18,43,45,61,95 G:I=X1 @I
 D ^%VSQUEAK G L0
1 Q ""
6 Q ""
13 Q SEL
18 D REAFF G L0
43 I FIN="" D ^%VSQUEAK G L0
 S I=$O(@GL@(FIN)) I MOD=3,$F(I,DEB,0)'=($L(DEB)+1) D ^%VSQUEAK G L0
 I I="" D ^%VSQUEAK G L0
 D PAGP,REAFF S SEL=COUR,PY=YH+1 G L0
45 I PAGE=1 D ^%VSQUEAK G L0
 D PAGM,REAFF S SEL=FIN,PY=(YH+DV)-2 G L0
61 G 43
95 G 45
H G:PY'=(YH+1) HOK I PAGE=1 D ^%VSQUEAK G L0
 D PAGM,REAFF S SEL=FIN,PY=(YH+DV)-2 G L0
HOK D POS,NET,POS1 S PY=PY-1,SEL=$ZP(@GL@(SEL)) G L0
B S I=$O(@GL@(SEL)) I (I="")!(I="z") D ^%VSQUEAK G L0
 G:PY'=((YH+DV)-2) BOK I FIN="" D ^%VSQUEAK G L0
 D PAGP,REAFF S SEL=COUR,PY=YH+1 G L0
BOK I MOD=3 S I=$O(@GL@(SEL)) I $F(I,DEB,0)'=($L(DEB)+1) D ^%VSQUEAK G L0
 D POS,NET,POS1 S PY=PY+1,SEL=$O(@GL@(SEL)) G L0
G G L0
D G L0
AFF D REV^%VVIDEO,BLD^%VVIDEO W $S($L(SEL)<(DH-4):SEL,1:$$^%QZCHEV(SEL,DH-4,"P")) D NORM^%VVIDEO Q
NET W $S($L(SEL)<(DH-4):SEL,1:$$^%QZCHEV(SEL,DH-4,"P")) Q
HELP S DX=XG+2,DY=(YH+DV)-1 X XY W " (+),(-) " Q
REAFF S DXG=XG,DYH=YH,LH=DH,LV=DV,BLD=1 D CARS^%VVIDEO
 S DX=XG+1 F DY=YH+1:1:(YH+DV)-2 X XY W $J("",DH-2)
 D HELP,PAGE,NOPA Q
PAGE N LOC S LOC=COUR,DX=XG+2 F DY=YH+1:1:(YH+DV)-2 X XY W $J("",DH-4) D TLOC
 S FIN=$ZP(@GL@(LOC)) Q
TLOC Q:LOC="z"  G:MOD=3 TL2 I LOC'="" X XY W $S($L(LOC)<(DH-4):LOC,1:$$^%QZCHEV(LOC,DH-4,"P")) S LOC=$O(@GL@(LOC))
 Q
TL2 I $F(LOC,DEB,0)=($L(DEB)+1) X XY W $S($L(LOC)<(DH-4):LOC,1:$$^%QZCHEV(LOC,DH-4,"P")) S LOC=$O(@GL@(LOC))
 Q
POS S DX=PX,DY=PY X XY Q
POS1 S DX=PX-1,DY=PY X XY Q
PAGP S PAGE=PAGE+1 I $D(PAGE(1,PAGE)) S COUR=PAGE(1,PAGE) Q
 S COUR=$O(@GL@(FIN)),PAGE(1,PAGE)=COUR,PAGE(2,COUR)=PAGE Q
PAGM S COUR=PAGE(1,PAGE-1),PAGE=PAGE-1 Q
NOPA S DX=(XG+(DH\2))-5,DY=YH X XY W " Page : ",PAGE," " Q
 
 
 
 
 
 
SUP(GLOBAL,TEXTE,XG,YH,DH,DV) N DER,MODE
 S DER=$L(TEXTE),DER=$E(TEXTE,DER) I "?*"'[DER D ^%VSQUEAK Q "?"
 S MODE=$S(TEXTE="?":1,DER="?":2,1:3)
 S TEXTE=$S(MODE=1:"",1:$E(TEXTE,1,$L(TEXTE)-1))
 Q $$^%QUCHOIX(GLOBAL,MODE,TEXTE,XG,YH,DH,DV)

