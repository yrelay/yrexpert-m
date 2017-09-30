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

;TOP0CLAE^INT^1^59547,74873^0
TOP0CLAE ;
 
LEC S DX=0,DY=6 D CLEBAS^%VVIDEO W "No (A)RC ou No (T)OTEM ? " S DX=$X D ^TOLECONE Q:CTRLA!CTRLF  G:(X1'=65)&(X1'=84) LEC G @X1
65 K ^GLOCLI($I) S DX=0,DY=8 D CLEBAS^%VVIDEO W "No D'ARC : " S DX=$X D ^%VLEC G:(CTRLA!CTRLF)!(Y1="") END S ARC=Y1 I ARC="" D ^%VSQUEAK G 65
 I ('($D(^[QUI]PSRLFILI(ARC))))!('($D(^[QUI]PSRLRTES(ARC)))) D ^%VSQUEAK G 65
651 S ^GLOCLI($I,ARC)=1 D ^TOP0CHNU S ARC=-1 F %AA=1:1 S ARC=$N(^EDICLI($J,ARC)) Q:ARC=-1  S NUFA=-1 F %NN=1:1 S NUFA=$N(^EDICLI($J,ARC,NUFA)) Q:NUFA=-1  S TWREF=0 D IMP Q:CTRLA
 G END
84 S DX=0,DY=8 D CLEBAS^%VVIDEO W "No TOTEM : " S DX=$X D ^%VLEC G:(CTRLA!CTRLF)!(Y1="") END S NUFA=Y1 I '($D(^[QUI]TREEWORK(NUFA))) D ^%VSQUEAK G 84
 S ARC=$P(^[QUI]TREEWORK(NUFA,0),"^",10),TWREF=0 G:ARC="" 84 K ^EDICLI($J) S ^EDICLI($J,ARC,NUFA,TWREF)=1 D IMP G END
END S DX=0,DY=5 D CLEBAS^%VVIDEO K ^EDICLI($J),^PARPARTI($I),^POSENR($I),^GLOCLI($I),ARC,NUFA,TWREF,PAG,LG,OLG,DL,SL,PAGE,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,TIT
 Q
IMP D CLEPAG^%VVIDEO S DX=0,DY=6 D CLEBAS^%VVIDEO W "Un instant..." S DOLARI=$I,%PGM="TOP0HAUD" D PREPAR^TOP0HAUC,^TOP0AFF,^TOP0PCAE I ('($D(^POSENR($I))))&('($D(^GLAFF($J)))) Q
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1) S:(NBPAG=0)&$D(^GLAFF($J)) NBPAG=1 S PAGE=1,NPAG=PAGE D CLEPAG^%VVIDEO G AFF2
SUIT D POCLEPA^%VVIDEO W $$L17^%QSLIB1("CTRLF:Fin du cliche:cliche suivant")
 S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=0 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 Q
6 Q
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF G:NPAG=1 AFF2 I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=1 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  S DX=0 X XY S LIGNE=^POSENR($I,PAGE,DY),PLC=0 F XX=0,7,38,53 S PLC=PLC+1 W ?XX,$P(LIGNE,"^",PLC)
 G SUIT
AFF2 S PAGE=NPAG,DX=0,DY=2 D CLEBAS^%VVIDEO S OLG=2,LG=-1 F LL=1:1 S LG=$N(^GLAFF($J,PAGE,LG)) Q:LG=-1  D SAULG S COL=-1 F CC=1:1 S COL=$N(^GLAFF($J,PAGE,LG,COL)) Q:COL=-1  W ?COL,$P(^GLAFF($J,PAGE,LG,COL),"|",1)
 G SUIT
SAULG S DL=LG-OLG F SL=1:1:DL W !
 S OLG=LG Q

