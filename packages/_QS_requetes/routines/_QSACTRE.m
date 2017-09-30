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
;! HL002 ! HL     ! 20/07/12 ! PB saut de ligne sur terminal-gnome            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSACTRE^INT^1^59547,73880^0
RQSACTRE(REQ,BASE) 
 
 
 
 
 
 
DEB N TABC
 S TABC(1)="OUI",TABC(2)="NON"
 G:^[QUI]RQS1(REQ,"ACTIVATIONS")'=0 S
;HL002 L0 D POCLEPA^%VVIDEO,^%VSQUEAK S BID=$$MES^%VZECHO($$^%QZCHW("Cette requete n'a jamais ete activee, continuons-nous ? :"),"TABC")
L0 D POCLEPA^%VVIDEO,^%VSQUEAK S ($X,$Y)=0 X XY S BID=$$MES^%VZECHO($$^%QZCHW("Cette requete n'a jamais ete activee, continuons-nous ? :"),"TABC")
 F I=1,6,10,"OUI","NON" G:I=BID @I
1 S RQSRESUL="" G FIN
6 G 1
10 D ^%QSQUESI G L0
NON G 1
OUI G ACT
 D ^%VSQUEAK G L0
S D POCLEPA^%VVIDEO S BID=$$MES^%VZECHO($$^%QZCHW("Requete deja activee, voulez vous recommencer ? : "),"TABC")
 
 F I=1,6,10,"OUI","NON" G:I=BID @("X"_I)
 D ^%VSQUEAK G S
X1 S RQSRESUL="" G FIN
X6 G X1
X10 D ^%QSQUESI G S
XNON G 1
XOUI G ACT
RECUP 
 
 S RQSRESUL=%ACT D REAFF^%QSQUEST G:RQSRESUL="" S
 S ^[QUI]RQS2(RQSRESUL,"DERNIERE.UTILISATION")=$H
 Q
ACT 
LL G LL73
 R *BID F I=1,6,73,78 G:I=BID @("LL"_I)
 D ^%VSQUEAK G LL
LL1 S RQSRESUL="" G FIN
LL6 G LL1
LL73 D ^%QSGOREQ(REQ,BASE) G FIN
LL78 D ADD^%QS3BATC(REQ),POCLEPA^%VVIDEO W $$^%QZCHW("OK") H 1 G LL1
FIN K BID,I
 Q
 ;

