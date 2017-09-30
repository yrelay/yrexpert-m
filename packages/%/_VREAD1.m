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

;%VREAD1^INT^1^59547,74036^0
VVREAD1 ;
 
 
 
LEC I '($$MORE^%VZATOU(.X1,.F,.CTR,.ESC,ATTENTE,0)) S X1=1,CTR="A" G CTRL
 I X1'="" G LEK
 G 65:F="G",66:F="D",67:F="H",68:F="B",EOL:F="2",FIN:(F="RETURN")&(%TAB=0)
 G MFLD:CTR="I",MFLD:(F="RETURN")&(%TAB=1),DEL^%VREADD:F="DEL"
 G GOMME:CTR="G",CTRL:CTR'="",LEC:1
 
 
LEK I $L(YG)>500 D ^%VSQUEAK G LEC
 
 D PGD^%VREADG(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 I %TAB=0 S PD=$E(PD,2,9999)
 W $C(X1) S YG=PG0_PG_$C(X1)_PD_PD0 I VISU=1 D ZAVERTIS(YG),ZAVERTIS(PG),ZAVERTIS(PD) X XY
 S NBC=NBC+1,DX=DX+1
 
 
 I %TAB=1 G LEC1
 
LECB I DX<%LDX X XY G LEC
 
 I (DX'<%LDX)&((DY+1)<%YB) S DY=DY+1,DX=%LGX+1 X XY G LEC
 
 S TYPE="P",MODE=0
 D UCONT^%VREADU(UCONT,0,.TYPE,MODE,$$NL^%VREADG(YG,NBC,%LGX,%LDX),.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 
 I TYPE="L" D ^%VREADW("",DX,DY,%LGX,%LDX,%YB,0) X XY G LEC
 
 D PAGED(MODE)
 X XY
 G LEC
 
LEC1 I PD="" G LECB
 S MODE=0
 D BOUT^%VREADG(DX-1,DY,%LGX,%LDX,%YB,NBC-1,$E(YG,2,999),MODE,.TYPEB)
 I VISU=5 D MSG(TYPEB)
 
 I TYPEB="P" G LECL
 
 I DX<%LDX D ^%VREADW(PD,DX,DY,%LGX,%LDX,%YB,0) X XY G LEC
 
 I (DX'<%LDX)&((DY+1)<%YB) S DY=DY+1,DX=%LGX+1 D ^%VREADW(PD,DX,DY,%LGX,%LDX,%YB,0) X XY G LEC
 
 S TYPE="P",MODE=0
 D UCONT^%VREADU(UCONT,0,.TYPE,MODE,$$NL^%VREADG(YG,NBC,%LGX,%LDX),.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 
 D PAGED(MODE)
 X XY
 G LEC
LECL D UCONT^%VREADU(UCONT,1,.TYPEB,MODE,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 
 
 I DX'<%LDX S DY=DY+1,DX=%LGX+1
 D ^%VREADW(PD,DX,DY,%LGX,%LDX,%YB,0) X XY
 G LEC
 
 
 
AFFP 
 I PAGE=1 D ^%VREADW(MSG_YG,%LGX+1,%YH+1,%LGX,%LDX,%YB,0) X XY Q
 
 D ^%VREADW(PG_PD,%LGX+1,%YH+1,%LGX,%LDX,%YB,0) X XY
 Q
PAGED(MODE) 
 D PGD^%VREADG(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 I VISU=3 D ZAVERTIS(YG),ZAVERTIS(PG0),ZAVERTIS(PG),ZAVERTIS(PD)
 D AFFP D:VISU=6 MSG(PAGE)
 Q
 
 
FIN S TYPE="P1"
 D UCONT^%VREADU(UCONT,1,.TYPE,0,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,PAGE)
 I CTR="A" S YG=YY1
 I (TYPE="P2")!(CTR="A") S PAGE=1 D AFFP
 
 S:CTR'="A" YY1=YG
 
 
 I %TAB=1 S %TAB=0 D MFLD1
 I $$DIR^%QZCHMX(YY1) D ZAVERTIS($$^%QZCHW("Format incorrect ")) S %TAB=0 G MFLD
 D ECHON^%VVIDEO,NUMKP^%VVIDEO
 Q
ESC R *X,*Y G LEC:X'=$A("["),LEC:Y<65,LEC:Y>68,@Y
ESC0 R *X,*Y G LEC:X'=$A("["),LEC:Y<65,LEC:Y>68 S CTR="*"_Y G FIN
CTRL 
 I (CTR'="A")&(CTR'="F") D ^%VSQUEAK G LEC
 G FIN
 
MFLD 
 S %TAB=$S(%TAB=1:0,1:1)
 
 D MFLD1 G LEC
MFLD1 
 W $$XY^%VVIDEO1(@TBP@("DX"),@TBP@("DY")),$S(%TAB=1:$$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$REV^%VVIDEO1_@TBP@("MSGI")_$$NORM^%VVIDEO1,1:$J($E(@TBP@("MSG"),1,$L(@TBP@("MSGI"))),$L(@TBP@("MSGI")))),$$XY^%VVIDEO1(DX,DY)
 Q
 
GOMME D PGD^%VREADG(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 D ^%VREADW("",DX,DY,%LGX,%LDX,%YB,0) S YG=PG X XY
 G LEC
 
EOL D EOL^%VREAD2 G LEC
 
 
65 I VISU=2 D ZAVERTIS(NBC_" "_$L(YG)) X XY
 I ((PAGE=1)&((DX-1)<PCX))&(PCY=DY) D ^%VSQUEAK G LEC
 
 I ((DX-1)'>%LGX)&(%YH=(DY-1)) D UCONT^%VREADU(UCONT,0,"P",1,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE),PAGED(1) S NBC=NBC-1 X XY G LEC
 S NBC=NBC-1
 
 I (DX-1)'>%LGX D UCONT^%VREADU("",0,"L",1,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE) X XY G LEC
 S DX=DX-1 X XY
 G LEC
 
66 I VISU=2 D ZAVERTIS(NBC_" "_$L(YG)) X XY
 I NBC=($L(YG)+1) D ^%VSQUEAK G LEC
 
 I ((DX+1)'<%LDX)&((DY+1)'<%YB) D UCONT^%VREADU(UCONT,0,"P",0,$$NL^%VREADG(YG,NBC,%LGX,%LDX),.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE) S NBC=NBC+1 D PAGED(0) X XY G LEC
 
 I (DX+1)'<%LDX D UCONT^%VREADU("",0,"L",0,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE) S NBC=NBC+1 X XY G LEC
 S DX=DX+1 X XY S NBC=NBC+1
 G LEC
67 G 66
68 G 65
 
ZAVERTIS(MSG) N DX,DY
 D ^%VZEAVT(MSG)
 Q
MSG(MSG) 
 N DX,DY
 D POCLEPA^%VVIDEO W MSG
 Q

