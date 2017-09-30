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

;%QUKOLO^INT^1^59547,73885^0
ZCOLON ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
BEG N I,QW,QW2,HA S QW="QW"
 S I=-1 I $D(@COL@("SELECTN")) S QW=@COL@("SELECTION") K @(QW)
 F %I=0:0 S I=$N(@COL@(I)) Q:I=-1  I I?.N S J=((I-1)\14)+1,PAGE(J)=((J-1)*14)+1
DEB S LII=1
 S:'($D(PCOL)) PCOL=0 Q:'($D(@COL))  S CO=1,LI=1,YT=6,YPL=YT+2,HA=22-YPL
 S AB=$S($D(@COL@("ABBREV")):@COL@("ABBREV"),1:"P")
 S CIC=$S($D(@COL@("INCR")):@COL@("INCR"),1:1)
 S INTER=$S($D(@COL@("INTER")):@COL@("INTER"),1:0)
 S MODI=$S($D(@COL@("MODI")):@COL@("MODI"),1:0)
AF D CLEPAG^%VVIDEO,CA,HE,CO,PA
L1 D BLD,LOC,ZFLECHE^%VZATOU I %F="" F I=1,5,6,10,13,18,66,80 G:I=X1 @I
 I %F="" G:X1=-1 1 D ^%VSQUEAK G L1
 G @%F
H G:'(MODI) H2 I LII=1 D ^%VSQUEAK G L1
 D CL S LII=LII-1 G:LII=(LI-1) B2 G L1
H2 I '($D(@COL@(LI+HA))) D ^%VSQUEAK G L1
 S LI=LI+HA D NE,HE,CO,PA G L1
B G:'(MODI) B2 I '($D(@COL@(LII+1))) D ^%VSQUEAK G L1
 D CL S LII=LII+1 G:LII=(LI+HA) H2 G L1
B2 I LI=1 D ^%VSQUEAK G L1
 S LI=LI-HA D NE,HE,CO,PA G L1
G I '($D(@COL@("COL",CO+CIC))) D ^%VSQUEAK G L1
 S CO=CO+CIC D PA G L1
D I CO=1 D ^%VSQUEAK G L1
 S CO=CO-CIC S:CO<1 CO=1 D PA G L1
SORTIE S NOSEL=0 G FI
1 G:INTER&MODI 83 S NOSEL=1 G FI
5 G:INTER&('(MODI)) 83 D ^%VSQUEAK G L1
6 I ('(INTER))!('(MODI)) G 1
 I $D(@COL@("SELECT1")) S %SELECT=@COL@(LII) Q
 S %L=LII,PCOL(PCOL)=COL_"^^^"_LII,PCOL=PCOL+1,REAFF=0,SORTIE=0 D @@COL@("PROG") S PCOL=PCOL-1,COL=$P(PCOL(PCOL),"^^^",1),LII=$P(PCOL(PCOL),"^^^",2) G:SORTIE SORTIE G:REAFF AF D HE,CL G L1
10 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Sortie sur imprimante")_" ? ","O")'=1 D HE G L1
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 D ^%QUKOLOP(COL)
 D ^%VZEAVT($$^%QZCHW("Impression terminee, vous pouvez aller chercher votre listing"))
 D HE G L1
13 I '(INTER&MODI) D ^%VSQUEAK G L1
 G:'($D(@COL@("SELECTN"))) 6 I $D(QW2(LII)) D LET G B
 D GET G B
LET K @QW@(@COL@(LII)),QW2(LII) Q
GET S @QW@(@COL@(LII))="",QW2(LII)="" Q
18 G AF
66 D POCLEPA^%VVIDEO W "Nouveau pas horizontal [",CIC,"] : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA=1 L1 S:Y1="" Y1=CIC I Y1'?.N D ^%VSQUEAK G 80
 S CIC=Y1 D HE G L1
80 D POCLEPA^%VVIDEO W "Page : " S DX=$X,DY=$Y D ^%VLEC I CTRLA!(Y1="") D HE G L1
 I ((Y1'?.N)!(Y1=0))!(Y1>$ZP(PAGE(""))) D ^%VSQUEAK G 80
 S (LII,LI)=PAGE(Y1) D NE,HE,CO,PA G L1
83 I '(INTER) D ^%VSQUEAK G L1
 S MODI='(MODI) S:MODI LII=LI D:'(MODI) CL D HE G L1
FI I $D(@COL@("SELECT1"))&('($D(%SELECT))) S %SELECT=""
 K AT,CC,%CC,CCF,CO,DE,%F,I,J,CIC,INTER,%L,%LIBEL,LII,LC,LI,LO,PAGE,SORTIE,X1,YPL,YT Q
BLD Q:('(INTER))!('(MODI))  D REV^%VVIDEO D:$D(QW2(LII)) BLD^%VVIDEO S DX=2,DY=(YPL+LII)-LI X XY W $$^%QZCHEV(@COL@(LII),@COL@("LGC"),"P") S DX=DX-1 X XY D NORM^%VVIDEO Q
CL S DX=2,DY=(YPL+LII)-LI D CL2 Q
CL2 S J="" I $D(@COL@(LII,"VIDEO")) S J=@COL@(LII,"VIDEO") F I=1:1 S K=$P(J,",",I) Q:K=""  D @(K_"^%VVIDEO")
 D:$D(QW2(LII)) BLD^%VVIDEO X XY W $$^%QZCHEV(@COL@(LII),@COL@("LGC"),"P")
 D NORM^%VVIDEO Q
CA I '($D(@COL@("SCAD"))) D ^%VZCD(0,39,0,4,1,0,@COL@("MSG")) Q
 D CARSA^%VVIDEO(0,0,80,5)
 F X=1:1:@COL@("SCAD") F Y=1:1:3 I $D(@COL@("CADR",X,Y)) S DX=(((X-1)*78)\@COL@("SCAD"))+2,DY=Y X XY D COL X XY W $P(@COL@("CADR",X,Y),"^",1) D NORM^%VVIDEO
 Q
COL S AT=$P(@COL@("CADR",X,Y),"^",2) F I=1:1 Q:$P(AT,",",I)=""  D @($P(AT,",",I)_"^%VVIDEO")
 Q
NE S DX=0,DY=5 D CLEBAS^%VVIDEO Q
CO S PAGE=((LI-1)\14)+1,DX=70,DY=YT-1 X XY W "Page ",PAGE,"/",$ZP(PAGE(""))
 D CARSP^%VVIDEO(0,YT-1,HA+4,@COL@("LGC")+4,1)
 D REV^%VVIDEO,BLD^%VVIDEO
 S DX=1,DY=YT X XY W " "_$$^%QZCHEV(@COL@("TITC"),@COL@("LGC"),AB)_" "
 D NORM^%VVIDEO
 S DX=2,%L=@COL@("LGC") F LC=LI:1:(LI+HA)-1 Q:'($D(@COL@(LC)))  D:$D(QW2(LC)) BLD^%VVIDEO S DY=(YPL+LC)-LI X XY W $$^%QZCHEV(@COL@(LC),%L,"P") D NORM^%VVIDEO
 Q
PA S (DE,LO)=@COL@("LGC")+6 F CC=CO:1 D TPA Q:ST
 S DX=DE F DY=YT:1:YPL-1 X XY W $J("",80-DE)
 F DY=YPL:1:(YPL+HA)-1 Q:'($D(@COL@((LI+DY)-YPL)))  X XY W $J("",80-DE)
 S CCF=CC F CC=CO:1:CCF S DX=DE,DY=YT D BLD^%VVIDEO S %L=$P(@COL@("COL",CC),"^",2) X XY W $$^%QZCHEV($P(@COL@("COL",CC),"^",1),%L,AB) D NORM^%VVIDEO,TA
 Q
TA S DE=(DE+%L)+1 F DY=YPL:1:(YPL+HA)-1 S IDF=(DY-YPL)+LI,NOM=$P(@COL@("COL",CC),"^",3) I $D(@COL@(IDF,NOM)) X XY W $$^%QZCHEV(@COL@(IDF,NOM),%L,"P")
 Q
TPA S ST=0 I '($D(@COL@("COL",CC))) S CC=CC-1,ST=1 Q
 S LO=(LO+$P(@COL@("COL",CC),"^",2))+1 I LO>78 S CC=CC-1,LO=(LO-$P(@COL@("COL",CC),"^",2))-1,ST=1 Q
 Q
HE D ^%VZCFLE W " (P)age,(B)alayage des colonnes" W:INTER&('(MODI)) ",(CTRLE)acces aux objets" W:INTER&MODI ",",$$L24^%QSLIB2 Q
TEST K @(COL) S @COL@("TITC")="TITRE.COLONNE",@COL@("LGC")=10,@COL@("MSG")="TITRE DU CADRE",@COL@("IC")=3
 F I=1:1:10 S @COL@("COL",I)="TC."_I_"^"_(10+I)_"^MN."_I F J=1:1:24 S @COL@(J)="LIG."_J,@COL@(J,"MN."_I)="TEXTE."_I_"."_J
 D ZCOLON Q
LOC S DX=75,DY=23 X XY Q

