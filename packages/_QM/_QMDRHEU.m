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

;%QMDRHEU^INT^1^59547,73877^0
QMDRHEU ;
 
 
CONT S %DU=$TR(%DU," ","") I %DU="" S %OKH=0 G FIN
 G @$S($F(%DU,"H",0):"HEURE",1:"MINUT")
HEURE S %OKH=($P(%DU,"H",1)?.N)&($P(%DU,"H",2)?.N) G:'(%OKH) FIN
 S %HE=$P(%DU,"H",1)+0,%HM=$P(%DU,"H",2) I (%HE'?.N)!(%HM'?.N) S %OKH=0 G FIN
 I %HM>59 S %HE=%HE+(%HM\60),%HM=%HM-((%HM\60)*60)
CAL S:$L(%HM)=0 %HM="00" S %TI=$S($L(%HE)=1:"0",1:"")_%HE_"H"_$S($L(%HM)=1:"0",1:"")_%HM,%OKH=1 G FIN
MINUT I %DU'?.N S %OKH=0 G FIN
 S %HE=%DU\60,%HM=%DU-(%HE*60) G CAL
FIN Q
ADD 
 
 S %DU=%DU1 D CONT I '(%OKH) S %DUT=0 G FIN
 S HE1=%HE,MI1=%HM,%DU=%DU2 D CONT I '(%OKH) S %DUT=0 G FIN
 S HE2=%HE,MI2=%HM,%HM=MI1+MI2,%HE=HE1+HE2,%HE=%HE+(%HM\60),%HM=%HM-((%HM\60)*60) G CAL
TEST W !,"Duree : " R %DU Q:%DU=""  D QMDRHEU W !,$S(%OKH:"Duree correcte",1:"Duree incorrecte") I %OKH W " Heures = ",%HE," Minutes = ",%HM,!,"Heure complete = ",%TI
 G TEST
TIME S %TI=$P($H,",",2),H=%TI\3600,M=(%TI-(3600*H))\60,%TI=$S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M) K H,M Q

