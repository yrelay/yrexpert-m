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

;%QWSAAJ^INT^1^59547,73886^0
QWSAAJ ;
 
 
 
 
R3 D AJOUTER("^[QUI]RQSGLO(""QW"",""R3"")","AFFI^%QWSAR3","AJOUT^%QWSAR3","FOND^%QWSAR3") Q
 
R4 D AJOUTER("^[QUI]RQSGLO(""QW"",""R4"")","AFFI^%QWSAR4","AJOUT^%QWSAR4","FOND^%QWSAR4") Q
 
META D AJOUTER("^[QUI]RQSGLO(""QW"",""MC"")","AFFI^%QWSAMC","AJOUT^%QWSAMC","FOND^%QWSAMC") Q
 
AJOUTER(GLOREG,UCAFFI,UCAJOUT,UCFOND) 
 N TABC,I,C
 S TABC(1)="AJOUT",TABC(2)="FIN"
 G AJOU
BCL D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"AJOUT","FIN" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G BCL
1 Q
6 Q
18 D @(UCAFFI_"(DOMAJ,REGAJ)")
 G BCL
 
AJOU 
 D CLEPAG^%VVIDEO
 I $$GETPAR^%QWSARGU(GLOREG,1,1,"DOMAJ","REGAJ")="A" G BCL
 D @(UCAJOUT_"(DOMAJ,REGAJ)")
 G BCL
 
FIN Q

