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

;LKTXINU0^INT^1^59547,74868^0
LKTXIN0 ;
 
 
 
FIC N APP,NODE,DATE,FIC
 S APP="INOVAC",NODE="A1",DATE="D",FIC="INOVAC.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 Q
QUE N ER,X,SEL,TEMP,APP,DATE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="INOVAC" K @(TEMP)
 D ^LKLSEL(APP,"A1",SEL)
 D T
 K @(TEMP)
 Q
T N I,SDE,H S SDE=$O(@SEL@(""))
 F I=1:0 Q:SDE=""  D T1 S SDE=$O(@SEL@(SDE))
 Q
T1 S H=@SEL@(SDE)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXINU2","","",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXINU2","","",1)
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","INU2^LKTXINU2","","")
 Q
 
DES N TEMP,APP
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 K @(TEMP)
 S APP="INOVAC"
 D ^LKLDES(APP,"LNODE^LKTXINU2","A1","")
 K @(TEMP)
 Q
BQS(M) Q  N ER,X,SEL,TEMP,APP,DATE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 K @(TEMP)
 S APP="INOVAC",DATE=$H,FIC="INOVAC.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXINU2","","",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXINU2","","",1)
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","INU2^LKTXINU2","","")
 D:M="S" INT^LKLDES(APP,"LNODE^LKTXINU0",DATE)
 K @(TEMP)
 Q
TEST D LKTXINU0 Q
XY S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="INOVAC"
 S H="D"
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXINU2","","",1)
 
 Q
XX S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="INOVAC"
 S H="D"
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXINU2","","",1)
 
 Q
XZ N ER,APP
 S APP="INOVAC",H="D"
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","INU2^LKTXINU2","","")
 Q
XXX S TEMP=$$CONCAT^LKZ("^TEMPORAI",$J_","""_$P($ZPOS,"^",2)_"""")
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="INOVAC"
 S H="D",FIC="INOVAC.DUMP"
 D ^LKFIC(APP,"A1",H,FIC)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","INU^LKTXINU2",38161,"",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","INU1^LKTXINU2","","",1)
 S ER=$$^LKRQS(APP,"A3",H,$H,"INORQS","INU2^LKTXINU2","","")
 
 
 Q

