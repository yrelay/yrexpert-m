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

;%ANARB24^INT^1^59547,73866^0
%ANARB24 ;
 
 
 
 
ERR S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
POINT 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8"
 S @TEMPO@(9)="SA",@TEMPO@(10)="SYNT",@TEMPO@(11)="OK",@TEMPO@(12)="POP",@TEMPO@(13)="NUM",@TEMPO@(14)="RES",@TEMPO@(15)="MSG",@TEMPO@(16)="I",@TEMPO@(17)="VALPAR"
 D EMPV^%ANGEPIL(TEMPO)
 S (P7,P8)="",I=0
 S SA=A
PARP 
 S I=I+1
 S A=$$RED(SA,I)
 
 I I=7,A=0 G ANAP
 D EMPIL^%ANGEPIL("FPO^%ANARB24") G INT^%ANARBR2
FPO 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=9 G PARP
 
ANAP 
 D EMPIL^%ANGEPIL("ANAP0^%ANARB24") G CONDIT^%ANARB23
ANAP0 
 S SYNT="POINT ; "_$E(P4,2,$L(P4)-1)_" ; "_P5_" ; "_P6_" ; ( "_P7_" ; "_P8_" )"
 S SYNT=SYNT_COND
 G ANAL^%ANARB23
 
 
TEXTE 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8"
 S @TEMPO@(9)="SA",@TEMPO@(10)="SYNT",@TEMPO@(11)="OK",@TEMPO@(12)="POP",@TEMPO@(13)="NUM",@TEMPO@(14)="RES",@TEMPO@(15)="MSG",@TEMPO@(16)="I",@TEMPO@(17)="VALPAR"
 D EMPV^%ANGEPIL(TEMPO)
 S P8="",I=0
 S SA=A
PART 
 S I=I+1
 S A=$$RED(SA,I)
 
 I I=8,A=0 G ANAT
 D EMPIL^%ANGEPIL("FTE^%ANARB24") G INT^%ANARBR2
FTE 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=9 G PART
 
ANAT 
 D EMPIL^%ANGEPIL("ANAT0^%ANARB24") G CONDIT^%ANARB23
ANAT0 
 D SUBST(.P7)
 S SYNT="TEXTE ; "_P4_" ; "_$S(P6="""""":$E(P5,2,$L(P5)-1),1:"("_P5_" ; "_P6_")")_" ; "_P7_$S(P8="":"",1:" ; "_P8)
 I COND="" G ANAT1
 I P8="" S SYNT=SYNT_" ; "
 S SYNT=SYNT_COND
ANAT1 G ANAL^%ANARB23
SUBST(P7) 
 I ((P7'["$SYMBOLE")&(P7'["$BAS"))&(P7'["$HAUT") Q
 S P7=$$ZSUBST^%QZCHSUB(P7,"""""","""")
 Q
 
 
FLECHE 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8"
 S @TEMPO@(9)="P9",@TEMPO@(10)="P10",@TEMPO@(11)="P11",@TEMPO@(12)="P12",@TEMPO@(13)="P13"
 S @TEMPO@(14)="SA",@TEMPO@(15)="SYNT",@TEMPO@(16)="OK",@TEMPO@(17)="POP",@TEMPO@(18)="NUM",@TEMPO@(19)="RES",@TEMPO@(20)="MSG",@TEMPO@(21)="I",@TEMPO@(22)="VALPAR",@TEMPO@(23)="TEXTE"
 D EMPV^%ANGEPIL(TEMPO)
 S P13="",I=0
 S SA=A
PARF 
 S I=I+1
 
 I I=13,P8=1 G ANAF
 S A=$$RED(SA,I)
 
 I I=13,A=0 G ANAF
 D EMPIL^%ANGEPIL("FFL^%ANARB24") G INT^%ANARBR2
FFL 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=14 G PARF
 
ANAF 
 S A=$$RED(SA,"PAR.TEXTE")
 D EMPIL^%ANGEPIL("PARFT^%ANARB24") G INT^%ANARBR2
PARFT 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer texte") G ERR
 S TEXTE=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 I (P6'="""EXTERIEUR""")&(P6'="""INTERIEUR""") S MSG=$$^%QZCHW("6eme param. ""EXTERIEUR""/""INTERIEUR""") G ERR
 I (P7'="""SIMPLE""")&(P7'="""DOUBLE""") S MSG=$$^%QZCHW("7eme param. ""SIMPLE""/""DOUBLE""") G ERR
 D EMPIL^%ANGEPIL("PARFT0^%ANARB24") G CONDIT^%ANARB23
PARFT0 
 S SYNT="FLECHE ; "_P4_" ; "_P5_" ; "_P6_" ; "_P7_" ; "_TEXTE_" ; "_P8_" ; "_$S(P10="""""":$E(P9,2,$L(P9)-1),1:"("_P9_" ; "_P10_")")_" ; "
 I P8=1 S SYNT=SYNT_$S(P12="""""":$E(P11,2,$L(P11)-1),1:"("_P11_" ; "_P12_")")_COND G PARFT1
 I P8=2 S SYNT=SYNT_P11_" ; "_P12_$S(P13="":"",1:" ; "_$E(P13,2,$L(P13)-1))
 I COND="" G PARFT1
 I P13="" S SYNT=SYNT_" ; "
 S SYNT=SYNT_COND
PARFT1 G ANAL^%ANARB23
 
 
ELLI 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8"
 S @TEMPO@(9)="P9",@TEMPO@(10)="P10",@TEMPO@(11)="P11",@TEMPO@(12)="P12",@TEMPO@(13)="P13"
 S @TEMPO@(14)="SA",@TEMPO@(15)="SYNT",@TEMPO@(16)="OK",@TEMPO@(17)="POP",@TEMPO@(18)="NUM",@TEMPO@(19)="RES",@TEMPO@(20)="MSG",@TEMPO@(21)="I",@TEMPO@(22)="VALPAR",@TEMPO@(23)="TYPELL"
 D EMPV^%ANGEPIL(TEMPO)
 S (P12,P13)="",I=0
 S TYPELL=$P(TYP,"$CREER.",2)
 S SA=A
PARE 
 S I=I+1
 
 I I=13,P6=1 G ANAE
 S A=$$RED(SA,I)
 
 
 D EMPIL^%ANGEPIL("FEL^%ANARB24") G INT^%ANARBR2
FEL 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=14 G PARE
 
ANAE 
 D EMPIL^%ANGEPIL("ANAE0^%ANARB24") G CONDIT^%ANARB23
ANAE0 
 S SYNT=TYPELL_" ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8="""""":$E(P7,2,$L(P7)-1),1:"("_P7_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10="""""":$E(P9,2,$L(P9)-1),1:"("_P9_" ; "_P10_")")_" ; "_$S(P12="""""":$E(P11,2,$L(P11)-1),1:"("_P11_" ; "_P12_")")_COND G ANAE1
 I P6=2 S SYNT=SYNT_P9_" ; "_P10_" ; "_P11_$S(P12="""""":"",1:" ; "_$E(P12,2,$L(P12)-1)_" ; "_$E(P13,2,$L(P13)-1))
 I COND="" G ANAE1
 I P12="""""" S SYNT=SYNT_" ; ; "
 S SYNT=SYNT_COND
ANAE1 G ANAL^%ANARB23
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

