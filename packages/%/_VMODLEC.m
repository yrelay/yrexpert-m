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

;%VMODLEC^INT^1^59547,74035^0
GEMODLEC ;
 
 
 
 
 
 S ABENDFLD=0,PC=$X,LFLD=$L(FLD),LG=DFLD,LD=LG+LFLD
READ S RET="READ" R *X1:^TOZE($I,"ATTENTE") G ABEND:X1=-1
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(X1,.X1)
 G RFLD:X1=27,FIN:X1=13,FIN:X1=9,DEL:X1=127,GOMME:X1=7
 I X1<32 D TEST G READ
 D PGD S FLD=PG_$C(X1)_PD,ADX=$X,ADY=$Y D ECR(FLD)
 S DX=ADX+1,DY=ADY S:DX'<%LDX DX=%LGX+1,DY=DY+1 X XY S LFLD=LFLD+1,LD=LD+1
RCAR S RET="RCAR" R *WG:^TOZE($I,"ATTENTE")
 I $$FLECHE^%INCCLAV(WG,.WG,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(WG,.WG)
 G GOMME:WG=7,FIN:WG=9,RFLD:WG=27,DEL:WG=127,ABEND:WG<2,FIN:WG=6,FIN:WG=13 I WG<32 D TEST G RCAR
 D PGD S FLD=PG_$C(WG)_PD,ADX=$X,ADY=$Y D ECR(FLD)
 S DX=ADX+1,DY=ADY S:DX'<%LDX DX=%LGX+1,DY=DY+1 X XY
 S LFLD=LFLD+1,LD=LD+1 G RCAR
RFLD 
 G:MODTM BELL
 R *X2
 G:X2=91 271
 R *X3
 G BELL
271 R *X3
 G:(X3<48)!(X3>57) BELL
272 R *X3
 S X3=$C(X3)
 G:X3="~" BELL
 G 272
BELL D TEST G READ
FIN Q
 
65 D PGD G:PG="" TEST
 S DX=$X-1,DY=$Y S:DX'>%LGX DX=%LDX-1,DY=$Y-1 X XY Q
 
66 D PGD G:PG=FLD TEST
 S DX=$X+1,DY=$Y S:DX'<%LDX DX=%LGX+1,DY=$Y+1 X XY Q
 
67 G 66
68 G 65
 
 
 
TEST Q  D ^%VSQUEAK Q
 
ABEND S ABENDFLD=1 Q
 
DEL D PGD
 I PG="" D TEST G @RET
 S ADX=$X,ADY=$Y,FLD=$E(PG,1,$L(PG)-1)_PD
 D ECR(FLD_" ")
 S DX=ADX-1,DY=ADY S:DX'>%LGX DX=%LDX-1,DY=$Y-1 X XY G READ
 
GOMME S ADX=$X,ADY=$Y D PGD,ECR(PG_$J("",$L(PD)))
 S FLD=PG,DX=ADX,DY=ADY X XY G @RET
 
PGD S XC=$X,YC=$Y,LPG=$S(YC'=PCY:(((%LDX-PCX)+(((YC-PCY)-1)*((%LDX-%LGX)-1)))+XC)-%LGX,1:(XC-PCX)+1)
 S PD=$E(FLD,LPG,999),PG=$E(FLD,1,LPG-1)
 K XC,YC Q
 
ECR(DLF) 
 S DX=PCX,DY=PCY,YG1=$E(DLF,1,%LDX-PCX) X XY W YG1
 S YG1=$E(DLF,(%LDX-PCX)+1,999),DY=DY+1,DX=%LGX+1
 S LG=(%LDX-%LGX)-1
 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K DLF,YGI,YG1,YG2,LG,LPG Q

