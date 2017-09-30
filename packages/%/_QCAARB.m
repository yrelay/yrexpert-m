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

;%QCAARB^INT^1^59547,73875^0
ZARBGLO(ARB,TET,AD) 
 
 
 
 
 
 
 
 
 
 
 
 N K1,K2,K3
 K ^VU($J),^PIL($J) S ^VU($J,TET)="",^PIL($J)=1,^PIL($J,1)=TET
LP S K1=$$PUL(.K2,.K3) G:K1="" FIN S K2=$O(@ARB@(K1,K2))
 I K2'="" D PUS(K1,K2) D:'($D(^VU($J,K2))) PUS(K2,"") S ^VU($J,K2)="" D @AD
 G LP
FIN Q
PUL(X,T) 
 N V S T=^PIL($J) Q:T=0 "" S V=^PIL($J,T),X=$P(V,$C(9),2),V=$P(V,$C(9),1),^PIL($J)=T-1 K ^PIL($J,T) Q V
PUS(X,Y) 
 N T S T=^PIL($J)+1,^PIL($J)=T,^PIL($J,T)=X_$C(9)_Y Q
 
TEST K ^TEST($J) S AD="T1" F I=65:1:67 F J=I+1:1:I+3 S ^TEST($J,$C(I),$C(J))=""
 D ^%QCAARB("^TEST($J)","A","T1") Q
T1 W !,K3,?10,K1,?20,K2

