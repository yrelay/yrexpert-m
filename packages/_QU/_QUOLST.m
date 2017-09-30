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

;%QUOLST^INT^1^59547,73886^0
%QUOLST(IN) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FCOM 
 N %F,A,BUF,COL,I,J,L,LC,LD,LF,OK,REAF,SX,SY,V,X,X1,XC,Y,YC,NC,MODE,PA,NP
 N CGEN,VID
 S REAF=0
 D INIT^%QUOLST2,AFF^%QUOLST2
L0 D VAL^%QUOLST2
 S DX=XC,DY=YC X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 I MODE=1 F I=1,4,6,7,8,9,10,12,16,18,43,45,46,61,95 G:I=X1 @I
 
 I MODE=0 F I=1,6,7,8,9,10,18,43,45,46,61,95 G:I=X1 @I
 G:(X1<31)!(X1>126) ERR
 
 I $D(@A@(LC)) G:$D(@IN@("CHI",COL)) ERR D MODD^%QUOLST3 G NEXT
 
 I MODE=0 G ERR
 I COL'=1 G ERR
 D ADDP^%QUOLST3($C(X1))
 G L0
1 Q
4 
 I ((COL=1)&(BUF'=""))&('($D(@A@(LC)))) S @A@(LC)=BUF D PAG^%QUOLST2(LC) G L0
 G ERR
6 Q
7 
 G:MODE=0 70
 I COL=1 D DEL^%QUOLST3
 G L0
 
70 
 G:$D(@IN@("CHI",COL)) ERR
 G:'($D(@IN@("LI",COL,"S"))) S70
 G:@IN@("LI",COL,"S")=1 ERR
S70 G:'($D(@IN@("LI",COL,"SUP"))) ERR
 S SLD=LD,Y1=""
 D MUC^%QUOLST3
 G NEXT
8 
 D AIDE^%QUOLST2 G L0
9 
 I '($D(@A@(LC))) G ERR
 
 I $D(@IN@("CHI",COL)) G ERR
 D MOD^%QUOLST3 G NEXT
10 
 D IMPR^%QUOLST2 G L0
12 
 D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO
 X XY W $$^%QZCHW("Ajout") D NORM^%VVIDEO
 D ADD^%QUOLST3
 D POCLEPA^%VVIDEO,PAG^%QUOLST2(LC)
 G B
16 
 I (COL=1)&$D(@A@(LC)) S BUF=@A@(LC) D POCLEPA^%VVIDEO G L0
 G ERR
18 
 D:$D(@IN@("AFF")) @@IN@("AFF")
 D AFF^%QUOLST2 G L0
43 
 G:'($D(@A@(LF+1))) ERR
 D PP S LC=LD
 D PAG^%QUOLST2(LD) G L0
61 G 43
45 
 G:'($D(@A@(LD-1))) ERR
 D PM S LC=LF
 D PAG^%QUOLST2(LD) G L0
95 G 45
46 
 D POCLEPA^%VVIDEO W $$^%QZCHW("No de page : ")
 R NP D POCLEPA^%VVIDEO
 G:NP="" L0 G:(NP<1)!(NP=PA) ERR
 G:NP>PA S46
P46 
 S I=(@IN@("H")-5)*(PA-NP)
 S PA=NP,LC=LC-I,LF=LF-I,LD=LD-I
 D PAG^%QUOLST2(LD) G L0
S46 
 S I=(@IN@("H")-5)*(NP-PA)
 G:'($D(@A@(LC+I))) ERR
 S PA=NP,LD=LD+I,LC=LC+I,LF=LF+I
 D PAG^%QUOLST2(LD) G L0
H 
 I '($D(@A@(LC-1))) G ERR
 I LC=LD D PM,PAG^%QUOLST2(LD) G L0
 S YC=YC-1,LC=LC-1 G L0
B 
 I '($D(@A@(LC+1))) G:LC'=$ZP(@A@("")) ERR I MODE=0 G ERR
 I LC=LF D PP,PAG^%QUOLST2(LD) G L0
 S YC=YC+1,LC=LC+1 G L0
D 
 I '($D(@IN@("LI",COL+1))) G ERR
 S COL=COL+1,XC=(@IN@("X")+1)+@IN@("LI",COL,"X")
 G L0
G 
 I '($D(@IN@("LI",COL-1))) G ERR
 S COL=COL-1,XC=(@IN@("X")+1)+@IN@("LI",COL,"X")
 G L0
NEXT 
 S I=COL
NEXTC I I=NC G NEXTL
 S I=I+1 I $D(@IN@("CHI",I)) G NEXTC
 
 S COL=I-1
 G D
NEXTL 
 I '($D(@A@(LC+1))) G ERR
 I LC'=LF S YC=YC+1,LC=LC+1 G NEXL
 
 D PP,PAG^%QUOLST2(LD)
NEXL S I=0 G NEXTC
 
ERR D ^%VSQUEAK G L0
 
PP S LC=LC+1,YC=@IN@("Y")+3,LD=LF+1,LF=(LD+@IN@("H"))-6
 S PA=PA+1 Q
 
PM S LC=LC-1,YC=(@IN@("Y")+@IN@("H"))-3,LF=LD-1,LD=(LF-@IN@("H"))+6
 S PA=PA-1 Q
 
 
TEST G TEST^%QUOLST3

