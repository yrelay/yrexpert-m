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

;%ABPREMR^INT^1^59547,73864^0
%ABPREMR ;
 
 S TIT=$$^%QZCHW(" Rappel des PREMISSES et RESULTANTES d'ABAQUES ") D ^%ABLISAB G:'($D(^TACOMPIL($I))) FIN G TRAIT
FIN K ^POSENR($I),^TACOMPIL($I),^VPAR($I) Q
TRAIT S %UCI=^TABIDENT($I,"%UCI"),PAGE=0,PG=-1,LIC=8 K ^VPAR($I),^POSENR($I) S DX=0,DY=7 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("Un instant...")
 F UU=0:0 S PG=$N(^TACOMPIL($I,PG)) Q:PG=-1  S LI=-1 F VV=0:0 S LI=$N(^TACOMPIL($I,PG,LI)) Q:LI=-1  D T0
AFF S NBPVU=PAGE S:'($D(^POSENR($I,PAGE))) NBPVU=NBPVU-1 S PAGE=1,PT=$$^%QZCHW(" ") F UU=1:1:60 S PT=PT_"."
AFFI S DX=0,DY=6 D CLEBAS^%VVIDEO S MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBPVU,DY=6,DX=40-($L(MSG)\2) X XY W MSG S DY=-1 F UU=0:0 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  S DX=-1 F VV=0:0 S DX=$N(^POSENR($I,PAGE,DY,DX)) Q:DX=-1  X XY W ^POSENR($I,PAGE,DY,DX)
QUES D POCLEPA^%VVIDEO W $$L17^%QSLIB1("?:repere, CTRLJ:Imprimante")
 S DX=$X D ^%VLEC G:CTRLA=1 FIN G:CTRLJ IMPR G:Y1="" QUES S:Y1="=" Y1="+" S ADR=$S(Y1="?":"INT",Y1="+":"PLUS",Y1=$$^%QZCHW("-"):"MOINS",1:"NUM") G @ADR
PLUS S PG=PAGE+1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
MOINS S PG=PAGE-1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
NUM S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) QUES S PG=Y1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
INT S STOP=0,DX=0,DY=6 D CLEBAS^%VVIDEO X XY S LIC=$Y+1,NOMG=-1 F UU=1:1 S NOMG=$N(^VPAR($I,NOMG)) Q:NOMG=-1  W !,NOMG,$E(PT,1,60-$X),$$^%QZCHW(" page "),^VPAR($I,NOMG) S LIC=LIC+1 I LIC>21 D T3 Q:STOP=1
 I STOP=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 G AFFI
T3 D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=13)&(RET'=1) T3 I RET=13 S LIC=7,DX=0,DY=6 D CLEBAS^%VVIDEO G END
 S STOP=1 G END
T0 S NOMG=$P(^TACOMPIL($I,PG,LI),"^",1),TYP=$P(^TACOMPIL($I,PG,LI),"^",2),QUW=$S(TYP[$$^%QZCHW("P"):QUI,1:%UCI),PAGE=PAGE+1,LIC=8,^POSENR($I,PAGE,LIC,0)=NOMG_$$^%QZCHW(" ")_TYP,LIC=LIC+2,^POSENR($I,PAGE,LIC,5)=$$^%QZCHW("Premisses"),LIC=LIC+1,LIS=-1,TP=$$^%QZCHW("P"),^VPAR($I,NOMG_$$^%QZCHW(" ")_TYP)=PAGE
LOOP F WW=0:0 S LIS=$N(^[QUW]STRUCT(NOMG,2,TP,LIS)) Q:LIS=-1  D T1
 G:TP="R" END S TP="R",^POSENR($I,PAGE,LIC,5)=$$^%QZCHW("Resultantes"),LIC=LIC+1 D:LI>20 T2 G LOOP
T1 S ^POSENR($I,PAGE,LIC,17)=^[QUW]STRUCT(NOMG,2,TP,LIS),^POSENR($I,PAGE,LIC,26)="==> "_$S($D(^[QUW]STRUCT(NOMG,2,TP,LIS,"FULL")):^[QUW]STRUCT(NOMG,2,TP,LIS,"FULL"),1:$$^%QZCHW(" A redefinir, risque de devenir ambigu"))
 S LIC=LIC+1 I LIC>20 G T2
END Q
T2 S PAGE=PAGE+1,LIC=8,^POSENR($I,PAGE,LIC,0)=NOMG_$$^%QZCHW(" ")_TYP_$$^%QZCHW("  [suite]")
 S LIC=LIC+2 G END
IMPR S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant impression en cours...") S DOLI=$I O IMPR U IMPR
 S PGE=-1
LPGE S PGE=$N(^POSENR(DOLI,PGE)) G:PGE=-1 FLPGE H 2 W !,!,!,!,! S OLI=7,LI=-1
LLI S LI=$N(^POSENR(DOLI,PGE,LI)) G:LI=-1 LPGE F %U=OLI:1:LI W !
 S OLI=LI,COL=-1
LCOL S COL=$N(^POSENR(DOLI,PGE,LI,COL)) G:COL=-1 LLI W ?COL,^POSENR(DOLI,PGE,LI,COL) G LCOL
FLPGE K PGE,OLI,LI,COL C IMPR G QUES

