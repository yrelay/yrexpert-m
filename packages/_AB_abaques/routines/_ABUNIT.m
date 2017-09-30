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

;%ABUNIT^INT^1^59547,73864^0
%ABUNIT ;
 
 D BALAY
DEB S %VV=%V F %V="P","R" D ECR
 S %V=%VV K %VV G BALAY2
ECR S DX=0,DE=$S(%V="P":4,1:PSEP+1),FI=$S(%V="P":PSEP-1,1:20) F DY=DE:1:FI X XY W "        "
 S DXG=11,DXD=78,DYH=DE+1,DYB=FI+1 D LWIN^%VVIDEO
FREQ1 S DX=0,DA=$S(%V="P":%DH,1:%DB),DB=DA+$S(%V="P":3,1:PSEP),DC=DB,FN=$S(%V="P":%PH,1:%PB)+DB F UU=0:0 S DC=$N(^[QU]STRUCT(NOMG,2,%V,DC)) Q:DC=-1  Q:DC>FN  S DY=DC-DA X XY D AFF
 Q
AFF S DX=0 X XY W ^[QU]STRUCT(NOMG,2,%V,DC)
 S UNECR=$S($D(^[QU]STRUCT(NOMG,2,%V,DC,5)):^[QU]STRUCT(NOMG,2,%V,DC,5),1:" ??? "),UNEXP=$S($D(^[QU]STRUCT(NOMG,2,%V,DC,6)):^[QU]STRUCT(NOMG,2,%V,DC,6),1:" ??? "),DX=12 X XY
 W $S((UNECR["??")&(UNEXP["??"):$$^%QZCHW("Pas d'unite"),1:$$^%QZCHW("Valeurs ecrites en unite : ")_UNECR_$$^%QZCHW(", exprimees en ")_UNEXP) Q
BALAY S %LL="SAISIE",%PY=$Y,%PX=$X,COLC=(%PX-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,AW=$S(%PY<PSEP:$$^%QZCHW("partie basse"),1:$$^%QZCHW("partie haute")),%V=$S(AW["b":"P",1:"R") Q
BALAY2 D SSMEN K UNECR,UNEXP Q
SSMEN D POCLEPA^%VVIDEO W $$L9^%QSLIB1 R *REP
 D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP'=1)&((REP'=5)&((REP'=61)&((REP'=43)&(REP'=45)))) SSMEN G @REP
61 G 43
5 S AW=$$^%QZCHW("partie ")_$S(AW["b":$$^%QZCHW("haute"),1:$$^%QZCHW("basse")),%V=$S(%V="P":"R",1:"P") G SSMEN
43 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=$S($D(^NEXSAIS($I,NOMG,%V,%D+%D1)):%D+%D1,1:%D),%DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ECR K %D,%D1,%D3 G SSMEN
45 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=%D-%D1 S:%D<0 %D=0 S %DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ECR K %D,%D1,%D3 G SSMEN
1 I %LL="SAISIE" D ^%ABAFGRI,^%ABEMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S C="",DX=DXC,DY=%PY X XY Q
 D ^%ABAFGRI,^%ABEMPGR Q

