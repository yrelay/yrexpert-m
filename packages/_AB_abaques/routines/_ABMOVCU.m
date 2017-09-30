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

;%ABMOVCU^INT^1^59547,73864^0
%ABMOVCU ;;05:05 PM  10 Feb 1992
 O 0 U 0,0 S:'($D(IOM)) IOM=80 U 0
 
LOOP1 S %PYY=$Y,%PXX=$X,%V=$S(%PYY<PSEP:"P",1:"R"),%D=$S(%V="P":%DH,1:%DB),%D1=$S(%V="P":%PH,1:%PB),%D3=$S(%V="P":"%DH",1:"%DB") I '($D(ATT)) S ATT=30
LOOP 
 R *X1:2000
 ;;DTM
 G:$$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) FLEC
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 I (X1=-1)!(X1=11) D HEURE G LOOP
 ;;NONDTM
 
 ;;FINDTM
 I X1=27 G @X1
 E  G FIN
ECRI R *Y D ^%VZANVT G 27+1:$D(%XLEC)
 I (Y=127)!(Y=13) G @Y
 E  S DX=DX+1,C=C_$C(Y) G ECRI
127 S DX=DX-1 I DX<PX S PX=DX X XY G ECRI
 E  X XY W " " X XY S LON=$L(C)-1,C=$E(C,1,LON) G ECRI
13 Q
27 G:MODTM BELL
 R *X2
 G:X2=91 271
 R *X3 G BELL
271 R *X3
 G:(X3<48)!(X3>57) BELL
272 R *X3
 S X3=$C(X3)
 G:X3="~" BELL
 G 272
 
FLEC D @X3,TEST X XY G LOOP1
BELL D ^%VSQUEAK G LOOP
SHOW X XY W "*" Q
CLEPOS X XY S %PYY=DY,%PXX=DX Q
FIN O 0 U 0 Q
65 S DDX=0,WQ=$O(^DERSAIS($I,NOMG,%V,-(%D),-(%PYY))) G:WQ="" PAPR S:WQ="" WQ=100 S DDY=-(%PYY+WQ) Q
66 S DDX=0,WQ=$O(^NEXSAIS($I,NOMG,%V,%D,%PYY)) G:WQ="" PASU S DDY=WQ-%PYY Q
67 S DDY=0,DDX=MPASX Q
68 S DDY=0,DDX=-(MPASX) Q
TEST S NX=DX+DDX,NY=DY+DDY I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D SQUEAK Q
 S DX=NX,DY=NY D CLEPOS K NX,NY Q
SQUEAK D ^%VSQUEAK Q
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

