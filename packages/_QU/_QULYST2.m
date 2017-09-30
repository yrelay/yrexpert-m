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

;%QULYST2^INT^1^59547,73886^0
ZLISTE(XG,YH,DH,DV,LI,P1,COA,COS) 
 N HELP,MODP,CP,GDX
 S HELP="^%QULYSTH",MODP=1 G GO
ZLISTE2(XG,YH,DH,DV,LI,P1,COA,COS,HELP) N MODP,CP,GDX
 S MODP=1 G GO
ZLISTE3(XG,YH,DH,DV,LI,P1,COA,COS,MODP) N HELP,CP,GDX
 S HELP="^%QULYSTH" G GO
ZLISTE4(XG,YH,DH,DV,LI,P1,COA,COS,HELP,CP,GDX) N MODP
 S MODP=1 G GO
ZLISTE5(XG,YH,DH,DV,LI,P1,COA,COS,MODP,CP) N HELP,GDX
 S HELP="^%QULYSTH" G GO
 
 
 
 
 
 
 
 
 
 
 
 
 
GO N CARD,CTR,I,%F,LPR,NL,NPAG,OK,SP1C,PAG,P1C,TAB S P1C=P1,LPR="",NL=DV-2
 S CARD=$ZP(@LI@("")) S:CARD="" CARD=0
LL D LLP
LP S NPAG=(CARD\NL)+((CARD#NL)'=0),PAG=(P1C\NL)+((P1C#NL)'=0)
 I MODP S DX=XG+2,DY=YH X XY W " Page ",PAG,"/",NPAG," "
L0 D POCLEPA^%VVIDEO W "CTRLH aide, CTRLF sortie de la fenetre"
L00 D POS X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO
 G:%F'="" @%F F I=1,4,5,6,7,8,9,10,12,16,18,43,45,46,61,95 G:X1=I @I
 S I=$C(X1) G:(X1'<32)&(X1'>126) M D ^%VSQUEAK G L00
M W I S YG=$S($D(@LI@(P1C)):$C(X1)_$P(@LI@(P1C),2,999),1:$C(X1))
 D POS S PCX=DX,PCY=DY D BEG^%VLEC I CTRLA!(Y1="") D AFFICH S OK=0 G L00
 D POS,SAUV,@COA,CHARG
 I '(OK) S YG=Y1 D 91,AFFICH G L00
 S OK=1,@LI@(P1C)=Y1 D AFFICH G B
 
1 S AB=1 Q
 
4 I LPR="" D ^%VSQUEAK G L00
 S Y1=LPR F I=$ZP(@LI@("")):-1:P1C D RECOP(I,I+1)
 
 I $D(CP)&$D(GDX) D AJOUT^%EDCGELI
 S @LI@(P1C)=LPR D REAF(P1C,LI),POS,SAUV,@COA,CHARG
 D AFFICH I OK S CARD=CARD+1 G B
 S YG=Y1 D 91 G LP
 
5 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 S SP1C=P1C D SAUV2
B5 S Y1=@LI@(P1C) D POS X XY D SAUV,@COS,CHARG I '(OK) D ^%VSQUEAK G E5
 I (DY>YH)&(((YH+DV)-1)>DY) D EFF
 K @LI@(P1C) K:$D(CP) @CP@(P1C) S CARD=CARD-1,P1C=$O(@LI@(P1C)) G:P1C'="" B5
E5 S P1C=SP1C D REAF(P1C,LI),CHARG2 G LP
 
6 S AB=0 Q
 
7 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 D POS S OK=@LI@(P1C)="" D:@LI@(P1C)'="" SAUV,@COS,CHARG I '(OK) D ^%VSQUEAK G L0
OK7 D EFF S CARD=CARD-1
 F I=P1C+1:1 Q:'($D(@LI@(I)))  D RECOP(I,I-1)
 S I=$ZP(@LI@("")) K:I'="" @LI@(I) K:(I'="")&$D(CP) @CP@(I) D REAF(P1C,LI) G LP
 
8 D REAF(P1,"LLLLXXXX"),@HELP G 18
 
9 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 S YG=@LI@(P1C) D 91,AFFICH G:OK B G LL
91 D POS S PCX=DX,PCY=DY X XY S CTRLA=0 O 0
 S TAB("DX")=XG+2,TAB("DY")=(YH+DV)-1,TAB("MSG")=" Insertion "
 S TAB("PCX")=PCX,TAB("PCY")=PCY,TAB("%LGX")=XG+1,TAB("%LDX")=(XG+DH)-2
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 I ((CTR="A")!(CTR="F"))!(Y1="") S OK=0 D EFF X XY D LLP Q
 D LLP,POS,SAUV,@COA,CHARG I '(OK) S YG=Y1 G 91
 S @LI@(P1C)=Y1 Q
 
10 D ^%VPRINT(LI) G L0
 
12 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 F I=$ZP(@LI@("")):-1:P1C D RECOP(I,I+1)
 
 I $D(CP)&$D(GDX) D AJOUT^%EDCGELI
 K @LI@(P1C) D EFF,REAF(P1C+1,LI),POS,^%VLEC
 S @LI@(P1C)=Y1 G:CTRLA!(Y1="") 7
 D POS,SAUV,@COA,CHARG I OK S CARD=CARD+1 G B
 S YG=Y1 D 91 I OK S CARD=CARD+1 G B
 G 7
 
16 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 S LPR=@LI@(P1C) D POCLEPA^%VVIDEO W "--> ",LPR H 1 D POCLEPA^%VVIDEO G L00
 
18 D REAF(P1,LI) G L0
43 G 61
61 I '($D(@LI@(P1+((DV-2)\2)))) D ^%VSQUEAK G L0
 S P1C=(P1+((DV-2)\2))-1 G BSS
45 G 95
46 I '(MODP) D ^%VSQUEAK G L00
 G 80
95 I '($D(@LI@(P1-((DV-2)/2)))) D ^%VSQUEAK G L0
 S P1C=(P1-((DV-2)\2))+1 G HSS
80 
 D POCLEPA^%VVIDEO W "Page : " S DX=$X,DY=$Y D ^%VLEC,POCLEPA^%VVIDEO
 I CTRLA!(Y1="") G L00
 I Y1'?1N.N D ^%VSQUEAK G 80
 I Y1>NPAG D ^%VSQUEAK G 80
 S PAG=Y1,(P1C,P1)=((PAG-1)*NL)+1 D REAF(P1,LI) G LP
H I '($D(@LI@(P1C-1))) D ^%VSQUEAK G L00
 I P1C'=P1 S P1C=P1C-1 G L00
HSS S P1=P1-((DV-2)\2) S:P1<0 P1=1 S P1C=P1C-1 D REAF(P1,LI) G LP
B G:P1C=$ZP(@LI@("")) BS I '($D(@LI@(P1C+1))) D ^%VSQUEAK G L00
BS I P1C'=((P1+DV)-3) S P1C=P1C+1 G L00
BSS S P1=P1+((DV-2)\2) S:P1>$ZP(@LI@("")) P1=$ZP(@LI@("")) S P1C=P1C+1
 D REAF(P1,LI) G LL
G G L00
D G L00
 
AFFICH D EFF X XY W:$D(@LI@(P1C)) @LI@(P1C) Q
EFF D POS X XY W $J("",DH-4) Q
POS S DX=XG+2,DY=((YH+P1C)-P1)+1 Q
REAFF(I,L,XG,YH,DH,DV) N NL,P1 S NL=DV-2,P1=I G RG
REAF(I,L) 
RG D CUROF^%VVIDEO
 S I=I-1 F DY=((YH+I)-P1)+2:1:(YH+DV)-2 S DX=XG+1 X XY W $J("",DH-2) S I=I+1 I $D(@L@(I)) D NO S DX=XG+2 X XY W $E(@L@(I),1,DH-4)
 D CURON^%VVIDEO Q
NO I (I#NL)=1 S DX=XG+1 D BLK^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO X XY W ((I\NL)+1)#10 D NORM^%VVIDEO
 Q
DEL(A) 
 K @LI@(P1C,A) Q
VAL(A) 
 Q:'($D(@LI@(P1C,A))) "" N %V S %V=@LI@(P1C,A) Q %V
AFF(A,V) 
 S @LI@(P1C,A)=V Q
RECOP(S,D) 
 N I,%I S @LI@(D)=@LI@(S)
 I $D(CP) S:$D(@CP@(S)) @CP@(D)=@CP@(S)
 S I=-1 F %I=0:0 S I=$N(@LI@(S,I)) Q:I=-1  S @LI@(D,I)=@LI@(S,I)
 
 Q
TEST S XX=1 D CLEPAG^%VVIDEO S DXG=0,DYH=0,LH=80,LV=23,BLD=0 D CARS^%VVIDEO
 D ZLISTE(0,0,80,23,"LISTE",.XX,"ADD","ADD") Q
ADD S OK=1 Q
LLP S DX=XG+2,DY=(YH+DV)-1 X XY W " (+),(-)",$S(MODP:",(.)Page",1:"")," " Q
SAUV S SP1C=P1C,SP1=P1,SXG=XG,SXY=XY,SLI=LI Q
CHARG S P1C=SP1C,P1=SP1,XG=SXG,XY=SXY,LI=SLI Q
SAUV2 S SP2C=P1C,SP2=P1,SXG2=XG,SXY2=XY,SLI2=LI Q
CHARG2 S P1C=SP2C,P1=SP2,XG=SXG2,XY=SXY2,LI=SLI2 Q

