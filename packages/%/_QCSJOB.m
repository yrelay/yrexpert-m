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

;%QCSJOB^INT^1^59547,73875^0
ZJOB(MODE,ROU,PAR,USER) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N STO,PARA,ROUT,ERR,USR,I,VAL,HOST
 S STO="^XJOB"
 I $$^%QCAZG(STO)="ACTIVE" Q 1
 K @(STO)
 S @STO="ACTIVE"
 S PARA=$$CONCAS^%QZCHAD(STO,"PARA")
 S ROUT=$$CONCAS^%QZCHAD(STO,"ROUT")
 S ERR=$$CONCAS^%QZCHAD(STO,"ERR")
 S USR=$$CONCAS^%QZCHAD(STO,"USR")
 S VAL=$O(@PAR@(""))
 F I=0:0 Q:VAL=""  S @PARA@(VAL)=@PAR@(VAL),VAL=$O(@PAR@(VAL))
 S @ROUT=ROU
 S @USR=USER
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 I MODE D JOB^%QCSJOB Q $$^%QCAZG(ERR)
 I HOST="PDP" ZJ JOB^%QCSJOB
 I HOST="VAX" ZJ JOB^%QCSJOB:(::"NL:":"NL:")
 Q $$^%QCAZG(ERR)
JOB N
 S STO="^XJOB"
 S USR=$$CONCAS^%QZCHAD(STO,"USR")
 
 I $$JOB^%QCSAP(@USR) D ERR($$^%QZCHW("Utilisateur inconnu, mettre a jour la table d'identification")) Q
 
 N PILE,STO,PARA,ROUT,ERR,USR,ADR
 N I,NPAR,ROUTI
 S STO="^XJOB"
 S PARA=$$CONCAS^%QZCHAD(STO,"PARA")
 S ROUT=$$CONCAS^%QZCHAD(STO,"ROUT")
 S ERR=$$CONCAS^%QZCHAD(STO,"ERR")
 S USR=$$CONCAS^%QZCHAD(STO,"USR")
 S $ZT="ERR^%QCSJOB"
 S NPAR=$O(@PARA@("")),ADR=""
 F I=0:0 Q:NPAR=""  D JOB1 S NPAR=$O(@PARA@(NPAR))
 S ROUTI=$$CONCAT^%QZCHAD(@ROUT,ADR)
 S @STO=""
 D @ROUTI
 S $ZT=""
 Q
JOB1 I ADR'="" S ADR=ADR_","_$$CONCAS^%QZCHAD("@PARA@",NPAR) Q
 S ADR=$$CONCAS^%QZCHAD("@PARA@",NPAR)
 Q
ERR S @STO="",@ERR=$ZE Q
 
ERR(LIB) 
 S @STO="",@ERR=LIB Q
 
TEST K ^XJOB
 S PAR="TUTU"
 S @PAR@(1)=2
 S @PAR@(2)=3
 S @PAR@(3)=""
 S ERRE=$$^%QCSJOB(0,"ROUT^%QCSJOB",PAR,"DMO")
 Q
ROUT(A,B,C) 
 S C=A+B
 S ^A=C
 S ^A(1)=0
 F I=0:0 Q:^A(1)
 Q

