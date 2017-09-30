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

;%ACHIAFF^INT^1^59547,73864^0
ACHIAFF ;
 
 
 
 
 
 
AFF(SECT,STO,LC,HC) 
 N NBL,NBH,LG,HH,IX,IY,LH,LV,DXG,DYH
 S NBL=79\(LC-1),LG=(LC-1)*NBL
 S NBH=20\(HC-1),HH=(HC-1)*NBH
 S LH=LG+1,LV=HH+1,DXG=79-LH,DYH=1,IX=LC-2,IY=HC-2
 S @STO@("POS","LC")=LC
 S @STO@("POS","HC")=HC
 S @STO@("POS","DXG")=DXG+1
 S @STO@("POS","DYH")=DYH+1
 S @STO@("POS","DERX")=((DXG+1)+LH)-LC
 S @STO@("POS","DERY")=((DYH+1)+LV)-HC
 D TIT,DAMIER^%VVIDEO
 Q
 
TIT 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition de")_" "_SECT,0)
 Q
 
 
AFFM(SECT,STO,LC,HC,IMP,ATR,COR,NBR) 
 N %I,%J,Y,X,A,B,C,D,P,TEMP
 S TEMP=$$CONCAS^%QZCHAD(STO,"PLAN")
 I IMP,'($$INIT^%ACHIIMP) D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les parametres de l'imprimante, veuillez revoir la configuration utilisateur")) Q
 I '(IMP),ATR'=0 D TIT
 
 S Y="" F %I=0:0 S Y=$O(@TEMP@(Y)) Q:Y=""  S X="" F %J=0:0 S X=$O(@TEMP@(Y,X)) Q:X=""  D AFXY
 D G0OFF^%VVIDEO
 
 D AFFC(STO,LC,ATR,IMP,NBR)
 
 I COR=1 D COROUV^%ACHIDE3(STO,LC,HC)
 
 D AFOUV(STO,IMP)
 I IMP S %FONC="CLEAR" D ^%PBPZ S %FONC="PRINTER" D ^%PBPZ C %PORT D ^%VSQUEAK
 Q
 
AFXY S P=@TEMP@(Y,X)
 S A=$P(P,"^",1),B=$P(P,"^",2),C=$P(P,"^",3),D=$P(P,"^",4)
 I A=B G AB
 I B=C G BC
 I A=D G AD
 I C=D D ECR("v",1,0) Q
 
 D ECR("n",1,1)
 
 Q
AB I (C=D)&(A=D) D ECR("",0,0) Q
 I B=C D ECR("k",0,1) Q
 I B=D D ECR("l",1,1) Q
 I C=D D ECR("q",1,0) Q
 
 D ECR("w",1,1)
 Q
BC I C=D D ECR("j",0,0) Q
 I A=D D ECR("x",0,1) Q
 
 D ECR("u",0,1)
 Q
AD I A=C D ECR("m",1,0) Q
 I B'=C D ECR("t",1,1)
 Q
 
ECR(CSP,TH,TV) 
 D G0ON^%VVIDEO
 I IMP D AFF^%ACHIIMP(C,CSP,X,Y) Q
 S DX=X,DY=Y X XY W $$CARSPE^%VVIDEO(CSP)
 I TH=1 S DYH=Y,DXG=DX+1,LH=LC-2 D TRH^%VVIDEO
 I TV=1 S DYH=Y+1,DXG=X,LV=HC-2 D TRV^%VVIDEO
 
 S @TEMP@(Y,X)=$P(@TEMP@(Y,X),"^",1,4)_"^"_$S(TH=1:"H",1:"")_"^"_$S(TV=1:"V",1:"")
 
 I (CSP="q")!(CSP="x") S @TEMP@(Y,X,"INVI")=$S(CSP="q":"H",1:"V")
 
 I C="" Q
 I '($D(@STO@("SEL",C*1))) Q
 N Y1,L,YF
 S Y1=$S(TH=0:Y,1:Y+1),DX=$S(TV=0:X,1:X+1),L=LC-$S(DX=X:1,1:2)
 I CSP="j" S DY=Y1,DX=X+1 X XY D REV^%VVIDEO X XY W $J("",LC-2) S DX=X,Y1=Y+1
 S YF=(Y1+HC)-$S(Y1=Y:2,1:3)
 F DY=Y1:1:YF X XY D REV^%VVIDEO X XY W $J("",L)
 D NORM^%VVIDEO
 Q
 
 
AFFC(STO,LC,ATR,IMP,NBR) 
 N %A,%I,%J,%K,A,TEMP
 S TEMP=$$CONCAS^%QZCHAD(STO,"PLNUM")
 S A=""
 F %I=0:0 S A=$O(@TEMP@(A)) Q:A=""  S DY="" F %J=0:0 S DY=$O(@TEMP@(A,DY)) Q:DY=""  S DX="" F %K=0:0 S DX=$O(@TEMP@(A,DY,DX)) Q:DX=""  D:'(IMP) NUM D:IMP ATT^%ACHIIMP(A,ATR,DX,DY,NBR)
 Q:IMP=1
 S DX=0,DY=0 X XY D REV^%VVIDEO X XY W $J("",(56-$L(SECT))\2)
 I (ATR'="")&(ATR'=0) S DX=1 X XY W "(",ATR,")"
 I @STO@("DISTANCE")=0 S DX=63 X XY D REV^%VVIDEO X XY W "Distances fausses"
 S DY=1,DX=0 X XY D NORM^%VVIDEO Q
 
NUM I $D(@STO@("SEL",A*1)) X XY D REV^%VVIDEO
 I ATR="" X XY W $TR($J("",NBR-$L(A))," ",0)_A G FN
 
 X XY W $J("",LC-2)
 I ATR=0 G FN
 
 X XY
 I $D(@STO@("CAR",A,ATR)) W $E(@STO@("CAR",A,ATR),1,NBR) G FN
 W $E($$^%QSCALIN(REPFI,SECT_","_$S($D(@STO@("CAR",A,"NOM")):@STO@("CAR",A,"NOM"),1:A),$P(ATR," (",1),$P($P(ATR,"(",2),")",1)),1,NBR)
 
FN D NORM^%VVIDEO Q
 
 
AFOUV(STO,IMP) 
 I IMP D OUV^%ACHIIMP(STO,IMP) Q
 N %I,TEMP
 S TEMP=$$CONCAS^%QZCHAD(STO,"OUV")
 S DY="" F %I=0:0 S DY=$O(@TEMP@(DY)) Q:DY=""  S DX="" F %I=0:0 S DX=$O(@TEMP@(DY,DX)) Q:DX=""  X XY D REV^%VVIDEO X XY W " " D NORM^%VVIDEO
 Q
 
 
SAUV(TEMP,STO) 
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde du plan"))
 N %I,%J,Y,X,A,B,C,D
 
 S @STO@("DISTANCE")=0,@STO@("MAJ")=0
 K @STO@("PLAN"),@STO@("PLNUM"),@STO@("COOR")
 S Y=@STO@("POS","DYH")-1
Y0 I Y>20 G DERY
 D TRX
Y1 S Y=(Y+HC)-1
 G Y0
DERY 
 S Y=($ZP(@TEMP@("POS",""))+HC)-1
 D TRX
 Q
 
TRX S X=@STO@("POS","DXG")-1
X0 I X>79 G DERX
 I '($D(@TEMP@("POS",Y,X))) S @TEMP@("POS",Y,X)=""
 D STO
X1 S X=(X+LC)-1
 G X0
DERX 
 S X=($ZP(@TEMP@("POS",Y,""))+LC)-1
 S @TEMP@("POS",Y,X)=""
 D STO Q
 
STO S A=$S($D(@TEMP@("POS",(Y-HC)+1,(X-LC)+1)):@TEMP@("POS",(Y-HC)+1,(X-LC)+1),1:"")
 S B=$S($D(@TEMP@("POS",(Y-HC)+1,X)):@TEMP@("POS",(Y-HC)+1,X),1:"")
 S D=$S($D(@TEMP@("POS",Y,(X-LC)+1)):@TEMP@("POS",Y,(X-LC)+1),1:"")
 S C=@TEMP@("POS",Y,X)
 
 I C'="" S @STO@("COOR",C*1,Y,X)=""
 
 I (((A=B)&(B=C))&(C=D))&(A="") Q
 S @STO@("PLAN",Y,X)=A_"^"_B_"^"_C_"^"_D
 
 Q:C=""
 I B=C Q
 I C=D Q
 I A=B G SAB
 I A=D G:A'=C N Q
 G N
SAB I B=D G N
 I A'=D G N
 Q
N S @STO@("PLNUM",C*1,Y+1,X+1)=""
 Q

