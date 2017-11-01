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
;! HL002 ! HL     ! 30/10/17 ! Doublement du caractère saisi.                 !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABGTFLD^INT^1^59547,73864^0
%ABGTFLD ;
 
 
 S DX=$X S:'($D(YG)) YG=""
 S PCX=^[QU]SCRC(SCR,ICC,2)+$L(^[QU]SCRC(SCR,ICC,1)),PCY=$Y
 ;HL002 U 0
 U 0:NOECHO
LEC R *X1
 ;;DTM
 G:$$FLECHE^%INCCLAV(X1,.X1,.XG2,.XG3) FLEC
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G P:X1=16,D:X1=4,REFR:X1=18,DEL:X1=127,ESC:X1=27
 ;;NONDTM
 
 ;;FINNONDTM
 G HELP:X1=8,GOMME:X1=7,MFLD:X1=9,FIN:(X1=13)!(X1<2),CTRLF:X1=6,REFUS:X1<32
 W $C(X1) S LPG=((($Y-PCY)*80)+$X)-PCX,PG=$E(YG,1,LPG-1),PD=$E(YG,LPG+1,299),YG=PG_$C(X1)_PD
 G LEC
DEL I (($X-1)<PCX)&(PCY=$Y) D ^%VSQUEAK G LEC
 S ADX=$X-1,ADY=$Y,DX=((PCX+$L(YG))#80)-1,DY=((PCX+$L(YG))\80)+PCY S:DX<0 DX=79,DY=DY-1 X XY W " " S LPG=(((ADY-PCY)*80)+ADX)-PCX,PD=$E(YG,LPG+2,299),PG=$E(YG,1,LPG),YG=PG_PD,DX=PCX,DY=PCY X XY W YG S DX=ADX,DY=ADY S:ADX<0 DX=79,DY=DY-1 X XY G LEC
 
ESC G:MODTM REFUS
 R *XG2
 G:XG2=91 ESC1
 R *XG3
 G REFUS
ESC1 R *XG3
 G:(X3<48)!(X3>57) REFUS
ESC11 R *XG3
 S XG3=$C(XG3)
 G:XG3="~" REFUS
 G ESC11
FLEC G REFUS:(XG2=27)!(XG3=27) I (((X1'=27)!(XG2'=91))!(XG3'>64))!(XG3'<69) D ^%VSQUEAK G LEC
 G FIN
REFUS D ^%VSQUEAK G LEC
CTRLF S CTRLF=1
FIN S Y1=YG Q
NONVT S %XLEC=X1,X1=27
 S XG2=91
 I %XLEC=8 S XG3=$A("D") G ESC+1
 I %XLEC=24 S XG3=$A("C") G ESC+1
 I %XLEC=11 S XG3=$A("B") G ESC+1
 I %XLEC=28 S XG3=$A("A") G ESC+1
MFLD S ADX=DX,DFLD=PCX,FLD=YG,XEW=$X,YEW=$Y D POCLEPA^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW(" Mode extension ") D NORM^%VVIDEO S DX=XEW,DY=YEW X XY
 
 D ^%VMOD S XEW=$X,YEW=$Y D POCLEPA^%VVIDEO S DX=XEW,DY=YEW X XY S CCX=$X I ABENDFLD=0 G MS
 S DX=ADX X XY F UU=1:1:LFLD W " "
 X XY W YG X XY G LEC
MS S YG=FLD,DX=PCX,DY=PCY X XY W YG G LEC
GOMME S AAX=$X,LYG=$L(YG),YG=$E(YG,1,$X-PCX) F EE=$L(YG):1:LYG W " "
 S DX=AAX X XY G LEC
HELP S ICK=ICC,CHCOUR=YG D ^%VHELPSC S ICC=ICK G LEC
REFR S OICC=ICC,RESUL(ICC)=YG,ADX=$X,ADY=^[QU]SCRC(SCR,ICC,3) D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR S DX=ADX,DY=ADY,ICC=OICC X XY G LEC
IMPR S ADX=$X,ADY=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...") D ^%VIMPSCR,POCLEPA^%VVIDEO S DX=ADX,DY=ADY X XY G LEC
P K ^DEPFLD($I) S ^DEPFLD($I,%DAT)=YG,DEP=1 G FIN
D I '($D(^DEPFLD($I,%DAT))) K ^DEPFLD($I) D ^%VSQUEAK G LEC
 S ADX=$X,PG=$E(YG,1,$X-PCX),PD=$E(YG,($X-PCX)+1,299),LPD=$L(PD),LDEP=$L(^DEPFLD($I,%DAT)),YG=PG_^DEPFLD($I,%DAT)_$E(PD,LDEP+1,299),DX=PCX,DY=$Y X XY W YG S DX=ADX+LDEP X XY G LEC

