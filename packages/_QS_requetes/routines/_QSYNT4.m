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

;%QSYNT4^INT^1^59547,73884^0
RQSYNT4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
 
EXPRESS(CH,P,A) N C S A=0 D CAR
 Q:'($$OBJET^%QSYNT1(CH,.P,.A)) 0 Q $$SEXPRE(CH,.P,.A)
 
SEXPRE(CH,P,A) N C,N,T
BS D CAR Q:"+-*/\"'[C 1 I '($$OBINAIRE^%QSYNT1(CH,.P,.N)) D KILL^%ANA(A) Q 0
 D SET^%ANA(N,1,A) S A=N I '($$OBJET^%QSYNT1(CH,.P,.N)) D KILL^%ANA(A) Q 0
 D SET^%ANA(A,2,N) G BS
 
PRECED(CH,P,A) N C,I,V1,V2 S A=0 D CAR
 Q:'($$VARIABL^%QSYNT3(CH,.P,.V1)) 0
 I '($$OPRECED^%QSYNT1(CH,.P,.A)) D KILL^%ANA(V1) Q 0
 I '($$VARIABL^%QSYNT3(CH,.P,.V2)) D KILL^%ANA(V1),KILL^%ANA(A) Q 0
 D SET^%ANA(A,1,V1),SET^%ANA(A,2,V2) Q 1
 
CONDIT(CH,P,A) N C,I S A=0 D CAR
 I $E(CH,P,P+1)'="SI" D M($$^%QZCHW("un SI etait attendu ...")) Q 0
 F I=1:1:2 D LEC
 I '($$COND(CH,.P,.A)) Q 0
 I $E(CH,P,P+4)'="ALORS" D KILL^%ANA(A),M($$^%QZCHW("Vous avez oublie le ALORS ...")) Q 0
 F I=1:1:5 D LEC
 Q 1
 
COND(CH,P,A) Q:'($$CRIT(CH,.P,.A)) 0 Q $$SCOND(CH,.P,.A)
 
SCOND(CH,P,A) N C,I,N,R D CAR
BSC S R=$E(CH,P,P+1) Q:(R'="ET")&(R'="OU") 1 F I=1:1:2 D LEC
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","OPERATEUR.LOGIQUE"),SET^%ANA(N,"TEXTE",R),SET^%ANA(N,1,A) S A=N
 I '($$CRIT(CH,.P,.N)) D KILL^%ANA(A) Q 0
 D SET^%ANA(A,2,N) G BSC
 
CRIT(CH,P,A) N C,N S A=0 D CAR
 G:C'="'" RIEN D LEC
 S N=$$NEW^%ANA D SET^%ANA(N,"TYPE","NEGATION"),SET^%ANA(N,"TEXTE","'")
 I '($$CRIT1(CH,.P,.A)) D KILL^%ANA(N) Q 0
 D SET^%ANA(N,1,A) S A=N Q 1
RIEN Q $$CRIT1(CH,.P,.A)
 
CRIT1(CH,P,A) N C S A=0 D CAR
 Q:C="$" $$FLOG^%QSYNT2(CH,.P,.A)
 Q:C'="(" $$CRITERE^%QSYNT5(CH,.P,.A)
 D LEC I '($$COND(CH,.P,.A)) Q 0
 D CAR I C'=")" D KILL^%ANA(A),M($$^%QZCHW("Il manque une ) ...")) Q 0
 D LEC Q 1

