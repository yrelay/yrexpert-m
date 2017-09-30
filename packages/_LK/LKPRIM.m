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

;LKPRIM^INT^1^59547,74867^0
LKPRIM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIRE(APP,NODE,DATE,UNIT,PROT,VECT) 
 N EXTERNE S EXTERNE="" G LIRE2
LIRE1(APP,NODE,DATE,UNIT,PROT,VECT,EXTERNE) 
LIRE2 N ER,X,TEMP,PAR,PVECT,ERRA,DATA,ER1
 S TEMP="^TEMPORAI($J,""LKPHY"")"
 S TABERR=$$CONCAS^%QZCHAD(TEMP,"TABERR")
 S ER=$$SCR1("READ")
 I ER=0 Q "ABORT"
 S ER=$$OPEN^LKPHY(APP,NODE,DATE,UNIT,PROT,VECT,EXTERNE)
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$REWIND^LKPHY
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$READ^LKPHY(1)
 S ER=$$EREAD(ER) I ER["AB" D ABORT Q "ABORT"
 S ER=$$REWIND^LKPHY
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$CLOSE^LKPHY
 I EXTERNE="" Q 0
 
 Q 0
 
 
ECRIRE1(APP,NODE,DATE,UNIT,PROT,VECT,EXTERNE) 
 G ECRIRE2
ECRIRE(APP,NODE,DATE,UNIT,PROT,VECT) 
 N EXTERNE S EXTERNE=""
ECRIRE2 
 N ER,X,TEMP,PAR,PVECT,ERRA,DATA,ER1
 S TEMP="^TEMPORAI($J,""LKPHY"")"
 S TABERR=$$CONCAT^LKZ(TEMP,"TABERR")
 S ER=$$SCR1("WRITE")
 I ER=0 Q "ABORT"
 S ER=$$OPEN^LKPHY(APP,NODE,DATE,UNIT,PROT,VECT,EXTERNE)
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$REWIND^LKPHY
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$WRITE^LKPHY
 S ER=$$EREAD(ER) I ER["AB" D ABORT Q "ABORT"
 S ER=$$REWIND^LKPHY
 S ER=$$EROP I ER["AB" D ABORT Q "ABORT"
 S ER=$$CLOSE^LKPHY
 Q 0
 
 
ERRC(OER,ER) Q:OER="ABORT" OER Q:ER="ABORT" ER Q:OER=ER ER
 Q:OER="WARNING" Q W *
 
EROP() 
 I $$NERR("NO")'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Derouleur pas monte") Q "ABORT"
 Q "OK"
 I $$ERR("ONL")=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Derouleur pas ""on line""") Q "ABORT"
 I $$ERR("CDE")!$$ERR("BTE") D POCLEPA^%VVIDEO W $$^%QZCHW("Bande illisible ou derouleur HS") Q "ABORT"
 I $$ERR("TNR") D POCLEPA^%VVIDEO W $$^%QZCHW("Bande pas prete ") Q "ABORT"
 Q "OK"
 
EREAD(E) 
 I $$EROP["AB" Q "ABORT"
 I E=0 Q "OK"
 I (E#2)=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Erreur fatale [RETURN]") R X D ^LKPEST(TEMP,TABERR) Q "ABORT"
 I ((E\2)#2)=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Avertissement [RETURN]") R X D ^LKPEST(TEMP,TABERR) Q "WARNING"
 Q "OK"
 
ABORT N ER S ER=$$REWIND^LKPHY,ER=$$CLOSE^LKPHY Q
 
SCR1(M) N REP D CLEPAG^%VVIDEO S DX=10,DY=10 X XY W $$^%QZCHW("N'oubliez pas de  monter la bande")
 S DX=10,DY=12 X XY W:M["RE" $$^%QZCHW("Pret pour la lecture ?") W:M["WR" $$^%QZCHW("Pret pour l'ecriture ?")
 S REP=$$^%VZEOUI("O") D CLEPAG^%VVIDEO Q REP
 
ERR(A) Q $$ERR^LKPHYERR(A)
 
NERR(A) Q $$NERR^LKPHYERR(A)
 
 
TEST S APP="AVEX",DATE="53625,68578" K ^TEMPORAI
 S ER=$$ECRIRE^LKPRIM(APP,"A1",DATE,47,"ASCIIST","PHYAVEX^LKTXAVEX")
 Q

