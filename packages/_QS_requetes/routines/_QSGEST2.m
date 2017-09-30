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

;%QSGEST2^INT^1^59547,73881^0
%QSGEST2 ;;02:41 PM  4 Sep 1996
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RECOP(B,O1,O2,LB) 
 D RECOP^%QSGEST4(B,O1,O2,LB,QUI)
 Q
 
 
 
ALL(B,O1,O2) 
 D ALL^%QSGEST4(B,O1,O2,QUI) Q
 
 
 
 
 
 
KILL(BASE) N O,%O S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(BASE,O)) Q:O=""  D SX^%QSGESTK(BASE,O)
 Q
TEST W !,"Base : " R B Q:B=""
L1 W !,"Objet a recopier : " R S G:S="" TEST
L2 W !,"Destination de la recopie : " R D G:D="" L1
L3 W !,"Base autorisee : " R BA G:BA="" GO S BB(BA)="" G L3
GO D RECOP(B,S,D,.BB) G TEST
 
MAJLIEN(REP,O1,O2,LB) 
 
 
 
 
 
 N PREF,CLE,NCLE,T,REP2,LI,VAL
 S PREF="^[QUI]QUERYV(REP,O1)"
 G:'($D(@PREF)) FIN
BOLIEN 
 S PREF=$$^%Q($Q(@PREF))
 G:PREF="" FIN
 S PREF="^[QUI]"_$E(PREF,2,$L(PREF))
 D ^%QCAGLCN(PREF,"CLE")
 G:(CLE(1)'=REP)!(CLE(2)'=O1) FIN
 
 S CLE(5)=CLE(4),CLEF(4)=@PREF
 S T=$$TYPE^%QSGEST9(REP,CLE(3))
 I T'=3 G BOLIEN
 S REP2=$$REPD^%QSGEL2(REP,CLE(3))
 S LI=$$LIENI^%QSGEL2(REP,REP2,CLE(3),T)
 D ADDS^%QSGEST3(REP2,CLE(4),LI,REP,O2)
 G BOLIEN
FIN 
 Q

