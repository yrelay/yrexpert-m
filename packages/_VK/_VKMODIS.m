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

;%VKMODIS^INT^1^59547,74035^0
MODISCRE ;
 
 
 D OABRES K FRESU I ^TOZE($I,"FULL")=1 S ABENDSCR=1 G FIN
IC1 S IC=1,ABENDSCR=0,%DIFL=1
LOOP G:IC=0 IC1 G FIN:'($D(^%SCRE(SCR,IC))) I $D(PATOUCH(IC)),PATOUCH(IC)=1 S IC=IC+%DIFL G LOOP
 S (PCX,DX)=$L(^%SCRE(SCR,IC,1))+^%SCRE(SCR,IC,2),DY=^%SCRE(SCR,IC,3) X XY S PCY=$Y
 S (OY1,Y1)=RESUL(IC)
READ S RET="READ" O 0 R *X1:^TOZE($I,"ATTENTE") S:X1=-1 X1=1
 ;;DTM
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3,TEST G LOOP
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G:X1=16 P G:X1=4 D G:X1=18 REFR G RFLD:X1=27 G:X1=8 HELP G:X1=10 IMPR
 G DEL:X1=127,RFLD:X1=27,EFF:X1=5,MODFLD:X1=9,GOMME:X1=7
 ;;NONDTM
 
 ;;FINNONDTM
 G ABEND:X1<2,FIN:X1=6,CHAMP:X1=13,GOMME:X1=7,DEL:X1=127 I X1<32 D ^%VSQUEAK G LOOP
 W $C(X1) S OY1=Y1,LPG=((($Y-PCY)*80)+$X)-PCX,Y1=$E(Y1,1,LPG-1)_$C(X1)_$E(Y1,LPG+1,299)
RCAR S RET="RCAR" R *YG:^TOZE($I,"ATTENTE") D TOUCHE^%INCCLAV(YG,.YG) S:YG=-1 YG=1 G:YG=16 P G:YG=4 D G:YG=18 REFR G IMPR:X1=10,HELP:YG=8,MODFLD:YG=9,GOMME:YG=7,DEL:YG=127,ABEND:YG<2,FIN:YG=6,CHAMP:YG=13 I YG<32 D ^%VSQUEAK G RCAR
 W $C(YG) S OY1=Y1,LPG=((($Y-PCY)*80)+$X)-PCX,Y1=$E(Y1,1,LPG-1)_$C(YG)_$E(Y1,LPG+1,299) G RCAR
RFLD ;;NONDTM
 
 
 
 ;;FINNONDTM
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
FIN0 G:(X2'=27)&(X3'=27) REFUS
 ;;FINDTM
FIN O 0 Q
REFUS D ^%VSQUEAK G LOOP
65 S %DIFL=-1,DYC=$Y,DYV=$O(^IGCURGRI($I,SCR,-(DYC))) I DYV="" D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,-(DYV),-1)),IC=^GCURGRIL($I,SCR,-(DYV),DXV) Q
66 S %DIFL=1,DYC=$Y,DYV=$O(^GCURGRIL($I,SCR,DYC)) I DYV="" D ^%VSQUEAK Q
 S DXV=$N(^GCURGRIL($I,SCR,DYV,-1)),IC=^GCURGRIL($I,SCR,DYV,DXV) Q
67 S IC=IC+1,%DIFL=1 Q
68 S IC=IC-1,%DIFL=-1 Q
TEST D:'($D(^%SCRE(SCR,IC))) ^%VSQUEAK Q
ABEND S ABENDSCR=1 Q
DEL 
DEL1 I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G @RET
 S ADX=$X-1,ADY=$Y,DX=((PCX+$L(Y1))#80)-1,DY=((PCX+$L(Y1))\80)+PCY S:DX<0 DX=79,DY=DY-1 X XY W " " S LPG=(((ADY-PCY)*80)+ADX)-PCX,PD=$E(Y1,LPG+2,299),PG=$E(Y1,1,LPG),Y1=PG_PD,DX=PCX,DY=PCY X XY W Y1 S DX=ADX,DY=ADY S:ADX<0 DX=79,DY=DY-1 X XY G @RET
CHAMP S:'($D(YG)) YG="" S ICC=IC,LL=$L(RESUL(ICC))
 S XXYYZZ=RESUL(IC),RESUL(IC)=$S(Y1'="":Y1,$D(^%SCRE(SCR,IC,5)):^%SCRE(SCR,IC,5),1:"") I $D(^%SCRE(SCR,IC,5)) S TAB(IC)=RESUL(IC) D ^%VAFFICH:RESUL(IC)=^%SCRE(SCR,IC,5)
 S REFUSE=""
 D VERIF G REFULOP:REFUSE>0 S STOPUC=0 I $D(CMS),CMS'=1,$D(^%SCRE(SCR,ICC,4)),^%SCRE(SCR,ICC,4)'="" K FRESU(ICC) F UYT=1:1 S UCONT=$P(^%SCRE(SCR,ICC,4),",",UYT) Q:UCONT=""  S IC=ICC D @UCONT G REFULOP:REFUSE>0 Q:STOPUC=1
 S IC=IC+1,%DIFL=1 I XXYYZZ'="",$L(Y1)=0 S PADMESSA="Vous avez efface ce champ..." D ^%VSQUEAK,PAD^%VZEATT H 2 D POCLEPA^%VVIDEO
 G LOOP
UCONT Q:'($D(^%SCRE(SCR,IC,4)))
 Q:^%SCRE(SCR,IC,4)=""  S UCONT=^%SCRE(SCR,IC,4) D @UCONT Q
VERIF Q:'($D(^%SCRE(SCR,IC,6)))  S NVLEG=^%SCRE(SCR,IC,6) Q:NVLEG'>0
 F IV=1:1:NVLEG S VLEG=^%SCRE(SCR,IC,6+IV) G FVER:VLEG=RESUL(IC)
 S REFUSE=1 Q
FVER Q
REFULOP S ICC=IC D:REFUSE=1 ^%VREFUSE G LOOP
NONVT S %XLEC=X1,X1=27
 S X2=91
 I %XLEC=8 S X3=$A("D") G RFLD+2
 I %XLEC=24 S X3=$A("C") G RFLD+2
 I %XLEC=11 S X3=$A("B") G RFLD+2
 I %XLEC=28 S X3=$A("A") G RFLD+2
EFF S NIC=IC-1 F UU=0:0 S NIC=$N(RESUL(NIC)) Q:NIC=-1  S DX=^%SCRE(SCR,NIC,2)+$L(^%SCRE(SCR,NIC,1)),DY=^%SCRE(SCR,NIC,3) X XY S CRIC=RESUL(NIC),RESUL(NIC)="",LIC=$L(CRIC) K FRESU(NIC) F VV=1:1:LIC W " "
 G LOOP
MODFLD S ADX=DX,DFLD=PCX,FLD=Y1,XEW=$X,YEW=$Y D POCLEPA^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO W " Mode extension " D NORM^%VVIDEO S DX=XEW,DY=YEW X XY
 
 D ^%VMOD S XEW=$X,YEW=DY D POCLEPA^%VVIDEO S DX=XEW,DY=YEW X XY I ABENDFLD=0 G MS
 S DX=PCX X XY F UU=1:1:LFLD W " "
 X XY W RESUL(IC) X XY S (OY1,Y1)=RESUL(IC) G READ
MS S (OY1,Y1)=FLD G RCAR
GOMME S ADX=$X,ADY=$Y,LY1=$L(Y1),Y1=$E(Y1,1,$X-PCX) F EE=$L(Y1):1:LY1 W " "
 S DX=ADX,DY=ADY X XY G @RET Q
HELP S ICK=IC,CHCOUR=Y1 D ^%VHELPSC S IC=ICK G @RET
REFR S OICC=IC,RESUL(IC)=Y1,ADX=$X,ADY=^%SCRE(SCR,IC,3) D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S DX=ADX,DY=ADY,IC=OICC X XY G @RET
IMPR S ADX=$X,ADY=$Y D POCLEPA^%VVIDEO W "Impression en cours..." D ^%VIMPSCR,POCLEPA^%VVIDEO S DX=ADX,DY=ADY X XY G @RET
OABRES K ^OABRES($I) S YK=-1 F ZK=1:1 S YK=$N(RESUL(YK)) Q:YK=-1  S ^OABRES($I,YK)=RESUL(YK)
 K YK,ZK Q
P K ^DEPFLD($I) S ^DEPFLD($I,%DAT)=Y1,DEP=1 G @RET
D I '($D(^DEPFLD($I,%DAT))) K ^DEPFLD($I) D ^%VSQUEAK G @RET
 S ADX=$X,PG=$E(Y1,1,$X-PCX),PD=$E(Y1,($X-PCX)+1,299),LPD=$L(PD),LDEP=$L(^DEPFLD($I,%DAT)),Y1=PG_^DEPFLD($I,%DAT)_$E(PD,LDEP+1,299),DX=PCX,DY=$Y X XY W Y1 S DX=ADX+LDEP X XY G @RET

