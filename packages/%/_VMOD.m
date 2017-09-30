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

;%VMOD^INT^1^59547,74035^0
VVMOD ;
 
 
 S ABENDFLD=0,LFLD=$L(FLD),LG=DFLD,LD=LG+LFLD
READ S RET="READ" R *X1:^TOZE($I,"ATTENTE") S:X1=-1 X1=1
 ;;DTM
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G RFLD:X1=27,P:X1=16,D:X1=4
 G REFR:X1=18,GOMME:X1=7,DEL:X1=127
 ;;NONDTM
 
 ;;FINNONDTM
 G ABEND:X1<2,FIN:X1=6,FIN:X1=13,FIN:X1=9,DEL:X1=127
 I X1<32 D ^%VSQUEAK G READ
 S DOLX=$X,DOLY=$Y
 S LPG=((($Y-PCY)*80)+$X)-PCX,PFG=$E(FLD,1,LPG),PFD=$E(FLD,LPG+1,299)
 S FLD=PFG_$C(X1)_PFD,DX=$X X XY W $C(X1),PFD
 S DX=DX+1 S:DX>79 DX=0,DY=DY+1 X XY S LFLD=LFLD+1,LD=LD+1
RCAR S RET="RCAR" R *WG:^TOZE($I,"ATTENTE") S:WG=-1 WG=1
 ;;DTM
 I $$FLECHE^%INCCLAV(WG,.X1,.X2,.X3) D @X3 G READ
 D TOUCHE^%INCCLAV(WG,.WG)
 ;;FINDTM
 G P:WG=16,D:WG=4,REFR:WG=18 G:WG=7 GOMME G:WG=9 FIN
 G:WG=27 RFLD
 ;;NONDTM
 
 ;;FINNONDTM
 G DEL:WG=127,ABEND:WG<2,FIN:WG=6,FIN:WG=13 I WG<32 D ^%VSQUEAK G RCAR
 S LPG=((($Y-PCY)*80)+$X)-PCX,PFG=$E(FLD,1,LPG),PFD=$E(FLD,LPG+1,299)
 S FLD=PFG_$C(WG)_PFD,DX=$X X XY W $C(WG),PFD
 S DX=DX+1 S:DX>79 DX=0,DY=DY+1 X XY S LFLD=LFLD+1,LD=LD+1 G RCAR
RFLD ;;NONDTM
 
 
 
 
 ;;FINNONDTM
 ;;DTM
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
 ;;FINDTM
BELL D ^%VSQUEAK G READ
FIN Q
65 G:($X=LD)&($Y=PCY) TEST
 S DX=$X-1,DY=$Y S:DX<0 DX=79,DY=$Y-1 X XY Q
66 S LDX=($L(FLD)+PCX)#80,LDY=(($L(FLD)+PCX)\80)+PCY
 G:($X=LDX)&($Y=LDY) TEST
 S DX=$X+1,DY=$Y S:DX>79 DX=0,DY=$Y+1 X XY Q
67 G 66
68 G:($X=LG)&($Y=PCY) TEST
 S DX=$X-1,DY=$Y S:DX<0 DX=79,DY=$Y-1 X XY Q
TEST D ^%VSQUEAK Q
ABEND S ABENDFLD=1 Q
DEL I LD=$X D ^%VSQUEAK G @RET
 S ADX=$X,ADY=$Y,DX=((PCX+$L(FLD))#80)-1,DY=((PCX+$L(FLD))\80)+PCY
 S:DX<0 DX=79,DY=DY-1 X XY W " "
 S LPG=(((ADY-PCY)*80)+ADX)-PCX,PD=$E(FLD,LPG+2,299),PG=$E(FLD,1,LPG),FLD=PG_PD,DX=PCX,DY=PCY X XY W FLD
 S DX=ADX,DY=ADY S:ADX<0 DX=79,DY=DY-1 X XY G @RET
 S PFG=$E(FLD,1,$X-DFLD),PFD=$E(FLD,($X-DFLD)+2,299),FLD=PFG_PFD,DX=$X,DY=$Y,FNUL="" F UU=1:1:$L(PFD)+1 S FNUL=FNUL_" "
 X XY W FNUL X XY W PFD X XY S LD=LD-1,LFLD=LFLD-1 G READ
NONVT S %XLEC=X1,X1=27
 S X2=91
 I %XLEC=8 S X3=$A("D") G RFLD+2
 I %XLEC=24 S X3=$A("C") G RFLD+2
 I %XLEC=11 S X3=$A("B") G RFLD+2
 I %XLEC=28 S X3=$A("A") G RFLD+2
 G RFLD+2
NONVT1 S X1=WG G NONVT
GOMME S WX=$X,LY1=$L(FLD),FLD=$E(FLD,1,$X-DFLD) F EE=$L(FLD):1:LY1 S LD=LD-1 W " "
 S DX=WX X XY G @RET
REFR S OICC=ICC,RESUL(ICC)=FLD,ADX=DX,ADY=^%SCRE(SCR,ICC,3) D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S DX=ADX,DY=ADY,ICC=OICC X XY G @RET
P K ^DEPFLD($I) S ^DEPFLD($I,%DAT)=FLD,DEP=1 G @RET
D I '($D(^DEPFLD($I,%DAT))) K ^DEPFLD($I) D ^%VSQUEAK G @RET
 S ADX=$X,PG=$E(FLD,1,$X-PCX),PD=$E(FLD,($X-PCX)+1,299),LPD=$L(PD),LDEP=$L(^DEPFLD($I,%DAT)),FLD=PG_^DEPFLD($I,%DAT)_PD,DX=PCX,DY=$Y X XY W FLD S DX=ADX+LDEP X XY G @RET
 
ZZ D CLEPAG^%VVIDEO S DX=10,DY=10 X XY W "ESSAI : " S DX=$X X XY S YG="ABCDEFGH" W YG X XY S FLD=YG,(DFLD,PCX)=$X,PCY=$Y O 0 D ^MODIFLD

