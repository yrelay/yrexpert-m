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

;%VMODIFL^INT^1^59547,74035^0
GEMODIFL ;
 
 
 S ABENDFLD=0,PC=$X,LFLD=$L(FLD),LG=DFLD,LD=LG+LFLD
READ S RET="READ" R *X1
 ;;DTM
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G P:X1=16,D:X1=4,RFLD:X1=27
 G REFR:X1=18,GOMME:X1=7,DEL:X1=127,RFLD:X1=27
 ;;NONDTM
 
 ;;FINNONDTM
 G ABEND:X1<2,FIN:X1=6,FIN:X1=13,FIN:X1=9,DEL:X1=127 I X1<32 W *7,*-1 G READ
 D PGD S FLD=PG_$C(X1)_PD,ADX=$X,ADY=$Y D ECR(FLD) S DX=ADX+1,DY=ADY S:DX'<%LXD DX=%LXG+1,DY=DY+1 X XY S LFLD=LFLD+1,LD=LD+1
RCAR S RET="RCAR" R *WG
 ;;DTM
 I $$FLECHE^%INCCLAV(WG,.X1,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(WG,.WG)
 ;;FINDTM
 G P:X1=16,D:X1=4 G:WG=18 REFR G:WG=7 GOMME G:WG=9 FIN G:WG=27 RFLD
 ;;NONDTM
 
 ;;FINNONDTM
 G DEL:WG=127,ABEND:WG<2,FIN:WG=6,FIN:WG=13 I WG<32 D ^%VSQUEAK G RCAR
 D PGD S FLD=PG_$C(WG)_PD,ADX=$X,ADY=$Y D ECR(FLD) S DX=ADX+1,DY=ADY S:DX'<%LXD DX=%LXG+1,DY=DY+1 X XY S LFLD=LFLD+1,LD=LD+1 G RCAR
RFLD ;;NONDTM
 
 
 
 
 ;;FINONDTM
 ;;DTM
 S X1=27
 G:MODTM REFUS
 R *X2
 G:X2=91 271
 R *X3
 G FIN0
271 R *X3
 G:(X3<48)!(X3>57) FIN0
272 R *X3
 S X3=$C(X3)
 G:X3="~" FIN0
 G 272
 ;;FINDTM
REFUS D ^%VSQUEAK G READ
 ;;DTM
FIN0 G:(X2'=27)&(X3'=27) REFUS
 ;;FINDTM
FIN Q
65 G:($X=PCX)&($Y=PCY) TEST S DX=$X-1,DY=$Y S:DX'>%LXG DX=%LXD-1,DY=$Y-1 X XY Q
66 D PGD G:PG=FLD TEST S DX=$X+1,DY=$Y S:DX'<%LXD DX=%LXG+1,DY=$Y+1 X XY Q
67 G 66
68 G 65
TEST D ^%VSQUEAK Q
ABEND S ABENDFLD=1 Q
DEL D PGD I PG=FLD D ^%VSQUEAK G @RET
 S ADX=$X,ADY=$Y,FLD=PG_$E(PD,2,999) D ECR(FLD_" ") S DX=ADX,DY=ADY X XY G READ
NONVT S %XLEC=X1,X1=27
 S X2=91
 I %XLEC=8 S X3=$A("D") G RFLD+2
 I %XLEC=24 S X3=$A("C") G RFLD+2
 I %XLEC=11 S X3=$A("B") G RFLD+2
 I %XLEC=28 S X3=$A("A") G RFLD+2
 G RFLD+2
NONVT1 S X1=WG G NONVT
GOMME S ADX=$X,ADY=$Y D PGD,ECR(PG_$J("",$L(PD))) S FLD=PG,DX=ADX,DY=ADY X XY G @RET
 
REFR S OICC=ICC,RESUL(ICC)=FLD,ADX=DX,ADY=^%SCRE(SCR,ICC,3) D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S DX=ADX,DY=ADY,ICC=OICC X XY G @RET
P K ^DEPFLD($I) S ^DEPFLD($I,%DAT)=FLD,DEP=1 G @RET
D I '($D(^DEPFLD($I,%DAT))) K ^DEPFLD($I) D ^%VSQUEAK G @RET
 S ADX=$X,PG=$E(FLD,1,$X-PCX),PD=$E(FLD,($X-PCX)+1,299),LPD=$L(PD),LDEP=$L(^DEPFLD($I,%DAT)),FLD=PG_^DEPFLD($I,%DAT)_PD,DX=PCX,DY=$Y X XY W FLD S DX=ADX+LDEP X XY G @RET
PGD S XC=$X,YC=$Y,LPG=$S(YC'=PCY:(((%LXD-PCX)+(((YC-PCY)-1)*((%LXD-%LXG)-1)))+XC)-%LXG,1:(XC-PCX)+1),PD=$E(FLD,LPG,999),PG=$E(FLD,1,LPG-1) K XC,YC Q
ECR(DLF) 
 
 S DX=PCX,DY=PCY,YG1=$E(DLF,1,%LXD-PCX) X XY W YG1 S YG1=$E(DLF,(%LXD-PCX)+1,999),DY=DY+1,DX=%LXG+1
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K DLF,YGI,YG1,YG2,LG,LPG Q

