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
;! Nomprog     : %VACTDRI                                                     !
;! Module      : VIDEO                                                        !
;! But         : Affiche l'entete, le pied de page et les cadres.             !
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

;%VACTDRI^INT^1^59547,74033^0
%VACTDRI ;;09:39 AM  8 Jan 1996
 
B S:'($D(RM)) RM=80 O 0 K ^TOLISRAM($I,10)
 S TBMOV="^GLOMENU($I,%PROG,""DY"",DY)",%ABM=0 D CLEPAG^%VVIDEO S MSG=$$^%QZCHW(^GLOMENU($I,%PROG,0))
 D ^%VZCD(0,38,0,4,1,1,MSG) S DY=22,DX=27 X XY W $$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YREXPERT ("_^INCONNE("VERSION")_")") D ZD^%QMDATE4,^%QMDAK0 S DY=22,DX=0 X XY W $$^%QZCHW("le "),%DAT,"  ",HEURE S DX=75 X XY W WHOIS S DX=5,DY=3 X ^TOLISRAM(5),^TOLISRAM S DX=5,DY=3 X XY

C 
D
 D CHM,^%VMENUPG("TBM",.%A,.%CTR)
 K TBM S ADC=$P(%CTR,"^",2),%CTR=$P(%CTR,"^",1) I %CTR="I" D ^%VACTIMP(%PROG,^GLOMENU($I,%PROG,0))
 I (%CTR="@")!(%CTR="_") D MPG^%VACTCOM(%PROG,ADC,%CTR) G D
 G DENOM:%CTR="D",APEL:%CTR="N",HLP:%CTR="H"
 I (%CTR="A")!(%CTR="F") S ^MEN($I,"%APEL")="",^TOLISRAM($I,10)=^TOLISRAM($I,100),^TOLISRAM($I,100)="" G FIN
 G:%A="" D
 I %A=0 S ^TOLISRAM($I,100)="~"_$P(^TOLISRAM($I,100),"~",3,299) G FIN
 
 S F=%A G:'($D(^GLOMENU($I,%PROG,F))) D S A=^GLOMENU($I,%PROG,F) I A'="" S %PROGET=$P($P(A,";;",3),"/",1) D PASS Q:B="???"  S ^TOLISRAM($I,100)="~"_%PROGET_^TOLISRAM($I,100) Q:%ABM=1  Q
FIN O 0 D CURON^%VVIDEO K TBMENU,Y1,X1,Y,ATT Q
PASS S B=$P($P(A,";;",3),"/",2) G:B="" PASS2 D ^%INCUPA G FIN
PASS2 S B=$P($P(A,";;",3),"/",3) G:B="" FIN
 D POCLEPA^%VVIDEO S:'($$FIX2^%INCUPA(B,DX,DY)) B="???" G FIN
DENOM S DX=10,DY=5 X XY W $$^%QZCHW("Denomination : ") S DX=$X D ^%VLEC G:Y1="" EFF
 K ^TOLISRAM($I,30,Y1) S F=ADC I F=0 S ^TOLISRAM($I,30,Y1,"TOLIS")=^TOLISRAM($I,100) G STO
 G:'($D(^GLOMENU($I,%PROG,F))) EFF S A=^GLOMENU($I,%PROG,F) G EFF:A="" S %PROGET=$P($P(A,";;",3),"/",1),^TOLISRAM($I,30,Y1,"TOLIS")="~"_%PROGET_^TOLISRAM($I,100)
STO S NOMTREE="^PIMEN("_$S(($I+0)=$I:"",1:"""")_$I_$S(($I+0)=$I:"",1:""""),%TREECOP="^TOLISRAM($I,30,Y1,""PIM""" D ^%QCAGLC,KILL^%VGERMPG("%MNUS")
 S ^TOLISRAM($I,30,Y1,"LIB")=$S(ADC=0:^GLOMENU($I,%PROG,0),1:$P(A,";;",2)) S:ADC'=0 ^TOLISRAM($I,30,Y1,"COM")=$S($D(^GLOMENU($I,%PROG,"AFF",F,"COM")):^GLOMENU($I,%PROG,"AFF",F,"COM"),1:"")
EFF S DX=10,DY=5 X XY W $J("",60) G D
APEL S DX=10,DY=5 X XY W $$^%QZCHW("Libelle : ") S DX=$X D ^%VLEC G EFF:Y1="",EFF:'($D(^TOLISRAM($I,30,Y1)))
APEL1 S ^MEN($I,"%APEL")=Y1,^TOLISRAM($I,100)="" G FIN
HLP D ^%VACTUSE($I,.Y1) G D:Y1="%%%",B:Y1="",APEL1
CHM K TBM S TBM("PG")=%PROG,CHM=$P($T(CHM0),";;",2) F %V=1:1 S %U=$P(CHM,";",%V) Q:%U=""  S TBM($P(%U,"=",1))=$P(%U,"=",2)
 K CHM Q
CHM0 ;;XG=10;XD=12;YH=7;YB=16;DL=1;MES=^GLOMENU($I,%PROG,"AFF")

