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

;%QNEQM6^INT^1^59547,73879^0
QNEQM6(N) 
 
 
 
 
 
 
 
 
 
 
 
 n P
 s P(0)=1
 f I=1:1:N s P(I)=$$CAL(I) w !,I," ",P(I)
 q P(N)
CAL(N) n J
 s P(N)=0
 f J=0:1:N-1 s P(N)=P(N)+($$CNK^%QZCA(N-1,J)*P(J))
 q P(N)
 
TEST w !,"N : " r N
 w !,$$QNEQM6(N)
 q
 
 
 
 
 
 
 
 
 
 
 
 
S(N,R) 
 n A
 i (N=1)!(R=1) q 1
 s A=$$S(N-1,R-1)+(R*$$S(N-1,R))
 w !,N," ",R," ",A
 q A
T(N,R) 
 k T
 s T(1,1)=1
 q $$T0(N,R)
 
T0(N,R) 
 w !,N," ",R," ?"
 i R=1 w " --> ",1 q 1
 i R>N w " --> ",0 q 0
 i N=1 w " --> ",1 q 1
 i $d(T(N,R)) w " --> ",T(N,R) q T(N,R)
 n A
 s A=R*($$T0(N-1,R-1)+$$T0(N-1,R))
 w " --> ",A
 s T(N,R)=A
 q A
TESTT w !,"N " r N
 w !,"R " r R
 s A=$$T(N,R)
 w !,N," ",R," --> ",A
 q

