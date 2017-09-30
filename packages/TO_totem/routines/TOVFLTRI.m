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

;TOVFLTRI^INT^1^59547,74876^0
TOVFLTRI ;
 
 I '(DTM) K (%PROGEX,ARTI,QUI,%CHOIX,%NARTI,%UCATT,%XXX,%EX,%ADR,UU) G SUIT
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%PROGEX","ARTI","QUI","%CHOIX","%NARTI","%UCATT","%XXX","%EX","%ADR","UU","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
SUIT D CURRENT^%IS,VARSYS^%QCSAP
 S PART="VALI"_ARTI_"/",VART=$P(PART,"/",1)_$C($A("/")-1)_"z",SCR="IMPTRIP",NOMTAB="^[QUI]IMPTRIP"
 F WB=0:0 S VART=$N(^[QUI]IMPTRIP(VART)) Q:(VART=-1)!($E(VART,1,$L(PART))'=PART)  S %B2=-1 F WC=0:0 S %B2=$N(^[QUI]IMPTRIP(VART,%B2)) Q:%B2=-1  S %B3=-1 F WD=0:0 S %B3=$N(^[QUI]IMPTRIP(VART,%B2,%B3)) Q:%B3=-1  D TRAIT
FIN Q
TRAIT W !,$$^%QZCHW("TRIPLET"),!,?5,%B2," ",%B3
 I $D(^[QUI]FLTRIP(VART,%B2,%B3)) G END
 W !,?5,$$^%QZCHW("Correspondant FULL MATCH inexistant"),!
END Q

