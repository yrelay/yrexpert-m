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

;%ATNREM^INT^1^59547,73866^0
%ATNREM ;;05:37 PM  16 Nov 1992; 25 Oct 92  9:47 AM ; 26 Apr 93 11:03 AM
 
 
INITREM(ATN) 
 N ET1,ET2,E1,E2
 K ^[QUI]RQSGLO("ATN",ATN,"R")
 Q:'($D(^[QUI]RQSGLO("ATN",ATN,"T")))
 S ET1=""
 F ET=1:1 S ET1=$O(^[QUI]RQSGLO("ATN",ATN,"T",ET1)) Q:ET1=""  S ET2="" F E2=0:0 S ET2=$O(^[QUI]RQSGLO("ATN",ATN,"T",ET1,ET2)) Q:ET2=""  D I2
 Q
I2 I $D(^[QUI]RQSGLO("ATN",ATN,"T",ET1,ET2,1)),^[QUI]RQSGLO("ATN",ATN,"T",ET1,ET2,1)'="SINON" G I22
 I ('($D(^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2))))&('($D(^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2)))) S ^[QUI]RQSGLO("ATN",ATN,"R",ET1,0,ET2)="" Q
I22 I '($D(^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2))) S (BONUS,^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2))=1 G I23
 S BONUS=^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2)
I23 I '($D(^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2))) S (MALUS,^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2))=1 G I24
 S MALUS=^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2)
I24 S ^[QUI]RQSGLO("ATN",ATN,"R",ET1,BONUS/(BONUS+MALUS),ET2)="" Q
 Q
EXIREM(ATN) Q $D(^[QUI]RQSGLO("ATN",ATN,"R"))
 
KILLREM(ATN) K ^[QUI]RQSGLO("ATN",ATN,"R") Q
 
REINIT(ATN) 
 K ^[QUI]RQSGLO("ATN",ATN,"R"),^[QUI]RQSGLO("ATN",ATN,"RM"),^[QUI]RQSGLO("ATN",ATN,"RB") Q
 
BONUS(ATN,ET1,ET2,BONUS) 
 S ^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2)=$S('($D(^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2))):1+BONUS,1:^[QUI]RQSGLO("ATN",ATN,"RB",ET1,ET2)+BONUS)
 Q
 
 
MALUS(ATN,ET1,ET2,MALUS) 
 S ^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2)=$S('($D(^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2))):1+MALUS,1:^[QUI]RQSGLO("ATN",ATN,"RM",ET1,ET2)+MALUS)
 Q

