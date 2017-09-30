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

;%QNEQM^INT^1^59547,73879^0
QNEQM(STO,N,K,MODE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ELT,CLASSE
 
 S ELT=$$BIGENOS(STO,K,"")
 
 I ELT="" Q 0
 
 S CLASSE=$$CLASSE(STO,K,ELT)
 S CLASSE=$O(@STO@(K,"CLASSE",CLASSE))
 
 I CLASSE="" S CLASSE=$$FUTURC(STO,K)
 D STOELT(STO,K,CLASSE,ELT)
 
 D COP(STO,K,ELT)
 Q 1
 
COP(STO,K,ELT) 
 N I,ELT1
 S ELT1=$O(@STO@(K,"ELT",ELT))
 F I=0:0 Q:ELT1=""  D STOELT(STO,K,1,ELT1) S ELT1=$O(@STO@(K,"ELT",ELT1))
 Q
 
FUTURC(STO,K) 
 Q $ZP(@STO@(K,"CLASSE",""))+1
 
 
STOELT(STO,K,CLASSE,ELT) 
 N OCLASSE
 S OCLASSE=$$CLASSE(STO,K,ELT)
 
 K @STO@(K,"CLASSE",OCLASSE,ELT)
 S @STO@(K,"CLASSE",CLASSE,ELT)=""
 S @STO@(K,"ELT",ELT)=CLASSE
 Q
 
 
 
 
BIGENOS(STO,K,BIG) 
 N I,ELT
 S ELT=$ZP(@STO@(K,"ELT",BIG))
 F I=0:0 Q:ELT=""  Q:'($$SINGL(STO,K,ELT))  S ELT=$ZP(@STO@(K,"ELT",ELT))
 Q ELT
 
SINGL(STO,K,ELT) 
 N CLASSE,A
 S CLASSE=$$CLASSE(STO,K,ELT)
 S A=$O(@STO@(K,"CLASSE",CLASSE,""))
 S B=$O(@STO@(K,"CLASSE",CLASSE,ELT))
 Q (ELT=A)&(B="")
 
CLASSE(STO,K,ELT) 
 S ELT=@STO@(K,"ELT",ELT) Q ELT
 
INIT(STO,N) 
 N I
 F I=1:1:N S @STO@(1,"CLASSE",1,I)="",@STO@(1,"ELT",I)=1
 Q
 
PRINT(STO,K,N) 
 N I,J,CLASSE,ELT
 S CLASSE=$O(@STO@(K,"CLASSE","")) W !,N," {"
 F I=0:0 Q:CLASSE=""  D PRINT1 S CLASSE=$O(@STO@(K,"CLASSE",CLASSE)) W:CLASSE'="" "/ "
 W "}"
 Q
PRINT1 
 S ELT=$O(@STO@(K,"CLASSE",CLASSE,""))
 F J=0:0 Q:ELT=""  D PRINT2 S ELT=$O(@STO@(K,"CLASSE",CLASSE,ELT))
 Q
PRINT2 W ELT," "
 Q
 
 
COPY(STO,K,STOD) 
 N I,J,CLASSE,ELT
 K @(STOD)
 S CLASSE=$O(@STO@(K,"CLASSE",""))
 F I=0:0 Q:CLASSE=""  D COPY1 S CLASSE=$O(@STO@(K,"CLASSE",CLASSE))
 Q
COPY1 S ELT=$O(@STO@(K,"CLASSE",CLASSE,""))
 F J=0:0 Q:ELT=""  D COPY2 S ELT=$O(@STO@(K,"CLASSE",CLASSE,ELT))
 Q
COPY2 S @STOD@("CLASSE",CLASSE,ELT)=""
 S @STOD@("ELT",ELT)=CLASSE
 Q
 
PF(STO,N,K,BIG) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ELT,CLASSE
 
 S ELT=$$BIGENOS(STO,K,BIG)
 
 I ELT="" Q 0
 
 S CLASSE=$$CLASSE(STO,K,ELT)
 S CLASSE=$O(@STO@(K,"CLASSE",CLASSE))
 
 I CLASSE="" Q 0
 
 D STOELT(STO,K,CLASSE,ELT)
 
 D COPW(STO,K,ELT)
 Q 1
COPW(STO,K,ELT) 
 N I,ELT1
 S ELT1=$O(@STO@(K,"ELT",ELT))
 F I=0:0 Q:ELT1=""  D:'($$UNI(STO,K,ELT1)) STOELT(STO,K,1,ELT1) S ELT1=$O(@STO@(K,"ELT",ELT1))
 Q
 
UNI(STO,K,ELT) 
 N CLASSE
 S CLASSE=$$CLASSE(STO,K,ELT)
 I $O(@STO@(K,"CLASSE",CLASSE,""))'=ELT Q 0
 I $ZP(@STO@(K,"CLASSE",CLASSE,""))'=ELT Q 0
 Q 1
 
INIT1(STO,N,K) 
 N I
 F I=1:1:N-K S @STO@(1,"CLASSE",1,I)="",@STO@(1,"ELT",I)=1
 F I=(N-K)+1:1:N S @STO@(1,"CLASSE",(I-(N-K))+1,I)="",@STO@(1,"ELT",I)=(I-(N-K))+1
 Q
 
TEST W !,"nombre d'elements " R N
 W !,"mode " R M
 D TEST1(N,M)
 Q
TEST1(N,M) 
 S STO="STO1"
 K @(STO)
 D INIT(STO,N) S K=1
 
 F I=1:1 Q:'($$QNEQM(STO,N,K,M))  D PRINT(STO,K,I)
 Q
TEST2(N,M,NBP) 
 S STO="STO1",STO(1)="STO1(1,""CLASSE"")"
 K @(STO)
 D INIT(STO,N) S K=1,J=1
 
 F I=1:1 Q:'($$QNEQM(STO,N,K,M))  I $$CARD^%QCALIST(STO(1))=NBP D PRINT(STO,K,I) W " ",J S J=J+1
 Q
TESTX W !,"nombre d'elements " R N
 W !,"nombre de partitions " R NBP
 W !,"output " R O
 W !,"mode " R M
 I O'="" O O U O
 I '(M) D TESTX1(N,NBP)
 I M D TEST2(N,1,NBP)
 I O'="" U O C O
 Q
TESTX1(N,NBP) 
 S STO="STO1"
 K @(STO)
 D INIT1(STO,N,NBP-1) S K=1,BIG=""
 D PRINT(STO,K,0)
 
 F I=1:1 Q:'($$PF(STO,N,K,.BIG))  D PRINT(STO,K,I)
 Q

