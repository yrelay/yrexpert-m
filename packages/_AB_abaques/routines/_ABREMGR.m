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

;%ABREMGR^INT^1^59547,73864^0
%ABREMGR ;
 
 S STOP=0,PDX=DX
AJ S %DUP=0,NXI=9,NXS=9+((ESPC+1)*NBC),NYI=3,NYS=22,MPASX=ESPC+1,MPASY=1
AJB 
 X XY D ^%ABCURT G:X1=1 FIN G:X1=7 DEL G PRPOS:X1=6,DUP:X1=4,JEU:X1=16,PAGE:X1=12,RET:X1=18,LIST:X1=10 S PX=DX,PY=DY D ^%ABOCGRI G:REFUSE=1 AJB G PRPOS
 
 
FIN Q
PRPOS I C="" S PX=$X,PY=$Y,%PY=PY,PY=$S(PY<PSEP:%DH,1:%DB)+PY,%V=$S(%PY<PSEP:"P",1:"R")
NEXDY I %PY>PSEP S NDY=$O(^NEXSAIS($I,NOMG,"R",%DB,%PY)) G:NDY="" NEXCOL S L=$L(^[QU]STRUCT(NOMG,2,%V,NDY+%DB)) S:L>9 %PY=%PY+1 G:L>9 NEXDY S DY=NDY X XY G AJB
 S PPY=$O(^NEXSAIS($I,NOMG,"P",%DH,%PY)) I PPY'="" S DY=PPY G AJB
 S NDH=$O(^NEXSAIS($I,NOMG,"P",%DH)) I NDH="" G BAPA
 S %DH=(%DH+%PH)-2,%D=%DH,%D1=%PH,%D3="%DH",%V="P" D ^%ABAFSSP S DY=$O(^NEXSAIS($I,NOMG,%V,%D,5)),DX=PX G AJB
BAPA I %DB=0 S DY=$O(^NEXSAIS($I,NOMG,"R",%DB,"")) G AJB
 S %DB=0,%D=0,%V="R",%D1=%PB,%D3="%DB" D ^%ABAFSSP S DY=$O(^NEXSAIS($I,NOMG,"R",0,"")),DX=PX G AJB
 Q
NEXCOL S NDB=$O(^NEXSAIS($I,NOMG,"R",%DB)) I NDB'="" G BAPAS
 S CCOL=($X-9)\(ESPC+1) G:CCOL'<(NBC-1) PB I %DH'=0 S (%DH,%D)=0,%V="P",%D1=%PH,%D3="%DH" D ^%ABAFSSP
 S %V="P",DX=((CCOL+1)*(ESPC+1))+10,DY=$O(^NEXSAIS($I,NOMG,%V,0,"")) X XY G AJB
BAPAS S %DB=(%DB+%PB)-2,%D=%DB,%D1=%PB,%D3="%DB",%V="R" D ^%ABAFSSP S DY=$O(^NEXSAIS($I,NOMG,"R",%D,PSEP+2)),DX=PX G:DY="" NEXCOL G AJB
JEU S CCOL=($X-9)\(ESPC+1),DXC=((ESPC+1)*CCOL)+10,DYC=$Y R *TYP D TOUCHE^%INCCLAV(TYP,.TYP) G:(TYP'=21)&(TYP'=16) AJB
 G:TYP=16 PLUCOL
JEUQ K ^COLDUP($I) S DX=DXC X XY
 F %VV="P","R" S DYC=-1 F WW=0:0 S DYC=$N(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,DYC)) Q:DYC=-1  I $D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,DYC,DXC)) S ^COLDUP($I,%VV,DYC)=^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,DYC,DXC)
 X XY G AJB
DUP S CCOL=($X-9)\(ESPC+1),DXC=((ESPC+1)*CCOL)+10,DX=DXC,DYC=$Y R *TYP D TOUCHE^%INCCLAV(TYP,.TYP) G:(TYP'=21)&(TYP'=16) AJB
 G:TYP=16 DEPCOL
 D ^%ABPOSCO G AJB
DEL S COLC=($X-9)\(ESPC+1),PX=((ESPC+1)*COLC)+10,%PY=$Y D ^%ABPAR S PY=%PY+%D G AJB:'($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,PX))) S LC=$L(^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,PX)),CD="" F UU=1:1:LC S CD=CD_" "
 W CD K ^[QUW]OCGRIL(NOMG,%NORM,DP,%V,PY,PX) S DX=PX,DY=%PY X XY G AJB
PAGE S ADR=$S(%DUP=1:"PLUMOV",1:"AJB") D READ^%ABGRPAG G @PGQ
ABPAG D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D PGE^%ABGRPAG,AFFICH^%ABGRPAG S DX=10,DY=$O(^NEXSAIS($I,NOMG,$S(NOMG["/COMMENT":"R",1:"P"),%DH,"")) X XY G @ADR
PGNUM S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) PAGE S PGE=Y1 D:(%DH'=0)!(%DB'=0) END^%ABGTPAR D DP^%ABGRPAG,^%ABAFGRI,^%ABEMPGR G PAGE
43 D:(%DH'=0)!(%DB'=0) END^%ABGTPAR D MORE^%ABCALDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG G PAGE
45 G:DP=^[QUW]OCGRIL(NOMG) PAGE D:(%DH'=0)!(%DB'=0) END^%ABGTPAR D LESS^%ABCALDP,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG G PAGE
PLUCOL K ^PLUCOL($I) S %DUP=1,^PLUCOL($I)=DP_"/"_DXC D POCLEPA^%VVIDEO,REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Saisie de plusieurs colonnes pour duplication") D NORM^%VVIDEO S DX=DXC,DY=DYC X XY
PLUMOV D ^%ABMOCUR
 G:X1=12 PAGE
 I X1'=16 S DXC=$X,DYC=$Y D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Saisie avortee !! [RETURN]") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^%ABGRPAG S DX=DXC,DY=DYC X XY S %DUP=0 K ^PLUCOL($I) G AJB
 S CCOL=($X-9)\(ESPC+1),DYC=$Y,DXC=((ESPC+1)*CCOL)+10,DX=DXC,^PLUCOL($I)=^PLUCOL($I)_"^"_DP_"/"_DXC_"^"_NOMG_"^"_%NORM_"^"_%IDENT_"^"_$S(QUW=^TABIDENT($I,"%UCI"):"(C)",1:"(P)")
 S %DUP=0 D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^%ABGRPAG S DX=DXC,DY=DYC X XY
 G AJB
DEPCOL I '($D(^PLUCOL($I))) S ODX=DX,ODY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune colonne a dupliquer n'est connue ! [RETURN] ") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=ODX,DY=ODY X XY G AJB
 D ^%ABDEPCO S DX=DXC,DY=DYC X XY G AJB
PB D MORE^%ABCALDP,END^%ABGTPAR,^%ABAFGRI,^%ABEMPGR,PGE^%ABGRPAG,AFFICH^%ABGRPAG S DX=10,DY=$O(^NEXSAIS($I,NOMG,"P",0,"")) X XY G AJB
RET S DX=$X,DY=$Y X XY G AJB
LIST S GRS=^PILABAC($J)+1,^PILABAC($J,GRS)=NOMG_"^"_%NORM_"^"_%IDENT_"^"_$S(QUW=^TABIDENT($I,"%UCI"):"(C)",1:"(P)"),^PILABAC($J)=GRS
 S TIT=$$^%QZCHW("Abaques deja connus"),PROGTRA="PIL^%ABREMGR" D ^%ABPRESA G FIN
PIL S %IP=-1,GRS=^PILABAC($J) F %I1=1:1 S %IP=$N(^TACOMPIL($I,%IP)) Q:%IP=-1  S %IL=-1 F %I2=1:1 S %IL=$N(^TACOMPIL($I,%IP,%IL)) Q:%IL=-1  S GRS=GRS+1,^PILABAC($J,GRS)=^TACOMPIL($I,%IP,%IL)
 S ^PILABAC($J)=GRS K %IP,%I1,%LI,GRS Q

