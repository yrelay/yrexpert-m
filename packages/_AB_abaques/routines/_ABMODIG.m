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

;%ABMODIG^INT^1^59547,73864^0
%ABMODIG ;
LOOP G FIN:'($D(^[QU]SCRC(SCR,IC))) S (PCX,DX)=$L(^[QU]SCRC(SCR,IC,1))+^[QU]SCRC(SCR,IC,2),DY=^[QU]SCRC(SCR,IC,3) X XY
 S (OY1,Y1)=RESUL(IC)
READ S RET="READ" O 0 R *X1
 ;;DTM
 G:$$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) FLEC
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G RFLD:X1=27 G:X1=8 HELP
 G DEL:X1=127,RFLD:X1=27,EFF:X1=5,MODFLD:X1=9,CHAMP:X1=7
 ;;NONDTM
 
 ;;FINNONDTM
 G ABEND:X1<2,FIN:X1=6,CHAMP:X1=13,CHAMP:X1=7,DEL:X1=127 I X1<32 D ^%VSQUEAK G LOOP
 W $C(X1) S OY1=Y1,Y1=$E(Y1,1,($X-PCX)-1)_$C(X1)_$E(Y1,($X-PCX)+1,299)
RCAR S RET="RCAR" R *YG
 G HELP:YG=8,MODFLD:YG=9,CHAMP:YG=7,DEL:YG=127,ABEND:YG<2,FIN:YG=6,CHAMP:YG=13 I YG<32 D ^%VSQUEAK G RCAR
 W $C(YG) S OY1=Y1,Y1=$E(Y1,1,($X-PCX)-1)_$C(YG)_$E(Y1,($X-PCX)+1,299) G RCAR:$L(Y1)<76 S YG=13 G CHAMP
RFLD 
 ;;NONDTM
 
 ;;FINNONDTM
 G:MODTM BELL
 R *X2
 G:X2=91 RFLD1
 R *X3
 G FIN:(X2=27)!(X3=27) I (((X1'=27)!(X2'=91))!(X3'>64))!(X3'<69) G BELL
 G FLEC
RFLD1 R *X3
 G:(X3<48)!(X3>57) BELL
RFLD11 R *X3
 S X3=$C(X3)
 G:X3'="~" RFLD11
 G BELL
FLEC D @X3,TEST G LOOP
BELL D ^%VSQUEAK G LOOP
FIN O 0 Q
65 S IC=IC-1 Q
66 S IC=IC+1 Q
67 S IC=IC+1 Q
68 S IC=IC-1 Q
TEST D:'($D(^[QU]SCRC(SCR,IC))) ^%VSQUEAK Q
ABEND S ABENDSCR=1 Q
DEL 
DEL1 I ($X-1)<PCX D ^%VSQUEAK G @RET
 S ADX=$X-1,DX=(PCX+$L(Y1))-1 X XY W " " S PD=$E(Y1,(ADX-PCX)+2,299),PG=$E(Y1,1,ADX-PCX),Y1=PG_PD,DX=PCX X XY W Y1 S DX=ADX X XY G @RET
CHAMP D:(X1=7)!(YG=7) GOMME S ICC=IC,LL=$L(RESUL(ICC))
 S XXYYZZ=RESUL(IC),RESUL(IC)=$S(Y1'="":Y1,$D(^[QU]SCRC(SCR,IC,5)):^[QU]SCRC(SCR,IC,5),1:"") I $D(^[QU]SCRC(SCR,IC,5)) S TAB(IC)=RESUL(IC) D ^%VAFFICH:RESUL(IC)=^[QU]SCRC(SCR,IC,5)
 S REFUSE=""
 D VERIF G REFULOP:REFUSE=1 D UCONT G REFULOP:REFUSE=1 S IC=IC+1 I XXYYZZ'="",$L(Y1)=0 S PADMESSA=$$^%QZCHW("Vous avez efface ce champ...") D ^%VSQUEAK,PAD^%VZEATT H 2 D POCLEPA^%VVIDEO
 G LOOP
UCONT Q:'($D(^[QU]SCRC(SCR,IC,4)))
 Q:^[QU]SCRC(SCR,IC,4)=""  S UCONT=^[QU]SCRC(SCR,IC,4) D @UCONT Q
VERIF Q:'($D(^[QU]SCRC(SCR,IC,6)))  S NVLEG=^[QU]SCRC(SCR,IC,6) Q:NVLEG'>0
 F IV=1:1:NVLEG S VLEG=^[QU]SCRC(SCR,IC,6+IV) G FVER:VLEG=RESUL(IC)
 S REFUSE=1 Q
FVER Q
REFULOP S ICC=IC D ^%ABREFUS G LOOP
NONVT S %XLEC=X1,X1=27
 S X2=91
 I %XLEC=8 S X3=$A("D") G RFLD+2
 I %XLEC=24 S X3=$A("C") G RFLD+2
 I %XLEC=11 S X3=$A("B") G RFLD+2
 I %XLEC=28 S X3=$A("A") G RFLD+2
EFF S NIC=IC-1 F UU=0:0 S NIC=$N(RESUL(NIC)) Q:NIC=-1  S DX=^[QU]SCRC(SCR,NIC,2)+$L(^[QU]SCRC(SCR,NIC,1)),DY=^[QU]SCRC(SCR,NIC,3) X XY S CRIC=RESUL(NIC),RESUL(NIC)="",LIC=$L(CRIC) F VV=1:1:LIC W " "
 G LOOP
MODFLD S ADX=DX,DFLD=PCX,FLD=Y1,XEW=$X,YEW=$Y D POCLEPA^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW(" Mode extension ") D NORM^%VVIDEO S DX=XEW,DY=YEW X XY
 
 D ^%VMOD S XEW=$X,YEW=DY D POCLEPA^%VVIDEO S DX=XEW,DY=YEW X XY I ABENDFLD=0 G MS
 S DX=PCX X XY F UU=1:1:LFLD W " "
 X XY W RESUL(IC) X XY S (OY1,Y1)=RESUL(IC) G READ
MS S (OY1,Y1)=FLD G RCAR
GOMME S LY1=$L(Y1),Y1=$E(Y1,1,$X-PCX) F EE=$L(Y1):1:LY1 W " "
 Q
HELP S ICK=IC,CHCOUR=Y1 D ^%VHELPSC S IC=ICK G @RET

