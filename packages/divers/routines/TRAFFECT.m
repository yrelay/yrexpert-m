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

;TRAFFECT^INT^1^59547,74877^0
TRAFFECT ;
 W !,!,"TEST AFFECTATION",!,!
 W !,"Nb de sources : M=" R M S N=M W !,"Nb de problemes a traiter : " R NPROB S m=M,n=N
CALC ;;
 F PROB=1:1:NPROB W !,"Probleme ",PROB,": " D RAND,^VTIME,^TROPTRA W ?$X-10 D AFF^VTIME S ^F($J,%zm)=^F($J,%zm)+DELTA,M=m D ^TRBEST
 W *7 H 1 S ^F($J,%zm)=^F($J,%zm)/NPROB Q
RAND K ^A($I),^B($I),^C($I)
 F I=1:1:M S ^C($I,I)=1 F J=1:1:N S ^A($I,I,J)=$R(1000)
 F J=1:1:N S ^B($I,J)=1
 Q
 
probe ;;
PROBE ;;
 K ^F($J)
 F %zm=15:1:20 S ^F($J,%zm)=0,(M,m)=%zm,N=M,NPROB=3 D CALC W !,%zm," ",^F($J,%zm) S CX(%zm-14)=%zm,FCX(%zm-14)=^F($J,%zm)
 S MPM=$$^TRMTC1(.CX,.FCX),^perfo($H)=MPM
 W " coefficient MPM =",MPM," soit ",MPM/46804E-2," equivalent RAMEAU"

