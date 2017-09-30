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

;%QS0S^INT^1^59547,73879^0
QS0S ;
ENREG N DATE,I D CLEPAG^%VVIDEO
L0 W !,"Date [",$$DATE^%QMDATE,"] : " S DX=$X,DY=$Y D ^%VLEC G:CTRLA FIN
 S:Y1="" Y1=$$DATE^%QMDATE S DATE=Y1
 F I=2:1 S J=$P($T(SIC),";;",I) Q:J=""  W !,J," : " S DX=$X,DY=$Y D ^%VLEC Q:CTRLA  S:Y1="" I=I-2 I Y1'="" S ^%QS0S($$INVERS^%QMDATE(DATE),J)=Y1
 Q
SIC ;;Epargne-Unie;;Uni-Foncier;;Unifrance;;Uni-Garantie;;Uni-Obligation;;Uni-Region;;Unirente
SIC2 ;;1/Epargne-Unie;;2/Uni-Foncier;;3/Unifrance;;4/Uni-Garantie;;5/Uni-Obligation;;6/Uni-Region;;7/Unirente
VISU N BID,D,%D,DI,DEP,DP,I,J,PO,PREC,S,SIC,T
DEBV D CLEPAG^%VVIDEO K PREC
L1 F I=2:1 S J=$P($T(SIC2),";;",I) Q:J=""  W !,J," "
 D POCLEPA^%VVIDEO S DX=$X,DY=$Y D ^%VLEC G:CTRLA!(Y1="") FV S SIC=$P($T(SIC),";;",Y1+1) D POCLEPA^%VVIDEO W SIC
 S T=0,D=-1 F %D=0:0 S D=$N(^%QS0S(D)) Q:D=-1  D:$D(^%QS0S(D,SIC)) TDD
 W !,!,"[RETURN]" R *BID G DEBV
FV Q
TDD S S=^%QS0S(D,SIC) W !,$$INVERS^%QMDATE(D)," ",S
 I T S PO=$J(((S-DEP)/DEP)*100,1,2) W ?20,PO,"% (",$J(PO/$$DIFJ^%QMDATE($$INVERS^%QMDATE(D),$$INVERS^%QMDATE(DI)),1,2),"%)"
 I $D(PREC) S PO=$J(((S-PREC)/PREC)*100,1,2) W ?40,PO,"% (",$J(PO/$$DIFJ^%QMDATE($$INVERS^%QMDATE(D),$$INVERS^%QMDATE(DP)),1,2),"%)"
 I '(T) S DEP=S,DI=D
 S T=1,PREC=S,DP=D
 Q
BILAN D CLEPAG^%VVIDEO
 N B,D1,D2,I,J,T1,T2 F I=2:1 S J=$P($T(SIC),";;",I) Q:J=""  D TIJ
 S T1="" F T2=0:0 S T1=$ZP(B(T1)) Q:T1=""  S D1=-1 F D2=0:0 S D1=$N(B(T1,D1)) Q:D1=-1  W !,T1/100,?20,D1
 Q
TIJ S D=-1 F %D=0:0 S D=$N(^%QS0S(D)) Q:D=-1  Q:$D(^%QS0S(D,J))
 S D1=D
 S D="" F %D=0:0 S D=$ZP(^%QS0S(D)) Q:D=""  Q:$D(^%QS0S(D,J))
 S D2=D S:(D1'=-1)&(D2'="") T1=^%QS0S(D1,J),T2=^%QS0S(D2,J),B($J(((T2-T1)/T1)*100,1,2)*100,J)="" Q
ACHAT D CLEPAG^%VVIDEO N A,I,J,D,%D,P F I=2:1 S J=$P($T(SIC),";;",I) Q:J=""  D TAC
 S P=0,I=-1 F J=0:0 S I=$N(A(I)) Q:I=-1  S P=P+A(I)
 W !,!,"Prix = ",P Q
TAC S D="" F %D=0:0 S D=$ZP(^%QS0S(D)) Q:D=""  Q:$D(^%QS0S(D,J))
 Q:D=""  W !,J,?20," : " S DX=$X,DY=$Y D ^%VLEC S A(J)=^%QS0S(D,J)*Y1 Q

