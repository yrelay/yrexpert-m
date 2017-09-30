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

;LKNMINIT^INT^1^59547,74867^0
LKYINIT(DATA,BASE) 
 
 
 
 
 
 N ER,I,ATT,GLO,FIRST,LAST,ABORT,LT,IND,LSEP,LILI,AA,LILA,ATTI,REP
 N PREC
 S LILI=$$CONCAS^%QZCHAD("^[QUI]LKY","REP,"_$$NOMLOG^%QSF(BASE))
 S ABORT=""
 S REP=$$NOMLOG^%QSF(BASE)
 S ER=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]LKY","LONGUEUR,"_REP),1,.AA)
 S @DATA@("L")=$$^%QCAZG("AA")
 I ($D(@DATA@("L"))#10)=0 S ABORT="La longeur totale de l'enregistrement n'est pas definie" Q ABORT
 S ER=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]LKY","LONGUEUR,"_REP),2,.AA)
 S @DATA@("S")=$$^%QCAZG("AA"),LSEP=$L($$^%QCAZG($$CONCAS^%QZCHAD(DATA,"S")))
 S ATT=$O(@LILI@(""))
 F I=0:0 Q:(ATT="")!(ABORT'="")  D T S ATT=$O(@LILI@(ATT))
 Q:ABORT'="" ABORT
 S IND=$O(@DATA@("D","")),LT=0,PREC=0
 F I=0:0 Q:(IND="")!(ABORT'="")  D T1 S PREC=(@DATA@("D",IND,"T")+IND)-1,IND=$O(@DATA@("D",IND))
 S ABORT=$$BOUC(LT,@DATA@("L")+1)
 Q ABORT
T S (FIRST,LAST)=-1
 
 S ER=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]LKY","REP,"_REP_","_ATT),3,.FIRST)
 S ER=$$OUT^%QZCHGE($$CONCAS^%QZCHAD("^[QUI]LKY","REP,"_REP_","_ATT),4,.LAST)+ER
 I (ER'=0)!($$^%QCAZG("FIRST")="") S ABORT="La position ds l'enregistrement de "_ATT_" est incorrecte ou pas definie" Q
 I ((FIRST>LAST)!(FIRST<0))!(LAST<0) S ABORT="La position ds l'enregistrement de "_ATT_" est incorrecte ou pas definie" Q
 S @DATA@("D",FIRST,"T")=(LAST-FIRST)+1
 S @DATA@("D",FIRST,"ATT")=ATT
 Q
T1 S ABORT=$$BOUC(PREC,IND) Q:ABORT'=""
 
 S LT=@DATA@("D",IND,"T")+LT
 I LT>@DATA@("L") S ABORT="La taille cumulle des champs est superieure a celle de l'enregistrement" Q
 Q
T2 S @DATA@("R",ATT)=""
 Q
BOUC(PREC,IND) 
 N ABORT S ABORT=""
 I PREC>(IND-1) S ABORT="Les champs "_$$^%QCAZG($$CONCAS^%QZCHAD(DATA,"D,"_IND_",ATT"))_" et "_$$^%QCAZG($$CONCAS^%QZCHAD(DATA,"D,"_PREC_",ATT"))_" se chevauchent" Q ABORT
 I ((PREC+LSEP)>(IND-1))&(PREC'=(IND-1)) W *
 I (PREC+LSEP)<(IND-1) S @DATA@("D",PREC+1,"T")=(IND-PREC)-1,LT=((LT+IND)-PREC)-1
 Q ABORT

