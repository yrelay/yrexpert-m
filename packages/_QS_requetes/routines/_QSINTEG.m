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

;%QSINTEG^INT^1^59547,73882^0
%QSINTEG ;
 
 
 
 
 
 
 
DIALOG N A,%A,B,%B,BID,CO,DATE,HEURE,%I,I,NE,NT,O,%O,V,%V
DEB D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous detecter toutes les incoherences ? : "),"O")'=1 Q
79 S DATE=$$DATE^%QMDATE,HEURE=$$HEURE^%QMDATE K ^[QUI]RQSINTEG(DATE,HEURE) S ^[QUI]RQSINTEG(DATE,HEURE)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERYV en cours de verification ...")
 S (NE,NT,CO)=0,B="" F %B=0:0 S B=$O(^[QUI]QUERYV(B)) Q:B=""  S I="" F %I=0:0 S I=$O(^[QUI]QUERYV(B,I)) Q:I=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERYV(B,I,A)) Q:A=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(B,I,A,O)) Q:O=""  D TB1
 S ^[QUI]RQSINTEG(DATE,HEURE,1,"TAUX")=NE/NT,^[QUI]RQSINTEG(DATE,HEURE,1,"ERREURS")=NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERYV Taux d'erreurs = "),NE/NT,$$^%QZCHW(" nb d'erreurs = "),NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY2 en cours de verification ...")
 S (NE,NT,CO)=0,B="" F %B=0:0 S B=$O(^[QUI]QUERY2(B)) Q:B=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY2(B,A)) Q:A=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY2(B,A,V)) Q:V=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY2(B,A,V,O)) Q:O=""  D TB2
 S ^[QUI]RQSINTEG(DATE,HEURE,2,"TAUX")=NE/NT,^[QUI]RQSINTEG(DATE,HEURE,2,"ERREURS")=NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY2 Taux d'erreurs = "),NE/NT,$$^%QZCHW(" nb d'erreurs = "),NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY3 en cours de verification ...")
 S (NE,NT,CO)=0,B="" F %B=0:0 S B=$O(^[QUI]QUERY3(B)) Q:B=""  S I="" F %I=0:0 S I=$O(^[QUI]QUERY3(B,I)) Q:I=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY3(B,I,O)) Q:O=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY3(B,I,O,A)) Q:A=""  D TB3
 S ^[QUI]RQSINTEG(DATE,HEURE,3,"TAUX")=NE/NT,^[QUI]RQSINTEG(DATE,HEURE,3,"ERREURS")=NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY3 Taux d'erreurs = "),NE/NT,$$^%QZCHW(" nb d'erreurs = "),NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY4 en cours de verification ...")
 S (NE,NT,CO)=0,B="" F %B=0:0 S B=$O(^[QUI]QUERY4(B)) Q:B=""  S V="" F %V=0:0 S V=$O(^[QUI]QUERY4(B,V)) Q:V=""  S A="" F %A=0:0 S A=$O(^[QUI]QUERY4(B,V,A)) Q:A=""  S O="" F %O=0:0 S O=$O(^[QUI]QUERY4(B,V,A,O)) Q:O=""  D TB4
 S ^[QUI]RQSINTEG(DATE,HEURE,4,"TAUX")=NE/NT,^[QUI]RQSINTEG(DATE,HEURE,4,"ERREURS")=NE
 D POCLEPA^%VVIDEO W $$^%QZCHW("QUERY4 Taux d'erreurs = "),NE/NT,$$^%QZCHW(" nb d'erreurs = "),NE
 Q
TB1 S V="",V=^[QUI]QUERYV(B,I,A,O) Q:V=""  S CO=CO+1 W:(CO#100)=0 "%" S NT=NT+1 I (('($D(^[QUI]QUERY2(B,A,V,O,I))))!('($D(^[QUI]QUERY3(B,I,O,A,V)))))!('($D(^[QUI]QUERY4(B,V,A,O,I)))) S NE=NE+1 W:(NE#100)=0 "e"
 Q
 
 
TB2 S I=""
TB22 S I=$O(^[QUI]QUERY2(B,A,V,O,I)) Q:I=""
 S CO=CO+1 W:(CO#100)=0 "%" S NT=NT+1
 I (('($D(^[QUI]QUERYV(B,I,A,O))))!('($D(^[QUI]QUERY3(B,I,O,A,V)))))!('($D(^[QUI]QUERY4(B,V,A,O,I)))) S NE=NE+1 W:(NE#100)=0 "e" G TB22
 I $D(^[QUI]QUERYV(B,I,A,O))&(^[QUI]QUERYV(B,I,A,O)'=V) S NE=NE+1 W:(NE#100)=0 "e" G TB22
 G TB22
 
 
TB3 S V=""
TB32 S V=$O(^[QUI]QUERY3(B,I,O,A,V)) Q:V=""
 S CO=CO+1 W:(CO#100)=0 "%" S NT=NT+1
 I (('($D(^[QUI]QUERYV(B,I,A,O))))!('($D(^[QUI]QUERY2(B,A,V,O,I)))))!('($D(^[QUI]QUERY4(B,V,A,O,I)))) S NE=NE+1 W:(NE#100)=0 "e" G TB32
 I $D(^[QUI]QUERYV(B,I,A,O))&(^[QUI]QUERYV(B,I,A,O)'=V) S NE=NE+1 W:(NE#100)=0 "e" G TB32
 G TB32
 
 
TB4 S I=""
TB42 S I=$O(^[QUI]QUERY4(B,V,A,O,I)) Q:I=""
 S CO=CO+1 W:(CO#100)=0 "%" S NT=NT+1
 I (('($D(^[QUI]QUERYV(B,I,A,O))))!('($D(^[QUI]QUERY2(B,A,V,O,I)))))!('($D(^[QUI]QUERY3(B,I,O,A,V)))) S NE=NE+1 W:(NE#100)=0 "e" G TB42
 I $D(^[QUI]QUERYV(B,I,A,O))&(^[QUI]QUERYV(B,I,A,O)'=V) S NE=NE+1 W:(NE#100)=0 "e" G TB42
 G TB42
 ;
 ;

