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

;%VGETFLD^INT^1^59547,74035^0
GEGETFLD(YG,PCX,PCY,%LXG,%LXD,CONTF,YY1) ;;07:16 PM  2 Jan 1996
 
 S DX=$X,DY=$Y X XY U 0
LEC R *X1:^TOZE($I,"ATTENTE")
 ;;DTM 
 G:$$FLECHE^%INCCLAV(X1,.X1,.XG2,.XG3) FIN
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 I X1=-1 S X1=1 G FIN
 G IMPR:X1=10,EFF:X1=5,P:X1=16,D:X1=4,REFR:X1=18,DEL:X1=127,ESC:X1=27,NONVT:(SUB']"C-VT")&((((X1=8)!(X1=11))!(X1=24))!(X1=28))
 G HELP:X1=8,IMPR:X1=10,GOMME:X1=7,MFLD:X1=9,FIN:(X1=13)!(X1<2),CONTK:X1=11,CONTL:X1=12,CONTF:X1=6,REFUS:X1<32
 D PGD W $C(X1) S YG=PG_$C(X1)_$E(PD,2,999) I $X'<%LXD S DY=DY+1,DX=%LXG+1 X XY
 G LEC
PGD S XC=$X,YC=$Y,LPG=$S(YC'=PCY:(((%LXD-PCX)+(((YC-PCY)-1)*((%LXD-%LXG)-1)))+XC)-%LXG,1:(XC-PCX)+1),PD=$E(YG,LPG,999),PG=$E(YG,1,LPG-1) K XC,YC Q
DEL I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G LEC
 D PGD S (DX,ADX)=$X-1,(DY,ADY)=$Y S:DX'>%LXG DX=%LXD-1,DY=DY-1 X XY W " " S YG=$E(PG,1,$L(PG)-1)_PD,DX=PCX,DY=PCY,YG1=$E(YG,1,%LXD-PCX) X XY W YG1 S YG1=$E(YG,(%LXD-PCX)+1,999),DY=DY+1,DX=%LXG+1
 S DX=PCX,DY=PCY,YG1=$E(YG,1,%LXD-PCX) X XY W YG1 S YG1=$E(YG,(%LXD-PCX)+1,999),DY=DY+1,DX=%LXG+1
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K YGI,YG1,YG2,LG,LPG,PG,PD S DX=ADX,DY=ADY S:ADX'>%LXG DX=%LXD-1,DY=DY-1 X XY G LEC
ESC ;;NONDTM
 
 
 ;;FINNONDTM
 G:MODTM REFUS
 R *XG2
 G:XG2=91 271
 R *XG3 G REFUS
271 R *XG3
 G:(XG3<48)!(XG3>57) REFUS
272 R *XG3
 S XG3=$C(XG3)
 G:XG3="~" REFUS
 G 272
REFUS D ^%VSQUEAK G LEC
CONTK G REFUS:$D(^SAV($I)) S CONTF="K" G FIN
CONTF S CONTF=1 G FIN
CONTL S CONTF="L" G FIN
FIN S YY1=YG Q
NONVT S %XLEC=X1,X1=27
 S XG2=91
 I %XLEC=8 S XG3=$A("D") G ESC+1
 I %XLEC=24 S XG3=$A("C") G ESC+1
 I %XLEC=11 S XG3=$A("B") G ESC+1
 I %XLEC=28 S XG3=$A("A") G ESC+1
MFLD S ADX=DX,DFLD=PCX,FLD=YG,XEW=$X,YEW=$Y D POCLEPA^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO W " Mode extension " D NORM^%VVIDEO S DX=XEW,DY=YEW X XY
 D ^%VMODIFL S XEW=$X,YEW=$Y D POCLEPA^%VVIDEO S DX=XEW,DY=YEW X XY S CCX=$X I ABENDFLD=0 G MS
 S DX=ADX,FLD=$J("",$L(FLD)) D ECR(FLD),ECR(YG) S DX=PCX,DY=PCY X XY
 G LEC
MS S YG=FLD D ECR(YG) G LEC
GOMME S ADX=$X,ADY=$Y D PGD,ECR(PG_$J("",$L(PD))) S YG=PG,DX=ADX,DY=ADY X XY G LEC
HELP S ICK=ICC,CHCOUR=YG D ^%VHELPSC S ICC=ICK G LEC
REFR S OICC=ICC,RESUL(ICC)=YG,ADX=$X,ADY=^%SCRE(SCR,ICC,3) D ^%VAFIGRI,^%VAFISCR S DX=ADX,DY=ADY,ICC=OICC X XY G LEC
P K ^DEPFLD($I) D ZD^%QMDATE4 S ^DEPFLD($I,%DAT)=YG,DEP=1 G FIN
D I '($D(^DEPFLD($I,%DAT))) K ^DEPFLD($I) D ^%VSQUEAK G LEC
 D PGD S LDEP=$L(^DEPFLD($I,%DAT)),YG=PG_^DEPFLD($I,%DAT)_$E(PD,LDEP+1,999) D ECR(YG) G LEC
ECR(FLD) 
 S DX=PCX,DY=PCY,YG1=$E(FLD,1,%LXD-PCX) X XY W YG1 S YG1=$E(FLD,(%LXD-PCX)+1,999),DY=DY+1,DX=%LXG+1
 
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K FLD,YGI,YG1,YG2,LG,LPG Q
TEST D CLEPAG^%VVIDEO S YG="",%LXG=30,%LXD=50,%LIYH=5,%LIYB=15,SCR="TEST",ICC=1,DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY W ^%SCRE(SCR,ICC,1) D ^%VGETFLD Q
EFF S NIC=ICC-1
EFFN S NIC=$N(RESUL(NIC)) G:NIC=-1 EFFF S DX=^%SCRE(SCR,NIC,2)+$L(^%SCRE(SCR,NIC,1)),DY=^%SCRE(SCR,NIC,3),CRIC=RESUL(NIC),RESUL(NIC)="" K AFRESU(NIC),FRESU(NIC) S ES=$S($D(^%SCRE(SCR,NIC,"ESPACE")):^%SCRE(SCR,NIC,"ESPACE"),1:"-1,80")
 D ^%VCRIFLD($J("",$L(CRIC)),DX,DY,$P(ES,",",1),$P(ES,",",2)) G EFFN
EFFF S DX=^%SCRE(SCR,ICC,2)+$L(^%SCRE(SCR,ICC,1)),DY=^%SCRE(SCR,ICC,3) X XY G LEC
IMPR S ADX=$X,ADY=$Y,AICC=ICC D POCLEPA^%VVIDEO W "Impression en cours..." D ^%VIMPSCR,POCLEPA^%VVIDEO S ICC=AICC,DX=ADX,DY=ADY X XY G LEC

