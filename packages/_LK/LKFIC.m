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

;LKFIC^INT^1^59547,74867^0
LKFIC(APP,NODE,DATE,FIC) 
 
 
 
 
 
 N GLO
 S GLO=$$CONCAT^%QZCHAD("^[QUI]LK",$$S1^%QZCHAD(APP)_","_$$S1^%QZCHAD(NODE)_","_$$S1^%QZCHAD(DATE)_",""DATA"","_1)
 D INT(GLO,FIC)
 Q
 
CHARG(APP,NODE,DATE,FIC,NUM) 
 N GLO,I,J,K,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(TEMP)
 D INT(TEMP,FIC)
 S GLO=$$CONCAT^%QZCHAD("^[QUI]LK",$$S1^%QZCHAD(APP)_","_$$S1^%QZCHAD(NODE)_","_$$S1^%QZCHAD(DATE)_",""DATA"","_1)
 S J=0
 F I=1:NUM Q:'($D(@TEMP@(I)))  S J=J+1 F K=1:1:NUM S @GLO@(J,K)=$S($D(@TEMP@((I+K)-1)):@TEMP@((I+K)-1),1:"")
 K @(TEMP)
 Q
 
INT(GLO,FIC) 
 N A,I,MAX,DATE,DATE1,B
 S DATE1=$$TEMPS^%QMDATE
 D LIREFIC^%SYSUTI1(GLO,1,FIC)
 Q
 
 
 
W(APP,NODE,DATE,FIC) 
 
 N GLO
 S GLO=$$CONCAT^%QZCHAD("^[QUI]LK",$$S1^%QZCHAD(APP)_","_$$S1^%QZCHAD(NODE)_","_$$S1^%QZCHAD(DATE)_",""DATA"","_1)
 D OUT(GLO,FIC)
 Q
 
OUT(GLO,FIC) 
 N A,I,MAX,DATE,DATE1,B
 S DATE1=$$TEMPS^%QMDATE
 S B=0
 D ECRFIC^%SYSUTI1(GLO,1,FIC)
 Q
ECRIRE(GLO,FIRST,FIC) 
 D ECRFIC^%SYSUTI1(GLO,FIRST,FIC)
 Q
 
 
TEST W !,"transfert fichier--->global",!
 W "VOTRE FICHIER " R A Q:A=""
 K ^[QUI]LK("TEST","A1",A)
 D ^LKFIC("TEST","A1",A,A)
 W !,"le resultat est ds ^[qui]lk(""test"",""a1"","_A_") "
 Q
TEST1 W !,"transfert global --->fichier",!
 W "VOTRE FICHIER " R A Q:A=""
 D W^LKFIC("TEST","A1",A,A)
 W !,"le resultat est ds ",A
 Q

