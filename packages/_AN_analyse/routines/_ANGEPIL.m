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

;%ANGEPIL^INT^1^59547,73866^0
%ANGEPIL ;
 
 
 
 
 
 
 
 
 
 
INIT N %11NIV S %11NIV=$S('($D(^PILANAD($J))):1,1:^PILANAD($J)+1)
 K ^PILANAD($J,%11NIV),^PILANVAL($J,%11NIV)
 S (^PILANAD($J,%11NIV),^PILANVAL($J,%11NIV))=0
 S ^PILANAD($J)=%11NIV,^PILANVAL($J)=%11NIV
 S RESULT=1,NORES=0
 Q
 
EPIL N %11NIV S %11NIV=^PILANAD($J)
 I %11NIV=1 K ^PILANAD($J),^PILANVAL($J) Q
 K ^PILANVAL($J,%11NIV),^PILANAD($J,%11NIV)
 S ^PILANAD($J)=%11NIV-1,^PILANVAL($J)=%11NIV-1
 Q
 
EMPIL(AD) N %11INDIC,%11NIV
 S %11NIV=^PILANAD($J),%11INDIC=^PILANAD($J,%11NIV)+1,^PILANAD($J,%11NIV)=%11INDIC,^PILANAD($J,%11NIV,%11INDIC)=AD
 Q
 
 
 
 
EMPV(TAB) N %11INDIC,%11I,%11VA,%11NIV
 S %11NIV=^PILANVAL($J),(^PILANVAL($J,%11NIV),%11INDIC)=^PILANVAL($J,%11NIV)+1
 Q:'($D(@TAB@(1)))
 S %11I=""
BOUC S %11I=$O(@TAB@(%11I)) Q:%11I=""  S %11VA=@TAB@(%11I),^PILANVAL($J,%11NIV,%11INDIC,%11I,"NOM")=%11VA,^PILANVAL($J,%11NIV,%11INDIC,%11I,"VAL")=$S($D(@%11VA)#10:@%11VA,1:"!@#$%^&*()") G BOUC
 
 
 
 
 
 
DEPIL S %11NIV=^PILANVAL($J),%11INDIC=^PILANVAL($J,%11NIV),^PILANVAL($J,%11NIV)=%11INDIC-1,%11I2=""
BOUCD S %11I2=$O(^PILANVAL($J,%11NIV,%11INDIC,%11I2)) G:%11I2="" DEPIL2 S %11VALL=^PILANVAL($J,%11NIV,%11INDIC,%11I2,"VAL")
 I %11VALL="!@#$%^&*()" K @(^PILANVAL($J,%11NIV,%11INDIC,%11I2,"NOM")) G BOUCD
 S @^PILANVAL($J,%11NIV,%11INDIC,%11I2,"NOM")=%11VALL G BOUCD
 
DEPIL2 K ^PILANVAL($J,%11NIV,%11INDIC),%11I2,%11VALL
 S %11NIV=^PILANAD($J),%11INDIC=^PILANAD($J,%11NIV),^PILANAD($J,%11NIV)=%11INDIC-1 G @^PILANAD($J,%11NIV,%11INDIC)
 
 
 
 
 
RET S %11NIV=^PILANAD($J),%11INDIC=^PILANAD($J,%11NIV),^PILANAD($J,%11NIV)=%11INDIC-1 G @^PILANAD($J,%11NIV,%11INDIC)
 
 
 
DEPV S %11NIV=^PILANVAL($J),%11INDIC=^PILANVAL($J,%11NIV),^PILANVAL($J,%11NIV)=%11INDIC-1,%11I2=""
BOUCV S %11I2=$O(^PILANVAL($J,%11NIV,%11INDIC,%11I2)) I %11I2="" K ^PILANVAL($J,%11NIV,%11INDIC),%11I2,%11VALL Q
 S %11VALL=^PILANVAL($J,%11NIV,%11INDIC,%11I2,"VAL")
 I %11VALL="!@#$%^&*()" K @(^PILANVAL($J,%11NIV,%11INDIC,%11I2,"NOM")) G BOUCV
 S @^PILANVAL($J,%11NIV,%11INDIC,%11I2,"NOM")=%11VALL G BOUCV
 ;

