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

;%ANARBR3^INT^1^59547,73866^0
%ANARBR3 ;
 
 
 
 
 
 
 
FOPAR 
 K @(TEMPO)
 S @TEMPO@(1)="CHA",@TEMPO@(2)="SEP",@TEMPO@(3)="POSI"
 S @TEMPO@(4)="POS2",@TEMPO@(4)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOPAR1^%ANARBR3") G INT^%ANARBR2
FOPAR1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("FOPAR2^%ANARBR3") G INT^%ANARBR2
FOPAR2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S SEP=VAL,A=$$RED(SA,3)
 I A=0 S VAL=$P(CHA,SEP) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOPAR3^%ANARBR3") G INT^%ANARBR2
FOPAR3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S POSI=VAL,A=$$RED(SA,4)
 I A=0 S VAL=$P(CHA,SEP,POSI) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOPAR4^%ANARBR3") G INT^%ANARBR2
FOPAR4 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$P(CHA,SEP,POSI,VAL) G DEPIL^%ANGEPIL
 
 
FOTROUV 
 K @(TEMPO)
 S @TEMPO@(1)="CHA",@TEMPO@(2)="SEP",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOTR1^%ANARBR3") G INT^%ANARBR2
FOTR1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("FOTR2^%ANARBR3")
 G INT^%ANARBR2
FOTR2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S SEP=VAL,A=$$RED(SA,3)
 I A=0 S VAL=$F(CHA,SEP) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOTR3^%ANARBR3") G INT^%ANARBR2
FOTR3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$F(CHA,SEP,VAL) G DEPIL^%ANGEPIL
 
 
FOJUS 
 K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="NB1",@TEMPO@(3)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOJUS1^%ANARBR3") G INT^%ANARBR2
FOJUS1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("FOJUS2^%ANARBR3") G INT^%ANARBR2
FOJUS2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 I VAL>150 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("$JUSTIFIER: la longueur de la chaine ne doit pas depasser 150")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S NB1=VAL,A=$$RED(SA,3)
 I A=0 S VAL=$J(CHA,NB1) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOJUS3^%ANARBR3") G INT^%ANARBR2
FOJUS3 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$J(CHA,NB1,VAL) G DEPIL^%ANGEPIL
 
 
FOLONG 
 K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOLONG1^%ANARBR3") G INT^%ANARBR2
FOLONG1 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S CHA=VAL,A=$$RED(SA,2)
 I A=0 S VAL=$L(CHA) G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FOLONG2^%ANARBR3") G INT^%ANARBR2
FOLONG2 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VAL=$L(CHA,VAL) G DEPIL^%ANGEPIL
 
 
FOMAJ 
 K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOMAJ1^%ANARBR3") G INT^%ANARBR2
FOMAJ1 G:POS=0 DEPIL^%ANGEPIL
 S VAL=$$MAJ^%VMINUSC(VAL)
 G DEPIL^%ANGEPIL
 
 
FOMIN 
 K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="SA"
 D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1)
 D EMPIL^%ANGEPIL("FOMIN1^%ANARBR3") G INT^%ANARBR2
FOMIN1 G:POS=0 DEPIL^%ANGEPIL
 S VAL=$$MIN^%VMINUSC(VAL)
 G DEPIL^%ANGEPIL
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

