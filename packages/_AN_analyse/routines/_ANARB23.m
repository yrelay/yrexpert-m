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

;%ANARB23^INT^1^59547,73866^0
%ANARB23 ;
 
 
 
 
ANAL 
 I MODAF'=0 D ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Creation d'un element graphique"))
 I $E(P1)="""" S P1=$E(P1,2,$L(P1)-1)
 I $E(P2)="""" S P2=$E(P2,2,$L(P2)-1)
 D ISESS^%SDEANTI(P1,P2,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 S POP=0
 
 I P3="""""" S P3=$ZP(@GLTEXT@("z"))+1,@GLTEXT@(P3)="",POP=1
 S SYNT=P3_" ; "_SYNT
 S OK=$$LIGNE^%SDEANT1(SYNT,0,23,"",0,1,.NUM,.RES,.MSG)
 I OK=0 K:POP=1 @GLTEXT@(P3)
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 
 I OK=0 G FIN0
 
 D MAJVAR^%SDEGES3(P1,P2)
 S VAL=NUM
 G DEPIL^%ANGEPIL
 
FIN0 S VAL=0 G ERC
 
ERR S VAL="" G ERC
 
ERC S ECHEC=1,POS=0
 I MSG'="" D:MODAF ADD^%TLIFEN("LOG","   "_MSG)
 G DEPIL^%ANGEPIL
 
 
DROITE 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8",@TEMPO@(9)="P9",@TEMPO@(10)="P10",@TEMPO@(11)="P11"
 S @TEMPO@(12)="SA",@TEMPO@(13)="SYNT",@TEMPO@(14)="OK",@TEMPO@(15)="POP",@TEMPO@(16)="NUM",@TEMPO@(17)="RES",@TEMPO@(18)="MSG",@TEMPO@(19)="I",@TEMPO@(20)="VALPAR",@TEMPO@(21)="COND"
 D EMPV^%ANGEPIL(TEMPO)
 S P11="",I=0
 S SA=A
PARD 
 S I=I+1
 
 I I=11,P6=1 G ANAD
 S A=$$RED(SA,I)
 
 I I=11,A=0 G ANAD
 D EMPIL^%ANGEPIL("FDR^%ANARB23") G INT^%ANARBR2
FDR 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=11 G PARD
 
ANAD 
 D EMPIL^%ANGEPIL("ANAD0^%ANARB23") G CONDIT
ANAD0 
 S SYNT="DROITE ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8="""""":$E(P7,2,$L(P7)-1),1:"("_P7_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10="""""":$E(P9,2,$L(P9)-1),1:"("_P9_" ; "_P10_")")
 I P6=2 S SYNT=SYNT_P9_" ; "_P10_" ; "_$E(P11,2,$L(P11)-1)
 S SYNT=SYNT_COND
 G ANAL
 
 
CERCLE 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8",@TEMPO@(9)="P9",@TEMPO@(10)="P10"
 S @TEMPO@(11)="SA",@TEMPO@(12)="SYNT",@TEMPO@(13)="OK",@TEMPO@(14)="POP",@TEMPO@(15)="NUM",@TEMPO@(16)="RES",@TEMPO@(17)="MSG",@TEMPO@(18)="I",@TEMPO@(19)="VALPAR"
 D EMPV^%ANGEPIL(TEMPO)
 S I=0
 S SA=A
PARC 
 S I=I+1
 
 I I=10,P6=2 G ANAC
 S A=$$RED(SA,I)
 D EMPIL^%ANGEPIL("FCE^%ANARB23") G INT^%ANARBR2
FCE 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=10 G PARC
 
ANAC 
 D EMPIL^%ANGEPIL("ANAC0^%ANARB23") G CONDIT
ANAC0 
 S SYNT="CERCLE ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8="""""":$E(P7,2,$L(P7)-1),1:"("_P7_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10="""""":$E(P9,2,$L(P9)-1),1:"("_P9_" ; "_P10_")")
 I P6=2 S SYNT=SYNT_P9
 S SYNT=SYNT_COND
 G ANAL
 
 
ARC 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8"
 S @TEMPO@(9)="P9",@TEMPO@(10)="P10",@TEMPO@(11)="P11",@TEMPO@(12)="P12",@TEMPO@(13)="P13"
 S @TEMPO@(14)="SA",@TEMPO@(15)="SYNT",@TEMPO@(16)="OK",@TEMPO@(17)="POP",@TEMPO@(18)="NUM",@TEMPO@(19)="RES",@TEMPO@(20)="MSG",@TEMPO@(21)="I",@TEMPO@(22)="VALPAR"
 D EMPV^%ANGEPIL(TEMPO)
 S (P12,P13)="",I=0
 S SA=A
PARA 
 S I=I+1
 
 I I=13,P6=1 G ANAA
 S A=$$RED(SA,I)
 
 
 D EMPIL^%ANGEPIL("FAR^%ANARB23") G INT^%ANARBR2
FAR 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=13 G PARA
 
ANAA 
 D EMPIL^%ANGEPIL("ANAA0^%ANARB23") G CONDIT
ANAA0 
 S SYNT="ARC ; "_P4_" ; "_P5_" ; "_P6_" ; "_$S(P8="""""":$E(P7,2,$L(P7)-1),1:"("_P7_" ; "_P8_")")_" ; "
 I P6=1 S SYNT=SYNT_$S(P10="""""":$E(P9,2,$L(P9)-1),1:"("_P9_" ; "_P10_")")_" ; "_$S(P12="""""":$E(P11,2,$L(P11)-1),1:"("_P11_" ; "_P12_")")_COND G ANAA1
 
 I P6=2 S SYNT=SYNT_P9_" ; "_P10_" ; "_P11_$S(P12="""""":"",1:" ; "_$E(P12,2,$L(P12)-1)_" ; "_$E(P13,2,$L(P13)-1))
 I COND="" G ANAA1
 I P12="""""" S SYNT=SYNT_" ;  ; "
 S SYNT=SYNT_COND
ANAA1 G ANAL
 
CONDIT 
 S A=$$RED(SA,"CONDITION")
 D EMPIL^%ANGEPIL("CONDIT0^%ANARB23") G INT^%ANARBR2
CONDIT0 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer texte") G ERR
 S COND=$S(VAL="":"",1:" ; ""CONDITION"" ; """_VAL_"""")
 G RET^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

