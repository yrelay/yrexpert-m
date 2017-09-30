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

;%ATNACTI^INT^1^59547,73866^0
%ATNACTI ;;02:54 PM  11 Feb 1993; 14 Oct 92  5:03 PM ; 22 Apr 93  8:49 AM
 
 
 
 
 
 
 
 
 
 
 
 
ACTIONS 
 S ^RQSGLU("ACTIONS.ATN","TRAITER","ADRESSE")="TRAITER^%ATNACTI"
 S ^RQSGLU("ACTIONS.ATN","AFFNOTE","ADRESSE")="AFFNOTE^%ATNACTI"
 S ^RQSGLU("ACTIONS.ATN","QUEMANDER","ADRESSE")="QMD^%ATNACTI"
 S ^RQSGLU("ACTIONS.ATN","EVALCOND","ADRESSE")="$$EVALCOND^%ATNACTI"
 S ^RQSGLU("ACTIONS.ATN","EVALPRED","ADRESSE")="$$EVALPRED^%ATNACTI"
 S ^RQSGLU("ACTIONS.ATN","EXECNODE","ADRESSE")="EXECNODE^%QMEXSLV"
 Q
 
 
 
 
 
 
 
TRAITER(NIV) 
 N NOUVCXT
 
 D MEMX^%QCAMEM
 
 S NOUVCXT=$$TEMP^%SGUTIL
 K (NIV,QUI,WHOIS,CXT,NOUVCXT)
 S (POP,IOP)=0 D CURRENT^%IS,VARSYS^%QCSAP,^%IS,ZD^%QMDATE4
 S ABANDON=0
 
 S RES=$$CONTEXT^%TLIACUN(^PARAENT($J,NIV,"TRT"),^PARAENT($J,NIV,"REP"),^PARAENT($J,NIV,"IND"),0,0,0,.CXT,.ABANDON)
 
 D COPY^%QCAGLC("CXT",NOUVCXT)
 
 S ^PARASOR($J,NIV,"ABANDON")=ABANDON
 
 K
 D RMEMX^%QCAMEM
 D COPY^%QCAGLC(NOUVCXT,"CXT")
 Q
 
 
 
 
 
AFFNOTE(NIV) 
 
 
 N (NIV,QUI,WHOIS,CXT)
 S (POP,IOP)=0 D CURRENT^%IS,VARSYS^%QCSAP,^%IS,ZD^%QMDATE4
 F I=1:1:12 S A(I)=^PARAENT($J,NIV,I)
 
 D AFF^%QSNOTE2(A(1),A(2),A(3),A(4),A(5),A(6),A(7),A(8),A(9),A(10),A(11),A(12))
 Q
 
 
 
 
 
QMD(NIV) 
 
 N (NIV,QUI,WHOIS,CXT)
 S (POP,IOP)=0 D CURRENT^%IS,VARSYS^%QCSAP,^%IS,ZD^%QMDATE4
 S (MODAF,MODEX)=0
 
 D ACTAFF^%QMEAACT("SAISIE.I",^PARAENT($J,NIV,"SAISIE"),0,0,78,10,0,11,78,11,^PARAENT($J,NIV,"REP"),^PARAENT($J,NIV,"IND"),"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 
 D CLEPAG^%VVIDEO
 Q
 
 
 
EVALCOND(NIV) 
 N (NIV,QUI,WHOIS)
 S (POP,IOP)=0 D CURRENT^%IS,VARSYS^%QCSAP,^%IS,ZD^%QMDATE4
 D COPY^%QCAGLC("^PARAENT("_$J_","_NIV_",""CXT"")","CXT")
 S RES=$$SUBST^%ANARBR2(^PARAENT($J,NIV,"TETE"),.CXT,"ATT^%QMECTRA",.POS)
 Q RES
 
 
 
 
 
 
 
EVALPRED(NIV) 
 N (NIV,QUI,WHOIS,CXT)
 S (POP,IOP)=0 D CURRENT^%IS,VARSYS^%QCSAP,^%IS,ZD^%QMDATE4
 
 D DEB^%SGMESU("eval predicat")
 S RES=$$EVAL^%PSPREV(^PARAENT($J,NIV,"PRD"),^PARAENT($J,NIV,"REP"),^PARAENT($J,NIV,"IND"))
 D FIN^%SGMESU("eval predicat")
 Q RES
 
 
 
 
 
 
 
 
EXECNODE(NIV) 
 B
 S STO=^PARAENT($J,NIV,"STO")
 S SUIVANT=^PARAENT($J,NIV,"SUIVANT")
 S ACCESREP=^PARAENT($J,NIV,"ACCESREP")
 S ACCESIND=^PARAENT($J,NIV,"ACCESIND")
 S INDX=""
 S @("INDX="_SUIVANT_"(STO,INDX)")
 Q:INDX=""
 S @("INDX="_SUIVANT_"(STO,INDX)")
 G:INDX="" UNSEUL
 S INDX=""
 F %I=0:0 S @("INDX="_SUIVANT_"(STO,INDX)"),@("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)") D AJPB
 Q
 
UNSEUL 
 S INDX=""
 S @("INDX="_SUIVANT_"(STO,INDX)"),@("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)")
 D SOLVEPB^%QMEXAT6(REP,IND,^PARAENT($J,NIV,"NOEUD"))
 Q
 
AJPB Q
SOLVEPB Q

