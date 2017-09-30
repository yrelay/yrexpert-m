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

;TORQY6^INT^1^59547,74875^0
TORQY6(LISTE,DIA,TEST) 
 
 
 
 
 
 
 
 
 
 
 
 N NU,N,I,IND,ORDRE,REP,RI,TEMP,PRIS S TEST=1
 S RI=$$RI^TORQXIN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PRIS=$$CONCAS^%QZCHAD(TEMP,"PRIS") K @(TEMP)
 
 S NU="" F N=1:1 S NU=$O(@LISTE@(NU)) Q:'(TEST)  Q:NU=""  D TESTS(NU,DIA,.TEST)
 K @(TEMP) Q
 
 
TESTS(NU,DIA,TEST) 
 S NU2=$$^%QSCALVA(RI,NU,"NUMERO.ETUDE")
 I NU2="" D:DIA=1 ^%VZEAVT($$^%QZCHW("Transfert impossible de l'etude ")_NU_$$^%QZCHW(" l'attribut NUMERO.ETUDE n'existe pas")) K @LISTE@(NU) S:DIA=0 TEST=0 Q
 S TWREF=$$^%QSCALVA(RI,NU,"COMPOSANTS.ETUDE")
 I TWREF="" D:DIA=1 ^%VZEAVT($$^%QZCHW("Transfert impossible de l'etude ")_NU_$$^%QZCHW(" l'attribut COMPOSANTS.ETUDE n'existe pas")) K @LISTE@(NU) S:DIA=0 TEST=0 Q
 I '($D(@("^[QUI]TREEWORK(NU2,"_TWREF_")"))) D:DIA=1 ^%VZEAVT($$^%QZCHW("Transfert impossible de l'etude ")_NU) K @LISTE@(NU) S:DIA=0 TEST=0 Q
 S ARTI=$P(@("^[QUI]TREEWORK(NU2,"_TWREF_")"),"^",2)
 I '($D(^[QUI]ANTETUDE(ARTI,NU2,TWREF))) D:DIA=1 ^%VZEAVT("Transfert impossible de l'etude "_%CUK) K @LISTE@(NU) S:DIA=0 TEST=0 Q
 N GLOBA D MV^%QSCALVA(RI,NU,"INDIVIDU.RECEPTEUR",.GLOBA)
 I GLOBA=0 D:DIA=1 ^%VZEAVT($$^%QZCHW("Veuillez associer au moins un couple individu,repertoire a l'etude ")_NU_$$^%QZCHW(" afin d'effectuer le transfert")) S TEST=0 Q
 
 N GLOB D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR",.GLOB)
 I GLOB=0 D:DIA=1 ^%VZEAVT($$^%QZCHW("Veuillez associer au moins un couple individu,repertoire a l'etude ")_NU_$$^%QZCHW(" afin d'effectuer le transfert")) S TEST=0 Q
 
 N GLOB1 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.GAMME",.GLOB1)
 I (GLOB1=0)&($$^%QSCALVA(RI,NU,"GAMME")=1) D:DIA=1 ^%VZEAVT($$^%QZCHW("Veuillez associer au moins un couple individu,repertoire a l'etude ")_NU_$$^%QZCHW(" afin d'effectuer le transfert")) S TEST=0 Q
 
 N GLOB2 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",.GLOB2)
 
 N GLOB4 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",.GLOB4)
 I (GLOB4=0)&($$^%QSCALVA(RI,NU,"NOMENCLATURE")=1) D:DIA=1 ^%VZEAVT($$^%QZCHW("Veuillez associer au moins un repertoire.recepteur.nomenclature a l'etude ")_NU_$$^%QZCHW(" afin d'effectuer le transfert")) S TEST=0 Q
 
 N GLOB5 D MV^%QSCALVA(RI,NU,"NOMENCLATURE.LIEN",.GLOB5)
 S ORDRE="" F I=1:1 S ORDRE=$O(GLOBA(ORDRE)) Q:'(TEST)  Q:ORDRE=""  D GLOTEST
 Q
GLOTEST 
 D TESTIND^TORQY61(NU,ORDRE,DIA,.TEST)
 Q:'(TEST)
 D INDPRIS^TORQY61(NU,ORDRE,DIA,.TEST)
 Q:'(TEST)
 D STATUT^TORQY61(NU,DIA,.TEST)
 Q

