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

;%ABREMUN^INT^1^59547,73864^0
%ABREMUN ;
 
 S STOP=0,PDX=DX
AJ S %DUP=0,NXI=9,NXS=9+ESPC,NYI=3,NYS=22,MPASX=0,MPASY=1
AJB X XY D ^%ABMOCUN G:X1=1 FIN G:X1=7 DEL G:X1=6 PRPOS D OCUNIT G PRPOS
FIN Q
PRPOS I C="" S PX=$X,PY=$Y,%PY=PY,PY=$S(PY<PSEP:%DH,1:%DB)+PY,%V=$S(%PY<PSEP:"P",1:"R")
NEXDY I %PY>PSEP S NDY=$O(^NEXSAIS($I,NOMG,"R",%DB,%PY)) G:NDY="" NEXCOL S L=$L(^[QU]STRUCT(NOMG,2,%V,NDY+%DB)) S:L>9 %PY=%PY+1 G:L>9 NEXDY S DY=NDY X XY G AJB
 S PPY=$O(^NEXSAIS($I,NOMG,"P",%DH,%PY)) I PPY'="" S DY=PPY G AJB
 S NDH=$O(^NEXSAIS($I,NOMG,"P",%DH)) I NDH="" G BAPA
 S %DH=(%DH+%PH)-2,%D=%DH,%D1=%PH,%D3="%DH",%V="P" D ^%ABAFSSU S DY=$O(^NEXSAIS($I,NOMG,%V,%D,5)),DX=PX G AJB
BAPA I %DB=0 S DY=$O(^NEXSAIS($I,NOMG,"R",%DB,"")) G AJB
 S %DB=0,%D=0,%V="R",%D1=%PB,%D3="%DB" D ^%ABAFSSU S DY=$O(^NEXSAIS($I,NOMG,"R",0,"")),DX=PX G AJB
 Q
NEXCOL S NDB=$O(^NEXSAIS($I,NOMG,"R",%DB)) I NDB'="" G BAPAS
 S (%DH,%D)=0,%V="P",%D1=%PH,%D3="%DH" D ^%ABAFSSU
 S DX=10,DY=$O(^NEXSAIS($I,NOMG,%V,0,"")) X XY G AJB
BAPAS S %DB=(%DB+%PB)-2,%D=%DB,%D1=%PB,%D3="%DB",%V="R" D ^%ABAFSSU S DY=$O(^NEXSAIS($I,NOMG,"R",%D,PSEP+2)),DX=PX G:DY="" NEXCOL G AJB
DEL S COLC=($X-9)\(ESPC+1),PX=((ESPC+1)*COLC)+10,%PY=$Y D ^%ABPAR S PY=%PY+%D G AJB:'($D(^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%V,PY))) S LC=$L(^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%V,PY)),CD="" F UU=1:1:LC S CD=CD_" "
 W CD K ^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%V,PY) S DX=PX,DY=%PY X XY G AJB
OCUNIT S PY=$Y,%PY=PY,PY=$S(PY<PSEP:%DH,1:%DB)+PY,%V=$S(%PY<PSEP:"P",1:"R"),DX=10 X XY W CNULI X XY W C S ^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%V,PY)=C Q

