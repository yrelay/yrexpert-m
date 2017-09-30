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

;LKTXREV0^INT^1^59547,74868^0
LKTXREV0 ;
 
 
 
FIC N APP,NODE,DATE,FIC
 S APP="REVIMA",NODE="A1",DATE="D",FIC="REVIMA.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 Q
QUE N ER,X,SEL,TEMP,APP,DATE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="REVIMA" K @(TEMP)
 D ^LKLSEL(APP,"A1",SEL)
 D T
 K @(TEMP)
 Q
T N I,SDE,H S SDE=$O(@SEL@(""))
 F I=1:0 Q:SDE=""  D T1 S SDE=$O(@SEL@(SDE))
 Q
T1 S H=@SEL@(SDE)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","REV^LKTXREV1","","",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","REV1^LKTXREV1","","",1)
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","REV2^LKTXREV1","","")
 Q
 
DES N TEMP,APP
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 K @(TEMP)
 S APP="REVIMA"
 D ^LKLDES(APP,"LNODE^LKTXREV1","A1","")
 K @(TEMP)
 Q
BQS(M) Q  N ER,X,SEL,TEMP,APP,DATE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 K @(TEMP)
 S APP="REVIMA",DATE=$H,FIC="REVIMA.DUMP"
 D ^LKFIC(APP,NODE,DATE,FIC)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","REV^LKTXREV1","","",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","REV1^LKTXREV1","","",1)
 S ER=$$^LKRQS(APP,"A3",H,H,"INORQS","REV2^LKTXREV1","","")
 D:M="S" INT^LKLDES(APP,"LNODE^LKTXREV0",DATE)
 K @(TEMP)
 Q
TEST D LKTXREV0 Q
XY S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="REVIMA"
 S H="D"
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","REV^LKTXREV1","","",1)
 
 Q
XX W !,"0510L 0607L 0611L 3889L 3891L 3893L 4476L "
 W !,"quel fichier " R H
 S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="REVIMA"
 
 B  S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOST","REV1^LKTXREV1","","",1)
 
 Q
RECUP 
 F I="0510L","0607L","0611L","3889L","3891L","3893L","4476L" D RECUP1
 Q
RECUP1 W !,I
 D ADR^%QCAGLC("^TATA("""_I_".DOC""","^[QUI]LK(""REVIMA"",""A2"","""_I_""",""DATA"","_1)
 Q
XZ N ER,APP
 W !,"0510L 0607L 0611L 3889L 3891L 3893L 4476L "
 W !,"quel fichier " R H
 I H="" Q
 S APP="REVIMA"
 S ER=$$^LKRQS(APP,"A3",H,H,"BELRQS","REV2^LKTXREV1","","")
 Q
XXX S TEMP=$$CONCAT^LKZ("^TEMPORAI",$J_","""_$P($ZPOS,"^",2)_"""")
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S APP="REVIMA"
 S H="D",FIC="REVIMA.DUMP"
 D ^LKFIC(APP,"A1",H,FIC)
 S ER=$$^LKLO(APP,"A1",H,APP,"A2",H,"LOST","REV^LKTXREV1",38161,"",1)
 S ER=$$^LKLO(APP,"A2",H,APP,"A3",H,"LOLO","REV1^LKTXREV1","","",1)
 S ER=$$^LKRQS(APP,"A3",H,$H,"INORQS","REV2^LKTXREV1","","")
 
 
 Q

