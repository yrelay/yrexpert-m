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

;%SRPOP^INT^1^59547,73891^0
SRPOP ;
 
 
 
 N SA,ADRSA,POP,VALPOP
DEB D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un masque de saisie"),0)
 S SA=$$UN^%PKCHOIX($$ADR^%SRSAIS2,30,3,17)
 Q:SA=""
 D ATT^%PKUTIL(10,10,$$^%QZCHW("Un instant...Recherche en cours"),"R")
 S ADRSA=$$CONCAT^%QZCHAD($$ADR^%SRSAIS2,""""_SA_"""")
 S CH="",POP=0
 F %CH=0:0 S CH=$O(@ADRSA@("CHAMPS",CH)) Q:CH=""  I @ADRSA@("CHAMPS",CH)["$POPER" S POP=1 Q
 I POP=0 D MESS^%PKUTIL(10,10,$$^%QZCHW("Aucun champ de cette saisie n'est pope"),1) G DEB
 S VALPOP=$S(($D(^[QUI]RQSGLO("SR","CPT",SA))#10)=0:0,1:^[QUI]RQSGLO("SR","CPT",SA))
LEC S VAL=VALPOP
 G:'($$VAL^%PKUTIL(10,10,$$^%QZCHW("Nouvelle valeur du compteur :"),0,.VAL)) DEB
 I VAL="" G DEB
 I '($$PARA^%QZNBN1(VAL)) D MESS^%PKUTIL(15,12,$$^%QZCHW("Valeur numerique SVP"),1) G LEC
 I VAL<VALPOP D MESS^%PKUTIL(15,12,$$^%QZCHW("ATTENTION !!! Nouvelle valeur inferieure a l'ancienne"),1) G:'($$POS^%PKOUNO($$^%QZCHW("Confirmez vous la modification ?"),"N",17,12)) LEC
 S ^[QUI]RQSGLO("SR",SA,"CPT")=VAL
 G DEB

