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

;LKTXNSC^INT^1^59547,74868^0
LKTXNSC ;
 
 
 
 N ER,X,SEL
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="NSC",DATE=$H K @(TEMP)
 S ER=$$LIRE^LKPRIM(APP,"A1",DATE,47,"ASCIIST","PHYNSC1^LKTXNSC1")
 K @(TEMP)
 Q
QUE N ER,X,SEL
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="NSC" K @(TEMP)
 D ^LKLSEL(APP,"A1",SEL)
 D T
 K @(TEMP)
 Q
T N I,SDE,H S SDE=$O(@SEL@(""))
 F I=1:0 Q:SDE=""  D T1 S SDE=$O(@SEL@(SDE))
 Q
T1 S H=@SEL@(SDE)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","NSC1^LKTXNSC1","","",1)
 S ER=$$^LKRQS(APP,"A2",H,H,"NSCRQ","NSC2^LKTXNSC1","","")
 Q
TEST D LKTXNSC Q
XY K ^[QUI]LK("NSC","A2")
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2)) K @(TEMP)
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="NSC" K @(SEL)
 D QUE
 Q
 
DES N TEMP
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 K @(TEMP)
 S APP="NSC"
 D ^LKLDES(APP,"LNODE^LKTXNSC1","A1","")
 K @(TEMP)
 Q
TEST2 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2)) K @(TEMP)
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="NSC",H=53600
 S ER=$$^LKRQS(APP,"A2",H,H,"NSCRQ","NSC2^LKTXNSC1","","")
 Q

