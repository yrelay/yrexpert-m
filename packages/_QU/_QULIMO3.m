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
;! HL002 ! HL     ! 26/07/12 ! PB caratères parasites sur terminal-gnome      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULIMO3^INT^1^59547,73885^0
QULIMO3 ;
 
 
 
 
 
 
 
 
 
 
REAFF2(I,J,L,XG,YH,DH,DV,PARAM) 
 G SREAFF
REAFF(I,J,L,XG,YH,DH,DV) 
 N PARAM S PARAM=""
SREAFF N NL,NO,LL
 N K,M,B,LFEN,DX,DY,I0,STU,STU1,BAS
 S:(TADTM=0)&((XG+DH)>79) DH=79-XG
 D CUROF^%VVIDEO
 S NL=DV-2,NO=YH+1
 S I0=I,LFEN=DH-3,B=I,STU="STU1",DY=NO,BAS=(YH+DV)-1
 F M=0:0 Q:DY'<BAS  Q:($D(@L@(I))#10)'=1  S DX=XG+1 X XY D NO,LIG S I=I+1
 
 ;HL002 F M=0:0 Q:DY'<BAS  S DX=XG+1 X XY W $$FORMAT("",LFEN) S DY=DY+1
 F M=0:0 Q:DY'<BAS  S DX=XG+1 X XY W $$FORMAT("",LFEN) S ($X,$Y)=0 S DY=DY+1
 D CURON^%VVIDEO Q
NO 
 Q
 
LIG S LL=$$SUB^%QULIMO6(@L@(I),PARAM)
 
 ;HL002 F K=$S(I'=I0:1,1:J):1:$$LIGN^%QULIMO6(LL,LFEN,STU) Q:DY'<BAS  S DX=XG+1 X XY W $$FORMAT(@STU@(K),LFEN) S DX=XG+1 X XY W:K=1 " " S DY=DY+1
 F K=$S(I'=I0:1,1:J):1:$$LIGN^%QULIMO6(LL,LFEN,STU) Q:DY'<BAS  S DX=XG+1 X XY W $$FORMAT(@STU@(K),LFEN) S ($X,$Y)=0 S DX=XG+1 X XY W:K=1 " " S ($X,$Y)=0 S DY=DY+1
 Q
FORMAT(SS,SI) Q " "_$E(SS,1,SI)_$J("",SI-$L(SS))
 
 
 
 
 
 
 
CONS(L,NL,GL,DH,P11,P11L,CARD) 
 D CONS1(1,L,NL,GL,DH,P11,P11L,.CARD)
 Q
 
CONS1(MODE,L,NL,GL,DH,P11,P11L,CARD) 
 N I,%L,C,CPT,LC,LFEN,LMC,LONG,MC,MOT,P,PAGE,OCARD,NL1,A,VISU
 N PARAM
 K @(GL)
 S CARD=0,LFEN=DH-3,PAGE=1,VISU=0,PARAM=""
 S @GL@(PAGE)="1^1^1",NL1=1,PAGE=PAGE+1
 I MODE F I=P11:1 Q:'($D(@L@(I)))  S @L@(I,"NL")=$$LIGN^%QULIMO6($$SUB^%QULIMO6(@L@(I),PARAM),LFEN,"")
 I VISU W !,"PAGE",?10,"I",?20,"A",?30,"NL",?40,"CARD"
 F I=P11:1 Q:'($D(@L@(I)))  D CT
 
 D CT1(1)
 Q
CT 
 S NL1=@L@(I,"NL")
 D CT1(NL1)
 Q
CT1(NL1) 
 S PAGE1=PAGE-1
 
 I (CARD+NL1)>(NL*PAGE1) D CTP
 I VISU,(CARD+NL1)'>(NL*PAGE1) W !,PAGE,?10,I,?20,"x",?30,NL1,?40,CARD
 
 S CARD=CARD+NL1
 Q
 
CTP F A=(-(CARD))#NL:NL:((-(CARD))#NL)+NL1 S @GL@(PAGE)=I_"^"_((CARD+A)+1)_"^"_(A+1),PAGE=PAGE+1 I VISU W !,PAGE+1,?10,I,?20,A+1,?30,NL1,?40,CARD+A
 Q
 
R(GLO1,PAG,DEF) Q $S(($D(@GLO1@(PAG))#10)=1:$P(@GLO1@(PAG),"^",1),1:DEF)
L(GLO1,PAG,DEF) Q $S(($D(@GLO1@(PAG))#10)=1:$P(@GLO1@(PAG),"^",3),1:DEF)
 
TEST S XG=10,YH=5,DH=20,DV=8
 D CLEPAG^%VVIDEO,CARSA^%VVIDEO(XG,YH,DH,DV)
 S I=3
 F J=1:1:11 D REAFF(I,J,"^TATAT",XG,YH,DH,DV),^%VZEAVT(" ")
 Q
GEN K ^TATAT
 F I=1:1:32 S ^TATAT(I)="ligne "_I_" est suffisamment longue pour prendre plusieurs lignes"
 Q
TEST1 D CONS1(0,"^TATAT",10-2,"GLO",20,1,1,.CARD)
 Q
TEST2 S LONG=5,NL=8,N=30
 Q

