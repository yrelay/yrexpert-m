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
;! Nomprog     : %VACTIME                                                     !
;! Module      : VIDEO                                                        !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;! AFIMEN : affiche l'entete du menu                                          !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;! HL003 ! HL     ! 19/08/09 ! Label referenced but not defined: QW           !
;! HL004 ! HL     ! 25/06/12 ! Position menu et commentaire                   !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VACTIME ;
 
 S COUNT=0 D %UCI^%QCSDIR S QUI=%UCI,WHOIS=%UCI
A O 0 U 0 S A=1,IOP=0 D ^%IS,CURRENT^%IS S:'($D(QUI)) QUI="YXP" S:'($D(WHOIS)) WHOIS="YXP" S %ZD="MWA",^TOLISRAM($I,100)=""
A1 S MA="GENERAL",(^PIMEN($I),PIM)=1
START D REINIT^%EDPRLG
 S ^TOZE($I,"FULL")=0 I '($D(^TOZE($I,"NOCHAIR"))) S ^TOZE($I,"NOCHAIR")=0
 G:^TOZE($I,"NOCHAIR")=0 STARS
 S QUI=%UCI,WHOIS=-1 F UU=0:0 S WHOIS=$N(^TABIDENT(WHOIS)) Q:WHOIS=-1  I $D(^TABIDENT(WHOIS,"MACHINE")),^TABIDENT(WHOIS,"MACHINE")=QUI G STARS
STARS K (%UCI,%ZD,MCM,COUNT,FF,SWIT,MA,PIM,PIMEN,QUI,WHOIS) D VAR G:'($D(^TOLISRAM($I,20))) STARU D DUPR I $D(^PIMEN($I,"PROG")) S B=^PIMEN($I,"PROG") G STARV
 S PIM=^PIMEN($I),MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1) D:SWIT'="" ZSWITCH^%QCSCDIR(SWIT)
STARU S ^PIMEN($I,PIM)=MA_"^"_SWIT,AD="" D AFIMEN G:AD'="" @AD S LC="",CONNECT=0,^TOLISRAM($I,100)=""
;;;;;READ D CHM,^%VMENUPG("TBM",.%A,.%CTRL)
;;;;;READ D CHM S (DX,DY)=0 X XY W "***" D ^%VMENUPG("TBM",.%A,.%CTRL)
READ D CHM D ^%VMENUPG("TBM",.%A,.%CTRL)
 K TBM S ADC=$P(%CTRL,"^",2),%CTRL=$P(%CTRL,"^",1) I %CTRL="I" D ^%VACTIMP(MA,^MN(MA,"TITRE")) G READ
 I (%CTRL="@")!(%CTRL="_") D ^%VACTCOM(MA,ADC,%CTRL),AFIMEN G READ
 G DENOM:%CTRL="D",APEL:%CTRL="N",HLP:%CTRL="H"
 I (%CTRL="A")!(%CTRL="F") D DUP:%CTRL="A" S (^PIMEN($I),PIM)=1 G END:%CTRL="A",A1:%CTRL="F"
 G READ:%A="",END:%A=0,READ:'($D(^MEN($I,MA,%A))) S Y(1)=0,Y=^MEN($I,MA,%A) D COPAS G @AD
COPAS K ^PIMEN($I,"PROG"),^TOLISRAM($I,10) S SWIT=$P(Y,"|",4)
 S B=$P(Y,"|",3) I B'="" D FIX^%INCUPA(B,10,5,.AL) I AL'=1 S AD="START" Q
 S B=$P(Y,"|",2) I B="" S (B,MA)=$P(Y,"|",1) G STAF
 S B1=B I $D(^MN(B1)) S (B,MA)=B1 G STAF
CALRO 
 K:B="^WORD" IOP,IO I SWIT'="" D INT^%DIR S PIM=^PIMEN($I),$P(^PIMEN($I,PIM),"^",2)=%DIR D:Y(1)=0 ZSWITCH^%QCSCDIR(SWIT)
 S %PG=B,^PIMEN($I,"PROG")=B,AD="STARV" Q
STARV S ^MEN($I,"%APEL")="" D CLEPAG^%VVIDEO,@B G:^MEN($I,"%APEL")'="" SAUT S PIM=^PIMEN($I),MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1) D:SWIT'="" ZSWITCH^%QCSCDIR(SWIT) G START
NF W " Fonction inconnue ; taper ? pour avoir le menu ",*-1 H 1 G START
VAR S IOP=0 D ^%IS,CURRENT^%IS,VARSYS^%QCSAP Q
STAF S PIM=^PIMEN($I) I SWIT'="" D INT^%DIR S XX=^PIMEN($I,PIM),^PIMEN($I,PIM)=$P(XX,"^",1)_"^"_%DIR
 S:Y(1)=0 PIM=PIM+1,^PIMEN($I)=PIM S Y(1)=2,Y(2)=B,AD="START" Q
END Q:^PIMEN($I)=1  S PIM=^PIMEN($I),PIM=PIM-1,^PIMEN($I)=PIM,MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1) G START

AFIMEN ;Affiche entête, pied de page et cadre
 S PIM=^PIMEN($I),MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1) I SWIT'="" D ZSWITCH^%QCSCDIR(SWIT)
 I '($D(^MN(MA,"TITRE"))) S AD="A" Q
 ;HL002 D CLEPAG^%VVIDEO S MSG=$$^%QZCHW(^MN(MA,"TITRE")) D ^%VZCD(0,38,0,4,1,1,MSG),^%QMDAK0,ZD^%QMDATE4 S DX=0,DY=23 X XY W WHOIS,?38,HEURE,?65,%DAT
 ;HL003 D CLEPAG^%VVIDEO S MSG=$$^%QZCHW(^MN(MA,"TITRE")) D ^%VZCD(0,38,0,4,1,1,MSG),^%QMDAK0,ZD^%QMDATE4 S DX=0,DY=23 X XY W "le "_%DAT_"  "_HEURE,?27,$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",?75,WHOIS
 D CLEPAG^%VVIDEO S MSG=$$^%QZCHW(^MN(MA,"TITRE")) D ^%VZCD(0,40,0,4,1,1,MSG),^%QMDAK0,ZD^%QMDATE4 S DX=1,DY=22 X XY W "le "_%DAT_"  "_HEURE,?27,$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",?75,WHOIS
 D CARSP^%VVIDEO(1,6,12,78,1),CARSP^%VVIDEO(1,18,4,78,0)
 Q:$D(^MEN($I,MA))  S I="",J1=0 K ^MEN($I,MA) D CUROF^%VVIDEO

LOM
 S I=$O(^MN(MA,I)) G:((I="")!(I="TITRE"))!(I="STATUT") FOM S Y=^MN(MA,I) G:Y="" QW S A=$P(Y,"|",1)
 S OKR=$P(Y,"|",5) I OKR'="" S @("OKR(1)="_OKR) I OKR(1)=0 G LOM
 S J1=J1+1,LI=^MN(MA,I),^MEN($I,MA,J1)=LI,LI=$P(LI,"|",1)
 S ^MEN($I,MA,"AFF",J1)=LI_$J("",30-$L(LI))_"^"_J1,^MEN($I,MA,"AFF",J1,"EQU")=J1,^MEN($I,MA,"AFF",J1,"COM")=$S($D(^MN(MA,I,"COM")):^MN(MA,I,"COM"),1:"") G LOM
FOM
 S ^MEN($I,MA,0)="Abandon^0",^MEN($I,MA,"AFF",0)="Abandon"_$J("",30-$L("Abandon"))_"^0",^MEN($I,MA,"AFF",0,"EQU")=0,^MEN($I,MA,"AFF",0,"COM")=$P($S('(DTM):$T(ABEND),MODTM:$T(ABENDD),1:$T(ABENDA)),";;",2)
 S ^MEN($I,MA,"AFF")="20^3^77^1" Q
QW Q ;HL003
GET1 R *X:^TOZE($I,"ATTENTE") G:X<30 END Q
DUP 
 K ^TOLISRAM($I,20) S NOMTREE="^PIMEN("_$S(($I+0)=$I:"",1:"""")_$I_$S(($I+0)=$I:"",1:""""),%TREECOP="^TOLISRAM($I,20" D ^%QCAGLC Q
DUPR S %TREECOP="^PIMEN($I",NOMTREE="^TOLISRAM("_$S(($I+0)=$I:"",1:"""")_$I_$S(($I+0)=$I:"",1:"""")_",20" D ^%QCAGLC K ^TOLISRAM($I,20) Q
DENOM S Y(1)=1,DX=10,DY=5 X XY W "Denomination : " S DX=$X D ^%VLEC G:Y1="" EFF K ^TOLISRAM($I,30,Y1) G:'($D(^MEN($I,MA,ADC))) EFF S B="",Y=^MEN($I,MA,ADC) D:ADC'=0 COPAS G:B="???" EFF
 S PIM=^PIMEN($I),MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1)
STO S NOMTREE="^PIMEN("_$S(($I+0)=$I:"",1:"""")_$I_$S(($I+0)=$I:"",1:""""),%TREECOP="^TOLISRAM($I,30,Y1,""PIM""" D ^%QCAGLC I Y(1)=2 S ^TOLISRAM($I,30,Y1,"PIM")=PIM+1,^TOLISRAM($I,30,Y1,"PIM",PIM+1)=Y(2)
 S ^TOLISRAM($I,30,Y1,"LIB")=$S(ADC=0:MA,1:$P(Y,"|",1)) S:ADC'=0 ^TOLISRAM($I,30,Y1,"COM")=$S($D(^MEN($I,MA,"AFF",ADC,"COM")):^MEN($I,MA,"AFF",ADC,"COM"),1:"") D KILL^%VMENUPG("%MNUS")
 G EFF
APEL S DX=10,DY=5 X XY W "Libelle : " S DX=$X D ^%VLEC G EFF:Y1="",EFF:'($D(^TOLISRAM($I,30,Y1))) S ^MEN($I,"%APEL")=Y1 G SAUT
EFF S DX=10,DY=5 X XY W $J("",60) G READ
SAUT K ^TOLISRAM($I,20),^PIMEN($I) S Y1=^MEN($I,"%APEL"),NOMTREE="^TOLISRAM("_$S(($I+0)=$I:"",1:"""")_$I_$S(($I+0)=$I:"",1:"""")_",30,"""_Y1_""",""PIM""",%TREECOP="^PIMEN("_$I D ^%QCAGLC
 I $D(^TOLISRAM($I,30,Y1,"TOLIS")) S ^TOLISRAM($I,10)=^TOLISRAM($I,30,Y1,"TOLIS")
 S PIM=^PIMEN($I),MA=^PIMEN($I,PIM),SWIT=$P(MA,"^",2),MA=$P(MA,"^",1) I $D(^PIMEN($I,"PROG")) S B=^PIMEN($I,"PROG") G STARV
 G STARS
HLP D ^%VACTUSE($I,.Y1) I Y1="" D AFIMEN G READ
 G READ:Y1="%%%" S ^MEN($I,"%APEL")=Y1 G SAUT
CHM K TBM S TBM("PG")=MA,CHM=$P($T(CHM0),";;",2) F %V=1:1 S %U=$P(CHM,";",%V) Q:%U=""  S TBM($P(%U,"=",1))=$P(%U,"=",2)
 K CHM Q
; XG, XD , YH, YB position du menu et page
;HL004 CHM0 ;;XG=4;XD=78;YH=8;YB=15;DL=5;MES=^MEN($I,MA,"AFF")
CHM0 ;;XG=10;XD=50;YH=8;YB=15;DL=5;MES=^MEN($I,MA,"AFF")
ABEND ;;CTRLA pour abandonner, Return sur option choisie, numero de l'option, ou  caractere correspondant a l'option
ABENDD ;;ESCP pour abandonner, Return sur option choisie, numero de l'option, ou  caractere correspondant a l'option
ABENDA ;;BREAK pour abandonner, Return sur option choisie, numero de l'option, ou  caractere correspondant a l'option

