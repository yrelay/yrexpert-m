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

;%VLIFLD^INT^1^59547,74035^0
%VLIFLD(YG,TBP,CTR,YY1) ;;05:24 PM  10 Jun 1993; ; 11 Jun 93 10:35 AM
 
 
 
 
 N ADX,ADY,CCX,DFLD,FLD,LG,LPG,PD,PG,XC,XEW,YC,YEW,YG1,YG2
 G D1
 
MODIF(YG,TBP,CTR,YY1) 
 N ADX,ADY,CCX,DFLD,FLD,LG,LPG,PD,PG,XC,XEW,YC,YEW,YG1,YG2
 G MFLD
 
 
 
 
 
 
 
 
 
 
 
D1 S:'($D(@TBP@("DX"))) @TBP@("DX")=0
 S:'($D(@TBP@("DY"))) @TBP@("DY")=23
 S:'($D(@TBP@("MSG"))) @TBP@("MSG")="M"
 D IVAR
BEG D ^%VCRIFLD(YG,PCX,PCY,%LGX,%LDX)
 S CTR="",DX=PCX,DY=PCY X XY U 0
LEC S RES=$$MORE^%VZATOU(.X1,.F,.CTR,.ESC,^TOZE($I,"ATTENTE"),0)
 G:'(RES) FIN
 G GOMME:CTR="G",MFLD:CTR="I",FIN:F="RETURN",DEL:F="DEL"
 I F'="","GDHB"[F S CTR="*"_$S(F="G":68,F="D":67,F="H":65,F="B":66),YG="" G FIN
 I CTR'="" S YG="" G FIN
 D PGD W $C(X1) S YG=PG_$C(X1)_$E(PD,2,999) I $X'<%LDX S DY=DY+1,DX=%LGX+1 X XY
 G LEC
 
PGD S XC=$X,YC=$Y,LPG=$S(YC'=PCY:(((%LDX-PCX)+(((YC-PCY)-1)*((%LDX-%LGX)-1)))+XC)-%LGX,1:(XC-PCX)+1),PD=$E(YG,LPG,999),PG=$E(YG,1,LPG-1) Q
DEL I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G LEC
 D PGD S (DX,ADX)=$X-1,(DY,ADY)=$Y S:DX'>%LGX DX=%LDX-1,DY=DY-1 X XY W " " S YG=$E(PG,1,$L(PG)-1)_PD,DX=PCX,DY=PCY,YG1=$E(YG,1,%LDX-PCX) X XY W YG1 S YG1=$E(YG,(%LDX-PCX)+1,999),DY=DY+1,DX=%LGX+1
 S DX=PCX,DY=PCY,YG1=$E(YG,1,%LDX-PCX) X XY W YG1 S YG1=$E(YG,(%LDX-PCX)+1,999),DY=DY+1,DX=%LGX+1
 S LG=(%LDX-%LGX)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 S DX=ADX,DY=ADY S:ADX'>%LGX DX=%LDX-1,DY=DY-1 X XY G LEC
 
FIN I $$^%QZCHMX(YG) G BEG
 S YY1=YG Q
 
CTRL S CTR=$C(X1+64),YG="" G FIN
 
REFUS D ^%VSQUEAK G LEC
MFLD D IVAR S CTR="",ADX=DX,DFLD=PCX,FLD=YG,XEW=$X,YEW=$Y
 S DX=@TBP@("DX"),DY=@TBP@("DY") I DY>23 S DY=23
 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO X XY W @TBP@("MSG") D NORM^%VVIDEO
 S DX=XEW,DY=YEW X XY
 D ^%VLIMOD
 S DX=@TBP@("DX"),DY=@TBP@("DY") X XY W $J("",$L(@TBP@("MSG")))
 S XEW=$X,YEW=$Y D POCLEPA^%VVIDEO S DX=XEW,DY=YEW X XY S CCX=$X G:ABENDFLD=0 MS
 S DX=ADX,FLD=$J("",$L(FLD)) D ECR(FLD),ECR(YG) S DX=PCX,DY=PCY X XY
 G LEC
MS S YG=FLD D ECR(YG) G LEC
GOMME S ADX=$X,ADY=$Y D PGD,ECR(PG_$J("",$L(PD))) S YG=PG,DX=ADX,DY=ADY X XY G LEC
 
ECR(FLD) 
 S DX=PCX,DY=PCY,YG1=$E(FLD,1,%LDX-PCX) X XY W YG1 S YG1=$E(FLD,(%LDX-PCX)+1,999),DY=DY+1,DX=%LGX+1
 S LG=(%LDX-%LGX)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 Q
 
GET(YG,PCX,PCY,%LGX,%LDX,CTR,YY1) 
 N TBP,TB S TBP="TB",TB("DX")=0,TB("DY")=23,TB("MSG")="M" G BEG
 
 
IVAR F %U="PCX","PCY" S:'($D(@TBP@(%U))) @TBP@(%U)="" S @%U=$S(@TBP@(%U)'="":@TBP@(%U),1:0)
 F %U="%LGX","%LDX" S:'($D(@TBP@(%U))) @TBP@(%U)="" S @%U=$S(@TBP@(%U)'="":@TBP@(%U),1:$S(%U="%LXG":PCX,1:80))
 Q
 
TEST D CLEPAG^%VVIDEO
 S YG="",LXG=30,LXD=50,DX=30,DY=10 X XY W "A tester : "
 S PCX=$X,PCY=$Y D GET("AB",PCX,PCY,LXG,LXD,.%CTR,.RES)
 D POCLEPA^%VVIDEO W "%CTR=",%CTR,?30,"RES=",RES R *X Q:X=1  G TEST
 
TEST2 D CLEPAG^%VVIDEO
 S YG="CHAINE A MODIFIER"
 S DX=37,DY=13 X XY W YG S DX=37,DY=13 X XY
 S TAB("%LDX")=76,TAB("%LGX")=36
 S TAB("DX")=2,TAB("DY")=24
 S TAB("PCX")=37,TAB("PCY")=13,TAB("MSG")=YG
 D MODIF(YG,"TAB",.CTR,.YY1)
 Q
 ;

