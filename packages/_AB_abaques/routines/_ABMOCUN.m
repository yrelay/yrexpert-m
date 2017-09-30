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

;%ABMOCUN^INT^1^59547,73864^0
%ABMOCUN ;
 
 S CNULS="",CNULI="",C="" F UU=1:1:LCHP S CNULS=CNULS_" "
 F UU=1:1:ESPC S CNULI=CNULI_" "
LEC D ^%ABMOVCU G:X1=9 IMPR G:X1=5 ENDES G:X1=2 BALAY
 G:X1=20 FIN G:(X1=1)!((X1=6)!((X1=13)!((X1=7)!((X1=16)!((X1=4)!((X1=18)!((X1=2)!(X1=5)))))))) FIN S:C="" PX=$X,PY=$Y G:X1=127 DEL W $C(X1) S C=C_$C(X1) G:(PY<PSEP)&($L(C)'<LCHP) FIN G:(PY'<PSEP)&($L(C)'<ESPC) FIN G LEC
FIN Q
DEL S LC=$L(C) G:LC=0 LEC S C=$E(C,1,LC-1) X XY W $S(DY<PSEP:CNULS,1:CNULI) X XY W C G LEC
IMPR S DXAI=$X,DYAI=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^%ABIMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("Unite ecrite/Unite exprimee") S DX=DXAI,DY=DYAI X XY G LEC
ENDES S %PY=$Y,%PX=$X,COLC=(%PX-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,DX=DXC,C=""
 I %PY<PSEP S DY=$O(^NEXSAIS($I,NOMG,"R",%DB,"")) X XY G LEC
 S DY=-($O(^DERSAIS($I,NOMG,"P",-(%DH),""))) X XY G LEC
BALAY S %LL="SAISIE",%PY=$Y,%PX=$X,COLC=(%PX-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,AW=$S(%PY<PSEP:$$^%QZCHW("partie basse"),1:$$^%QZCHW("partie haute")),%V=$S(AW["b":"P",1:"R") D SSMEN G LEC
SSMEN D POCLEPA^%VVIDEO W $$L9^%QSLIB1
 R *REP
 D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP'=1)&((REP'=5)&((REP'=61)&((REP'=43)&(REP'=45)))) SSMEN G @REP
61 G 43
5 S AW=$$^%QZCHW("partie ")_$S(AW["b":$$^%QZCHW("haute"),1:$$^%QZCHW("basse")),%V=$S(%V="P":"R",1:"P") G SSMEN
43 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=$S($D(^NEXSAIS($I,NOMG,%V,%D+%D1)):%D+%D1,1:%D),%DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ^%ABAFSSU K %D,%D1,%D3 G SSMEN
45 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=%D-%D1 S:%D<0 %D=0 S %DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ^%ABAFSSU K %D,%D1,%D3 G SSMEN
1 I %LL="SAISIE" D POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLB balayage") S C="",DX=DXC,DY=%PY X XY Q
 Q
UNITE D ^%ABUNIT G LEC

