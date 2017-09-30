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

;%QSAFFAP^INT^1^59547,73880^0
QSAFFAP(O,BA,XG,YH,LA,HA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N COL,DEP,I,JE,L,L1,LC,LDEP,LFIN,M,NBPAGE,PAGE,REP,XC,YC
 D INIT,RECATPR
DEB S NBPAGE=(L\(HA-4))+((L#(HA-4))'=0) I L=0 D ^%VZEAVT($$^%QZCHW("Aucun attribut a afficher")) Q
 D POCLEPA^%VVIDEO,REAFF
L0 S M=$S(NBPAGE=0:"",COL:^GCMVAL($J,LC),1:^GCMAP($J,LC)),DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-2) S DX=((XG+(LA\2))-($L(M)\2))-1 D REV^%VVIDEO,BLD^%VVIDEO X XY W M D NORM^%VVIDEO
 S DX=XC,DY=YC X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F F I=1,6,10,43,45,61,95 G:I=X1 @I
 D ^%VZEAVT($$^%QZCHW("Vous n'avez pas le droit de modifier les attributs")) G L0
H I '($D(^GCMAP($J,LC-1))) D ^%VSQUEAK G L0
 G:LC'=LDEP HOK
 S PAGE=PAGE-1,LC=LC-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,YC=(YH+HA)-3 D PAGE G L0
HOK S LC=LC-1,YC=YC-1 G L0
B I '($D(^GCMAP($J,LC+1))) D ^%VSQUEAK G L0
 G:LC'=LFIN BOK
 S PAGE=PAGE+1,LC=LC+1,LDEP=LFIN+1,LFIN=(LDEP+HA)-5,YC=YH+2 D PAGE G L0
BOK S LC=LC+1,YC=YC+1 G L0
G I (XG+2)=XC D ^%VSQUEAK G L0
 S COL=0,XC=XG+2 G L0
D I (XG+2)'=XC D ^%VSQUEAK G L0
 S COL=1,XC=(XC+L1)+2 G L0
1 G FIN
6 G FIN
43 I '($D(^GCMAP($J,LFIN+1))) D ^%VSQUEAK G L0
 S PAGE=PAGE+1,LDEP=LFIN+1,LFIN=(LDEP+HA)-5,LC=LDEP,YC=YH+2 D PAGE G L0
61 G 43
45 I '($D(^GCMAP($J,LDEP-1))) D ^%VSQUEAK G L0
 S PAGE=PAGE-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,LC=LFIN,YC=(YH+HA)-3 D PAGE G L0
95 G 45
FIN K ^GCMAP($J),^GCMVAL($J) Q
 
INIT 
 D ^%VZEATT
 S L=0,LC=1,L1=(LA-6)\2,LDEP=1,YC=YH+2,XC=XG+2,LFIN=(LDEP+HA)-5,PAGE=1,COL=0,JE=WHOIS
 K ^GCMAP($J),^GCMVAL($J) Q
 
RECATPR 
 S REP=$$NOMLOG^%QSF(BA) Q:'($D(^[QUI]RQSATPR(REP,"*","*","*")))
 N %NF,ATR,I,LATR,NF
 S NF="" F %NF=0:0 S NF=$O(^[QUI]RQSATPR(REP,"*","*","*",NF)) Q:NF=""  D CHATTR
 Q
CHATTR S LATR=^[QUI]RQSATPR(REP,"*","*","*",NF)
 F I=1:2:15 S ATR=$P(LATR,"^",I) I ATR'="",$$^%QSDROIT(BA,ATR,"C",JE) S L=L+1,^GCMAP($J,L)=ATR,^GCMVAL($J,L)=$S($$AIR^%QSGEST5(BA,O,ATR):$$^%QSCALVA(BA,O,ATR),1:$P(LATR,"^",I+1))
 Q
 
REAFF 
 D CADR,TIT,PAGE,HELP Q
CADR S DXG=XG,DYH=YH,LH=LA,LV=HA,BLD=1 D CARS^%VVIDEO Q
TIT S DX=XG+10,DY=YH X XY W " " D REV^%VVIDEO S DX=DX+1 X XY W REP D NORM^%VVIDEO W " : " D BLD^%VVIDEO,REV^%VVIDEO W O D NORM^%VVIDEO W " " D NPAG Q
HELP S DX=XG+1,DY=(YH+HA)-1 X XY W "  " D XY^%VZCFLE S DX=DX+9 X XY
 W $$^%QZCHW(",(-),(+)") Q
PAGE S DEP=LDEP D NPAG
PAG2 S L=((YH+2)+DEP)-LDEP
 F I=DEP:1 Q:('($D(^GCMAP($J,I))))!(((YH+HA)-2)=L)  D AFF
 D CLEAR(L) Q
AFF S DY=L,DX=XG+1 X XY W $J("",LA-2) S DX=DX+1 X XY W $$^%QZCHEV(^GCMAP($J,I),L1,"P") S DX=(DX+L1)+2 X XY W $E(^GCMVAL($J,I),1,L1) S L=L+1
 Q
NPAG S DX=XG+2,DY=YH X XY W " ",PAGE,"/",NBPAGE," " Q
CLEAR(D) S DX=XG+1 F DY=D:1:(YH+HA)-2 X XY W $J("",LA-2)
 Q
 
ATAFF(O,BA,XG,YH,LA,HA) 
 N COL,DEP,I,JE,L,L1,LC,LDEP,LFIN,M,NBPAGE,PAGE,REP,XC,YC
 D INIT,RECATAFF G DEB
 
RECATAFF 
 Q:'($D(^[QUI]QSATAFF(REP)))
 N %NF,ATR,I,LATR,NF
 S NF="" F %NF=0:0 S NF=$O(^[QUI]QSATAFF(REP,NF)) Q:NF=""  D CHATAFF
 Q
CHATAFF S LATR=^[QUI]QSATAFF(REP,NF)
 F I=1:1:12 S ATR=$P(LATR,"^",I) I ATR'="",$$^%QSDROIT(BA,ATR,"C",JE) S L=L+1,^GCMAP($J,L)=ATR,^GCMVAL($J,L)=$S($$AIR^%QSGEST5(BA,O,ATR):$$^%QSCALVA(BA,O,ATR),1:"")
 Q

