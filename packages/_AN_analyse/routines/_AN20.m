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

;%AN20^INT^1^59547,73865^0
AN20 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
CBINAIRE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR S R="" G:C'="'" CB S R=C D LEC
CB I "><=[]"'[C D M("Un comparateur >,<,=,[,ou ] etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=R_C,NORES=$$NEW^%ANA D LEC
 D SET^%ANA(NORES,"TYPE","COMPARATEUR.BINAIRE"),SET^%ANA(NORES,"TEXTE",R) S %COMPIL=%COMPIL_R G DEPIL^%ANGEPIL
 
CTERNAIR 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S R=""
 I C="'" S R="'" D LEC
 I "[]"'[C D M("Un comparateur [],[[,]],ou ][ etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=R_C D LEC1
 I "[]"'[C D M("Un comparateur [],[[,]],ou ][ etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=R_C D LEC S NORES=$$NEW^%ANA,%COMPIL=R
 D SET^%ANA(NORES,"TYPE","COMPARATEUR.TERNAIRE"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL
 
OBINAIRE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I "_#+-*/\"'[C S RESULT=0 G DEPIL^%ANGEPIL
 S R=C D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","OPERATEUR"),SET^%ANA(NORES,"TEXTE",R) S %COMPIL=%COMPIL_R G DEPIL^%ANGEPIL
 
OLOGIQUE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="R",@TEMPO@(4)="ET",@TEMPO@(5)="LET" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S ET=$$^%QZCHW("ET"),R=ET,LET=$L(ET) G:$E(CH,P,(P+LET)-1)=ET OLOG2
 S ET=$$^%QZCHW("OU"),R=ET,LET=$L(ET) G:$E(CH,P,(P+LET)-1)=ET OLOG2
 D M("Operateur logique ET ou OU attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
OLOG2 S NORES=$$NEW^%ANA F I=1:1:LET D LEC
 D SET^%ANA(NORES,"TYPE","OPERATEUR.LOGIQUE"),SET^%ANA(NORES,"TEXTE",R) S %COMPIL=%COMPIL_$S(R="ET":")&(",R="OU":")!(") G DEPIL^%ANGEPIL
 
OLOGBIN 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="L",@TEMPO@(4)="C2"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 G:C="!" OLOGBF
 G:C="&" OLOGBF
 I $E(CH,P,P+LET)=ET S C2="&",L=LET G OLOGB2
 I $E(CH,P,P+LOU)=OU S C2="!",L=LOU G OLOGB2
 D M("Operateur logique ""!"", ""&"", ""OU"" ou ""ET"" attendu ...")
 S RESULT=0 G DEPIL^%ANGEPIL
OLOGB2 F I=1:1:L D LEC
 S C=C2
OLOGBF S NORES=$$NEW^%ANA
 S:'(NOCOMPIL) %COMPIL=%COMPIL_$S(C2="&":")&(",C2="!":")!(")
 D SET^%ANA(NORES,"TYPE","OPERATEUR"),SET^%ANA(NORES,"TEXTE",C),LEC G DEPIL^%ANGEPIL
 
OPRECED 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S R=$E(CH,P,P+1)
 I R'="<<" D M("Operateur de precedence << attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","OPERATEUR.PRECEDENCE"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL
 
BOOL 
 K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I (C'=1)&(C'=0) D M("Valeur 1 ou 0 attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 S NORES=$$NEW^%ANA,%COMPIL=C
 D SET^%ANA(NORES,"TYPE","CHAINE"),SET^%ANA(NORES,"TEXTE",C),LEC G DEPIL^%ANGEPIL
 Q
 
EXPLEGAL 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R",@TEMPO@(3)="TER",@TEMPO@(4)="A1",@TEMPO@(5)="A2" D EMPV^%ANGEPIL(TEMPO)
 S (TER,A1,A2)=0
 D CAR S R="" G:C'="'" NN S R=C D LEC
NN I "><=[]"'[C D M("Un comparateur >,<,=,[,ou ] etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=R_C D LEC
 I "[]"[C S R=R_C,TER=1 D LEC
 S A1=$$NEW^%ANA
 D SET^%ANA(A1,"TYPE",$S(TER:"COMPARATEUR.TERNAIRE",1:"COMPARATEUR.BINAIRE"))
 D SET^%ANA(A1,"TEXTE",R)
 G:TER DBL
 
 D CAR,EMPIL^%ANGEPIL("FEXP^%AN20") G EXPRESS^%AN4
FEXP I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES
 D SET^%ANA(A1,2,A2) S NORES=A1 G DEPIL^%ANGEPIL
 
DBL D CAR,EMPIL^%ANGEPIL("DBL1^%AN20") G EXPRESS^%AN4
DBL1 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES D SET^%ANA(A1,2,A2)
 D CAR I C'="," D KILL^%ANA(A1),M("Une virgule entre les deux bornes est necessaire ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DBL2^%AN20") G EXPRESS^%AN4
DBL2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 D SET^%ANA(A1,3,NORES) S NORES=A1
 G DEPIL^%ANGEPIL

