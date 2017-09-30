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

;%QZCHNET^INT^1^59547,73887^0
ZNETCHA ;
 
 
 
 
 
 
DEB N LON,I,%CAR
 S %NCH="",LON=$L(%OCH) Q:LON=0
 
 S I=0
LOOP S I=I+1 G:I>LON FIN
 S %CAR=$E(%OCH,I) S:$A(%CAR)'<32 %NCH=%NCH_%CAR
 G LOOP
FIN K LON,%CAR Q
ADR(%OCH) 
 N %NCH
 D DEB Q %NCH
 
ELIM(%CH,%C) 
 Q:%CH'[%C %CH
 N %NCH,%LON
 S %NCH=%CH
BEL1 I $E(%NCH)=%C S %NCH=$E(%NCH,2,999999) G BEL1
 S %LON=$L(%NCH)
BEL2 I $E(%NCH,%LON)=%C S %NCH=$E(%NCH,1,%LON-1),%LON=%LON-1 G BEL2
 Q %NCH
 
NET(%OCH) 
 N %NCH,LON,I,%CAR
 S %NCH="",LON=$L(%OCH) Q:LON=0
 S I=0
NETL S I=I+1 G:I>LON NETF S %CAR=$E(%OCH,I) S:($A(%CAR)>31)&($A(%CAR)<127) %NCH=%NCH_%CAR G NETL
NETF Q %NCH
 
 
ELIMALL(%CH,%C) Q $TR(%CH,%C,"")
 
TEST W !,"CHAINE A TESTER : " R %OCH Q:%OCH=""  W "  LONGUEUR : ",$L(%OCH) D ZNETCHA W !,"NOUVELLE CHAINE : ",%NCH,"  LONGUEUR : ",$L(%NCH) G TEST

