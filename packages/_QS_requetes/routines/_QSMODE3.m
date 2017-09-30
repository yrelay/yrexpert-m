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

;%QSMODE3^INT^1^59547,73882^0
QSMODE3(MODEL,GL) 
 
 
 
 
 
 
 
 
 
 N REP,I,TYPE,INDICE,STOD,STOI,BASE
 S STOD=$$ADRD^%QSGEL3
 S STOI=$$ADRI^%QSGEL3
 K @(STOD),@(STOI)
 S REP=$O(@GL@(MODEL,""))
 F I=0:0 Q:REP=""  D TR S REP=$O(@GL@(MODEL,REP))
 Q
TR S BASE=$P(@GL@(MODEL,REP),"^",1)
 I $$RESERVE(REP) D TR2 Q
 S TYPE=$P(@GL@(MODEL,REP),"^",3)
 S:TYPE="" TYPE="DONNEES"
 S INDICE=$P(@GL@(MODEL,REP),"^",4)
 S:INDICE="" INDICE=$ZP(@STOD@(TYPE,""))+1
 D STO
 Q
STO S @STOD@(TYPE,INDICE)=BASE
 S @STOI@(REP,"TYPE")=TYPE
 S @STOI@(REP,"INDICE")=INDICE
 Q
TR2 S TYPE=REP,INDICE=1
 
 S $P(@GL@(MODEL,REP),"^",3)=TYPE
 S $P(@GL@(MODEL,REP),"^",4)=INDICE
 D STO
 Q
 
RESERVE(BASE) 
 N I,VU
 S VU=0
 F I="LIEN","ATTRIBUT","REQUETE","ETUDE.TOTEM","LISTE","TRAITEMENT" I I=BASE S VU=1 Q
 Q VU
 
 
 
 
 
 
 
 
 
 
LIENI(MODEL,GL,LLIENI) 
 N REP,I,J
 S REP=$O(@GL@(MODEL,"")),J=0
 F I=0:J Q:REP=""  D LIENI1 S REP=$O(@GL@(MODEL,REP))
 S @LLIENI=J
 Q
LIENI1 S BASE=$P(@GL@(MODEL,REP),"^",1)
 S TYPE=$P(@GL@(MODEL,REP),"^",3)
 I TYPE'="LIEN" Q
 S @LLIENI@(REP)=BASE
 S J=J+1
 Q
 
SYSTEME 
 D SYS^%QSDROIT($$LIENI^%QSGEL3,"REMANENCE")
 Q

