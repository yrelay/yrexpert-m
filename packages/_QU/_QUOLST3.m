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

;%QUOLST3^INT^1^59547,73886^0
QUOLST3 ;
 
 
 
 
 
 
DEL 
 I '($D(@A@(LC))) D ^%VSQUEAK Q
 I $D(@IN@("UCSU")) D @@IN@("UCSU") I OK=0 Q
 F I=LC+1:1 Q:'($D(@A@(I)))  S @A@(I-1)=@A@(I)
 S I=$ZP(@A@("")) K @A@(I)
 I '($D(@A)) S LC=1 D PAG^%QUOLST2(LD) Q
 I (LC=LD)&(I=LC) D PM^%QUOLST,PAG^%QUOLST2(LD) Q
 I I=LC S LC=LC-1,YC=YC-1
 D PAG^%QUOLST2(LC) Q
 
ADD 
 N CC
 F I=$ZP(@A@("")):-1:LC S @A@(I+1)=@A@(I)
 S DX=@IN@("X")+1,DY=YC X XY W $J("",@IN@("L")-2)
 D PAG^%QUOLST2(LC+1)
 S CC=1
A0 S DX=(@IN@("X")+1)+@IN@("LI",CC,"X"),DY=YC X XY
 S V=$J("",(@IN@("L")-2)-@IN@("LI",CC,"X")) W V X XY
 S (SX,DX)=$X,(SY,DY)=$Y D ^%VLEC G:CTRLA AS
COMA 
 S REAF=0
 D @@IN@("LI",CC,"U")
 I REAF=1 D PAG^%QUOLST2(LD)
 G:'(OK) A0
 S $P(@A@(LC),"^",CC)=Y1
 S DX=SX,DY=SY X XY W V X XY W Y1
 S CC=CC+1
 
 I '($D(@IN@("LI",CC))) G VALID
 G A0
AS D DEL Q
 
VALID 
 I '($D(@IN@("UCAJ"))) Q
 D @@IN@("UCAJ")
 
 I OK=0 G AS
 Q
 
ADDP(X1) 
 N CC,YG,PCX,PCY
 S @A@(LC)=X1
 S DX=@IN@("X")+2,DY=YC X XY W X1 X XY
 S SX=$X,SY=$Y
 S YG=X1,PCX=DX,PCY=YC X XY W YG
 D BEG^%VLEC G:CTRLA!(Y1="") AS
 S CC=1
 G COMA
 
MOD 
 N CTRLA,CTR,PCX,PCY,YG,SLD,TAB
 
 S CTRLA=0,SLD=LD
 S YG=$P(@A@(LC),"^",COL)
 S TAB("DX")=@IN@("X")+2,TAB("DY")=(@IN@("Y")+@IN@("H"))-1,TAB("MSG")="Modification"
 S TAB("PCX")=(@IN@("X")+1)+@IN@("LI",COL,"X"),TAB("PCY")=YC
 S TAB("%LGX")=TAB("PCX")-2,TAB("%LDX")=TAB("%LGX")+$S(COL=NC:@IN@("L"),1:@IN@("LI",COL+1,"X")-@IN@("LI",COL,"X"))
 I '(DTM) O 0:(RM:1)
 S Y1=""
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 I (Y1="")!(CTR="A") G MOF
MUC 
 S REAF=0
 D @@IN@("LI",COL,"U")
 I OK=0 G MOF
 
 I $D(@IN@("UCMO")) D @@IN@("UCMO")
 I OK=0 G MOF
 
 S $P(@A@(LC),"^",COL)=Y1
 
 
 
MOF 
 S LD=SLD
 I REAF=1 D AFF^%QUOLST2 Q
 S DX=(@IN@("X")+1)+@IN@("LI",COL,"X"),DY=YC X XY
 S V=$J("",$S($D(@IN@("LI",COL+1,"X")):@IN@("LI",COL+1,"X")-1,1:@IN@("L")-2)-@IN@("LI",COL,"X")) W V X XY
 W $P(@A@(LC),"^",COL)
 Q
 
MODD 
 N YG,PCX,PCY,CTRLA,SLD
 S SLD=LD
 S YG=$C(X1),PCX=DX,PCY=YC X XY W YG
 D BEG^%VLEC I CTRLA!(Y1="") S REAF=0 G MOF
 G MUC
 
 
TEST 
 N GL,LIS
 S GL("X")=0,GL("Y")=3,GL("L")=79,GL("H")=8,GL("TI")="Attributs affiches"
 S GL("LI",1,"T")="nom",GL("LI",1,"X")=1,GL("LI",1,"U")="OK^%QUOLST3"
 S GL("LI",2,"T")="adresse",GL("LI",2,"X")=20,GL("LI",2,"U")="OK^%QUOLST3"
 S GL("LI",3,"T")="code",GL("LI",3,"X")=45,GL("LI",3,"U")="OK^%QUOLST3"
 S GL("LI",4,"T")="ville",GL("LI",4,"X")=52,GL("LI",4,"U")="OK^%QUOLST3"
 S GL("LI",5,"T")="test",GL("LI",5,"X")=85,GL("LI",5,"U")="OK^%QUOLST3"
 S GL("LI",4,"SUP")=1
 S GL("A")="LIS"
 S GL("CHI",1)="",GL("CHI",3)=""
 S LIS(1)="DUPONT^chemin des halles^69000^LYON"
 S LIS(2)="TOTO^rue Edouard Herriot^38003^GRENOBLE"
 S LIS(3)="ROSSIGNOL^rue des lilas^38000^GRENOBLE"
 S LIS(4)="MARTINEZ^avenue Jean Jaures^38240^MEYLAN"
 D CLEPAG^%VVIDEO,^%QUOLST("GL")
 Q
OK S OK=1 Q

