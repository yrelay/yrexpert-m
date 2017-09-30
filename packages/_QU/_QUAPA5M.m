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
;! HL002 ! HL     ! 03/09/12 ! La variable T est déjà utiliser.               !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QUAPA5M^INT^1^59547,73884^0
QUAPA5M ;
 
 
 
 
GOS N A,B,COL,%F,I,NB,P,P1,S,T,V,XXX,YYY,Z,INDICE,VA,SYN,VT1,HOST,PAS
 S Z=^Z($J)
GO2 I '($D(^Z($J,Z,"R"))) D ^%VSQUEAK Q:'(MODE) "" Q
 S HOST=$$TABID^%INCOIN("ORDINATEUR"),PAS=1
 D:MODE'=2 NET^%QUAPA5M
 ;HL002 S T=^Z($J,Z,"T"),B=^Z($J,Z,"B"),COL=0,P=^Z($J,Z,"P"),A=^Z($J,Z,"A"),XXX=^Z($J,Z,"TAB",COL),S=^Z($J,Z,"R",^Z($J,Z,"P"),"D"),YYY=^Z($J,Z,"Y")+2,NB=$$NOMLOG^%QSF(B)
 S TT=^Z($J,Z,"T"),B=^Z($J,Z,"B"),COL=0,P=^Z($J,Z,"P"),A=^Z($J,Z,"A"),XXX=^Z($J,Z,"TAB",COL),S=^Z($J,Z,"R",^Z($J,Z,"P"),"D"),YYY=^Z($J,Z,"Y")+2,NB=$$NOMLOG^%QSF(B)
 
UNX S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-1 X XY W $$^%QZCHW(" (?),(P)age,(R)epere,(A)ttributs,(<),(>),(+),(-)") W:^Z($J,Z,"MAN") $$^%QZCHW(",CTRLG supprimer,CTRLI inserer") W " "
 I MODE>-1 S DY=^Z($J,Z,"Y") D REV^%VVIDEO,BLK^%VVIDEO,BLD^%VVIDEO X XY W:MODE=0 " Selectionnez 1 ",NB," par [RETURN] " W:(MODE=1)!(MODE=2) " Selectionnez les ",NB,"s par des [RETURN] " D NORM^%VVIDEO
 S SYN=$S(($D(^Z($J,Z,"SYN"))#10)=0:0,1:^Z($J,Z,"SYN"))
 I SYN=1 S SYN("A")=$S(($D(^Z($J,Z,"SYN.A"))#10)=0:"",1:^Z($J,Z,"SYN.A")) I SYN("A")="" S SYN=0
 I SYN=1 S SYN("O")=$S(($D(^Z($J,Z,"SYN.O"))#10)=0:"",1:^Z($J,Z,"SYN.O"))
;HL002 UN0 S V=$S(T:@A@(S),1:S)
UN0 S V=$S(TT:@A@(S),1:S)
 S DX=^Z($J,Z,"X")+1,DY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-2,%F=^Z($J,Z,"L")-4 X XY W $J("",%F) X XY
 
 I COL=0 S I=V
 
 S COL(1)=(^Z($J,Z,"DEP")+COL)-1
 
 I COL'=0,^Z($J,Z,"C",COL(1),"D")'=2 S I=$$^%QSCALIN(B,V,^Z($J,Z,"C",COL(1),"C"),$S(($D(^Z($J,Z,"C",COL(1),"I"))#10)=0:"",1:^Z($J,Z,"C",COL(1),"I")))
 
 I COL'=0,^Z($J,Z,"C",COL(1),"D")=2 S VT1=^Z($J,Z,"C",COL(1),"FCT.VT"),C=^Z($J,Z,"C",COL(1),"C"),@("I="_^Z($J,Z,"C",COL(1),"FCT"))
 S SYN("V")=$S((COL=0)&SYN:$$^%QAXT(B,I,SYN("A"),SYN("O")),1:$$S^%QAX(I))
 S DX=((DX+(%F\2))-($L(SYN("V"))\2))-1 X XY
 D BLD^%VVIDEO,REV^%VVIDEO W $E(SYN("V"),1,%F) D NORM^%VVIDEO
 
SUIT S DX=XXX,DY=YYY X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @("UN"_%F)
 F I=1,2,6,7,8,9,10,13,14,18,43,44,45,46,60,61,62,63,65,80,82,95 G:I=X1 @("UN"_I)
ERR D ^%VSQUEAK G UN0
UN1 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P"))
 S CTR="A" Q:MODE=-1  I (MODE=1)!(MODE=2) K @(ENS) Q
 Q ""
UN2 I '($D(^Z($J,Z,"C"))) G ERR
 D POCLEPA^%VVIDEO S I=$$^%VZAME1($$^%QZCHW("Nouveau pas de balayage des colonnes")_" ["_PAS_"] ? ") D POCLEPA^%VVIDEO I I="" G UN0
 I '($$ENTP^%QZNBN(I)) G UN2
 I I=0 G UN2
 S PAS=I G SUIT
UN6 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P"))
 S CTR="F" Q:MODE=0 "" Q
UN6S D AFF1 S ^Z($J,Z,"S",V)=""
 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")) Q V
UN7 G UN7^%QUAPA6M
UN8 G UN8^%QUAPA6M
UN9 G UN9^%QUAPA6M
UN10 D ^%QUAPA4M G UNX
UN13 G UN6S:MODE=0,UNB:MODE=-1,UN131:$D(^Z($J,Z,"S",V)),UN130:1
UN131 K ^Z($J,Z,"S",V),@ENS@(V) D EFF G UNB
UN130 S ^Z($J,Z,"S",V)="",@ENS@(V)="" D AFF1 G UNB
UN14 I MODE'=0 D ^%VSQUEAK G SUIT
 D POCLEPA^%VVIDEO
UN140 I '(SYN) G SUIT
 S V=$$M^%QAX($$^%VZAME1($$^%QZCHW("Nom ?")))
 I V="" D POCLEPA^%VVIDEO G SUIT
 I '($D(@^Z($J,Z,"A")@(V))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Inconnu...") H 2 D POCLEPA^%VVIDEO G UN140
 S ^Z($J,Z,"S",V)="" D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")) Q V
UN18 D CADR^%QUAPA2M,NPAG^%QUAPA2M(^Z($J,Z,"P")),PAGEI^%QUAPA2M(^Z($J,Z,"P")) S XXX=^Z($J,Z,"TAB",COL) G UNX
UN43 D PLUS^%QUAPAGM
 S P=^Z($J,Z,"P"),YYY=^Z($J,Z,"Y")+2,S=^Z($J,Z,"R",P,"D") G UNX
UN44 G UN60
UN45 S P1=P D MOINS^%QUAPAGM
 
 S P=^Z($J,Z,"P") I P=P1 G UNX
 S YYY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-3,S=^Z($J,Z,"R",P,"A") G UNX
UN46 G UN62
UN61 G UN43
UN60 I ^Z($J,Z,"DEP")=1 G ERR
 S ^Z($J,Z,"DEP")=^Z($J,Z,"DEP")-PAS
 I ^Z($J,Z,"DEP")<1 S ^Z($J,Z,"DEP")=1
 G UN18
UN62 I '($D(^Z($J,Z,"C",^Z($J,Z,"DEP")+PAS))) G ERR
 S ^Z($J,Z,"DEP")=^Z($J,Z,"DEP")+PAS
 I $D(^Z($J,Z,"C",(^Z($J,Z,"DEP")+COL)+PAS)) G UN18
 S COL=COL-PAS S:COL<0 COL=0
 G UN18
UN63 I (COL'=0)!(($$^%QCAZG("^Z($J,Z,""ATT"")")+0)=0) G UN633
 G:(B="")!(V="") UN0
UN631 G:'($$EXI(B,V)) UN0
 D CLEPAG^%VVIDEO,MODE^%QSATTRI(V,B,0,0,80,23,0)
UN632 D CLEPAG^%VVIDEO D:$D(^Z($J,Z,"AFF")) @^Z($J,Z,"AFF") G UN18
UN633 I '($D(^Z($J,Z,"C",COL,"?"))) G ERR
 S @("I=$$"_^Z($J,Z,"C",COL,"?")_"("""_V_""","""_^Z($J,Z,"B")_""")")
 G UN0:I=0,UN631:I=1 D @^Z($J,Z,"ECRAN") G UN0
EXI(B,I) Q:$$IR^%QSGEST5(B,I) 1
 D ^%VZEAVT($$^%QZCHW("Cet individu n'existe plus")) Q 0
 D @^Z($J,Z,"PADLINE") G UN0
UN65 D ^%QUAPA3M G UNX
UN80 D PAGE^%QUAPAGM G:^Z($J,Z,"P")=P UNX
 S YYY=^Z($J,Z,"Y")+2,P=^Z($J,Z,"P"),S=^Z($J,Z,"R",P,"D") G UNX
UN82 D REPERE^%QUAPAGM G UN18
UN95 G UN45
UNG I '($D(^Z($J,Z,"TAB",COL-1))) G ERR
 S COL=COL-1,XXX=^Z($J,Z,"TAB",COL) G UN0
UND I '($D(^Z($J,Z,"TAB",COL+1))) G ERR
 S COL=COL+1,XXX=^Z($J,Z,"TAB",COL) G UN0
UNH G:YYY'=(^Z($J,Z,"Y")+2) UNH1
 I '($D(^Z($J,Z,"P",P-1))) G ERR
 S (^Z($J,Z,"P"),P)=P-1,YYY=(^Z($J,Z,"Y")+^Z($J,Z,"H"))-3,S=^Z($J,Z,"R",P,"A") G UN18
UNH1 S YYY=YYY-1,S=$ZP(@A@(S)) G UN0
UNB G:YYY'=((^Z($J,Z,"Y")+^Z($J,Z,"H"))-3) UNB1
 I '($D(^Z($J,Z,"P",P+1))) G ERR
 S (^Z($J,Z,"P"),P)=P+1,YYY=^Z($J,Z,"Y")+2,S=^Z($J,Z,"R",P,"D") G UN18
UNB1 I $O(@A@(S))="" G ERR
 S YYY=YYY+1,S=$O(@A@(S)) G UN0
 
AFF1 S DX=^Z($J,Z,"TAB",0),DY=YYY
 X XY D BLD^%VVIDEO
 X XY W $S(SYN:$$^%QAXT(B,V,SYN("A"),SYN("O")),1:$$S^%QAX(V))
 X XY D NORM^%VVIDEO Q
EFF N FLAG
 S DX=^Z($J,Z,"TAB",0),DY=YYY,FLAG=0
 I $D(^Z($J,Z,"REV",V)) X XY D REV^%VVIDEO S FLAG=1
 X XY W $S(SYN:$$^%QAXT(B,V,SYN("A"),SYN("O")),1:$$S^%QAX(V))
 I FLAG X XY D NORM^%VVIDEO
 Q
NET Q:'($D(^Z($J,Z,"S")))
 K ^Z($J,Z,"S") D PAGEC^%QUAPA2M(^Z($J,Z,"P")) Q

