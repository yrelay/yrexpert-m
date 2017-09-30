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

;%QUSAIS2^INT^1^59547,73886^0
QUSAIS2(TABLE,XG,YH,LA,HA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N MOD,ROU
 S MOD=1,ROU=""
DEB N A,%A,C,D,%D,DEP,%F,I,L,L1,LC,LDEP,LFIN,M,NBPAGE,PAGE,SAUT,T,X1,XC,YC,Z,REP,REP1,NUM,%W,%WW,RES
 S:'($D(^ATT($J))) ^ATT($J)=0 S (Z,^ATT($J))=^ATT($J)+1
 D INIT,REAFF
 
L0 D POCLEPA^%VVIDEO
 S M=$S(NBPAGE=0:"",1:^VAL($J,Z,LC)),DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-2) S DX=((XG+(LA\2))-($L(M)\2))-1 D REV^%VVIDEO,BLD^%VVIDEO X XY W M D NORM^%VVIDEO
 S PCX=XC,PCY=YC,YG="" D GET^%VLECFL2(YG,PCX,PCY,PCX,78,.CTR,.Y1) S XC=PCX,YC=PCY
 G ET:$E(CTR)="*",1:CTR="A",6:CTR="F",P:CTR="P",R:CTR="R",FL0:(Y1="")&(CTR'="F") I $E(Y1,1)="!" G MULT:MOD=1
 I ROU'="" S Y2=$S($$ADR^%QZNBN1(Y1):Y1,1:""""_$$ZSUBST^%QZCHSUB(Y1,"""","""""")_""""),RES="$$"_$S(ROU'["(":ROU_"("_Y2_")",1:$P(ROU,")")_","_Y2_")"),@("RES="_RES) I RES=0 G L0
 S NUM="" F N=1:1 S NUM=$O(@TABLE@(NUM)) Q:NUM=""  Q:$O(@TABLE@(NUM,""))=^ATT($J,Z,LC)
 S ^VAL($J,Z,LC)=Y1,@TABLE@(NUM,^ATT($J,Z,LC))=Y1
FL0 S DX=XC,DY=YC X XY W $J("",(LA\2)-2) X XY W ^VAL($J,Z,LC) G B
 
R 
 D INIT,REAFF G L0
MULT 
 S:$P(^ATT($J,Z,LC),")",1)["(" ^ATT($J,Z,LC)=$P(^ATT($J,Z,LC),"(",1)
 S Y1=""
M2 S NUM="",STOP=0,AT="" F %WW=1:1 Q:STOP  S NUM=$O(@TABLE@(NUM)) Q:NUM=""  F %W=1:1 S AT=$O(@TABLE@(NUM,AT)) Q:AT=""  S STOP=$S(AT=^ATT($J,Z,LC):1,$P(AT,"(",1)=^ATT($J,Z,LC):1,1:0) Q:STOP
 S DX=0,DY=HA+YH X XY S REP=$$^%VZAME1("Indice : ") G:REP="" FL0 S REP1=$$^%VZAME1(" Valeur : "),Y1=REP_"^"_REP1_"|",^VAL($J,Z,LC)="Multivaluee"
 K @TABLE@(NUM,^ATT($J,Z,LC))
 S @TABLE@(NUM,^ATT($J,Z,LC)_"("_REP_")")=REP1,DX=0,DY=HA+YH X XY W $J(" ",79) G M2
ET S CTR=$P(CTR,"*",2),I=$S(CTR=65:"H",CTR=68:"H",CTR=66:"B",CTR=67:"B") G @I
 
H I '($D(^ATT($J,Z,LC-1))) D ^%VSQUEAK G L0
 G:LC'=LDEP HOK
 S PAGE=PAGE-1,LC=LC-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,YC=(YH+HA)-3 D PAGE G L0
HOK S LC=LC-1,YC=YC-1 G L0
 
B I '($D(^ATT($J,Z,LC+1))) D ^%VSQUEAK G L0
 G:LC'=LFIN BOK
 S PAGE=PAGE+1,LC=LC+1,LDEP=LFIN+1,LFIN=(LDEP+HA)-5,YC=YH+2 D PAGE G L0
BOK S LC=LC+1,YC=YC+1 G L0
 
P D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Page : "),NUME=0 G:Y1="" L0 G:Y1="+" PAGESUP G:Y1="-" PAGEINF G:'($$ADR^%QZNBN1(Y1)) L0
 G:Y1>NBPAGE L0 G:Y1<1 L0 G NUMPAG
 
PAGESUP 
 I '($D(^ATT($J,Z,LFIN+1))) D ^%VSQUEAK G L0
 S PAGE=$S('(NUME):PAGE+1,1:Y1),LDEP=$S('(NUME):LFIN+1,1:(LFIN+1)+((HA-4)*SAUT)),LFIN=(LDEP+HA)-5,LC=LDEP,YC=YH+2
 D PAGE S CTRLF=0 G L0
 
PAGEINF 
 I '($D(^ATT($J,Z,LDEP-1))) D ^%VSQUEAK G L0
 S PAGE=$S('(NUME):PAGE-1,1:Y1)
 S LFIN=$S('(NUME):LDEP-1,1:(LDEP-1)-((HA-4)*SAUT))
 S LDEP=(LFIN-HA)+5,LC=LFIN,YC=(YH+HA)-3
 D PAGE S CTRLF=0 G L0
 
NUMPAG 
 I (Y1'=(PAGE+1))&(Y1'=(PAGE-1)) S NUME=1,SAUT=$S(Y1>PAGE:(Y1-PAGE)-1,1:(PAGE-Y1)-1)
 G:Y1>PAGE PAGESUP G:Y1<PAGE PAGEINF S NUME=0 G L0
 
1 G FIN
6 S SUIV="",VIDE=0,NUM=""
 F %WW=1:1 S NUM=$O(@TABLE@(NUM)) Q:NUM=""  F %W=1:1 S SUIV=$O(@TABLE@(NUM,SUIV)) Q:SUIV=""  S VIDE=$S(@TABLE@(NUM,SUIV)="":1,1:0) Q:VIDE
 G:'(VIDE) FIN
 D ^%VZEAVT($$^%QZCHW("Toutes les valeurs doivent etre definies")) G L0
FIN K ^ATT($J,Z),^VAL($J,Z) S (Z,^ATT($J))=^ATT($J)-1
 K:Z=0 ^ATT($J),^VAL($J) Q
 
INIT 
 D ^%VZEATT
 S L1=(LA-6)\2,LDEP=1,LC=1,YC=YH+2,XC=(XG+L1)+4,LFIN=(LDEP+HA)-5,PAGE=1,SUIV="",L=0,NUM=""
 K ^ATT($J,Z),^VAL($J,Z)
 F %A=1:1 S NUM=$O(@TABLE@(NUM)) Q:NUM=""  F %A=1:1 S SUIV=$O(@TABLE@(NUM,SUIV)) Q:SUIV=""  S L=L+1,^ATT($J,Z,L)=SUIV,^VAL($J,Z,L)=@TABLE@(NUM,SUIV)
 S NBPAGE=(L\(HA-4))+((L#(HA-4))'=0)
 D POCLEPA^%VVIDEO Q
 
REAFF D CADR,PAGE,HELP
 Q
HELP S DX=XG+1,DY=(YH+HA)-1 X XY W " " D BH^%VZCFLE S DX=DX+5 X XY
 W $$^%QZCHW(" CTRLP:Page, CTRLR:Reaffiche") Q:MOD=0
 W ", " D BLD^%VVIDEO W "!" D NORM^%VVIDEO W $$^%QZCHW(":Multivalues")
 Q
CADR D CLFEN^%VVIDEO(XG,YH,HA,LA),CARSP^%VVIDEO(XG,YH,HA,LA,1) Q
CLEAR(D) S DX=XG+1 F DY=D:1:(YH+HA)-2 X XY W $J("",LA-2)
 Q
PAG S DEP=LC G PAG2
PAGE S DEP=LDEP D NPAG
PAG2 N ATT S L=((YH+2)+DEP)-LDEP
 F I=DEP:1 Q:('($D(^ATT($J,Z,I))))!(((YH+HA)-2)=L)  D AFF
 D CLEAR(L) Q
AFF S ATT=^ATT($J,Z,I),DY=L,DX=XG+1 X XY W $J("",LA-2) S DX=DX+1 X XY W $E(ATT,1,L1) S DX=(DX+L1)+2 X XY W $E(^VAL($J,Z,I),1,L1) S L=L+1
 Q
NPAG S DX=XG+2,DY=YH X XY W " ",PAGE,"/",NBPAGE," " Q
 
SPEC(TABLE,XG,YH,LA,HA,MOD,ROU) 
 
 
 G DEB

