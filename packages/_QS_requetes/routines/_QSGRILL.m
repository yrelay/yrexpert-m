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

;%QSGRILL^INT^1^59547,73882^0
%QSGRILL ;
 
 
 
 
ADD(R,I,A,V,N) N CL,VA
 D:'($$OVAIR^%QSGEST5(R,I,A,V,N)) PA^%QSGESTI(R,I,A,V,N)
 D SCR(R,I,A,V,N,1,.CL,.VA) Q
MOD(R1,I1,A1,V1,N1,R2,I2,A2,V2,N2) N CL,VA
 D:$$OVAIR^%QSGEST5(R1,I1,A1,V1,N1) PS^%QSGESTI(R1,I1,A1,V1,N1)
 D:'($$OVAIR^%QSGEST5(R2,I2,A2,V2,N2)) PA^%QSGESTI(R2,I2,A2,V2,N2)
 D SCR(R1,I1,A1,V1,N1,0,.CL,.VA),SCR(R2,I2,A2,V2,N2,1,.CL,.VA) Q
SUP(R,I,A,V,N) N CL,VA
 D:$$OVAIR^%QSGEST5(R,I,A,V,N) PS^%QSGESTI(R1,I1,A1,V1,N1)
 D SCR(R,I,A,V,N,0,.CL,.VA) Q
EXI(R,I,A,V,N) 
 Q $$OVAIR^%QSGEST5(R,I,A,V,N)
SCR(R,I,A,V,N,MOD,CLE,VAL) N CH,G,%G,I
 S G="" F %G=0:0 S G=$O(^%SCREINV(1,R,A,G)) Q:G=""  D G
 Q
G D CLE(R,I,A,V,N,.CLE) D:MOD VAL(R,I,A,V,N,.VAL)
 S CH=$S(MOD:"S ",1:"K ")_^%SCREINV(1,R,A,G)_"("
 F I=1:1:$ZP(CLE("")) S CH=CH_CLE(I)_","
 S CH=$E(CH,1,$L(CH)-1)_")"
 I MOD F I=1:1:$ZP(VAL("")) S CH=CH_VAL(I)_"^"
 W !,CH Q
CLE(R,I,A,V,N,C) N I
 F I=1:1:$ZP(^%SCREINV(1,R,A,G,"CLE,""")) S @("C(I)="_^%SCREINV(1,R,A,G,"CLE",I))
 Q
VAL(R,I,A,V,N,X) N I
 F I=1:1:$ZP(^%SCREINV(1,R,A,G,"VAL,""")) S @("X(I)="_^%SCREINV(1,R,A,G,"VAL",I))
 Q

