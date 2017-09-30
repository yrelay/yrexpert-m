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

;%QWANA1^INT^1^59547,73886^0
QWANA1 ;
 
 
 
 
EXPR2(VAL,GCOMP,ROUTAFF) 
 N GCOUR
 S @PTVAT@(PARLVL,"CH")=1,@PTVAT@(PARLVL,"PV")=0
 S @PTVAT@(PARLVL,"EC")=0
 S VALC=VAL
EXPRES 
 I VALC="" S ERREUR="EXPATT" Q 0
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I '($$PARA^%QZNBN1(VALC)) G SEXP0
 I ($L(EXP)+$L(VALC))>MAXM S CODERR=KTL Q 0
 S FINAFF=$L(VALC)+PCR F PCR=PCR:1:FINAFF D BLD(PCR)
 S EXP=EXP_VALC Q 1
SEXP0 I ($L(EXP)+1)>MAXM S CODERR=KTL Q 0
 I PCAR'="(" G SEXP01
 S PARLVL=PARLVL+1,@PTVAT@(PARLVL,"PV",0)=""
 S @PTVAT@(PARLVL,"EC")=0
 S EXP=EXP_"(",PCR=PCR+1
 D BLD(PCR)
 S VALC=$E(VALC,2,$L(VALC))
 G EXPRES
SEXP01 I PCAR="-" S PCR=PCR+1,EXP=EXP_"-" D BLD(PCR) S VALC=$E(VALC,2,$L(VALC)) G EXPRES
 I ($A(PCAR)'<$A("A"))&($A(PCAR)'>$A("Z")) G ATT^%QWANA11
 
SEXP1 I PCAR'="""" G SEXP2
 
 S MOT=$$LIREMOT^%QWANA3 I VALC="" S CODERR=KST Q 0
 S PCAR=$E(VALC),VALC=$E(VALC,2,$L(VALC)) I PCAR'="""" S CODER=KST Q 0
 S MOT=MOT_""""
 I ($L(EXP)+$L(MOT))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_MOT
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 G OPER^%QWANA2
SEXP2 I ('($$PARA^%QZNBN1(PCAR)))&(PCAR'=".") G SEXP3
 
 S TWOPT=$S(PCAR=".":1,1:0)
 S NOMBRE=$$LIRENB^%QWANA3
 I ($L(EXP)+$L(NOMBRE))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_NOMBRE
 F PCR=PCR:1 Q:$E(CHAINE,PCR,PCR)'="0"  D BLD(PCR)
 S FINAFF=$L(NOMBRE)+PCR F PCR=PCR:1:FINAFF D BLD(PCR)
 G OPER^%QWANA2
SEXP3 I PCAR="$" S VALC=$E(VALC,2,$L(VALC)) G FONC
 S CODERR=KEA Q 0
 
FONC 
 I $E(VALC,1,5)="SSCH(" G FONC1
 I $E(VALC,1,9)="LONGUEUR(" G FONC2
 I $E(VALC,1,7)="FEXTER(" G FONC3
 I $E(VALC,1,10)="REPERTOIRE" G FONC4
 I $E(VALC,1,7)="PARTIE(" G FONC5
 S CODERR=KEA Q 0
FONC1 I ($L(EXP)+3)>MAXM S CODERR=KTL Q 0
 S PARLVL=PARLVL+1
 F PARA=0,1,2 S @PTVAT@(PARLVL,"PV",PARA)=""
 S EXP=EXP_"$E(",FINAFF=PCR+6 F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,6,$L(VALC))
 G EXPRES
FONC2 I ($L(EXP)+3)>MAXM S CODERR=KTL Q 0
 S PARLVL=PARLVL+1,@PTVAT@(PARLVL,"PV",0)=""
 S EXP=EXP_"$L(",FINAFF=PCR+10 F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,10,$L(VALC))
 G EXPRES
FONC3 I ($L(EXP)+2)>MAXM S CODERR=KTL Q 0
 
 S PARLVL=PARLVL+1
 F %I=0:1:20 S @PTVAT@(PARLVL,"PV",%I)=""
 S @PTVAT@(PARLVL,"PV",1)="N"
 S EXP=EXP_"$$",FINAFF=PCR+8 F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,8,$L(VALC)),PCAR=$E(VALC)
 S MOT=$$LIREROUT^%QWANA3 I MOT="" S CODERR=KUR Q 0
 I (($L(EXP)+$L(MOT))+1)>MAXM S CODERR=KTL Q 0
 S EXP=EXP_MOT_"("
 S FINAFF=(PCR+$L(MOT))+1 F PCR=PCR:1:FINAFF D BLD(PCR)
 G OPER^%QWANA2
FONC4 I ($L(EXP)+3)>MAXM S CODERR=KTL Q 0
 S EXP=EXP_"REP",FINAFF=PCR+11 F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,11,$L(VALC)),PCAR=$E(VALC)
 G OPER^%QWANA2
FONC5 I ($L(EXP)+3)>MAXM S CODERR=KTL Q 0
 S PARLVL=PARLVL+1
 F PARA=1,2,3 S @PTVAT@(PARLVL,"PV",PARA)=""
 S EXP=EXP_"$P(",FINAFF=PCR+8 F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,8,$L(VALC))
 G EXPRES
 
 
 
BLD(P) 
 N LI,C,PAFF
 Q:'(TRACEANA)
 S C=$E(CHAINE,P,P),PAFF=(SYNTX+P)-1
 S LI=PAFF\LRG,DX=PAFF-(LI*LRG),DY=SYNTY+LI X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W C D NORM^%VVIDEO
 Q

