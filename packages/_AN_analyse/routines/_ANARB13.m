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

;%ANARB13^INT^1^59547,73866^0
%ANARB13 ;
FONETTOY S A=$$RED(A,1) D EMPIL^%ANGEPIL("FONET1^%ANARB13") G INT^%ANARBR2
FONET1 I VAL="" S POS=0 G RET^%ANGEPIL
 S VAL=$$GETLBLAN^%VTLBLAN(VAL) G RET^%ANGEPIL
FOSSC K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="P1",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("FOSSC1^%ANARB13") G INT^%ANARBR2
FOSSC1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2) I A=0 S VAL=$E(CHA) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOSSC2^%ANARB13") G INT^%ANARBR2
FOSSC2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S P1=VAL,A=$$RED(SA,3) I A=0 S VAL=$E(CHA,P1) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOSSC3^%ANARB13") G INT^%ANARBR2
FOSSC3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$E(CHA,P1,VAL) G DEPIL^%ANGEPIL
 
OPE K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="SA",@TEMPO@(3)="OPR"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("OPE1^%ANARB13") G INT^%ANARBR2
OPE1 I POS=0 S VAL="" G DEPIL^%ANGEPIL
 S OPR=$$RED(SA,"TEXTE")
 S E1=$S(OPR'="_":$$S(VAL),1:$$S2(VAL))
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("OPE2^%ANARB13")
 G INT^%ANARBR2
OPE2 I POS=0 S VAL="" G DEPIL^%ANGEPIL
 S VAL=$S(OPR'="_":$$S(VAL),1:$$S2(VAL))
 I ((OPR="/")!(OPR="\"))&(VAL=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("calcul impossible : diviseur nul")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S VAL="("_E1_OPR_VAL_")",@("VAL="_VAL),POS=1
 G DEPIL^%ANGEPIL
 
PRE S VAL=$$RED(A,"TEXTE") G RET^%ANGEPIL
 
OPL K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="OP",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO) S SA=A,OP=$$RED(A,"TEXTE")
 S OP=$S(OP="OU":"!",OP="ET":"&",1:OP)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("OPL1^%ANARB13") G INT^%ANARBR2
OPL1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E1=$$S(VAL)
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("OPL2^%ANARB13") G INT^%ANARBR2
OPL2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$$S(VAL)
 S VAL="("_E1_OP_VAL_")",@("VAL="_VAL) G DEPIL^%ANGEPIL
 
VAR S VAL=$$RED(A,"TEXTE")
 I $E(VAL,1)'="%" G RET^%ANGEPIL
 S VAL=$$^%QSCALVA(CARBR1("%","BASE"),CARBR1("%","OBJET"),VAL)
 S:VAL="" POS=0 G RET^%ANGEPIL
 
S(E) Q:E="" """""" Q:$$PARA^%QZNBN1(E) E Q """"_$$ZSUBST^%QZCHSUB(E,"""","""""")_""""
S2(E) Q:E="" """""" Q """"_$$ZSUBST^%QZCHSUB(E,"""","""""")_""""
 
TANG K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("TANG1^%ANARB13") G INT^%ANARBR2
TANG1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) S VAL="",POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) G DEPIL^%ANGEPIL
 S VAL=$$TG^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
COTG K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("COTG1^%ANARB13") G INT^%ANARBR2
COTG1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) S VAL="",POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) G DEPIL^%ANGEPIL
 S VAL=$$COTG^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
ARCOTG K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("ARCOTG1^%ANARB13") G INT^%ANARBR2
ARCOTG1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$VERIFARC^%TLCAMTH(VAL)) S VAL="",POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non compris entre [-1,1]")) G DEPIL^%ANGEPIL
 S VAL=$$ARCCOTG^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
ALEAN S A=$$RED(A,1) D EMPIL^%ANGEPIL("ALEAN1^%ANARB13") G INT^%ANARBR2
ALEAN1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 I '($$PARA^%QZNBN1(VAL)) S VAL="",POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) G DEPIL^%ANGEPIL
 S VAL=VAL_"/"
 S VAL=$$FONC^%TLFNUMI("%TLCAALE",VAL)
 G RET^%ANGEPIL
 
ALEAL K @(TEMPO) S @TEMPO@(1)="NB" D EMPV^%ANGEPIL(TEMPO)
 S NB=$$RED($$RED(A,1),"TEXTE")
 
 
 S NB=$R(NB)+1
 S A=$$RED(A,NB+1) D EMPIL^%ANGEPIL("ALEAL1^%ANARB13") G INT^%ANARBR2
ALEAL1 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer valeur choisie")) S VAL=""
 G DEPIL^%ANGEPIL
 
MESSAG K @(TEMPO) S @TEMPO@(1)="MS",@TEMPO@(2)="CTR" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("MESSAG1^%ANARB13") G INT^%ANARBR2
MESSAG1 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer message")) S VAL="" G DEPIL^%ANGEPIL
 S MS=VAL,VAL="",CTR=""
 D COLR^%VZEAVT(MS,0,79,0)
 D ^%VLECFL("","","","",DX,DY,"",.CTR,.VAL)
 D POCLEPA^%VVIDEO
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

