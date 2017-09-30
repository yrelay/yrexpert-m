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

;%QNEQM4^INT^1^59547,73879^0
QNEQM4(LISTIND,LLISTEN,TEMPS,CYCLE,STO,R,MODE,DEB,INC,INCOMPG,INSEP,INS) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CARD,I,K,BASE,STEMPS,CARD1,NMIN
 S K=1
 S:DEB @R@("EQUIRM")=0
 S:DEB @R@("LLISTEN")=$$CRETYPV^%QNEQM1("L0","","","INDIVIDU")
 S CARD=$$CARD^%QSGEST7(LISTIND)
 S BASE=$$BASE^%QSGEST7(LISTIND)
 S STEMPS=$$STEMPS^%QNEQUI6(LISTIND,TEMPS,.CARD1)
 S NMIN=STEMPS/CYCLE
 D:DEB INIT^%QNEQM(STO,CARD)
 D INIVAL(STO,K,LISTIND,TEMPS)
 
 F I=1:1 D MORE(STO,K,NMIN,STEMPS,LISTIND,BASE,@R@("LLISTEN"),TEMPS,R,CARD,I,INC,INCOMPG,INSEP,INS) Q:'($$^%QNEQM(STO,CARD,K,MODE))
 D DEL^%QNEQM1(@R@("LLISTEN"))
 
 S LLISTEN=$$NOM^%QSGES11("EQL")
 D CRETYPV^%QSGES11("L0",LLISTEN,"EQL","equilibre","combinatoire","INDIVIDU")
 D LLISTEN($$CONCAS^%QZCHAD(R,"STOM"),K,LISTIND,BASE,LLISTEN,1)
 Q
MORE(STO,K,NMIN,STEMPS,LISTIND,BASE,LLISTEN,TEMPS,R,CARD,N1,INC,INCOMPG,INSEP,INS) 
 N EQUI,N,CMAX,MAXT,EQUIR,NTOT,MSG,NCLASSE
 S MSG=""
 D PRINT^%QNEQM(STO,K,N1)
 
 I '($$OKPART(STO,K,NMIN,.NCLASSE)) Q
 
 D ^%QNEQM5(STO,K,CYCLE,STEMPS,NCLASSE,.EQUI,.EQUIR)
 
 W " equilibre reel ",EQUIR," equilibre reel max ",@R@("EQUIRM")
 I @R@("EQUIRM")'<EQUIR Q
 
 D:$D(@INC) LLISTEN(STO,K,LISTIND,BASE,LLISTEN,0)
 
 
 D:$D(@INC) PLUSINC^%QNEQM3(LLISTEN,INS,INC,INCOMPG,"",.MSG)
 I MSG'="" W " ",MSG D FIN Q
 S @R@("EQUIRM")=EQUIR
 D COPY^%QNEQM(STO,K,$$CONCAS^%QZCHAD(R,"STOM,1"))
 D FIN
 Q
FIN D LISTOUT(LLISTEN)
 Q
OKPART(STO,K,NMIN,CARD) 
 S CARD=$$CARD^%QCALIST($$CONCAS^%QZCHAD(STO,K_",CLASSE"))
 
 
 I CARD<NMIN Q 0
 Q 1
 
 
 
LLISTEN(STO,K,LISTIND,BASE,LLISTEN,REEL) 
 N I,CLASSE,ADL,ADLT
 D ZERO^%QSGE11(LLISTEN)
 S ADL=$$ADRLIS^%QSGEST7(LLISTEN)
 S ADLT=$$ADRLT^%QSGEST7(LLISTEN)
 S CLASSE=$O(@STO@(K,"CLASSE",""))
 F I=1:1 Q:CLASSE=""  D LLISTEN1 S CLASSE=$O(@STO@(K,"CLASSE",CLASSE))
 D ADDA^%QS0(LLISTEN,"CARD",I-1)
 Q
LLISTEN1 
 N L
 S:'(REEL) L=$$CRETYPV^%QNEQM1(BASE,"","","INDIVIDU")
 I REEL S L=$$NOM^%QSGES11("EQL") D CRETYPV^%QSGES11(BASE,L,"EQL","","","INDIVIDU")
 D AJOUT(LISTIND,L,$$CONCAS^%QZCHAD(STO,K_",CLASSE,"_CLASSE))
 S @ADL@(L)=I
 S @ADLT@(I)=L
 Q
 
AJOUT(LISTIND,L,ENS) 
 N I,OBJI,ADR,ADRLT,IND
 D ZERO^%QSGE11(L)
 S ADR=$$ADRLIS^%QSGEST7(L)
 S ADRLT=$$ADRLT^%QSGEST7(L)
 S OBJI=$O(@ENS@(""))
 F I=1:1 Q:OBJI=""  D AJOUT1 S OBJI=$O(@ENS@(OBJI))
 D ADDA^%QS0(L,"CARD",I-1)
 Q
AJOUT1 S OBJ=$$OBJET^%QSGE11(LISTIND,OBJI)
 S @ADR@(OBJ)=I
 S @ADRLT@(I)=OBJ
 Q
 
LISTOUT(LLISTEN) 
 N ADR,I,L
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 S L=$O(@ADR@(""))
 F I=0:0 Q:L=""  D DEL^%QNEQM1(L) S L=$O(@ADR@(L))
 Q
 
INT(NOM,L,TEMPS,INC,INCOMPG,INSEP,INS,CYCLE,TAL,TAG,LLISTEN,DATE,COMM,MODE,MODAF,MSG) 
 N ADR,STO,R,DEB
 S ADR=$$ADR
 S R=$$CONCAS^%QZCHAD(ADR,"R")
 S STO=$$CONCAS^%QZCHAD(ADR,"STO")
 K @(ADR)
 S DEB=1
 D QNEQM4(L,.LLISTEN,TEMPS,CYCLE,STO,R,1,DEB,INC,INCOMPG,INSEP,INS)
 Q
ADR() Q $$CONCAS^%QZCHAD("TEMPORAY","A,QMEQM")
TEST1 D ZERO^%QNEQM1
 W $$ACT^%QNEQUI2("EQL88080008","E",0)
 Q
 
 
INIVAL(STO,K,LISTIND,TEMPS) 
 N ADRLT,I,IND,OBJ,VAL,BASE
 S ADRLT=$$ADRLT^%QSGEST7(LISTIND)
 S BASE=$$BASE^%QSGEST7(LISTIND)
 S IND=$O(@ADRLT@(""))
 F I=0:0 Q:IND=""  D INIVAL1 S IND=$O(@ADRLT@(IND))
 Q
INIVAL1 
 S OBJ=$$OBJET^%QSGE11(LISTIND,IND)
 S VAL=$$^%QSCALVA(BASE,OBJ,TEMPS)
 D STOVAL(STO,K,IND,VAL)
 Q
STOVAL(STO,K,IND,VAL) 
 S @STO@(K,"ELT",IND,"VAL")=VAL
 Q

