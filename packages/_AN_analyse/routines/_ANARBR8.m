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

;%ANARBR8^INT^1^59547,73866^0
%ANARBR8 ;
 
 
 
 
 
REQUET K @(TEMPO) S @TEMPO@(1)="REQ",@TEMPO@(2)="LIST",@TEMPO@(3)="R",@TEMPO@(4)="I",@TEMPO@(5)="PAR",@TEMPO@(6)="VPAR"
 S @TEMPO@(7)="LPARAM",@TEMPO@(8)="EPAR",@TEMPO@(9)="NI",@TEMPO@(10)="VAPAR",@TEMPO@(11)="SA"
 D EMPV^%ANGEPIL(TEMPO),SAUVVAL^%TLUTIL
 S LPARAM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LPARAM)
 S EPAR=1,POS=1,SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("REQ1^%ANARBR8") G INT^%ANARBR2
REQ1 I (POS=0)!(VAL="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la requete")) S POS=0,VAL="" D RESTVAL^%TLUTIL G DEPIL^%ANGEPIL
 I '($D(^[QUI]RQS1(VAL))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Requete inexistante")) S POS=0,VAL="" D RESTVAL^%TLUTIL G DEPIL^%ANGEPIL
 S REQ=VAL,POS=1,VAPAR=1,I=0
REQ2 S I=I+1 G:'($D(^[QUI]RQS1(REQ,"PARAMETRES",I))) REQ2F
 S A=$$RED(SA,I+2) G:A=0 REQ2F D EMPIL^%ANGEPIL("REQ21^%ANARBR8") G INT^%ANARBR2
REQ21 G:('(POS))!(VAL="") REQ2F S PAR=^[QUI]RQS1(REQ,"PARAMETRES",I),@LPARAM@(PAR)=VAL
 G REQ2
REQ2F I ((POS=0)!(VAL=""))!(A=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer parametres de la requete")) S VAL="",POS=0 D RESTVAL^%TLUTIL G DEPIL^%ANGEPIL
 S EPAR=I'=1,A=$$RED(SA,2) D EMPIL^%ANGEPIL("REQ3^%ANARBR8") G INT^%ANARBR2
REQ3 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S POS=0,VAL="" D RESTVAL^%TLUTIL G DEPIL^%ANGEPIL
 S LIST=VAL G:LIST="" SUIT
 S NI=$$NOMINT^%QSF(LIST) G:NI'="" SUIT
 I '($$EX^%QSGEST7(LIST)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) S POS=0,VAL="" D RESTVAL^%TLUTIL G DEPIL^%ANGEPIL
SUIT I $$GET^%SGVAR("ECR") D POCLEPA^%VVIDEO
 I '(EPAR) S VAL=$$ACTIVEP^%QSINTER(REQ,LIST,"") G FIN
 S VAL=$$ACTIVEP^%QSINTER(REQ,LIST,LPARAM)
FIN I MODAF=1 D REAF^%TLIFEN,IND^%TLIACT3
 I MODAF=2 D REAF^%TLBAIF(0)
 K @(LPARAM)
 D RESTVAL^%TLUTIL
 G DEPIL^%ANGEPIL
 
 
VALR K @(TEMPO) S @TEMPO@(1)="LIST",@TEMPO@(2)="NATT",@TEMPO@(3)="POS",@TEMPO@(4)="ATT",@TEMPO@(5)="L2",@TEMPO@(6)="SA" D EMPV^%ANGEPIL(TEMPO)
 S POS=1,SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("VALR1^%ANARBR8") G INT^%ANARBR2
VALR1 I (VAL="")!('(POS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$EX^%QSGEST7(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S LIST=VAL
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("VALR2^%ANARBR8") G INT^%ANARBR2
VALR2 I (POS=0)!(VAL="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom attribut d'extraction")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S ATT=VAL
 S VAL=$$GEN^%QCAPOP("VAL")
 D EXTR^%QS0VALE(LIST,ATT,VAL)
 D REAFF^%TLUTIL
 G DEPIL^%ANGEPIL
 
 
COPI K @(TEMPO) S @TEMPO@(1)="LIST",@TEMPO@(2)="R",@TEMPO@(3)="POS",@TEMPO@(4)="DUP",@TEMPO@(5)="SA" D EMPV^%ANGEPIL(TEMPO)
 S POS=1,SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("COPI1^%ANARBR8") G INT^%ANARBR2
COPI1 I (VAL="")!('(POS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$EX^%QSGEST7(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S LIST=VAL,VAL=$$GEN^%QCAPOP("DUP")
 D DUPL^%QS0DUPL(LIST,VAL,.R)
 I '(R) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Erreur au cours de la duplication")) S VAL="",POS=0
 D REAFF^%TLUTIL
 G DEPIL^%ANGEPIL
 
 
ARCTG K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("ARCTG1^%ANARBR8") G INT^%ANARBR2
ARCTG1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFARC^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non compris entre [-1,1]")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$ARCTG^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
 
ARROND K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="NB1",@TEMPO@(3)="SA",@TEMPO@(4)="VAL2",@TEMPO@(5)="DECIMAL",@TEMPO@(6)="MODE",@TEMPO@(7)="PUIS",@TEMPO@(8)="IP"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("ARROND1^%ANARBR8") G INT^%ANARBR2
ARROND1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("ARROND2^%ANARBR8") G INT^%ANARBR2
ARROND2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 I VAL>150 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("$JUSTIFIER: la longueur de la chaine ne doit pas depasser 150")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S NB1=VAL,A=$$RED(SA,3) I A=0 S VAL=$J(CHA,1,NB1)+0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("ARROND3^%ANARBR8") G INT^%ANARBR2
ARROND3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S MODE=VAL
 I $L(CHA,".")'=2 S VAL=$$GETLBLAN^%VTLBLAN($J(CHA,1,NB1))+0 G DEPIL^%ANGEPIL
ARROND4 S DECIMAL=$P(CHA,".",2)
 I $L(DECIMAL)'>NB1 S VAL=CHA G FARROND
 S PUIS=1 F IC=1:1:NB1 S PUIS=PUIS*10
 S VAL2=CHA*PUIS,RESTE=$P(VAL2,".",2)+0,VAL2=$P(VAL2,".")+0
 I RESTE=0 S VAL=VAL2/PUIS G DEPIL^%ANGEPIL
 S VAL=$S(MODE=0:VAL2/PUIS,1:(VAL2+1)/PUIS)
FARROND G DEPIL^%ANGEPIL
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

