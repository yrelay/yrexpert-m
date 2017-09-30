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

;%QULIMO4^INT^1^59547,73885^0
QULIMO4 ;
 
18 
 D A18
 G LP^%QULIMO
A18 D REAFF^%QULIMO3($$R^%QULIMO3(GLO1,PAG,1),$$L^%QULIMO3(GLO1,PAG,1),LI,XG,YH,DH,DV)
 Q
43 G 61
61 
 G:'($D(GLO(PAG+1))) ERR
 S PAG=PAG+1,(P1,P1C)=$$R^%QULIMO3(GLO1,PAG,1),NB=$P(GLO(PAG),"^",2)
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 
 I $D(@LI@(P1)),P1L'=1 S NB=(NB+(@LI@(P1,"NL")-P1L))+1
 
 D REAFF^%QULIMO3(P1,P1L,LI,XG,YH,DH,DV)
 G LL^%QULIMO
45 G 95
46 G:'(MODP) ERR
 G 80
95 
 G:'($D(GLO(PAG-1))) ERR
 S PAG=PAG-1,(P1,P1C)=$$R^%QULIMO3(GLO1,PAG,1),NB=$P(GLO(PAG),"^",2)
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 
 I $D(@LI@(P1)),P1L'=1 S NB=(NB+(@LI@(P1,"NL")-P1L))+1
 
 D REAFF^%QULIMO3(P1,P1L,LI,XG,YH,DH,DV)
 G LL^%QULIMO
80 
 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY
 D LIRE1^%VREAD($$^%QZCHW("Page : "),"",XG,23,.CTR,.Y1)
 D POCLEPA^%VVIDEO G:(Y1="")!(CTR="A") L00^%QULIMO
 I (Y1'?1N.N)!(Y1>NPAG) D ^%VSQUEAK G 80
 G:'($D(GLO(Y1))) 80
 S PAG=Y1,(P1,P1C)=$$R^%QULIMO3(GLO1,PAG,1),NB=$P(GLO(Y1),"^",2)
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 
 I $D(@LI@(P1)),P1L'=1 S NB=(NB+(@LI@(P1,"NL")-P1L))+1
 D REAFF^%QULIMO3(P1,P1L,LI,XG,YH,DH,DV)
 G LL^%QULIMO
H 
 G:'($D(@LI@(P1C-1))) ERR
 
 S L=@LI@(P1C-1,"NL"),NB=NB-L
 I (YC-L)>YH S P1C=P1C-1,YC=YC-L G L00^%QULIMO
 
HSS S P1C=P1C-1,PAG=PAG-1,P1=$$R^%QULIMO3(GLO1,PAG,1)
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 D LL(GLO1,PAG,NL,P1,P1L,.YC)
 D REAFF^%QULIMO3(P1,P1L,LI,XG,YH,DH,DV)
 F I=P1+(P1L'=1):1:P1C-1 Q:((YC+@LI@(I,"NL"))-1)'<(YH+NL)  S YC=YC+@LI@(I,"NL")
 G LP^%QULIMO
B 
 S I=$$B1
 G @I
B1() G:P1C=$ZP(@LI@("")) BS Q:'($D(@LI@(P1C+1))) "ERR"
BS S L=@LI@(P1C,"NL"),NB=NB+L
 I ((YC+L)-1)<(YH+NL) S YC=YC+L,P1C=P1C+1 Q "L00^%QULIMO"
BSS S P1C=P1C+1,YC=YH+1,PAG=PAG+1
 S P1=$$R^%QULIMO3(GLO1,PAG,P1C)
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 D LL(GLO1,PAG,NL,P1,P1L,.YC)
 D REAFF^%QULIMO3(P1,P1L,LI,XG,YH,DH,DV)
 Q "LL^%QULIMO"
G G L00^%QULIMO
D G L00^%QULIMO
 
ERR D ^%VSQUEAK G L00^%QULIMO
 
 
 
 
 
 
 
 
 
 
LL(GLO1,PAG,NL,P1,P1L,YC,P1C) 
 S P1L=$$L^%QULIMO3(GLO1,PAG,1)
 I '($D(@LI@(P1))) S YC=YH+1,P1C=P1 D LLP^%QULIMO2 Q
 I P1L=1 S YC=YH+1,P1C=P1 D LLP^%QULIMO2 Q
 S YC=((YH+1)+((@LI@(P1,"NL")-P1L)#NL))+1,P1C=$O(@LI@(P1))
 I P1C="" S P1C=$ZP(@LI@(""))+1
 D LLP^%QULIMO2
 Q
 
 
LP S NPAG=((CARD+1)\NL)+(((CARD+1)#NL)'=0),PAG=(NB\NL)+((NB#NL)'=0)
 I MODP S DX=XG+2,DY=YH X XY W $$^%QZCHW(" Page "),PAG,"/",NPAG," "
 Q

