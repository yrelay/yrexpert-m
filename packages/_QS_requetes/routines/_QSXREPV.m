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

;%QSXREPV^INT^1^59547,73884^0
%QSXREPV ;;10:34 AM  19 Oct 1993;
 
 
 
TQUERY2 W $$HEURE^%QMDATE D REPAR2
TQUERY3 W $$HEURE^%QMDATE D REPAR3
TQUERY4 W $$HEURE^%QMDATE D REPAR4
 Q
 
 
 
REPAR2 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY2(C1)) Q:C1=""  D REPAR21(C1)
 Q
REPAR21(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY2(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY2(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY2(C1,C2,C3,C4)) Q:C4=""  D T2
 Q
T2 S N=N+1 W:(N#1000)=0 "%" S C5=""
 F %C5=0:0 S C5=$O(^[QUI]QUERY2(C1,C2,C3,C4,C5)) Q:C5=""  I $G(^[QUI]QUERYV(C1,C5,C2,C4))'=C3 S ^[QUI]QUERYV(C1,C5,C2,C4)=C3
 Q
 
 
REPAR3 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY3(C1)) Q:C1=""  D REPAR31(C1)
 Q
REPAR31(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY3(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY3(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY3(C1,C2,C3,C4)) Q:C4=""  D T3
 Q
T3 S N=N+1 W:(N#1000)=0 "%"
 S C5="" F %C5=0:0 S C5=$O(^[QUI]QUERY3(C1,C2,C3,C4,C5)) Q:C5=""  I $G(^[QUI]QUERYV(C1,C2,C4,C3))'=C5 S ^[QUI]QUERYV(C1,C2,C4,C3)=C5
 Q
 
 
REPAR4 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY4(C1)) Q:C1=""  D REPAR41(C1)
 Q
REPAR41(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY4(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY4(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY4(C1,C2,C3,C4)) Q:C4=""  D T4
 Q
T4 S N=N+1 W:(N#1000)=0 "%"
 S C5="" F %C5=0:0 S C5=$O(^[QUI]QUERY4(C1,C2,C3,C4,C5)) Q:C5=""  I $G(^[QUI]QUERYV(C1,C5,C3,C4))'=C2 S ^[QUI]QUERYV(C1,C5,C3,C4)=C2
 Q
 ;

