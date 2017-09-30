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

;%ABSTRUS^INT^1^59547,73864^0
%ABSTRUS ;
 
PVERT D POCLEPA^%VVIDEO W $$L4^%QSLIB1 S PSEP=PPY,LCHP=8,ESPC=8,MPASX=0,MPASY=1,NXI=-1,NXS=80,NYI=3,NYS=21,DX=0,(DY,PY)=4 X XY S %DH=0,%DB=0,%PH=PSEP-4,%PB=20-PSEP
GPVERT X XY D ^%ABMOVC G:(X1=1)!(X1=6) JEU G:X1=2 BALAY G:X1=7 DEL S:C="" PY=$Y I C'="" G ALORS
 S %D=$S(PY<PSEP:%DH,1:%DB),%V=$S(PY<PSEP:"P",1:"R"),%PY=PY,PY=PY+%D
 G:$D(^[QU]STRUCT(NOMG,2,%V,PY,2))!$D(^[QU]STRUCT(NOMG,2,%V,PY,3)) VALPAR S DY=DY+1 G TESTINCR
 S DY=DY+1 G TESTINCR
ALORS S %D=$S(PY<PSEP:%DH,1:%DB),%V=$S(PY<PSEP:"P",1:"R"),%PY=PY,PY=PY+%D I $E(C,1,4)="----" S C="---------"_LIMS,DX=0,DY=PY X XY W C S DY=DY+1,^[QU]STRUCT(NOMG,2,%V,PY)=C G TESTINCR
 G:C="?" PINTER K ^[QU]STRUCT(NOMG,2,%V,PY) S %PPYY=PY,%IND=0 D ^%ABUCGR S PY=%PPYY I REFUSE=1 S DX=UDX,DY=UDY X XY G GPVERT
 S ^[QU]STRUCT(NOMG,2,%V,PY)=C,^[QU]STRUCT(NOMG,2,%V,PY,"FULL")=CFULL
 G:'(%IND) NOIND S W1="%"_$I,PIN=""
 F %U=1:1 S PIN=$O(^[QUI]UNKN(W1,PIN)) Q:PIN=""  S ^[QU]STRUCT(NOMG,2,%V,PY,"PARINT",PIN)=1
 S ^[QU]STRUCT(NOMG,2,%V,PY,"EXPEV")=EXPEV
NOIND S DY=(PY+1)-%D,LLC=$L(C),LDIF=8-LLC,CCN=$J("",LDIF)
 W CCN G VALPAR
VALPAR I %PY<PPY S ODY=DY,ODX=DX D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Cette variable est elle continue")_" ? ","O"),DX=ODX,DY=ODY G:(REP'=1)&(REP'=0) VALPAR S ^[QU]STRUCT(NOMG,2,%V,PY,4)=$S(REP=1:"O",1:"N") G:REP=1 TESTINCR
 D ^%ABVALDE,^%ABVALEG S DY=(PY+1)-%D
TESTINCR 
 I DY=PSEP S %D=%DH,%D1=%PH,%DY=4,%V="P" D REMONT S %DH=%D,DX=0,DY=PSEP-1 K %D,%D1 G GPVERT
 I DY>20 S %D=%DB,%D1=%PB,%DY=PSEP+1,%V="R" D REMONT S %DB=%D,DY=20 K %D,%D1 G GPVERT
 G GPVERT
JEU D ^%ABGTPAR
CONCLU S ^[QU]SCRC(NOMG)=18 Q:MOD=1  S ^[QU]SCRC(NOMG,"TITRE")=NOMG,^[QU]SCRC(NOMG,1,4)="^%ABUCGRI" D POCLEPA^%VVIDEO,^%VSQUEAK W "OK.." H 1 Q
 
FIN Q
 
DEL D ^%ABDLPA G GPVERT
 
REMONT S %D=%D+1
REMON2 S DY=%DY,DX=0 F UU=1:1:%D1 X XY W "        " S DY=DY+1
 S DPD=(%D+%DY)-1,DY=%DY,DPF=DPD+%D1,DC=DPD F UU=1:1 S DC=$N(^[QU]STRUCT(NOMG,2,%V,DC)) Q:DC=-1  Q:DC>DPF  S DY=DC-%D,DX=0 X XY W ^[QU]STRUCT(NOMG,2,%V,DC)
 K DPD,DC,DPF,%DY Q
 
BALAY S PY=$Y,AW=$S(PY<PSEP:"partie basse",1:"partie haute"),%V=$S(AW["b":"P",1:"R")
SSMEN D POCLEPA^%VVIDEO W $$^%QZCHW("+,-, CTRLE Acces "),AW,", ",$$L24^%QSLIB2," Retour a la grille"
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP'=1)&((REP'=5)&((REP'=61)&((REP'=43)&(REP'=45)))) SSMEN G @REP
61 G 43
5 S AW="partie "_$S(AW["b":"haute",1:"basse"),%V=$S(%V="P":"R",1:"P") G SSMEN
43 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=%D+%D1,%DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D REMON2 K %D,%D1,%D3 G SSMEN
45 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=%D-%D1 S:%D<0 %D=0 S %DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D REMON2 K %D,%D1,%D3 G SSMEN
1 D POCLEPA^%VVIDEO W $$L4^%QSLIB1 S DX=0,DY=$S(AW["b":4,1:PSEP+1) G GPVERT
 
PINTER I $D(^[QU]STRUCT(NOMG,2,%V,PY,"FULL")) D POCLEPA^%VVIDEO W ^[QU]STRUCT(NOMG,2,%V,PY,"FULL")
 S DY=%PY,DX=0 X XY W "        " I $D(^[QU]STRUCT(NOMG,2,%V,PY)) X XY W ^[QU]STRUCT(NOMG,2,%V,PY)
 X XY G GPVERT

