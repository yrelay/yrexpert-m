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

;%QUA^INT^1^59547,73884^0
ZAFFPAGM ;
 
 
 
 
 
 
INIT(INFO) I ($D(^Z($J))#10)'=1 K ^Z($J) S ^Z($J)=0
 S ^Z($J)=^Z($J)+1 N C,I,%I,J,%J,Z S Z=^Z($J),I=-1 K ^Z($J,Z) S:'($D(@INFO@("T"))) @INFO@("T")=0 S:'($D(@INFO@("ATT"))) @INFO@("ATT")=0 S:'($D(@INFO@("MAN"))) @INFO@("MAN")=0
 F %I=0:0 S I=$N(@INFO@(I)) Q:I=-1  S:I'="C" ^Z($J,Z,I)=@INFO@(I)
 S C=0 S:'($D(^Z($J,Z,"LR"))) C=1,^Z($J,Z,"LR")=20 S I=-1 F %I=0:0 S I=$N(@INFO@("C",I)) Q:I=-1  S J=-1 F %J=0:0 S J=$N(@INFO@("C",I,J)) Q:J=-1  S ^Z($J,Z,"C",I,J)=@INFO@("C",I,J)
 F I=1:1 Q:'($D(^Z($J,Z,"C",I)))  S:'($D(^Z($J,Z,"C",I,"T"))) ^Z($J,Z,"C",I,"T")=""
 S ^Z($J,Z,"P")=1,^Z($J,Z,"DEP")=1 D INIT2S Q
INIT2 N C S C=0
INIT2S N A,H,I,J,%I,%J,L,N,NI,P,T,V,Z S Z=^Z($J),P=^Z($J,Z,"P") K ^Z($J,Z,"R"),^Z($J,Z,"P") S ^Z($J,Z,"P")=P D ^%VZEATT S T=^Z($J,Z,"T"),I="",A=^Z($J,Z,"A"),N=0,P=0,H=^Z($J,Z,"H")-4,NI=$$^%QCAZG("^Z($J,Z,""N"")")
 F %I=0:0 S I=$O(@A@(I)) Q:I=""  D INIT3S:NI="",INIT4S:NI'=""
 S:P>0 ^Z($J,Z,"R",P,"A")=$ZP(@A@("")) S ^Z($J,Z,"NP")=P,P=^Z($J,Z,"P") F P=P:-1:0 Q:$D(^Z($J,Z,"R",P))
 S ^Z($J,Z,"P")=P D POCLEPA^%VVIDEO Q:('(C))!('(P))  N T,T2 S (T,T2)=0,I=-1 F %I=0:0 S I=$N(L(I)) Q:I=-1  S T=T+L(I),T2=(I*L(I))+T2
 S ^Z($J,Z,"LR")=(T2\T)+2 Q
INIT3S S V=$S(T:@A@(I),1:I),N=N+1 I (N#H)=1 S P=P+1,^Z($J,Z,"R",P,"D")=I,^Z($J,Z,"P",P)=I S:'($D(L($L(V)))) L($L(V))=0 S L($L(V))=L($L(V))+1 S:P>1 ^Z($J,Z,"R",P-1,"A")=$ZP(@A@(I))
 Q
INIT4S S J="" F %J=0:0 S J=$O(@A@(I,J)) Q:J=""  S V=$S(T:@A@(I,J),1:I_","_J),N=N+1 I (N#H)=1 S P=P+1,^Z($J,Z,"R",P,"D")=I,^Z($J,Z,"P",P)=I S:'($D(L($L(V)))) L($L(V))=0 S L($L(V))=L($L(V))+1 S:P>1 ^Z($J,Z,"R",P-1,"A")=$ZP(@A@(I,J))
 Q
END K ^Z($J,^Z($J)) S ^Z($J)=^Z($J)-1 K:^Z($J)=0 ^Z($J) Q
AFF(PAGE) N Z S Z=^Z($J) D CADR^%QUA2,NPAG^%QUA2(PAGE),PAGEI^%QUA2(PAGE) Q
AFFICH D AFF(^Z($J,^Z($J),"P")) Q
AFFP(O) N Z S Z=^Z($J) F I=1:1 Q:(^Z($J,Z,"R",I,"D")']O)&(O']^Z($J,Z,"R",I,"A"))
 S ^Z($J,Z,"P")=I Q
GO N MODE S MODE=-1 G GOS^%QUA2
REPERE N BID,I,L,LD,LF,P,%P S DX=^Z($J,Z,"X")+1,LD=^Z($J,Z,"Y")+1,LF=(LD+^Z($J,Z,"H"))-2,P=$O(^Z($J,Z,"R",""))
PAG1 S L=0 G:'($D(^Z($J,Z,"R"))) PAG3 F %P=0:0 Q:(P="")!(L=(^Z($J,Z,"H")-2))  S DY=LD+L,L=L+1 X XY W $J("",^Z($J,Z,"L")-2) D PAG2 S P=$O(^Z($J,Z,"R",P))
PAG3 F L=L:1:^Z($J,Z,"H")-3 S DY=LD+L X XY W $J("",^Z($J,Z,"L")-2)
 D CADR^%QUA2 S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-1 X XY W " [RETURN] "
L1 D ECHOFF^%VVIDEO R *BID D TOUCHE^%INCCLAV(BID,.BID),ECHON^%VVIDEO F I=1,6,13 G:I=BID @("X"_I)
 D ^%VSQUEAK G L1
X1 Q
X6 Q
X13 Q:P=""  G PAG1
PAG2 X XY W $$^%QZCHW(" Page "),$J("",3-$L(P)),P," de ",$$^%QZCHEV($$S^%QAX(^Z($J,Z,"R",P,"D")),^Z($J,Z,"LR"),"P")," a ",$$^%QZCHEV($$S^%QAX(^Z($J,Z,"R",P,"A")),^Z($J,Z,"LR"),"P") Q
CARA D NORM^%VVIDEO N E,I,P S P=(XD+^Z($J,Z,"LR"))+3 F I=^Z($J,Z,"DEP"):1 Q:(P'<XF)!('($D(^Z($J,Z,"C",I))))  S E=(XF-P)-1,E2=^Z($J,Z,"C",I,"L"),E=$S(E2>E:E,1:E2),DX=P X XY W $$^%QZCHEV($$^%QSCALVA(BASE,V,^Z($J,Z,"C",I,"C")),E,"P") S P=(P+E)+1
 Q
PLUS N Z S Z=^Z($J) I '($D(^Z($J,Z,"P",^Z($J,Z,"P")+1))) D ^%VSQUEAK Q
 S ^Z($J,Z,"P")=^Z($J,Z,"P")+1 D CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")),PAGEI^%QUA2(^Z($J,Z,"P")) Q
 
MOINS N Z S Z=^Z($J) I '($D(^Z($J,Z,"P",^Z($J,Z,"P")-1))) D ^%VSQUEAK Q
 S ^Z($J,Z,"P")=^Z($J,Z,"P")-1 D CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")),PAGEI^%QUA2(^Z($J,Z,"P")) Q
 
PAGE N I,Z S Z=^Z($J)
PAGE2 D CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")) S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-1 D REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO X XY W " Page : " S DX=$X,DY=$Y D NORM^%VVIDEO X XY W " " S DX=$X,DY=$Y W $J("",5) X XY D ^%VLEC
 I CTRLA!(Y1="") D CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")) Q
 I '($D(^Z($J,Z,"P",Y1))) D ^%VSQUEAK G PAGE2
 S I=^Z($J,Z,"P"),^Z($J,Z,"P")=Y1 D CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")) D:I'=Y1 PAGEI^%QUA2(^Z($J,Z,"P")) Q
 
UN() N MODE S MODE=0 G GOS^%QUA2
ENS(ENS) K @(ENS) N MODE S MODE=1 G GOS^%QUA2
REPER N Z S Z=^Z($J) D REPERE,CADR^%QUA2,NPAG^%QUA2(^Z($J,Z,"P")),PAGEI^%QUA2(^Z($J,Z,"P")) Q

