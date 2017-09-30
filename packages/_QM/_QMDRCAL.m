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

;%QMDRCAL^INT^1^59547,73877^0
QMDRCAL(%AN,%REG) 
 
 N EQP
 K ^VALPAR($J),^INTER($J),^HORPAR($J) G:'($D(^[QUI]PLCAREGI(%REG))) FIN S P1=%AN_"0000"
 F %W=1:1 S P1=$N(^[QUI]PLCAPEPA(%REG,P1)) Q:P1=-1  Q:$E(P1,1,2)'=%AN  S FP=$N(^[QUI]PLCAPEPA(%REG,P1,-1)) D T1:$D(^[QUI]PLCAPEHO(%REG,P1,FP)),T2:$D(^[QUI]PLCAPENO(%REG,P1,FP))
 S (P1,FP)=0,NF=-1,TB="^[QUI]PLCAHOJO(%REG)" D U11 S NF=-1,TB="^[QUI]PLCAJOFE(%REG)" D T21,JDH^%QMDRSEJ("01/01/"_%AN,.X,.DEB,.Y),JDH^%QMDRSEJ("31/12/"_%AN,.X,.FIN,.Y) S %U=-1,SEM="JEUDI,VENDREDI,SAMEDI,DIMANCHE,LUNDI,MARDI,MERCREDI"
T4 S %U=%U+1,JJ=DEB+%U G:JJ>FIN FIN K ^[QUI]PLPLACAL(%REG,JJ) G:$D(^INTER($J,JJ)) T4 S JS=$P(SEM,",",(JJ#7)+1),TYP=$S($D(^HORPAR($J,JJ)):^HORPAR($J,JJ),1:"0^0") G:'($D(^VALPAR($J,TYP,JS))) T4 S INT=-1
 F %W=1:1 S INT=$N(^VALPAR($J,TYP,JS,INT)) G T4:INT=-1 S P1=$P(INT,"^",1),FP=$P(INT,"^",2),^[QUI]PLPLACAL(%REG,JJ,P1,FP)=^VALPAR($J,TYP,JS,INT)
T1 D T3 F %U1=0:1 S JJ=R("P1")+%U1 Q:JJ>R("FP")  S ^HORPAR($J,JJ)=P1_"^"_FP
 S NF=-1,TB="^[QUI]PLCAPEHO(%REG,P1,FP)"
T11 S NF=$N(@TB@(NF)) G FIN:NF=-1 S RS=@TB@(NF) F %V=1:5:31 S J1=$P(RS,"^",%V) D:J1'="" T12
 G T11
T12 K H F %U2=1:1:4 S H(%U2)=$P(RS,"^",%V+%U2)
 G:(H(1)="")!(H(2)="") FIN S:(H(3)="")!(H(4)="") H(3)="",H(4)="" F %U2=1,2 S DT=H(%U2),HH=$P(DT,"H",1),MN=$P(DT,"H",2),H(%U2)=(HH*3600)+(MN*60)
 S ^VALPAR($J,P1_"^"_FP,J1,H(1)_"^"_H(2))=1 G FIN:H(3)="" F %U2=3,4 S DT=H(%U2),HH=$P(DT,"H",1),MN=$P(DT,"H",2),H(%U2)=(HH*3600)+(MN*60)
 S ^VALPAR($J,P1_"^"_FP,J1,H(3)_"^"_H(4))=1 G FIN
FIN Q
T2 S NF=-1,TB="^[QUI]PLCAPENO(%REG,P1,FP)"
T21 S NF=$N(@TB@(NF)) G:NF=-1 FIN S RS=@TB@(NF) F %VV=1:4:25 S J1=$P(RS,"^",%VV),M1=$P(RS,"^",%VV+1) D:(J1'="")&(M1'="") T22
 G T21
T22 S J2=$P(RS,"^",%VV+2),M2=$P(RS,"^",%VV+3) I J2="" S M2="" G T23
 I (M2="")&(J2<J1) S J2="" G T23
T23 S:M2="" M2=M1 S:J2="" J2=J1 S MS="JANVIER,FEVRIER,MARS,AVRIL,MAI,JUIN,JUILLET,AOUT,SEPTEMBRE,OCTOBRE,NOVEMBRE,DECEMBRE" K M F IT="M1","M2" S M(IT)=1,MC=@IT F %U2=1:1 S MSC=$P(MS,",",%U2) Q:MSC=""  I MC=MSC S M(IT)=%U2
 S M1=J1_"/"_M("M1")_"/"_%AN,M2=J2_"/"_M("M2")_"/"_%AN D JDH^%QMDRSEJ(M1,.X,.D1,.Y),JDH^%QMDRSEJ(M2,.X,.D2,.Y) F %U2=0:1 S DT=D1+%U2 Q:DT>D2  S ^INTER($J,DT)=1
 G FIN
T3 K R F IT="P1","FP" S DT=@IT,DT=$E(DT,5,6)_"/"_$E(DT,3,4)_"/"_$E(DT,1,2) D JDH^%QMDRSEJ(DT,.X,.J,.Y) S R(IT)=J
 Q
 
 
U11 S NF=$N(@TB@(NF)) Q:NF=-1
 S RS=@TB@(NF),EQP=$P(RS,"^"),RS=$P(RS,"^",2,9999) F %V=1:5:31 S J1=$P(RS,"^",%V) D:J1'="" U12
 G U11
 
U12 K H F %U2=1:1:4 S H(%U2)=$P(RS,"^",%V+%U2)
 G:(H(1)="")!(H(2)="") FIN S:(H(3)="")!(H(4)="") H(3)="",H(4)="" F %U2=1,2 S DT=H(%U2),HH=$P(DT,"H",1),MN=$P(DT,"H",2),H(%U2)=(HH*3600)+(MN*60)
 S ^VALPAR($J,P1_"^"_FP,J1,H(1)_"^"_H(2))=EQP G FIN:H(3)="" F %U2=3,4 S DT=H(%U2),HH=$P(DT,"H",1),MN=$P(DT,"H",2),H(%U2)=(HH*3600)+(MN*60)
 S ^VALPAR($J,P1_"^"_FP,J1,H(3)_"^"_H(4))=EQP G FIN
 Q
 
 
 
MAJ N R,%R,F,%F,TB,O,%O,V
 S TB="^[QUI]PLCAHOJO"
 S R="" F %R=0:0 S R=$O(@TB@(R)) Q:R=""  S O="" F %O=0:0 S O=$O(@TB@(R,O)) Q:O=""  S V=@TB@(R,O) I $L(V,"^")=36 S @TB@(R,O)="1^"_@TB@(R,O)
 Q
MAJREGI(R) N TB,O,%O
 S TB="^[QUI]PLCAHOJO"
 S O="" F %O=0:0 S O=$O(@TB@(R,O)) Q:O=""  S @TB@(R,O)="1^"_@TB@(R,O)
 Q
 
TEST W !,"regime : " R %REG Q:%REG=""
 W !,"Date : " R JR Q:$A(JR)<32
 S IC=1,RESUL(IC)=JR
 D BEG^%VYDAT G TEST:REFUSE D JDH^%QMDRSEJ(DAAT,.X,.J,.Y) S OK=$D(^[QUI]PLPLACAL(%REG,J)) W ?30,$S(OK:"Jour travaille",1:"jour non ouvre") G TEST

