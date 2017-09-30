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

;LKZ^INT^1^59547,74868^0
LKZ ;
 
 
 
 
 
 
EX(C) Q $E(C,1,$L(C)-1)
 
 
 
CONTEXT() 
 
 
 
 S TEMP="^TEMPORAI($J,""LKPHY"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S PVECT=$$EX^LKZ(TEMP)_",""PVECT"")"
 N I F I="ROOT","APP","NODE","DATE","UNIT","PROT","VECT" S @I=@PAR@(I)
 S ERRA=$$EX^LKZ(ROOT)_",""ERR"")"
 S DATA=$$EX^LKZ(ROOT)_",""DATA"")"
 I '($$OKP(PROT)) S @ERRA@("ERR")=$$^%QZCHW("Protocole pas supporte") Q 1
 Q 0
 
 
 
OKP(P) Q 1
 I (($D(@PAR@("WRITE"))=0)!$D(@PAR@("READ")))=0 W *
 
 
 
 
 
NB(A) N D S @("D=$D("_A_")") Q:D @(A) Q 0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SETERR(TAB,ER,P,M,ED) 
 Q:'($D(M))
 S:M["D" @ED@(ER)=$$^%QZCHW(@TAB@(ER))
 S:M["I" @ERRA@(P,ER)=$$NB^LKZ("@ERRA@("""_P_""","""_ER_""")")+1
 Q
 
 
 
 
 
 
 
 
CONCAT(ROOT,CLE) 
 I CLE="" Q ROOT
 I ROOT["(" S ROOT=$$EX^LKZ(ROOT)_","_CLE_")" Q ROOT
 Q ROOT_"("_CLE_")"
CONCAS(ROOT,CLE) Q $$CONCAT(ROOT,$$S(CLE))
 
S(S) N A,B S A=",",B=""",""" Q """"_$$ZSUBST^%QZCHSUB(S,A,B)_""""
S1(S) N A,B S A="""",B="""""" Q """"_$$ZSUBST^%QZCHSUB(S,A,B)_""""
 
TEST1 W !,$$EX("^A(""JHGJHG"",""KJGHKJHG"")")
 W !,$$EX("A")
 W !,$$EX("")
 Q
TEST2 S TEMP="^TITI" K ^TITI
 W !,$$NB^LKZ("@TEMP@(""T"",""U"")")
 S ^TITI("T","U")=5
 W !,$$NB^LKZ("@TEMP@(""T"",""U"")")
 Q
TEST S TABERR="^TITIX",^TITIX("VT")=" VALEUR TR "
 S ED="^TITIX(""DATA"")",^TITIX("DATA")=12
 S ERRA="^TITIX(""ERRA"")"
 D SETERR(TABERR,"VT","BLK","DI",ED)
 Q
TEST3 S A="^TOTO",B="A,D,""C""" D T3
 S A="^TOTO",B="" D T3
 S A="",B="A,D,""C""" D T3
 S A="^TOTO(U,""V"",I,""W"")",B="A,D,""C""" D T3
T3 W !,A,"  ",B," --> ",$$CONCAT(A,B) Q
 ;

