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

;%ABFULPR^INT^1^59547,73864^0
%ABFULPR ;
 
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("PREMISSES et RESULTANTES ") D CLEPAG^%VVIDEO,TO4^%VZCD G TRAIT
FIN K ^POSENR($I),^TACOMPIL($I),^VPAR($I) Q
TRAIT S %UCI=^TABIDENT($I,"%UCI"),PAGE=0,PG=-1,LIC=8 K ^VPAR($I),^POSENR($I) S DX=0,DY=7 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("Un instant...")
 D T0
AFF S NBPVU=PAGE S:'($D(^POSENR($I,PAGE))) NBPVU=NBPVU-1 S PAGE=1,PT=" " F UU=1:1:60 S PT=PT_"."
AFFI S DX=0,DY=6 D CLEBAS^%VVIDEO S MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBPVU,DY=6,DX=40-($L(MSG)\2) X XY W MSG S DY=-1 F UU=0:0 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  S DX=-1 F VV=0:0 S DX=$N(^POSENR($I,PAGE,DY,DX)) Q:DX=-1  X XY W ^POSENR($I,PAGE,DY,DX)
QUES D POCLEPA^%VVIDEO W $$L17^%QSLIB1("") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" QUES S:Y1="=" Y1="+" S ADR=$S(Y1="+":"PLUS",Y1="-":$$^%QZCHW("MOINS"),1:"NUM") G @ADR
PLUS S PG=PAGE+1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
MOINS S PG=PAGE-1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
NUM S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) QUES S PG=Y1 G:'($D(^POSENR($I,PG))) QUES S PAGE=PG G AFFI
T3 D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=13)&(RET'=1) T3 I RET=13 S LIC=7,DX=0,DY=6 D CLEBAS^%VVIDEO G END
 S STOP=1 G END
T0 
 S LI=1,TYP=$S(QU=QUI:"(P)",1:"(C)"),PAGE=PAGE+1,LIC=8,^POSENR($I,PAGE,LIC,0)=NOMG_" "_TYP,LIC=LIC+2,^POSENR($I,PAGE,LIC,5)=$$^%QZCHW("Premisses"),LIC=LIC+1,LIS=-1,TP="P",^VPAR($I,NOMG_" "_TYP)=PAGE
LOOP F WW=0:0 S LIS=$N(^[QUW]STRUCT(NOMG,2,TP,LIS)) Q:LIS=-1  D T1
 G:TP="R" END S TP="R",^POSENR($I,PAGE,LIC,5)=$$^%QZCHW("Resultantes"),LIC=LIC+1 D:LI>20 T2 G LOOP
T1 S ^POSENR($I,PAGE,LIC,17)=^[QUW]STRUCT(NOMG,2,TP,LIS),^POSENR($I,PAGE,LIC,26)="==> "_$S($D(^[QUW]STRUCT(NOMG,2,TP,LIS,"FULL")):^[QUW]STRUCT(NOMG,2,TP,LIS,"FULL"),1:$$^%QZCHW(" A redefinir, risque de devenir ambigu"))
 S LIC=LIC+1 I LIC>20 G T2
END Q
T2 S PAGE=PAGE+1,LIC=8,^POSENR($I,PAGE,LIC,0)=NOMG_" "_TYP_$$^%QZCHW("  [suite]")
 S LIC=LIC+2 G END

