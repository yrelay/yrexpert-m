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
;! HL002 ! HL     ! 01/11/17 ! %GTM-E-FALLINTOFLST, Fall-through to a label with formallist is not allowed !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABCURT^INT^1^59547,73864^0
%ABCURT ;;03:57 PM  11 Feb 1992;
 
 
 
 
 N %F
 S CNULS="",CNULI="",C="" F UU=1:1:LCHP S CNULS=CNULS_" "
 F UU=1:1:ESPC S CNULI=CNULI_" "
LEC S %PYY=$Y,%PXX=$X,%V=$S(%PYY<PSEP:"P",1:"R"),%D=$S(%V="P":%DH,1:%DB),%D1=$S(%V="P":%PH,1:%PB),%D3=$S(%V="P":"%DH",1:"%DB")
 I '($D(ATT)) S ATT=30
 S %F="",X1=""
;HL002 LEC2 D ^%VZATOU(.X1,.%F,5,1)
LEC2 D VVZATOU^%VZATOU(.X1,.%F,5,0)
 I (X1="")&(%F="") D HEURE G LEC2
 
 I %F'="" G @%F
 
 F %I=2,5,8,9,12,21,22,26 G:X1=%I @%I
 
 G:(X1>30)&(X1<127) SAISIE
 
 
 G:%DUP=1 FIN
 G:(X1=1)!((X1=6)!((X1=13)!((X1=7)!((X1=16)!((X1=4)!((X1=18)!((X1=2)!((X1=5)!(X1=10))))))))) FIN
 S:C="" PX=$X,PY=$Y
 G:X1=127 DEL
 W $C(X1) S C=C_$C(X1)
 G:(PY<PSEP)&($L(C)'<LCHP) FIN
 G:(PY'<PSEP)&($L(C)'<ESPC) FIN
 G LEC
FIN G:(X1=1)&(NOMGC="zzzzzz") RES Q
DEL S LC=$L(C) G:LC=0 LEC S C=$E(C,1,LC-1) X XY W $S(DY<PSEP:CNULS,1:CNULI) X XY W C G LEC
 
 
 
 
2 S %LL="SAISIE",%PY=$Y,%PX=$X,COLC=(%PX-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,AW=$S(%PY<PSEP:$$^%QZCHW("partie basse"),1:$$^%QZCHW("partie haute")),%V=$S(AW["b":"P",1:"R") D SSMEN G LEC
 
 
5 S %PY=$Y,%PX=$X,COLC=(%PX-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,DX=DXC,C=""
 I %PY<PSEP S DY=$O(^NEXSAIS($I,NOMG,"R",%DB,"")) X XY G LEC
 S DY=-($O(^DERSAIS($I,NOMG,"P",-(%DH),""))) X XY G LEC
 
 
8 D ^%ABHLPGR G LEC
 
 
9 S DXAI=$X,DYAI=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^%ABIMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^%ABGRPAG S DX=DXAI,DY=DYAI X XY G LEC
 
 
12 G FIN
 
 
21 D ^%ABAFUNI S DX=10,DY=4 D ^%ABREMUN,^%ABAFGRI,^%ABEMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=10,DY=$O(^NEXSAIS($I,NOMG,%V,%D,"")) X XY G LEC
 
 
22 S WDX=DX,WDY=DY D ^%ABFULPR,CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^%ABAFGRI,^%ABEMPGR,POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aidememoire") D AFFICH^%ABGRPAG S DX=WDX,DY=WDY X XY G LEC
 
 
26 G:NOMGC="zzzzzz" RES S COLC=($X-9)\(LCHP+1),DXC=((ESPC+1)*COLC)+10,%DX=DXC,%DY=$Y
 S ODP=DP,ONOMG=NOMG,NOMG=NOMGC,ONOMGC=NOMGC,NOMGC="zzzzzz",^[QUW]OCGRIL(NOMG)=DP D ^%ABGTPAR S DP=ODP,PSEP=0 D ^%ABAFGRI,^%ABEMPGR S DX=0,DY=10 D BLK^%VVIDEO,BLD^%VVIDEO X XY W $$^%QZCHW("Comment.") D NORM^%VVIDEO S DX=DXC,DY=4 X XY G LEC
 
 
RES S DX=0,DY=10 X XY W "        " S NOMG=ONOMG,NOMGC=ONOMGC D ^%ABGTPAR S DP=ODP D ^%ABAFGRI,^%ABEMPGR S DX=%DX,DY=%DY X XY G LEC
 
 
SSMEN D POCLEPA^%VVIDEO W $$L8^%QSLIB1
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP'=1)&((REP'=5)&((REP'=61)&((REP'=43)&((REP'=45)&((REP'=21)&(REP'=21)))))) SSMEN G @("SS"_REP)
SS61 G SS43
SS5 S AW=$$^%QZCHW("partie ")_$S(AW["b":$$^%QZCHW("haute"),1:$$^%QZCHW("basse")),%V=$S(%V="P":"R",1:"P") G SSMEN
SS43 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=$S($D(^NEXSAIS($I,NOMG,%V,%D+%D1)):%D+%D1,1:%D),%DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ^%ABAFSSP K %D,%D1,%D3 G SSMEN
SS45 S %D3=$S(AW["b":"%DH",1:"%DB"),%D=$S(AW["b":%DH,1:%DB),%D1=$S(AW["b":%PH,1:%PB),%D=%D-%D1 S:%D<0 %D=0 S %DY=$S(AW["b":4,1:PSEP+1),@%D3=%D D ^%ABAFSSP K %D,%D1,%D3 G SSMEN
SS21 D POCLEPA^%VVIDEO,^%ABAFUNI,SSMEN^%ABMOCUN,^%ABAFGRI,^%ABEMPGR G SSMEN
SS1 I %LL="SAISIE" D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S C="",DX=DXC,DY=%PY X XY Q
 Q
 
 
 
 
SAISIE 
 S YG=$C(X1),(DX,PCX,PCXX)=$X,(DY,PCY,PCYY)=$Y X XY W YG
 D BEG^%VLEC
 S C=Y1,(PCX,DX)=PCXX,(PCY,DY)=PCYY X XY
 Q
 
 
 
 
 
H S DDX=0,WQ=$O(^DERSAIS($I,NOMG,%V,-(%D),-(%PYY)))
 I WQ="" D PAPR G FINFL
 S DDY=-(%PYY+WQ) G FINFL
 
B S DDX=0,WQ=$O(^NEXSAIS($I,NOMG,%V,%D,%PYY))
 I WQ="" D PASU G FINFL
 S DDY=WQ-%PYY G FINFL
 
D S DDY=0,DDX=MPASX G FINFL
 
G S DDY=0,DDX=-(MPASX) G FINFL
 
FINFL S NX=DX+DDX,NY=DY+DDY
 I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D ^%VSQUEAK G LEC
 S DX=NX,DY=NY D CLEPOS K NX,NY
 G LEC
CLEPOS X XY S %PYY=DY,%PXX=DX Q
 
HEURE D ^%QMDAK0 S ADLX=$X,ADLY=$Y,DX=35,DY=23 X XY W "* ",HEURE," *" S DX=ADLX,DY=ADLY X XY Q
 
 
PAPR I %D=0 G PARPS
 S %D=%D-1,@%D3=%D D ^%ABAFSSP S WQ=$O(^NEXSAIS($I,NOMG,%V,%D,"")),DDY=WQ,DY=0,DX=%PXX,DDX=0 Q
PARPS I %V="P" S WQ=100,DDY=-(%PYY-WQ) Q
 I $P(%RH,".",2)=0 S WQ=-($O(^DERSAIS($I,NOMG,"P",-(%DH),""))),DY=0,DDY=WQ Q
 S %V="P",(%D,%DH)=-($O(^DERSAIS($I,NOMG,%V,""))),%D3="%DH",%D1=%PH D ^%ABAFSSP S WQ=-($O(^DERSAIS($I,NOMG,%V,-(%D),""))),DDY=WQ,DY=0,DX=%PXX,DDX=0 Q
PASU S %D4=$O(^NEXSAIS($I,NOMG,%V,%D)) I %D4="" G PASUS
 S %D=%D+1,@%D3=%D D ^%ABAFSSP S WQ=-($O(^DERSAIS($I,NOMG,%V,-(%D),""))),DDY=WQ,DX=%PXX,DY=0,DDX=0 Q
PASUS I %V="R" S WQ=100,DDY=%PYY-WQ Q
 I $P(%RB,".",1)=0 S WQ=$O(^NEXSAIS($I,NOMG,"R",%DB,"")),DY=0,DDY=WQ Q
 S %V="R",%DB=$O(^NEXSAIS($I,NOMG,%V,"")),%D=%DB,%D3="%DB",%D1=%PB D ^%ABAFSSP S WQ=$O(^NEXSAIS($I,NOMG,%V,%D,"")),DDY=WQ,DX=%PXX,DY=0,DDX=0 Q

