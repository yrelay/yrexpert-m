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

;%QS2^INT^1^59547,73880^0
%QS2 ;
 
 
 
 
DAFF() 
DAFF2 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Nom de la nouvelle requete : ")) D POCLEPA^%VVIDEO Q:CTRLA!(Y1="") 1
 I $D(^[QUI]RQS1(Y1)) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Cette requete existe deja ...")) G DAFF2
 N REQ S REQ=Y1 D INT(REQ) Q:'(OK) 2 D INIT2^%QUAPAGM,AFFP^%QUAPAGM(REQ) Q 2
 
INT(REQUETE) D ^%QSQUEST(REQUETE,1) G:'(OK) ERR
 D CREER^%TLQUER("q."_REQUETE)
 N TABC
L1 D POCLEPA^%VVIDEO S TABC(1)="OUI",TABC(2)="NON",BID=$$MES^%VZECHO($$^%QZCHW("Activation de la requete ? : "),"TABC") S:BID="OUI" BID=79 S:BID="NON" BID=78
 F I=1,6,9,13,78,79 G:I=BID @I
 D ^%VSQUEAK G L1
1 S RQSRESUL="" G FIN
6 G 1
9 D ^%QSQUESI G L1
13 G 79
78 D POCLEPA^%VVIDEO
 G 1
 I $$MES^%VZEOUI("Voulez-vous qu'elle soit activee cette nuit ? : ","O")'=1 G 1
B79 D ADD^%QS3BATC(REQUETE),POCLEPA^%VVIDEO W $$^%QZCHW("OK") H 1 G 1
79 D DEB^%VTIME,^%QSGOREQ(REQUETE,BASE) G:RQSRESUL="" FIN
 S ^DERLISTE($I)=RQSRESUL
 D POCLEPA^%VVIDEO W $$^%QZCHW("Le resultat se trouve dans ")
 D BLD^%VVIDEO W RQSRESUL_" ("_^[QUI]RQS2(RQSRESUL,"CARD")_") "
 D NORM^%VVIDEO,AFF^%VTIME W $$^%QZCHW(" ... [RETURN]") R *BID
 G FIN
LX D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous exploiter les resultats tout de suite  ? : "),"O")=1 G C79
 G FIN
C79 D REQU^%QS0D
FIN S OK=1 K BID,CTRLA,DX,DXD,DXG,DY,DYB,DYH,GRAPH,LH,LV,MSG,RQSRESUL,Y1
ERR Q

