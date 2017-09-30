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

;%ANARB12^INT^1^59547,73866^0
%ANARB12 ;
 
 
 
 
 
HISTO K @(TEMPO)
 S @TEMPO@(1)="TYPH",@TEMPO@(2)="NOMH",@TEMPO@(3)="LISTE",@TEMPO@(4)="TOT1",@TEMPO@(5)="REG1",@TEMPO@(6)="N1",@TEMPO@(7)="ABC",@TEMPO@(8)="P1"
 S @TEMPO@(9)="POS",@TEMPO@(10)="MES",@TEMPO@(11)="ERR",@TEMPO@(12)="GLH",@TEMPO@(13)="ND1",@TEMPO@(14)="ND2",@TEMPO@(15)="REP",@TEMPO@(16)="ND3",@TEMPO@(17)="ND4",@TEMPO@(18)="TOT2",@TEMPO@(19)="REG2",@TEMPO@(20)="HTOT"
 S @TEMPO@(21)="N2",@TEMPO@(22)="P2",@TEMPO@(23)="SA",@TEMPO@(24)="ABC2",@TEMPO@(25)="HTOT2"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,GLH=$$ADRHIS^%HXIHITU,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("HISTO1^%ANARB12") G INT^%ANARBR2
HISTO1 I ('(POS))!(VAL="") S POS=0 G DEPIL^%ANGEPIL
 
 S TYPH=VAL,A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("HISTO2^%ANARB12") G INT^%ANARBR2
HISTO2 G:'(POS) DEPIL^%ANGEPIL
 S NOMH=VAL
 
 I NOMH="" S NOMH=$$GEN^%QCAPOP("HIS")
 I $$EXHIS^%HXIHITU(GLH,NOMH) D SUP^%HXIHITU(NOMH)
 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("HISTO3^%ANARB12") G INT^%ANARBR2
HISTO3 I ('(POS))!(VAL="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S VAL="" G DEPIL^%ANGEPIL
 
 S LISTE=VAL,ND1=$$RED(SA,4)
 S TOT1=$$RED($$RED(ND1,1),"TEXTE")
 
 S REP=$$RED(ND1,3)
 I REP'=0 S REP=$$RED(REP,"TEXTE"),TOT1=TOT1_"^"_REP
 S ND2=$$RED(SA,5)
 S REG1=$$RED($$RED(ND2,1),"TEXTE")
 
 S REP=$$RED(ND2,3)
 I REP'=0 S REP=$$RED(REP,"TEXTE"),REG1=REG1_"^"_REP
 S A=$$RED(SA,6)
 D EMPIL^%ANGEPIL("HISTO4^%ANARB12") G INT^%ANARBR2
HISTO4 I ('(POS))!(VAL="") S POS=0 G DEPIL^%ANGEPIL
 
 S N1=VAL,A=$$RED(SA,7)
 D EMPIL^%ANGEPIL("HISTO5^%ANARB12") G INT^%ANARBR2
HISTO5 I ('(POS))!(VAL="") S POS=0 G DEPIL^%ANGEPIL
 
 S P1=VAL,A=$$RED(SA,8)
 D EMPIL^%ANGEPIL("HISTO50^%ANARB12") G INT^%ANARBR2
HISTO50 I ('(POS))!(VAL="") S POS=0 G DEPIL^%ANGEPIL
 
 S ABC=VAL,A=$$RED(SA,9)
 D EMPIL^%ANGEPIL("HISTO6^%ANARB12") G INT^%ANARBR2
HISTO6 I ('(POS))!(VAL="") S POS=0 G DEPIL^%ANGEPIL
 
 S HTOT=VAL
 I TYPH=3,'($$TYPE3) S POS=0 G DEPIL^%ANGEPIL
 I TYPH=2,'($$TYPE2) S POS=0 G DEPIL^%ANGEPIL
 I TYPH=1 S MES=$$HSIM^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,0,"",.ERR)
 I TYPH=3 S MES=$$HPAR^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,TOT2,ABC2,HTOT2,0,"",.ERR)
 I TYPH=2 S MES=$$HSER^%HXIHITR(GLH,NOMH,TYPH,LISTE,TOT1,REG1,N1,ABC,HTOT,P1,REG2,N2,P2,ABC2,HTOT2,0,"",.ERR)
 I ERR D:MODAF ADD^%TLIFEN("LOG",MES) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I MODAF=1 D REAF^%TLIFEN,IND^%TLIACT3,REAF^%QUPILF("ATT"),REAF^%QUPILF("ACT"),REAF^%QUPILF("LOG")
 I MODAF=2 D REAF^%TLBAIF(0)
 S VAL=NOMH G DEPIL^%ANGEPIL
 
TYPE3() 
 S ND3=$$RED(SA,10)
 
 S TOT2=$$RED($$RED(ND3,1),"TEXTE")
 S REP=$$RED(ND3,3)
 I REP'=0 S REP=$$RED(REP,"TEXTE"),TOT2=TOT2_"^"_REP
 S A=$$RED(SA,11)
 D EMPIL^%ANGEPIL("TYPE31^%ANARB12") G INT^%ANARBR2
TYPE31 Q:('(POS))!(VAL="") 0
 
 S ABC2=VAL,A=$$RED(SA,12)
 D EMPIL^%ANGEPIL("TYPE32^%ANARB12") G INT^%ANARBR2
TYPE32 Q:('(POS))!(VAL="") 0
 
 S HTOT2=VAL
 Q 1
 
TYPE2() 
 S ND4=$$RED(SA,10)
 
 S REG2=$$RED($$RED(ND4,1),"TEXTE")
 S REP=$$RED(ND4,3)
 I REP'=0 S REP=$$RED(REP,"TEXTE"),REG2=REG2_"^"_REP
 S A=$$RED(SA,11)
 D EMPIL^%ANGEPIL("TYPE21^%ANARB12") G INT^%ANARBR2
TYPE21 Q:('(POS))!(VAL="") 0
 
 S N2=VAL,A=$$RED(SA,12)
 D EMPIL^%ANGEPIL("TYPE22^%ANARB12") G INT^%ANARBR2
TYPE22 Q:('(POS))!(VAL="") 0
 
 S P2=VAL,A=$$RED(SA,13)
 D EMPIL^%ANGEPIL("TYPE23^%ANARB12") G INT^%ANARBR2
TYPE23 Q:('(POS))!(VAL="") 0
 
 S ABC2=VAL,A=$$RED(SA,14)
 D EMPIL^%ANGEPIL("TYPE24^%ANARB12") G INT^%ANARBR2
TYPE24 Q:('(POS))!(VAL="") 0
 
 S HTOT2=VAL
 Q 1
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

