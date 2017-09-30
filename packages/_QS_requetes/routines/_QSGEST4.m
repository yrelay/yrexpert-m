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

;%QSGEST4^INT^1^59547,73881^0
%QSGEST4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RECOP(B,O1,O2,LB,DEST) 
 Q:'($D(LB(B)))
 S WHO=QUI
 N A,%A,BA,O,%O,OK,OK1,OK2,V,%V S QUI=DEST D SX^%QSGESTK(B,O2)
 S QUI=WHO,A="" F %A=0:0 S A=$O(^[QUI]QUERYV(B,O1,A)) Q:A=""  D TA
 Q
TA S OK=$D(^[QUI]RQSLIEN(B,A)),OK2=0,OK1=0
 S:OK OK2=$P(^[QUI]RQSLIEN(B,A),"^",1)=2
 S:OK OK1=$P(^[QUI]RQSLIEN(B,A),"^",1)=1
 G:OK1!OK2 TA0 Q:OK
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(B,O1,A,O)) Q:O=""  S V=^[QUI]QUERYV(B,O1,A,O) W "." S QUI=DEST D PA^%QSGESTI(B,O2,A,$S(A="NOM":$$NOMEX^%QSGES10(B,O2),1:V),O) S QUI=WHO D SPE
 Q
TA0 
 S:OK2 BA=$P(^[QUI]RQSLIEN(B,A),"^",2) I OK2 Q:'($D(LB(BA)))
 S V=""
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(B,O1,A,O)) Q:O=""  S V=^[QUI]QUERYV(B,O1,A,O) W "." S QUI=DEST D PA^%QSGESTI(B,O2,A,$$VV,O) S QUI=WHO D:OK2 RECOP($P(^[QUI]RQSLIEN(B,A),"^",2),O1_","_V,O2_","_V,.LB,DEST) D SPE
 Q
VV() Q:'(OK1) V Q $P(O2,",",1,^[QUI]RQSNCLES(B)-1)
 
SPE 
 Q:'($$EX^%QSGESPE(A))
 Q:A'="NOTE"
 D DUPL^%QSNOTE(B,O1,O,DEST,O2,O)
 Q
 
 
ALL(B,O1,O2,DEST) 
 N LB,I,%I
 S I="" F %I=0:0 S I=$O(^[QUI]RQSNOINT(I)) Q:I=""  S LB(I)=""
 D RECOP(B,O1,O2,.LB,DEST) Q
 
 
TEST W !,"Base : " R B Q:B=""
L1 W !,"Objet a recopier : " R S G:S="" TEST
L2 W !,"Destination de la recopie : " R D G:D="" L1
L3 W !,"Base autorisee : " R BA G:BA="" GO S BB(BA)="" G L3
GO D RECOP(B,S,D,.BB,DEST) G TEST

