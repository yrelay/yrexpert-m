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

;DTERM1^INT^1^59547,74866^0
ZS ;
LEC D BLD^%VVIDEO W !,!,"signal " D NORM^%VVIDEO W "(T)est  (A)nnulation  (L)ister  (D)estinataire   [D] ? " R *REP G FIN:REP=1 G:REP=13 SET S REP=$C(REP) G SET:REP="D",NUL:REP="A",LIS:REP="L",TEST:REP="T",LEC
SET N DEV W !,"code: " R COD G LEC:COD=""
 W !,"console: ",$I S ^ZS1(COD)=$I G LEC
NUL W !,"code: " R COD G LEC:COD="" I '($D(^ZS1(COD))) W " ???" G NUL
 K ^ZS1(COD) W !,"OK." G LEC
LIS S COD="" F U=0:0 S COD=$O(^ZS1(COD)) G LEC:COD="" W !,COD,?10,^ZS1(COD)
 G LEC
S(COD) 
 S DEV=$$^%QCAZG("^ZS1(COD)") G FIN:DEV=""
 F U=1,2,3 D ^%DTERM($C(7),DEV) H 1
 S CH="******** VOICI LE SIGNAL ATTENDU (CODE "_COD_") ********"
 D ^%DTERM(CH,DEV) G FIN
TEST W !,"code: " R COD G LEC:COD=""
 D S(COD) G LEC
FIN K CH,COD,DEV,REP

