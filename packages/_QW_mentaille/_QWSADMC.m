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

;%QWSADMC^INT^1^59547,73886^0
QWSADMC ;
 
 
 
 
 
 
 N C,I,DOMCON,DOMCOUR,LEVCONS,NXTD,CTR,GLODOM,UCAFFI,UCMODIF,UCSUPP,UCAJOUT,UCFOND,TABC
 
 S UCAFFI="AFFI^%QWSADM",UCMODIF="MODIF^%QWSADM",UCSUPP="SUPP^%QWSADM"
 S UCAJOUT="AJOUT^%QWSADM",UCFOND="FOND^%QWSADM"
 S GLODOM="^[QUI]RQSGLO(""QW"",""DOM"")"
 
VCMS D CLEPAG^%VVIDEO
 S CTR=$$GETPAR^%QWSADMU(1,0,"DOMCON") Q:CTR="A"
 I DOMCON="" S LEVCONS=1,DOMCOUR=$O(@GLODOM@("")) G L0
 S LEVCONS=0,DOMCOUR=DOMCON
 
L0 I (DOMCOUR="")!(DOMCOUR="z") D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) Q
 D @(UCAFFI_"(DOMCOUR)")
LL S TABC(1)="CONSULTER",TABC(2)="MODIFIER",TABC(3)="AJOUTER",TABC(4)="SUPPRIMER",TABC(5)="MOINS"
BCL D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,18,"CONSULTER","MODIFIER","AJOUTER","SUPPRIMER","MOINS" I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G BCL
1 G VCMS
6 Q
18 G LL
 
CONS 
 G:LEVCONS=0 YAPLUS
 S NXTD=$O(@GLODOM@(DOMCOUR)) G:(NXTD="")!(NXTD="z") YAPLUS
 S DOMCOUR=NXTD
 D @(UCAFFI_"(DOMCOUR)")
 G BCL
 
MOIN 
 G:LEVCONS=0 YAPLUS
 S NXTD=$ZP(@GLODOM@(DOMCOUR)) G:NXTD="" YAPLUS
 S DOMCOUR=NXTD
 D @(UCAFFI_"(DOMCOUR)")
 G BCL
 
YAPLUS D ^%VZEAVT($$^%QZCHW("Recherche epuisee")) G BCL
 
MODI 
 D @(UCMODIF_"(DOMCOUR)")
 G BCL
 
AJOU 
 D CLEPAG^%VVIDEO
 S CTR=$$GETPAR^%QWSADMU(1,1,"DOMAJ") G:CTR="A" BCL
 D @UCFOND
 D @(UCAJOUT_"(DOMAJ)")
 G BCL
SUPP 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de ce domaine et de ses regles")_" ?")'=1 G BCL
 D @(UCSUPP_"(DOMCOUR)")
 G BCL
 
 
AJ 
 N CTR,DOM
AJ2 D CLEPAG^%VVIDEO
 S CTR=$$GETPAR^%QWSADMU(1,1,"DOM") Q:CTR="A"
 I DOM="" Q
 D AJOUT^%QWSADM(DOM)
 G AJ2

