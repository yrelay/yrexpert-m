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

;%QUAPA7M^INT^1^59547,73884^0
QUAPA7M ;
 
 
INIT2 N C S C=0 D INIT2S(C) Q
INIT2S(C) N A,H,I,%I,L,N,P,T,V,Z,SYN,BASE
 S Z=^Z($J),P=^Z($J,Z,"P") K ^Z($J,Z,"R"),^Z($J,Z,"P") S ^Z($J,Z,"P")=P D ^%VZEATT S T=^Z($J,Z,"T"),I="",A=^Z($J,Z,"A"),N=0,P=0,H=^Z($J,Z,"H")-4
 S BASE=^Z($J,Z,"B")
 
 S SYN=$S(($D(^Z($J,Z,"SYN"))#10)=0:0,1:^Z($J,Z,"SYN"))
 I SYN=1 S SYN("A")=$S(($D(^Z($J,Z,"SYN.A"))#10)=0:"",1:^Z($J,Z,"SYN.A")) I SYN("A")="" S SYN=0
 I SYN=1 S SYN("O")=$S(($D(^Z($J,Z,"SYN.O"))#10)=0:"",1:^Z($J,Z,"SYN.O"))
 S L=0,L(1)=0
 F %I=0:0 S I=$O(@A@(I)) Q:I=""  S V=$S(T:@A@(I),1:I),N=N+1 I (N#H)=1 D REP
 S:P>0 ^Z($J,Z,"R",P,"A")=$ZP(@A@("")) S ^Z($J,Z,"NP")=P,P=^Z($J,Z,"P") F P=P:-1:0 Q:$D(^Z($J,Z,"R",P))
 S ^Z($J,Z,"P")=P D POCLEPA^%VVIDEO Q:('(C))!('(P))
 I L'=0 S ^Z($J,Z,"LR")=(L(1)\L)+2
 I L=0 S ^Z($J,Z,"LR")=20
 Q
 
REP S P=P+1,^Z($J,Z,"R",P,"D")=I,^Z($J,Z,"P",P)=I
 S:P>1 ^Z($J,Z,"R",P-1,"A")=$ZP(@A@(I))
 S V=$S(SYN=1:$$^%QAXT(BASE,V,SYN("A"),SYN("O")),1:$$S^%QAX(V))
 S L(1)=L(1)+$L(V),L=L+1
 Q
 
 
 
 
 
 
 
REV(IND,FLAG) 
 N Z
 I IND="" Q
 S Z=^Z($J)
 
 S:FLAG ^Z($J,Z,"REV",IND)=""
 
 K:'(FLAG) ^Z($J,Z,"REV",IND)
 Q
 
 
 
 
OFFREV N Z
 S Z=^Z($J)
 K ^Z($J,Z,"REV")
 Q

