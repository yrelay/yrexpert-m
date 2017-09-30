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
;! Nomprog     : %VLIFL2                                                      !
;! Module      : VIDEO                                                        !
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

%VLIFL2(YG,TBP,CTR,YY1) ;
 N %U,ADX,ADY,AX,AY,CCX,DFLD,FLD,LG,LPG,PD,PG,X,X1,X2,X3,XC,XEW,YC,YEW,YG1,YG2
 N ZB,%F
 N TO,FL,CT,ES,RS
 G D1
 
MODIF(YG,TBP,CTR,YY1) 
 N %U,ADX,ADY,AX,AY,CCX,DFLD,FLD,LG,LPG,PD,PG,X,X1,X2,X3,XC,XEW,YC,YEW,YG1,YG2
 N ZB,%F
 N TO,FL,CT,ES,RS
 G MFLD
 
 
 
 
 
 
 
 
 
 
 
D1 S:'($D(@TBP@("DX"))) @TBP@("DX")=0
 S:'($D(@TBP@("DY"))) @TBP@("DY")=23
 S:'($D(@TBP@("MSG"))) @TBP@("MSG")="M"
 D IVAR
BEG S:'($D(%TAB)) %TAB=0
 D ^%VCRIFLD(YG,PCX,PCY,%LGX,%LDX) S CTR="",DX=PCX,DY=PCY X XY
LEC 
 S RS=$$MORE^%VZATOU(.X1,.FL,.CT,.ES,^TOZE($I,"ATTENTE"),0)
 S:'(RS) CT="A"
 S (X,Y)=""
 I (((FL="H")!(FL="B"))!(FL="D"))!(FL="G") S X3=$S(FL="D":67,FL="B":66,FL="G":68,FL="H":65) G FLEC
 G 68:(X1=31)&(%TAB=0),67:(X1=28)&(%TAB=0),BELL:ES'="",FIN:(FL="RETURN")&(%TAB=0),MFLD:(FL="RETURN")&(%TAB=1),DEL:FL="DEL",GOMME:CT="G",MFLD:CT="I",CTRL:CT'=""
 D PGD W:%TAB=0 $C(X1) S AX=$X,AY=$Y,YG=$S(%TAB=0:PG_$C(X1)_$E(PD,2,999),1:PG_$C(X1)_PD) I %TAB=1 D ECR(YG) S DX=AX+1,DY=AY X XY
 S AX=$X,AY=$Y I AX'<%LDX S DY=DY+1,DX=%LGX+1 X XY
 G LEC
PGD S XC=$X,YC=$Y,LPG=$S(YC'=PCY:(((%LDX-PCX)+(((YC-PCY)-1)*((%LDX-%LGX)-1)))+XC)-%LGX,1:(XC-PCX)+1),PD=$E(YG,LPG,999),PG=$E(YG,1,LPG-1) K XC,YC Q
DEL I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G LEC
 D PGD S (DX,ADX)=$X-1,(DY,ADY)=$Y,YG=$E(PG,1,$L(PG)-1)_PD
 D ECR(YG_" ") S DX=ADX,DY=ADY S:ADX'>%LGX DX=%LDX-1,DY=DY-1 X XY G LEC
FIN I $$^%QZCHMX(YG)=1 G BEG
 
 S YY1=YG D ECHON^%VVIDEO Q
 
CTRL S CTR=CT G FIN
MFLD D IVAR S:'($D(%TAB)) %TAB=0 S %TAB=$S(%TAB=1:0,1:1)
 S (AX,DX)=$X,(AY,DY)=$Y
 W $$XY^%VVIDEO1(@TBP@("DX"),@TBP@("DY")),$S(%TAB=1:$$BLD^%VVIDEO1_$$BLK^%VVIDEO1_$$REV^%VVIDEO1_@TBP@("MSG")_$$NORM^%VVIDEO1,1:$J("",$L(@TBP@("MSG")))),$$XY^%VVIDEO1(AX,AY) S DX=AX,DY=AY X XY G LEC
GOMME S ADX=$X,ADY=$Y D PGD,ECR(PG_$J("",$L(PD))) S YG=PG,DX=ADX,DY=ADY X XY G LEC
 
FLEC G:%TAB @X3
 S CTR="*"_X3
 G FIN
ECR(FLD) 
 D ^%VCRIFLD(FLD,PCX,PCY,%LGX,%LDX) Q
 
MES(MES,CTR,YY1) S:($D(RM)#10)=0 RM=80 W MES D GET^%VLECFL2("",$X,$Y,$X-1,RM,.CTR,.YY1) Q
 
MESD(VDEF,MES,DX,DY,CTR,YY1) S:($D(RM)#10)=0 RM=80 X XY W MES D GET^%VLECFL2(VDEF,$X,$Y,$X-1,RM,.CTR,.YY1) Q
 
GET(YG,PCX,PCY,%LGX,%LDX,CTR,YY1) 
 N TBP,TB,%U,ADX,ADY,AX,AY,CCX,DFLD,FLD,LG,LPG,PD,PG,X,X1,XC,XEW,YC,YEW,YG1,YG2,X2,X3
 S TBP="TB",TB("%TAB")=0,TB("PCX")=PCX,TB("PCY")=PCY,TB("%LGX")=%LGX,TB("%LDX")=%LDX,TB("DX")=0,TB("DY")=23,TB("MSG")="M" G BEG
 
 ;HL IVAR F z%U="PCX","PCY" S:'($D(@TBP@(%U))) @TBP@(%U)="" S @%U=$S(@TBP@(%U)'="":@TBP@(%U),1:0)
IVAR F %U="PCX","PCY" S:'($D(@TBP@(%U))) @TBP@(%U)="" S @%U=$S(@TBP@(%U)'="":@TBP@(%U),1:0)
 F %U="%LGX","%LDX" S:'($D(@TBP@(%U))) @TBP@(%U)="" S @%U=$S(@TBP@(%U)'="":@TBP@(%U),1:$S(%U="%LXG":PCX,1:80))
 I '($D(%TAB)) S:'($D(@TBP@("%TAB"))) @TBP@("%TAB")=0 S %TAB=@TBP@("%TAB")
 Q
65 G:($X=PCX)&($Y=PCY) BELL S DX=$X-1,DY=$Y S:DX'>%LGX DX=%LDX-1,DY=$Y-1 X XY G LEC
66 D PGD G:PG=YG BELL S DX=$X+1,DY=$Y S:DX'<%LDX DX=%LGX+1,DY=$Y+1 X XY G LEC
67 G 66
68 G 65
BELL D ^%VSQUEAK G LEC
 
 
TEST 
 D ^%IS
 D CLEPAG^%VVIDEO
 S YG="",LXG1=30,LXD1=50,DX=30,DY=10 X XY W "A tester : "
 S PCX1=$X,PCY1=$Y,%TAB=0
 D GET^%VLIFL2("ABCDEFGH",PCX1,PCY1,LXG1,LXD1,.%CTR,.RES),POCLEPA^%VVIDEO W "%CTR=",%CTR,?30,"RES=""",RES,""""
 R *X Q:X=1  G TEST

