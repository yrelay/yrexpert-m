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

;%QSYNT5^INT^1^59547,73884^0
RQSYNT5 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
CRITERE(CH,P,A) N C,N,N1,N2,R S A=0,R=""
 I '($$EXPRESS^%QSYNT4(CH,.P,.N)) Q 0
 S R=$E(CH,P,P+1) G:(((R'="[[")&(R'="]]"))&(R'="[]"))&(R'="][") 2 G 3
2 
 I '($$CBINAIRE^%QSYNT1(CH,.P,.A)) D KILL^%ANA(N) Q 0
 I '($$EXPRESS^%QSYNT4(CH,.P,.N1)) D KILL^%ANA(N),KILL^%ANA(A) Q 0
 D SET^%ANA(A,1,N),SET^%ANA(A,2,N1) Q 1
3 
 I '($$CTERNAIR^%QSYNT1(CH,.P,.A)) D KILL^%ANA(N) Q 0
 I '($$EXPRESS^%QSYNT4(CH,.P,.N1)) D KILL^%ANA(N),KILL^%ANA(A) Q 0
 I C'="," D KILL^%ANA(N),KILL^%ANA(N1),M($$^%QZCHW("Une virgule entre les deux bornes est necessaire ...")) Q 0
 D LEC
 I '($$EXPRESS^%QSYNT4(CH,.P,.N2)) D KILL^%ANA(N),KILL^%ANA(A),KILL^%ANA(N1) Q 0
 D SET^%ANA(A,1,N),SET^%ANA(A,2,N1),SET^%ANA(A,3,N2) Q 1
 
CRITREQ(CH,P,A) N C S A=0 D CAR
 Q:$F(CH,"<<",0) $$PRECED^%QSYNT4(CH,.P,.A)
 Q $$CRITERE(CH,.P,.A)
 
 
TTLT(CH,P,A) N ACT,C,COND S A=0 D CAR S COND=0 G:C="$" ACTI
 I '($$CONDIT^%QSYNT4(CH,.P,.COND)) Q 0
ACTI I '($$ACTTLT^%QSYNT6(CH,.P,.ACT)) Q 0
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","INFERENCE")
 D SET^%ANA(A,1,COND),SET^%ANA(A,2,ACT) Q 1

