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

;%QS6^INT^1^59547,73880^0
%QS6 ;
 
 
 
 
 
 
 
 
 
 K ^[QUI]RQS1(NEWREQ)
 K BASE,COMM,CONT,LVAR,UTIL,VAR
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",I)))  S VAR(I)=^[QUI]RQS1(REQ,"VARIABLES",I),VAR(I,"TETE")=$$RECOP^%ANA(^[QUI]RQS1(REQ,"VARIABLES",I,"TETE"))
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",I)))  S CONT(I)=^[QUI]RQS1(REQ,"CONTRAINTES",I),CONT(I,"TETE")=$$RECOP^%ANA(^[QUI]RQS1(REQ,"CONTRAINTES",I,"TETE")) I $D(^[QUI]RQS1(REQ,"CONTRAINTES",I,"TABATT")) S CONT(I,"TABATT")=$$RECOPATT(QUI,QUI,^[QUI]RQS1(REQ,"CONTRAINTES",I,"TABATT"))
 S I=-1 F %I=0:0 S I=$N(^[QUI]RQS1(REQ,"LVAR",I)) Q:I=-1  S LVAR(I)=^[QUI]RQS1(REQ,"LVAR",I)
 S BASE=^[QUI]RQS1(REQ,"BASE")
 S COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 F I=1:1 Q:'($D(CONT(I)))  S TETE=CONT(I,"TETE"),L=$$RED^%ANA(TETE,"VAR") F J=1:1 S K=$P(L,",",J) Q:K=""  S UTIL(K,TETE)=""
 S NOLV=1,NOLC=1,DEJAVARI=$D(VAR),DEJACONT=$D(CONT)
 D ^%QSQUEST(NEWREQ,0) G:'(OK) FIN
 D ^%QSACTRE(NEWREQ,BASE) G:RQSRESUL="" FIN
 S ^DERLISTE($I)=RQSRESUL
FIN K BASE,COMM,CONT,DEJACONT,DEJAVARI,I,%I,J,K,LVAR,NOLC,NOLV,TETE,UTIL,VAR Q
RECOPATT(QUI1,QUI2,OXTB) 
 N NXTB,ATT,IATT
 Q:OXTB=""
 S NXTB=$S($D(^[QUI2]RQSGLO("RQS","NBATT")):^[QUI2]RQSGLO("RQS","NBATT"),1:0)
 S (^[QUI2]RQSGLO("RQS","NBATT"),NXTB)=NXTB+1
 Q:OXTB="" NXTB Q:'($D(^[QUI1]RQSDON("RQS","ATT",OXTB))) NXTB
 S ATT="" F IATT=0:0 S ATT=$O(^[QUI1]RQSDON("RQS","ATT",OXTB,ATT)) Q:ATT=""  S ^[QUI2]RQSDON("RQS","ATT",NXTB,ATT)=""
 Q NXTB
 
 
COPIE(WHOIS1,QUI1,RQ1,WHOIS2,QUI2,RQ2) 
 N I,L,J
 F I="BASE","COMM","DATE.CREATION" S ^[QUI2]RQS1(RQ2,I)=$S(($D(^[QUI1]RQS1(RQ1,I))#10)=0:"",1:^[QUI1]RQS1(RQ1,I))
 F I="CONTRAINTES","PARAMETRES","LVAR","VARIABLES" S L=$O(^[QUI1]RQS1(RQ1,I,"")) F J=0:0 Q:L=""  S ^[QUI2]RQS1(RQ2,I,L)=^[QUI1]RQS1(RQ1,I,L) D NANA S L=$O(^[QUI1]RQS1(RQ1,I,L))
 S ^[QUI2]RQS1(RQ2,"DATE.CREATION")=$H
 S ^[QUI2]RQS1(RQ2,"ACTIVATIONS")=0
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"NOM",RQ2,1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"COMM",$$QSCALVA^%QMCPZ(WHOIS1,QUI1,"RQS",RQ1,"COMM"),1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"OBJET",$$QSCALVA^%QMCPZ(WHOIS1,QUI1,"RQS",RQ1,"OBJET"),1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"AUTEUR",$$QSCALVA^%QMCPZ(WHOIS1,QUI1,"RQS",RQ1,"AUTEUR"),1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"SITE",$I,1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"LISTE.ATTRIBUTS",$$QSCALVA^%QMCPZ(WHOIS1,QUI1,"RQS",RQ1,"LISTE.ATTRIBUTS"),1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"DATE.CREATION",$$DATE^%QMDATE,1)
 D PA^%QMCPZ(WHOIS2,QUI2,"RQS",RQ2,"HEURE.CREATION",$$HEURE^%QMDATE,1)
 Q
 
NANA I ($D(^[QUI1]RQS1(RQ1,I,L,"TETE"))#10)=0 Q
 S ^[QUI2]RQS1(RQ2,I,L,"TETE")=$$COPY^%ANA(QUI1,^[QUI1]RQS1(RQ1,I,L,"TETE"),QUI2)
 Q

