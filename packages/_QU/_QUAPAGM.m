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

;%QUAPAGM^INT^1^59547,73884^0
%QUAPAGM ;
 
 
 
 
 
 
 
 
OPEN(INFO,Z) 
 S ^Z($J)=Z G IN00
USE(Z) S ^Z($J)=Z Q
CLOSE(Z) K ^Z($J,Z) Q
CURRENT() Q:$D(^Z($J)) ^Z($J) Q ""
NEW() N Z S Z=$ZP(^Z($J,""))+1 Q Z
 
INIT(INFO) 
 I ($D(^Z($J))#10)'=1 K ^Z($J) S ^Z($J)=0
 S ^Z($J)=^Z($J)+1
IN00 N C,I,%I,J,%J,Z S Z=^Z($J),I=-1 K ^Z($J,Z) S:'($D(@INFO@("T"))) @INFO@("T")=0 S:'($D(@INFO@("ATT"))) @INFO@("ATT")=0 S:'($D(@INFO@("MAN"))) @INFO@("MAN")=0
 F %I=0:0 S I=$N(@INFO@(I)) Q:I=-1  S:I'="C" ^Z($J,Z,I)=@INFO@(I)
 S:MODTM&(^Z($J,Z,"L")>79) ^Z($J,Z,"L")=79
 
 S C=0 S:'($D(^Z($J,Z,"LR"))) C=1,^Z($J,Z,"LR")=20 S I=-1
 F %I=0:0 S I=$N(@INFO@("C",I)) Q:I=-1  S J=-1 F %J=0:0 S J=$N(@INFO@("C",I,J)) Q:J=-1  S ^Z($J,Z,"C",I,J)=@INFO@("C",I,J)
 F I=1:1 Q:'($D(^Z($J,Z,"C",I)))  S:'($D(^Z($J,Z,"C",I,"T"))) ^Z($J,Z,"C",I,"T")=""
 
 
 F I=1:1 Q:'($D(^Z($J,Z,"C",I)))  D FCT
 S ^Z($J,Z,"P")=1,^Z($J,Z,"DEP")=1 D INIT2S^%QUAPA7M(C)
 Q
FCT S %I=$S(($D(^Z($J,Z,"C",I,"FCT"))#10)=0:0,^Z($J,Z,"C",I,"FCT")'="":1,1:0)
 I %I=0 S ^Z($J,Z,"C",I,"D")=$S($$TYPE^%QSGESPE(^Z($J,Z,"C",I,"C")_"/"_$$NOMLOG^%QSF(^Z($J,Z,"B")))="DATE":1,1:0) Q
 
 S ^Z($J,Z,"C",I,"D")=2
 S ^Z($J,Z,"C",I,"FCT")=$$CONCAT^%QZCHAD(^Z($J,Z,"C",I,"FCT"),"VT1,V,C")
 S:($D(^Z($J,Z,"C",I,"FCT.VT"))#10)=0 ^Z($J,Z,"C",I,"FCT.VT")=""
 Q
INIT2 G INIT2^%QUAPA7M
 
END K ^Z($J,^Z($J)) S ^Z($J)=^Z($J)-1 K:^Z($J)=0 ^Z($J) Q
 
AFF(PAGE) N Z S Z=^Z($J)
 D CADR^%QUAPA2M,NPAG^%QUAPA2M(PAGE),PAGEI^%QUAPA2M(PAGE) Q
AFFICH D AFF(^Z($J,^Z($J),"P")) Q
 
AFFP(O) N Z S Z=^Z($J)
 I ^Z($J,Z,"T") S O=$$INDICE^%QSGE11(^Z($J,Z,"LIS"),O)
 I O="" Q
 I '(^Z($J,Z,"T")) F I=1:1 Q:(^Z($J,Z,"R",I,"D")']O)&(O']^Z($J,Z,"R",I,"A"))
 
 I ^Z($J,Z,"T") F I=1:1 Q:(^Z($J,Z,"R",I,"D")'>O)&(O'>^Z($J,Z,"R",I,"A"))
 S ^Z($J,Z,"P")=I Q
 
GO N MODE S MODE=-1 G GOS^%QUAPA5M
 
UN() N MODE S MODE=0 G GOS^%QUAPA5M
 
ENS(ENS) K @(ENS) N MODE S MODE=1 G GOS^%QUAPA5M
ENS2(ENS) K @(ENS) N MODE S MODE=2 G GOS^%QUAPA5M
 
REPERE N BID,I,L,LD,LF,P,%P,LB,SYN,BASE,V1,V2,T,A,Z
 S Z=^Z($J)
 S BASE=^Z($J,Z,"B"),T=^Z($J,Z,"T"),A=^Z($J,Z,"A")
 
 S SYN=$S(($D(^Z($J,Z,"SYN"))#10)=0:0,1:^Z($J,Z,"SYN"))
 I SYN=1 S SYN("A")=$S(($D(^Z($J,Z,"SYN.A"))#10)=0:"",1:^Z($J,Z,"SYN.A")) I SYN("A")="" S SYN=0
 I SYN=1 S SYN("O")=$S(($D(^Z($J,Z,"SYN.O"))#10)=0:"",1:^Z($J,Z,"SYN.O"))
 S DX=^Z($J,Z,"X")+1,LD=^Z($J,Z,"Y")+1,LF=(LD+^Z($J,Z,"H"))-2,P=$O(^Z($J,Z,"R","")),LB=$S(^Z($J,Z,"LR")>11:^Z($J,Z,"LR"),1:11)
PAG1 S L=0 G:'($D(^Z($J,Z,"R"))) PAG3 F %P=0:0 Q:(P="")!(L=(^Z($J,Z,"H")-2))  S DY=LD+L,L=L+1 X XY W $J("",^Z($J,Z,"L")-2) D PAG2 S P=$O(^Z($J,Z,"R",P))
PAG3 F L=L:1:^Z($J,Z,"H")-3 S DY=LD+L X XY W $J("",^Z($J,Z,"L")-2)
 D CADR^%QUAPA2M S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-1 X XY W " [RETURN] "
L1 D ECHOFF^%VVIDEO R *BID D TOUCHE^%INCCLAV(BID,.BID),ECHON^%VVIDEO F I=1,6,13 G:I=BID @("X"_I)
 D ^%VSQUEAK G L1
X1 Q
X6 Q
X13 Q:P=""  G PAG1
PAG2 S V1=$S(T:@A@(^Z($J,Z,"R",P,"D")),1:^Z($J,Z,"R",P,"D"))
 S V2=$S(T:@A@(^Z($J,Z,"R",P,"A")),1:^Z($J,Z,"R",P,"A"))
 X XY W $$^%QZCHW(" Page "),$J("",3-$L(P)),P," de ",$$^%QZCHEV($S(SYN:$$^%QAXT(BASE,V1,SYN("A"),SYN("O")),1:$$S^%QAX(V1)),LB,"P")," a "
 W $$^%QZCHEV($S(SYN:$$^%QAXT(BASE,V2,SYN("A"),SYN("O")),1:$$S^%QAX(V2)),LB,"P")
 Q
 
PLUS N Z S Z=^Z($J) I '($D(^Z($J,Z,"P",^Z($J,Z,"P")+1))) D ^%VSQUEAK Q
 S ^Z($J,Z,"P")=^Z($J,Z,"P")+1 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")),PAGEI^%QUAPA2M(^Z($J,Z,"P")) Q
 
MOINS N Z S Z=^Z($J) I '($D(^Z($J,Z,"P",^Z($J,Z,"P")-1))) D ^%VSQUEAK Q
 S ^Z($J,Z,"P")=^Z($J,Z,"P")-1 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")),PAGEI^%QUAPA2M(^Z($J,Z,"P")) Q
 
PAGE N I,Z S Z=^Z($J)
PAGE2 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")) S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-1 D REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO X XY W " Page : " S DX=$X,DY=$Y D NORM^%VVIDEO X XY W " " S DX=$X,DY=$Y W $J("",5) X XY D ^%VLEC
 I CTRLA!(Y1="") D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")) Q
 I '($D(^Z($J,Z,"P",Y1))) D ^%VSQUEAK G PAGE2
 S I=^Z($J,Z,"P"),^Z($J,Z,"P")=Y1 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")) D:I'=Y1 PAGEI^%QUAPA2M(^Z($J,Z,"P")) Q
 
REPER N Z S Z=^Z($J) D REPERE,CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")),PAGEI^%QUAPA2M(^Z($J,Z,"P")) Q
 
UNAJ(S) N Z,A S Z=^Z($J),A=^Z($J,Z,"A") D UNAJ^%QUAPA5M(S) Q
 
UNSUP(S) N Z,A S Z=^Z($J),A=^Z($J,Z,"A") D UNSUP^%QUAPA5M(S) Q
 
MODIF(S) N Z,A S Z=^Z($J),A=^Z($J,Z,"A")
 D INIT2^%QUAPA7M I S'="" D AFFP^%QUAPAGM(S)
 D AFFICH^%QUAPAGM
 Q
 
CADRE N Z S Z=^Z($J) D CADR^%QUAPA2M Q
 
XPAG() N Z S Z=^Z($J)
 I ($D(^Z($J,Z,"P"))#10)=1 Q ^Z($J,Z,"P")
 Q ""
REV(IND,FLAG) D REV^%QUAPA7M(IND,FLAG) Q
OFFREV D OFFREV^%QUAPA7M Q
ADRCOL() N Z S Z=^Z($J)
 Q "^Z("_$J_","_$S((Z+0)=Z:Z,1:""""_Z_"""")_",""C"")"
SYN() N Z S Z=^Z($J) Q $S($D(^Z($J,Z,"SYN")):^Z($J,Z,"SYN"),1:0)
SYNA() N Z S Z=^Z($J) Q $S($D(^Z($J,Z,"SYN.A")):^Z($J,Z,"SYN.A"),1:"")

