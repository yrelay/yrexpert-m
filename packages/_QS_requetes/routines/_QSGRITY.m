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

;%QSGRITY^INT^1^59547,73882^0
RQSINTEG ;
 
 
 
 
DIALOG D POCLEPA^%VVIDEO,^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("Cette operation risque d'etre longue, persistez-vous ? : "),"O")'=1 G FIN D POCLEPA^%VVIDEO
 N A,%A,B,%B,BID,CO,O,%O,R,%R,V,%V S CO=0
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY1 en cours de verification ...")
 S B="" F %B=0:0 S B=$O(^[QUI]QUERY1(B)) Q:B=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY1(B,O)) Q:O=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY1(B,O,A)) Q:A=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY1(B,O,A,V)) Q:V=""  D TB1
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY2 en cours de verification ...")
 S B="" F %B=0:0 S B=$O(^[QUI]QUERY2(B)) Q:B=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY2(B,A)) Q:A=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY2(B,A,V)) Q:V=""  S R="" F %R=0:0 S R=$O(^[QUI]QUERY2(B,A,V,R)) Q:R=""  D TB2
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY3 en cours de verification ...")
 S B="" F %B=0:0 S B=$O(^[QUI]QUERY3(B)) Q:B=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY3(B,O)) Q:O=""  S R="" F %R=0:0 S R=$O(^[QUI]QUERY3(B,O,R)) Q:R=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY3(B,O,R,A)) Q:A=""  D TB3
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY4 en cours de verification ...")
 S B="" F %B=0:0 S B=$O(^[QUI]QUERY4(B)) Q:B=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY4(B,V)) Q:V=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY4(B,V,A)) Q:A=""  S R="" F %R=0:0 S R=$O(^[QUI]QUERY4(B,V,A,R)) Q:R=""  D TB4
FIN Q
TB1 S R="" F %R=0:0 S R=$O(^[QUI]QUERY1(B,O,A,V,R)) Q:R=""  W:CO=0 "*" S CO=(CO+1)#10,^[QUI]QUERY1(B,O,A,V,R)="",^[QUI]QUERY2(B,A,V,R,O)="",^[QUI]QUERY3(B,O,R,A,V)="",^[QUI]QUERY4(B,V,A,R,O)=""
 Q
TB2 S O="" F %O=0:0 S O=$O(^[QUI]QUERY2(B,A,V,R,O)) Q:O=""  W:CO=0 "*" S CO=(CO+1)#10,^[QUI]QUERY1(B,O,A,V,R)="",^[QUI]QUERY2(B,A,V,R,O)="",^[QUI]QUERY3(B,O,R,A,V)="",^[QUI]QUERY4(B,V,A,R,O)=""
 Q
TB3 S V="" F %V=0:0 S V=$O(^[QUI]QUERY3(B,O,R,A,V)) Q:V=""  W:CO=0 "*" S CO=(CO+1)#10,^[QUI]QUERY1(B,O,A,V,R)="",^[QUI]QUERY2(B,A,V,R,O)="",^[QUI]QUERY3(B,O,R,A,V)="",^[QUI]QUERY4(B,V,A,R,O)=""
 Q
TB4 S O="" F %O=0:0 S O=$O(^[QUI]QUERY4(B,V,A,R,O)) Q:O=""  W:CO=0 "*" S CO=(CO+1)#10,^[QUI]QUERY1(B,O,A,V,R)="",^[QUI]QUERY2(B,A,V,R,O)="",^[QUI]QUERY3(B,O,R,A,V)="",^[QUI]QUERY4(B,V,A,R,O)=""
 Q

