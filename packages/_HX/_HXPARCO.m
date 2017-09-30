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

;%HXPARCO^INT^1^59547,73870^0
HXPARCO ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MAJ(GL,LISTE,CARD) 
 
 
 
 
 N STO,I,%I
 D PS^%QSGESTI("L0",LISTE,"TRIABLE","OUI",1)
 S STO=$$^%QSCALVA("L0",LISTE,"ADRESSE"),I=""
 F %I=1:1 S I=$O(@GL@(I)) Q:I=""  I @GL@(I)=1 S @STO@(I)="" D PA^%QSGESTI("L0",LISTE,"CARD",$$^%QSCALVA("L0",LISTE,"CARD")+1,1)
 S I=""
 F %I=1:1 S I=$O(@GL@(I)) Q:I=""  I @GL@(I)=2 K @STO@(I) D PA^%QSGESTI("L0",LISTE,"CARD",$$^%QSCALVA("L0",LISTE,"CARD")-1,1)
 S CARD=$$^%QSCALVA("L0",LISTE,"CARD")
 Q
 
MAJGLO(R,T,NOM,IMOD,%L,L) 
 N %I,I,LOLD
 S LOLD=L+1,I=""
 F %I=1:1 S I=$O(@NOM@(I)) Q:I=""  S @IMOD@(@NOM@(I))=1,L=L+1,^DESC($J,L)=$$S^%QAX(@NOM@(I)),^DESC($J,L,"INDIVIDU")=@NOM@(I)
 
 S ^DESC($J,%L,T)="",^DESC($J,%L,"INDIVIDU")="",^DESC($J,%L,R)=""
 Q
 
 
DEL(GL,IND,CS,OPTH,CARD) 
 N VT
 Q:($D(@GL@(CS,"IND",IND))#10)=0
 S VT=$P(@GL@(CS,"IND",IND),"^",1)
 I OPTH=1 S @GL@(CS)=@GL@(CS)-VT,@GL@("TOTAL")=@GL@("TOTAL")-VT,@GL@(CS,"TOT")=@GL@(CS) G SD
 I '($D(@GL@(CS,"TOT"))) S @GL@(CS,"TOT")=$S($D(@GL@(CS)):@GL@(CS)*@GL@(CS,"IND"),1:0)
 S @GL@(CS,"TOT")=@GL@(CS,"TOT")-VT
 S @GL@(CS)=$S(@GL@(CS,"IND")=1:0,1:@GL@(CS,"TOT")/(@GL@(CS,"IND")-1))
 S @GL@("TOTAL")=$S(CARD=1:0,1:((@GL@("TOTAL")*CARD)-VT)/(CARD-1))
 
SD S @GL@(CS,"IND")=@GL@(CS,"IND")-1
 K @GL@(CS,"IND",IND)
 S CARD=CARD-1
 Q
 
 
INS(GL,IND,CS,OPTH,VR,VT,CARD) 
 I OPTH=1 S @GL@(CS)=$S($D(@GL@(CS)):@GL@(CS),1:0)+VT,@GL@("TOTAL")=@GL@("TOTAL")+VT,@GL@(CS,"TOT")=@GL@(CS) G IN
 I '($D(@GL@(CS,"TOT"))) S @GL@(CS,"TOT")=$S($D(@GL@(CS)):@GL@(CS)*@GL@(CS,"IND"),1:0)
 S @GL@(CS,"TOT")=@GL@(CS,"TOT")+VT
 S @GL@(CS)=$S('($D(@GL@(CS))):VT,1:@GL@(CS,"TOT")/(@GL@(CS,"IND")+1))
 S @GL@("TOTAL")=$S(CARD=0:0,1:((@GL@("TOTAL")*CARD)+VT)/(CARD+1))
 
IN S @GL@(CS,"IND")=$S($D(@GL@(CS,"IND")):@GL@(CS,"IND"),1:0)+1
 S @GL@(CS,"IND",IND)=VT_"^"_VR
 S @GL@("MAX")=$$MAX(@GL@("MAX"),@GL@(CS))
 S CARD=CARD+1
 Q
MAX(A,B) Q:A<B B Q A
 
 
NOCOL(GL,INVC,ABC,VR,VN,VP,FCOL,BO,NOCOL) 
 N NC,I,CUR
 G:VN NUM
 Q:$D(@INVC@(VR)) @INVC@(VR)
 D TSUP(VR),CALCOL Q NC
NUM D NORMALIS^%QZNBN1(.VR)
 I ABC=1 S VR=(((VR-BO)\VP)*VP)+BO Q:$D(@INVC@(VR)) @INVC@(VR) D TSUP(VR),CALCOL Q NC
 I '($D(@GL)) D TSUP((VR\VP)*VP) G INF
 I @GL=0 D TSUP((VR\VP)*VP) G INF
 G:VR<@GL@(1,"TEXT") INF
 G:VR'<(@GL@(@GL,"TEXT")+VP) SUP
 S NC=$O(@INVC@(VR)),NC=$ZP(@INVC@(NC)) Q:NC'="" @INVC@(NC)
SUP S CUR=@GL@(@GL,"TEXT")
 F I=@GL+1:1 S CUR=CUR+VP D TSUP(CUR) Q:(CUR+VP)>VR
 
 D CALCOL
 Q NC
INF S CUR=(((VR-BO)\VP)*VP)+BO,NC=(@GL@(1,"TEXT")-CUR)/VP
 I ABC=1 S NC=1
 I NC'=0 D DECAL(NC)
 F I=1:1:NC D TSU(I,CUR) S CUR=CUR+VP
 S @GL=@GL+NC,NOCOL=NOCOL+NC
 D CALCOL Q 1
 
CALCOL D INV^%HXPARAM(GL,INVC)
 Q
TSUP(V) 
 I '($D(@GL)) S @GL=0,@GL@("TOTAL")=0,@GL@("MAX")=0
 S (NC,@GL)=@GL+1 D TSU(NC,V)
 Q
TSU(NC,V) S @GL@(NC)=0,@GL@(NC,"IND")=0,@GL@(NC,"TEXT")=V
 I FCOL'="" S @GL@(NC,"FCOL")=$$FCOL^%HXYISTO(FCOL,REPI,T,NC)
 
 Q
DECAL(I) N J,O,%O
 F J=@GL:-1:1 D DEC
 Q
DEC S @GL@(J+I)=@GL@(J)
 S @GL@(J+I,"TEXT")=@GL@(J,"TEXT"),@GL@(J+I,"IND")=@GL@(J,"IND")
 I FCOL'="" S @GL@(J+1,"FCOL")=@GL@(J,"FCOL")
 S O="" F %O=0:0 S O=$O(@GL@(J,"IND",O)) Q:O=""  S @GL@(J+I,"IND",O)=@GL@(J,"IND",O)
 K @GL@(J) Q

