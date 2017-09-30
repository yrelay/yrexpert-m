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

;%QS1GRIT^INT^1^59547,73880^0
RQS1GRIT ;
 
 
 
 
 D POCLEPA^%VVIDEO,^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("Cette operation risque d'etre longue, persistez-vous ? : "),"N")'=1 G FIN D POCLEPA^%VVIDEO
 S CO=0,B=%U7
 S O=-1 F %O=0:0 S O=$N(^[QUI]QUERY1(B,O)) Q:O=-1  S A=-1 F %A=0:0 S A=$N(^[QUI]QUERY1(B,O,A)) Q:A=-1  S V=-1 F %V=0:0 S V=$N(^[QUI]QUERY1(B,O,A,V)) Q:V=-1  D TB1
 S A=-1 F %A=0:0 S A=$N(^[QUI]QUERY2(B,A)) Q:A=-1  S V=-1 F %V=0:0 S V=$N(^[QUI]QUERY2(B,A,V)) Q:V=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]QUERY2(B,A,V,R)) Q:R=-1  D TB2
 S O=-1 F %O=0:0 S O=$N(^[QUI]QUERY3(B,O)) Q:O=-1  S R=-1 F %R=0:0 S R=$N(^[QUI]QUERY3(B,O,R)) Q:R=-1  S A=-1 F %A=0:0 S A=$N(^[QUI]QUERY3(B,O,R,A)) Q:A=-1  D TB3
 S R=-1 F %R=0:0 S R=$N(^[QUI]QUERY4(B,R)) Q:R=-1  S A=-1 F %A=0:0 S A=$N(^[QUI]QUERY4(B,R,A)) Q:A=-1  S V=-1 F %V=0:0 S V=$N(^[QUI]QUERY4(B,R,A,V)) Q:V=-1  D TB4
FIN K A,%A,B,BID,CO,O,%O,R,%R,V,%V Q
TB1 S R=-1 F %R=0:0 S R=$N(^[QUI]QUERY1(B,O,A,V,R)) Q:R=-1  D T
 Q
TB2 S O=-1 F %O=0:0 S O=$N(^[QUI]QUERY2(B,A,V,R,O)) Q:O=-1  D T
 Q
TB3 S V=-1 F %V=0:0 S V=$N(^[QUI]QUERY3(B,O,R,A,V)) Q:V=-1  D T
 Q
TB4 S O=-1 F %O=0:0 S O=$N(^[QUI]QUERY4(B,R,A,V,O)) Q:O=-1  D T
 Q
T W:CO=0 "*" S CO=(CO+1)#10,^[QUI]QUERY1(B,O,A,V,R)="",^[QUI]QUERY2(B,A,V,R,O)="",^[QUI]QUERY3(B,O,R,A,V)="",^[QUI]QUERY4(B,R,A,V,O)="" Q

