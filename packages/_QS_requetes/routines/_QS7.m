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

;%QS7^INT^1^59547,73880^0
%QS7 ;
 
 
 
 
 
DAFF() N ENS,REQ,I,REP,MOD,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S ENS=$$CONCAS^%QZCHAD(TEMP,"E")
 D ^%QUAPAD($$^%QZCHW("SUPPRESSION DE REQUETE(S)"))
 D ENS^%QUAPAGM(ENS) I $D(@ENS)=0 K @(TEMP) Q 1
 S REP=0
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer cette(ces) requete(s) ?"))
 G:REP'=1 FIN
 D POCLEPA^%VVIDEO
 S MOD=0 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression des listes associees a cette(ces) requete(s) ?"))=1 S MOD=1
 S REQ="" F I=1:1 S REQ=$O(@ENS@(REQ)) Q:REQ=""  D POCLEPA^%VVIDEO,^%VZEATT,^%QSUPREQ(REQ,MOD)
 
FIN D INIT2^%QUAPAGM
 K @(TEMP)
 Q 2
 
 
 
 
 
 
 
L1 S ACT=$S('($D(^[QUI]RQS1(REQ,"ACTIVATIONS"))):0,1:^[QUI]RQS1(REQ,"ACTIVATIONS")) I ACT=0 S MOD=1 G GO
 D POCLEPA^%VVIDEO,^%VSQUEAK
 W $$^%QZCHW("La requete ")_REQ_$$^%QZCHW(" a ete activee ")_ACT_$$^%QZCHW(" fois ...") H 3
 G GO
L2 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer les listes de cette requete ? : "))=1 D POCLEPA^%VVIDEO G 79
 D POCLEPA^%VVIDEO
78 S MOD=0 G GO
79 S MOD=1 G GO
GO S MOD=1 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer la requete  "_REQ_"  ? "))=1 D POCLEPA^%VVIDEO G Z79
 D POCLEPA^%VVIDEO Q
Z79 D ^%QSUPREQ(REQ,MOD) Q
CAD S DXG=10,DYH=10,LH=60,LV=3,BLD=1 D CARS^%VVIDEO S DX=12,DY=11 X XY W $$^%QZCHW("Requete : ") S DX=$X,DY=$Y W $J("",$L(REQ)) X XY W REQ X XY Q
TET D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("SUPPRESSION REQUETE") D 4^%VZCD Q

