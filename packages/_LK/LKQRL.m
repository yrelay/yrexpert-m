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

;LKQRL^INT^1^59547,74867^0
LKQRL(APP,NODE,DATE,REP,LISTE,LATT,LLIEN,SIZE) 
 
 
 
 
 
 
 
 
 
 
 
 
 N ADRESSE,I,J,K,L,LST,OR,T,TEMP,ATT,INDIV,LATT1,INDATT,INDLIEN,INDEX,TYP
 N DATATT,DATLIEN,GL,REP1,REP2
 S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 S DATATT=$$CONCAS^LKZ("^[QUI]LK",APP_","_NODE_"^ATT"_","_DATE_",DATA,1")
 S DATLIEN=$$CONCAS^LKZ("^[QUI]LK",APP_","_NODE_"^LIEN"_","_DATE_",DATA,1")
 S ADRESSE=$$^%QSCALVA("L0",LISTE,"ADRESSE")
 Q:$D(@ADRESSE)<9
 S INDIV=$O(@ADRESSE@("")),INDATT=1,INDLIEN=1
 F I=1:0 Q:INDIV=""  D STO1 S INDIV=$O(@ADRESSE@(INDIV))
 K @(TEMP)
 Q
 
STO1 
 
 S ATT=$$NXTRIA^%QSTRUC8(REP,INDIV,"")
 F J=1:0 Q:ATT=""  I $$OK(ATT) D STO2 S ATT=$$NXTRIA^%QSTRUC8(REP,INDIV,ATT)
 Q
 
OK(ATT) Q:ATT="" 0
 Q:$D(@LATT@("*"))'=0 1
 Q:$D(@LATT@(ATT))'=0 1
 Q 0
 
STO2 K GL D MV^%QSCALVA(REP,INDIV,ATT,.GL,.TYPE)
 I TYPE=0 G STOATT
 I TYPE=1 G STOLFP
 I TYPE=2 G STOLPF
 I TYPE=3 G STOLR
 Q
 
STOATT S OR=$O(GL(""))
 F K=1:0 Q:OR=""  S @DATATT@(INDATT)=$$FOR5(REP,INDIV,ATT,GL(OR),OR),OR=$O(GL(OR)),INDATT=INDATT+1
 Q
 
STOLPF S OR=$O(GL(""))
 S REP1=$$NOMINT^%QSF(ATT)
 F K=1:0 Q:OR=""  S @DATLIEN@(INDLIEN)=$$FOR5(REP,INDIV,REP1,GL(OR),OR),OR=$O(GL(OR)),INDLIEN=INDLIEN+1
 Q
 
STOLFP S OR=$O(GL(""))
 S REP1=$$NOMINT^%QSF(ATT)
 F K=1:0 Q:OR=""  S @DATLIEN@(INDLIEN)=$$FOR5(REP1,GL(OR),REP,INDIV,OR),OR=$O(GL(OR)),INDLIEN=INDLIEN+1
 Q
 
STOLR S OR=$O(GL(""))
 S REP1=$$NOMINT^%QSF(ATT)
 F K=1:0 Q:OR=""  S @DATLIEN@(INDLIEN)=$$FOR5(REP,INDIV,REP1,GL(OR),""),OR=$O(GL(OR)),INDLIEN=INDLIEN+1
 Q
 
FOR3(A,B,C) Q $$FORMAT^LKZFORM(A,SIZE)_$$FORMAT^LKZFORM(B,SIZE)_$$FORMAT^LKZFORM(C,SIZE)
 
FOR4(A,B,C,D) Q $$FORMAT^LKZFORM(A,SIZE)_$$FORMAT^LKZFORM(B,SIZE)_$$FORMAT^LKZFORM(C,SIZE)_$$FORMAT^LKZFORM(D,SIZE)
 
FOR5(A,B,C,D,E) Q $$FORMAT^LKZFORM(A,SIZE)_$$FORMAT^LKZFORM(B,SIZE)_$$FORMAT^LKZFORM(C,SIZE)_$$FORMAT^LKZFORM(D,SIZE)_$$FORMAT^LKZFORM(E,SIZE)
 
 
LISTE(REPE,LST) N LREP,REPSEL
 S REPE="",LST=""
 D REP^%QSGEST9("LREP")
 D SELECT^LKSEL("LREP","REPSEL",$$^%QZCHW("QUEL REPERTOIRE ?"),1)
 Q:$D(REPSEL)<9
 S REPE=$$NOMINT^%QSF($O(REPSEL(""))) Q:REPE=""
 S LST=$$^%QS1CHLI(REPE)
 Q
 
 
TEST1 D LISTE(.REP,.LISTE)
 Q:LISTE=""
 S ^LATT("*")="",APP="X",NODE=LISTE,DATE="Z"
 K ^[QUI]LK("X",LISTE_"^ATT"),^[QUI]LK("X",LISTE_"^LIEN")
 S ^LLIEN("*")=""
 D LKQRL(APP,NODE,DATE,REP,LISTE,"^LATT","^LLIEN",40)
 Q
TEST Q  S REP="P1",LISTE="RQS87110014"
 S ^LATT("*")="",APP="X",NODE="Y",DATE="Z"
 S ^LLIEN("*")=""
 D LKQRL(APP,NODE,DATE,REP,LISTE,"^LATT","^LLIEN",40)
 Q
TEST2 Q  S REP="P2",LISTE="RQS87100002"
 S ^LATT("*")="",APP="X",NODE="Y",DATE="Z"
 S ^LLIEN("*")=""
 D LKQRL(APP,NODE,DATE,REP,LISTE,"^LATT","^LLIEN",40)
 Q

