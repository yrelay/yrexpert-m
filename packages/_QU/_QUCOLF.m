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

;%QUCOLF^INT^1^59547,73884^0
ZCOLFEN(XG,YH,HA,LA,LE,COLON,DONNE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N AT,C,CH,DX,DY,%F,I,L,LC,STOP,X1
 N COLDEP,COLFIN,LARG,LIGDEP,NOCOL,NOPAG,POSIT,PAGE,PC,PL,PX,PY,TABH
 S COLDEP=1,LIGDEP=1,TABH=1,NOPAG=1,NOCOL=1 D REAFF
EXT D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @("X"_%F)
 F I=1,5,6,10,18 G:I=X1 @("X"_I)
 D ^%VSQUEAK G EXT
XH I LIGDEP=1 D ^%VSQUEAK G EXT
 S NOPAG=NOPAG-1,LIGDEP=(LIGDEP-(HA-4))+1 D REAFF G EXT
XB I '($D(@DONNE@((LIGDEP+(HA-4))-1))) D ^%VSQUEAK G EXT
 S NOPAG=NOPAG+1,LIGDEP=(LIGDEP+(HA-4))-1 D REAFF G EXT
XG I '($D(PAGE(TABH-1))) D ^%VSQUEAK G EXT
 S NOCOL=NOCOL-1,TABH=TABH-1,COLDEP=PAGE(TABH) D REAFF G EXT
XD I '($D(@COLON@(COLFIN+1))) D ^%VSQUEAK G EXT
 S NOCOL=NOCOL+1,TABH=TABH+1,COLDEP=COLFIN D REAFF G EXT
X1 Q
X5 G X69
X6 Q
X10 D IMPR^%QUCOLF1,REAFF G EXT
X18 D REAFF G EXT
X69 S PC=COLDEP,PL=LIGDEP,PX=XG+2,PY=YH+2 D BMOV,HE G EXT
BMOV D FULL
MOUV D CUR,ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F C=1,6,7,9,13,18 G:C=X1 @C
 I (X1'<32)&(X1'>126) D:$$UC^%QUCOLF1 CR^%QUCOLF1,NEXT G MOUV
 D ^%VSQUEAK G MOUV
B I PL=((LIGDEP+HA)-5) D ^%VSQUEAK G MOUV
 S PL=PL+1,PY=PY+1 G BMOV
H I PL=LIGDEP D ^%VSQUEAK G MOUV
 S PL=PL-1,PY=PY-1 G BMOV
G I '($D(POSIT(PC-1))) D ^%VSQUEAK G MOUV
 S PC=PC-1,PX=POSIT(PC) G BMOV
D I '($D(POSIT(PC+1))) D ^%VSQUEAK G MOUV
 S PC=PC+1,PX=POSIT(PC) G BMOV
1 Q
6 Q
7 G:'($$UC^%QUCOLF1) MOUV
 D NET^%QUCOLF1,OK^%QUCOLF1(@DONNE@(PL,PC),""),NEXT G BMOV
9 D:$$UC^%QUCOLF1 MD^%QUCOLF1,HE,NEXT G BMOV
13 D NEXT G BMOV
18 D REAFF G BMOV
NEXT G:$D(POSIT(PC+1)) COLOK Q:PL=((LIGDEP+HA)-5)
 S PC=COLDEP,PX=POSIT(PC),PL=PL+1,PY=PY+1 Q:$$UC^%QUCOLF1  G NEXT
COLOK S PC=PC+1,PX=POSIT(PC) G:'($$UC^%QUCOLF1) NEXT
FULL O $I S DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-2)
 S CH=$S($D(@DONNE@(PL,PC)):@DONNE@(PL,PC),1:""),L=((LA-2)-$L(CH))\2
 S DX=XG+L D BLD^%VVIDEO,REV^%VVIDEO X XY W CH D NORM^%VVIDEO Q
CUR S DX=PX,DY=PY X XY Q
REAFF O $I D CLFEN^%VVIDEO(XG,YH,HA,LA)
 O $I D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 O $I D TITR,COL,TI,HE Q
TITR K LARG,POSIT S L=0,STOP=0,DX=XG+2,DY=YH+1
 F C=COLDEP:1 D TTIT Q:STOP!('($D(@COLON@(C+1))))
 S PAGE(TABH)=COLDEP,COLFIN=C Q
TTIT S CH=@COLON@(C),LC=$P(CH,"^",3) S:(L+LC)>(LA-4) LC=(LA-4)-L,STOP=1
 D AFFT S L=(L+LC)+1 Q
AFFT S LARG(C)=LC,POSIT(C)=DX
 S AT=$P(CH,"^",2) D:AT'="" VID X XY W $E($P(CH,"^",1),1,LC)
 D:AT'="" NORM^%VVIDEO S DX=(DX+LC)+1 Q
VID F I=1:1 S J=$P(AT,",",I) Q:J=""  D @(J_"^%VVIDEO")
 Q
COL 
 F C=COLDEP:1:COLFIN D TCOL
 Q
TCOL S STOP=0,DY=YH+2 F L=LIGDEP:1:(LIGDEP+HA)-5 D TLIG Q:STOP  S DY=DY+1
 Q
TLIG I '($D(@DONNE@(L,C))) S STOP=1 Q
 S DX=POSIT(C) X XY W $E(@DONNE@(L,C),1,LARG(C)) Q
HE S DX=XG+2,DY=(YH+HA)-1 X XY W " " D NOK^%CGW,XY^%VZCFLE
 W $$^%QZCHW("(CTRLE)Entrer, (CTRLJ)Imprimer, ("),$$L24^%QSLIB2,")",$$^%QZCHW("Abandon") Q
TI S DX=XG+2,DY=YH X XY W $$^%QZCHW(" Page : "),NOPAG,$$^%QZCHW(", Colonne : "),NOCOL," " Q
 
TEST N CL,I K ^DN($J)
 F I=1:1:10 S CL(I)=I_".TITRE^"_$P("BLD,BLK,REV",",",$R(3)+1)_"^"_(5+$R(10))
 F I=1:1:10 F L=1:1:30 S ^DN($J,L,I)=$E("XXXXXXXXXXXXXXXXXXXX",1,$R(20)),^DN($J,L,I,"PROTECT")=$R(2)
 D ^%QUCOLF(0,0,23,80,"CL","^DN($J)") K ^DN($J) Q

