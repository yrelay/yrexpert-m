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

;%QMDAFFI^INT^1^59547,73877^0
QMDAFFI(INTER,FORM) 
 
 
 
 
 
 
 
 
 
 
 
 Q:FORM=0 INTER
 
 N A,ADR,ANN,D,DIF,DTE,F,H1,H2,HM,HMS,J,JOUR,M,MOIS,R,S1,TYPE
 S H1=$P(INTER,"/",1),S1=$P(H1,",",2),H1=$P(H1,",",1)
 Q:(H1<0)!(S1<0) ""
 
 S H2=$P(INTER,"/",2),H2=$P(H2,",",1)
 Q:H2<0
 S DIF=H2-H1 I DIF<2 S TYPE="J" G TS
 I (DIF<7)&(DIF>1) S TYPE="D" G TS
 I DIF=7 S TYPE="S" G TS
 I (DIF>27)&(DIF<32) S TYPE="M" G TS
 I (DIF>89)&(DIF<93) S TYPE="T" G TS
 Q INTER
TS I TYPE="J" S D=$$01^%QMDATE1(H1)
 
 
 
 
 E  S ADR="SUITE" G DETY
 
SUITE S R=D,A=$$ANNO^%QMDATE1(H1)
 G @TYPE
T 
 S:FORM=1009 R=$$AN(D) Q:(((FORM=9)!(FORM=1009))!(FORM=7))!(FORM=1007) R
 I (FORM=8)!(FORM=1008) S D="M"_$$MOISO^%QMDATE1(H1)_"/"_$P(D,"/",2),R=D S:FORM=1008 R=$$AN(D) Q R
 I (FORM=6)!(FORM=1006) S D="S"_$$SEMNO^%QMDATE1(H1)_"/"_$P(D,"/",2),R=D S:FORM=1006 R=$$AN(D) Q R
 I FORM=61 S R=$$05^%QMDATE1(H1) Q R
 S D=$$DATEX^%QMDATE(H1) G TRJ
 
M 
 I (FORM=9)!(FORM=1009) S R=$$TR("T",1009) Q R
 S:FORM=1008 R=$$AN(D) Q:(((FORM=1008)!(FORM=8))!(FORM=7))!(FORM=1007) R
 I (FORM=6)!(FORM=1006) S D="S"_$$SEMNO^%QMDATE1(H1)_"/"_$P(D,"/",2),R=D S:FORM=1006 R=$$AN(D) Q R
 I FORM=61 S R=$$05^%QMDATE1(H1) Q R
 S D=$$DATEX^%QMDATE(H1) G TRJ
 
S 
 I (FORM=9)!(FORM=1009) S R=$$TR("T",1009) Q R
 I (FORM=8)!(FORM=1008) S R=$$TR("M",1008) Q R
 S:FORM=1006 R=$$AN(D) Q:(((FORM=1006)!(FORM=6))!(FORM=7))!(FORM=1007) R
 I FORM=61 S R=$$05^%QMDATE1(H1) Q R
 S D=$$DATEX^%QMDATE(H1) G TRJ
 
D 
 I (FORM=9)!(FORM=1009) S R=$$TR("T",1009) Q R
 I (FORM=8)!(FORM=1008) S R=$$TR("M",1008) Q R
 I (FORM=6)!(FORM=1006) S R=$$TR("S",1006) Q R
 S:FORM=1007 R=$P(D,"/",1,2)_"/19"_$P(D,"/",3) Q:(FORM=1007)!(FORM=7) R
 I FORM=61 S R=$$05^%QMDATE1(H1) Q R
 S D=$$DATEX^%QMDATE(H1) G TRJ
 
J 
 I (FORM=9)!(FORM=1009) S R=$$TR("T",1009) Q R
 I (FORM=8)!(FORM=1008) S R=$$TR("M",1008) Q R
 I (FORM=6)!(FORM=1006) S R=$$TR("S",1006) Q R
 I FORM=61 S R=$$05^%QMDATE1(H1) Q R
TRJ S R=D Q:(FORM=7)!(FORM=1007) R
 S J=$P(D,"/",1),M=$P(D,"/",2),A=$P(D,"/",3)
 S ANN="19"_A,MOIS=$$MOIS^%QMDATE(M),JOUR=$$J^%QMDATE1(H1)_" "
 S:S1="0" (HM,HMS)="" S:S1'=0 HM=" "_$$HEURNO^%QMDATE(S1),HMS=" "_$$HEURNO2^%QMDATE(S1)
 G:FORM="" 10
 G @FORM
1 Q $$INVERS^%QMDATE(D)
2 Q R
3 Q $$02^%QMDATE1(H1)
4 Q $$06^%QMDATE1(H1)
5 Q J_" "_MOIS_" "_A
10 Q "J"_D
101 Q JOUR_$$INVERS^%QMDATE(D)
102 Q JOUR_D
103 Q JOUR_$$02^%QMDATE1(H1)
104 Q JOUR_$$06^%QMDATE1(H1)
105 Q JOUR_J_" "_MOIS_" "_A
1001 Q ANN_"/"_M_"/"_J
1002 Q J_"/"_M_"/"_ANN
1005 Q $$03^%QMDATE1(H1)
1101 Q JOUR_ANN_"/"_M_"/"_J
1102 Q JOUR_J_"/"_M_"/"_ANN
1104 Q JOUR_J_M_ANN
1105 Q JOUR_$$03^%QMDATE1(H1)
10001 Q $$INVERS^%QMDATE(D)_HM
10002 Q D_HM
10003 Q $$02^%QMDATE1(H1)_HM
10004 Q $$06^%QMDATE1(H1)_HM
10005 Q J_" "_MOIS_" "_A_HM
10101 Q JOUR_$$INVERS^%QMDATE(D)_HM
10102 Q JOUR_D_HM
10103 Q JOUR_$$02^%QMDATE1(H1)_HM
10104 Q JOUR_$$06^%QMDATE1(H1)_HM
10105 Q JOUR_J_" "_MOIS_" "_A_HM
11001 Q ANN_"/"_M_"/"_J_HM
11002 Q J_"/"_M_"/"_ANN_HM
11005 Q $$03^%QMDATE1(H1)_HM
11101 Q JOUR_ANN_"/"_M_"/"_J_HM
11102 Q JOUR_J_"/"_M_"/"_ANN_HM
11104 Q JOUR_J_M_ANN_HM
11105 Q JOUR_$$03^%QMDATE1(H1)_HM
20001 Q $$INVERS^%QMDATE(D)_HMS
20002 Q D_HMS
20003 Q $$02^%QMDATE1(H1)_HMS
20004 Q $$06^%QMDATE1(H1)_HMS
20005 Q J_" "_MOIS_" "_A_HMS
20101 Q JOUR_$$INVERS^%QMDATE(D)_HMS
20102 Q JOUR_D_HMS
20103 Q JOUR_$$02^%QMDATE1(H1)_HMS
20104 Q JOUR_$$06^%QMDATE1(H1)_HMS
20105 Q JOUR_J_" "_MOIS_" "_A_HMS
21001 Q ANN_"/"_M_"/"_J_HMS
21002 Q J_"/"_M_"/"_ANN_HMS
21005 Q $$03^%QMDATE1(H1)_HMS
21101 Q JOUR_ANN_"/"_M_"/"_J_HMS
21102 Q JOUR_J_"/"_M_"/"_ANN_HMS
21104 Q JOUR_J_M_ANN_HMS
21105 Q JOUR_$$03^%QMDATE1(H1)_HMS
21106 Q $$02^%QMDATE1(H1)_$TR($TR($TR(HMS,"H",""),"'","")," ","")
 
 
DETY 
 I TYPE="T" S DTE=$$01^%QMDATE1(H1),D="T"_$$TRIM^%QZDAJM($P(DTE,"/",2))_"/"_$P(DTE,"/",3)
 I TYPE="M" S DTE=$$01^%QMDATE1(H1),D="M"_$P(DTE,"/",2)_"/"_$P(DTE,"/",3)
 I TYPE="S" S DTE=$$05^%QMDATE1(H1),D="S"_$E(DTE,3,4)_"/"_$E(DTE,1,2)
 I TYPE="D" S DTE=$$01^%QMDATE1(H1),D="D"_$E($$05^%QMDATE1(H1),3,4)_"/"_$P(DTE,"/",2)_"/"_$P(DTE,"/",3)
 I TYPE="J" S DTE=$$01^%QMDATE1(H1) S:S1="" D="J"_DTE S:S1'="" D="J"_DTE_" "_$$HEURNO2^%QMDATE(S1)
 G @ADR
 
AN(D) 
 Q $P(D,"/",1)_"/19"_$P(D,"/",2)
 
TR(TYPE,FO) 
 
 S ADR="FTR" G DETY
FTR S:FORM=FO D=$$AN(D) Q D
 
 
TEST N C,F,R,V D CLEPAG^%VVIDEO
DEB W !,"Chaine saisie : " R C Q:C=""
 S R=$$^%QMDASAI(C,.V) W !,!,"Resultat : ",R,!,"Forme interne : ",V,! G:R=0 DEB
FR W !,"Format : " R F G:F="" DEB G:'($D(^RQSGLU("QMDA","FORM",F))) FR
 W !,"Date : ",$$QMDAFFI(V,F) G FR

