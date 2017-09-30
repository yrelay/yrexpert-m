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

;TOINDBIS^INT^1^59547,74872^0
TOINDBIS ;
 S NF=$P(PRX,"^",3),NFC=$P(PRX,"^",2),RFIC=^PHASADM($I,NUFA,TWREF,"TABIND","REPFIC",NFC),PRX=""""_YA_""","_$P(RFIC,"^",5),(PRX,RBIS)="("_PRX_")",BISI=$P(PRX,"""",4),PBIS=$P(RFIC,"^",2),PBIS=$P(PBIS,"""",2),IN=-1
LIN S IN=$N(^PHASADM($I,NUFA,TWREF,"TABIND","VALINDIS",NFC,IN)) G:IN=-1 FIN
 S ^V($I,YA,IN)=^PHASADM($I,NUFA,TWREF,"TABIND","VALINDIS",NFC,IN) G LIN
FIN K RFIC,VIN,IN Q
COMP S TCP("NF")=$P(TCP("REFC"),"^",3),TCP("NFC")=$P(TCP("REFC"),"^",2),RFIC=^PHASADM($I,NUFA,TWREF,"TABIND","REPFIC",TCP("NFC")),RFNOM=""""_YA_""","_$P(RFIC,"^",5),COMP=$P($P(RFIC,"^",2),"""",2)
 S RBIS="("_RFNOM_")",TCP("CPR")=$P(RBIS,"""",4),TCP("IND")=1,IN=-1 K ^INDEF($J)
CIN S IN=$N(^PHASADM($I,NUFA,TWREF,"TABIND","VALINDIS",TCP("NFC"),IN)) G:IN=-1 FIN
 S VIN=^PHASADM($I,NUFA,TWREF,"TABIND","VALINDIS",TCP("NFC"),IN),^V($I,YA,IN)=VIN,^INDEF($J,IN)=VIN,TCP("IND",IN)=VIN G CIN

