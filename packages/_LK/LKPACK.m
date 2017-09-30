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

;LKPACK^INT^1^59547,74867^0
LKPACK(T,N,M) 
 
 
 
 
 
 
 
 
 
 
 N CAR,P,L,PB,I,C1,C2
 S P='(T#2),L=$L(N)-1,PB=0,M=""
 F I=0:1:L S I2=2*I,CAR=$A($E(N,I+1)),C1=CAR\16,PB=PB!(C1>9),M=M_C1 I (I<L)!P S C2=CAR#16,PB=PB!(C2>9),M=M_C2
 S M=M+0
 Q PB
T S I2=2*I,CAR=$A($E(N,I+1)),C1=CAR\16,PB=PB!(C1<9),M=M_C1 I (I<L)!P S C2=CAR#16,PB=PB!(C2<9),M=M_C2 Q
 
T1 S I2=2*I
 S CAR=$A($E(N,I+1))
 S ^OCT(I2)=CAR\16,M=M_^OCT(I2)
 I (I<L)!P S ^OCT(I2+1)=CAR#16,M=M_^OCT(I2+1)
 B
 Q
TEST1 W !,"Parite ou nombre de caracteres  ",I," " R J
 W !,"LKPACK--> ",$$LKPACK(J,A,.N)," Nombre ",N,!,"Resultats egaux en parite impaire"
 G TEST
TEST S A=""
 F I=1:1 W !,"Nombre No ",I," : " R NB Q:NB=""  S ATR(I)=NB,A=A_$C(NB)
 Q:'($D(ATR))  D ^PSJMPAC W !,"       =========> ",%DCD G TEST1

