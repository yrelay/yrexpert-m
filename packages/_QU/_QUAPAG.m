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

;%QUAPAG^INT^1^59547,73884^0
ZAFFPAG(E) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BID,BLD,CTRLA,DX,DXD,DXG,DY,DYB,DYH,%F,GRAPH,I,J,K,L,LAST,LH,LIDI,LOBJ,LV,MSG,NCOL,O,%O,P,PASH,SEL,STOP,V,X1,X2,X3,Y1
 S:'($D(@E@("SELECT"))) @E@("SELECT")=0
 S PASH=$S($D(@E@("PASH")):@E@("PASH"),1:1)
 S P=0,P(P)=$N(@@E@("LISTE")@(-1)),SEL=0
 I P(P)=-1 D POCLEPA^%VVIDEO,^%VSQUEAK W "Aucun individu a lister ..." Q
 S NCOL("DEBUT")=1 D IPAG
 S LIDI=@E@("TYPCAD"),LIDI=23-$S(LIDI=0:0,LIDI=1:5,LIDI=2:@E@("TYPCAD","NBLC")+2)
AFF D AFFPAG
LL D HELP
L0 D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F F I=1,6,18,43,61,66,80,83 G:I=X1 @I
 D ^%VSQUEAK G L0
1 Q
6 Q
18 G AFF
43 G B
61 G B
45 G H
66 D POCLEPA^%VVIDEO W "Nouveau pas de balayage horizontal [",PASH,"] ? : "
 S DX=$X,DY=$Y D ^%VLEC G:CTRLA!(Y1="") E66
 I (Y1'?1N.N)!(Y1=0) D ^%VSQUEAK G 66
 S PASH=Y1
E66 D HELP G L0
80 D POCLEPA^%VVIDEO W "Page : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA LL
 I (Y1=0)!(Y1'?.N) D ^%VSQUEAK G 80
 I $D(P(Y1-1)) S P=Y1-1 D BAS G LL
 D POCLEPA^%VVIDEO W "Un instant ..." S P=$ZP(P("")),O=P(P)
 F P=P:1:Y1-1 S P(P)=O,L=(23-LIDI)+3 Q:O=-1  K LOBJ D T80
 S:O=-1 P=P-1 D:P'=(Y1-1) ^%VSQUEAK D BAS G LL
T80 F %O=0:0 Q:(O=-1)!(L=22)  S LOBJ(L)=O,L=L+1,O=$N(@@E@("LISTE")@(O))
 Q
83 I @E@("SELECT")=0 D ^%VSQUEAK G L0
 D ^%QUAPAG2 Q:STOP  G LL
95 G H
H I P=0 D ^%VSQUEAK G L0
 S P=P-1 D BAS G LL
B I LAST=-1 D ^%VSQUEAK G L0
 S P=P+1,P(P)=LAST D BAS G LL
G I '($D(@E@("COL",NCOL("DEBUT")-PASH))) G SG
 S NCOL("DEBUT")=NCOL("DEBUT")-PASH D IPAG,BAS G LL
D I '($D(@E@("COL",NCOL("DEBUT")+PASH))) D ^%VSQUEAK G L0
 S NCOL("DEBUT")=NCOL("DEBUT")+PASH D IPAG,BAS G LL
SG I NCOL("DEBUT")=1 D ^%VSQUEAK G L0
 S NCOL("DEBUT")=1 D IPAG,BAS G LL
AFFPAG D CLEPAG^%VVIDEO,CADR,BAS Q
BAS S DX=0,DY=23-LIDI D CLEBAS^%VVIDEO S DX=70,DY=23-LIDI X XY W "Page ",P+1
 D COLG,PAGE Q
CADR G @("C"_@E@("TYPCAD"))
C0 Q
C1 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=@E@("TYPCAD","MSG") D 4^%VZCD Q
C2 S DXG=0,DYH=0,LH=80,LV=@E@("TYPCAD","NBLC")+2,BLD=1 D CARS^%VVIDEO
 S LH=(78-(@E@("TYPCAD","NBCC")-1))\@E@("TYPCAD","NBCC")
 F I=1:1:@E@("TYPCAD","NBCC") F J=1:1:@E@("TYPCAD","NBLC") S DX=((I-1)*(LH+1))+1,DY=J D CVID X XY W $$^%QZCHEV($P(@E@("TYPCAD",I,J),"^",1),LH,"P") D NORM^%VVIDEO
 Q
CVID S V=$P(@E@("TYPCAD",I,J),"^",2)
 F K=1:1 S L=$P(V,",",K) Q:L=""  D @(L_"^%VVIDEO")
 Q
COLG K LOBJ S DXG=0,DYH=23-LIDI,(K,LH)=$P(@E@("COLG"),"^",1),LV=LIDI,BLD=1
 D CARS^%VVIDEO
 S DX=1,DY=(23-LIDI)+1 D REV^%VVIDEO,BLD^%VVIDEO X XY W " "_$$^%QZCHEV($P(@E@("COLG"),"^",2),K-4,"P")_" " D NORM^%VVIDEO
 S L=(23-LIDI)+3,O=P(P) F %O=0:0 Q:(O=-1)!(L=22)  S DX=2,DY=L,LOBJ(DY)=O X XY W $$^%QZCHEV(O,K-4,"P") S L=L+1,O=$N(@@E@("LISTE")@(O))
 S LAST=O Q
IPAG S J=$P(@E@("COLG"),"^",1)+2 F I=NCOL("DEBUT"):1 Q:'($D(@E@("COL",I)))  S K=$P(@E@("COL",I),"^",2) Q:((J+K)+1)>79  S NCOL(I)=J,J=(J+K)+1
 S NCOL("FIN")=I-1 Q
PAGE F I=NCOL("DEBUT"):1:NCOL("FIN") D TCOL
 Q
TCOL S K=$P(@E@("COL",I),"^",2),DX=NCOL(I),DY=(23-LIDI)+1 D BLD^%VVIDEO
 X XY W $$^%QZCHEV($P(@E@("COL",I),"^",1),K,"P") D NORM^%VVIDEO
 S L=(23-LIDI)+3,O=P(P) F %O=0:0 Q:(O=-1)!(L=22)  D TOP S O=$N(@@E@("LISTE")@(O)),L=L+1
 Q
TOP S DX=NCOL(I),DY=L X XY S @("J="_@E@("VAL",I)_""""_O_""")") W $$^%QZCHEV(J,K,"P") Q
HELP D POCLEPA^%VVIDEO W "(<),(>),(^),(v),(-),(+),(P)age,(B)alayage horizontal"
 Q:@E@("SELECT")=0  I '(SEL) W ",(S)electionner" Q
 W ",[RETURN] pour selectionner un individu" Q

