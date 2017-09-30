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

;%QWSACMS^INT^1^59547,73886^0
%QWSACMS ;
 
 
 
 
 
R3 D CONSUL("^[QUI]RQSGLO(""QW"",""R3"")","AFFI^%QWSAR3","MODIF^%QWSAR3","SUPP^%QWSAR3","AJOUT^%QWSAR3","FOND^%QWSAR3") Q
 
R4 D CONSUL("^[QUI]RQSGLO(""QW"",""R4"")","AFFI^%QWSAR4","MODIF^%QWSAR4","SUPP^%QWSAR4","AJOUT^%QWSAR4","FOND^%QWSAR4") Q
 
META D CONSUL("^[QUI]RQSGLO(""QW"",""MC"")","AFFI^%QWSAMC","MODIF^%QWSAMC","SUPP^%QWSAMC","AJOUT^%QWSAMC","FOND^%QWSAMC") Q
 
CONSUL(GLOREG,UCAFFI,UCMODIF,UCSUPP,UCAJOUT,UCFOND) 
 N DOMCON,REGCON,LEVCONS,NXTR,NXTD
VCMS D CLEPAG^%VVIDEO
 I $$GETPAR^%QWSARGU(GLOREG,1,0,"DOMCON","REGCON")="A" Q
 I DOMCON="" S LEVCONS=2,DOMCOUR=$O(@GLOREG@("")) G:DOMCOUR="" EPUIS S REGCOUR=$O(@GLOREG@(DOMCOUR,"")) G:REGCOUR="" EPUIS G L1
 I REGCON="" S LEVCONS=1,DOMCOUR=DOMCON,REGCOUR=$O(@GLOREG@(DOMCOUR,"")) G:REGCOUR="" EPUIS G L1
 S LEVCONS=0,DOMCOUR=DOMCON,REGCOUR=REGCON
 G L0
 
EPUIS D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) Q
 
L0 I (DOMCOUR="")!(REGCOUR="") G EPUIS
L1 D @(UCAFFI_"(DOMCOUR,REGCOUR)")
LL S TABC(1)="CONSULTER",TABC(2)="MODIFIER",TABC(3)="AJOUTER",TABC(4)="SUPPRIMER",TABC(5)="MOINS"
BCL D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CONSULTER","MODIFIER","AJOUTER","SUPPRIMER","MOINS" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G BCL
1 G VCMS
6 Q
18 G LL
 
CONS 
 G:LEVCONS=0 C0
 S NXTD=DOMCOUR
 S NXTR=$O(@GLOREG@(DOMCOUR,REGCOUR))
 I NXTR="" G:LEVCONS=1 C0 S NXTD=$O(@GLOREG@(DOMCOUR)) G:NXTD="" C0 S NXTR=$O(@GLOREG@(NXTD,"")) G:NXTR="" C0
 S DOMCOUR=NXTD,REGCOUR=NXTR
 D @(UCAFFI_"(DOMCOUR,REGCOUR)")
 G BCL
C0 D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) G BCL
 
MODI 
 D @(UCMODIF_"(DOMCOUR,REGCOUR)")
 G BCL
 
AJOU 
 D CLEPAG^%VVIDEO
 I $$GETPAR^%QWSARGU(GLOREG,1,1,"DOMAJ","REGAJ")="A" G BCL
 D @UCFOND
 D @(UCAJOUT_"(DOMAJ,REGAJ)")
 G BCL
SUPP 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de cette regle")_" ? ")'=1 G BCL
 D @(UCSUPP_"(DOMCOUR,REGCOUR)")
 G BCL
 
MOIN 
 G:LEVCONS=0 C0
 S NXTD=DOMCOUR
 S NXTR=$ZP(@GLOREG@(DOMCOUR,REGCOUR))
 I NXTR="" G:LEVCONS=1 C0 S NXTD=$ZP(@GLOREG@(DOMCOUR)) G:NXTD="" C0 S NXTR=$ZP(@GLOREG@(NXTD,"")) G:NXTR="" C0
 S DOMCOUR=NXTD,REGCOUR=NXTR
 D @(UCAFFI_"(DOMCOUR,REGCOUR)")
 G BCL
M0 D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) G BCL

