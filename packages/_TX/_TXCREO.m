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

;%TXCREO^INT^1^59547,74031^0
%TXCREO ;
 
 
 
 
 
 
 Q:DAAT=""
LHEUR S HEU=$O(^[QUI]RDV(DAAT,HEU)) Q:HEU=""
 S NAME=""
LNOM S NAME=$O(^[QUI]RDV(DAAT,HEU,NAME)) G:NAME="" LHEUR
 S NAIS=""
LNAIS S NAIS=$O(^[QUI]RDV(DAAT,HEU,NAME,NAIS)) G:NAIS="" LNOM
 S COM=""
LCOM S COM=$O(^[QUI]RDV(DAAT,HEU,NAME,NAIS,COM)) G:COM="" LNAIS
 S CH=^[QUI]RDV(DAAT,HEU,NAME,NAIS,COM),PRE=$P(CH,"^",3),OBJ=$E(COM,1,5)
 S:PRE="" PRE="?" S:OBJ="" OBJ="?"
 S ^[QUI]RDUJOUR(NAME,PRE,NAIS,HEU)=OBJ
 G LCOM
 
 
PRES 
 S TROUVE=0
 I $D(^[QUI]RDUJOUR(NAME,PRE,NAIS)) S TROUVE=1,HEU=$O(^[QUI]RDUJOUR(NAME,PRE,NAIS,"")) Q
 I '($D(^[QUI]RDUJOUR(NAME))) G ALORS
 I $D(^[QUI]RDUJOUR(NAME,PRE)) S TROUVE=1,NAIS=$O(^[QUI]RDUJOUR(NAME,PRE,"")),HEU=$O(^[QUI]RDUJOUR(NAME,PRE,NAIS,"")) Q
 S PRE="?" I $D(^[QUI]RDUJOUR(NAME,PRE,NAIS)) S TROUVE=1,HEU=$O(^[QUI]RDUJOUR(NAME,PRE,NAIS,"")) Q
ALORS 
 S TROUVE=-1
 D ^%VZEAVT($$^%QZCHW("Cette personne n'a pas rendez-vous aujourd'hui !!"))
 S $P(^[QUI]RDV(DAAT,"12H",NAME,NAIS,"??"),"^",3)=PRE
 Q

