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

;%AN1^INT^1^59547,73865^0
AN1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
ENTIER K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="B",@TEMPO@(3)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'?1N D M("Un nombre etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=C D LEC F B=0:0 Q:C'?1N  S R=R_C D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ENTIER"),SET^%ANA(NORES,"TEXTE",R) S %COMPIL=%COMPIL_R G DEPIL^%ANGEPIL
 
NOMBRE K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S R=""
 I C="-" S R="-",%COMPIL=%COMPIL_"-" D LEC
 G:C="." N3
N1 D EMPIL^%ANGEPIL("N10^%AN1") G ENTIER
N10 G:RESULT=0 DEPIL^%ANGEPIL
 S R=R_$$RED^%ANA(NORES,"TEXTE") D KILL^%ANA(NORES)
N2 D CAR G:C'="." NOK
N3 S R=R_".",%COMPIL=%COMPIL_"." D LEC,EMPIL^%ANGEPIL("N30^%AN1") G ENTIER
N30 G:RESULT=0 DEPIL^%ANGEPIL
 S R=R_$$RED^%ANA(NORES,"TEXTE") D KILL^%ANA(NORES)
NOK S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","NOMBRE"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL
 
CHAINE K @(TEMPO) S @TEMPO@(1)="B",@TEMPO@(2)="C",@TEMPO@(3)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'="""" D M("Une chaine de caracteres etait attendue et doit debuter par "" ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC1 S R=""
CHAIN1 F B=0:0 Q:(C="""")!(C="")  S R=R_C D LEC1
 I C'="""" D M("Une chaine de caracteres doit se terminer par "" ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 I C="""" S R=R_C D LEC1 G CHAIN1
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","CHAINE"),SET^%ANA(NORES,"TEXTE",R) G:NOCOMPIL DEPIL^%ANGEPIL
 I ($L(%COMPIL)+$L(R))>450 D M("Cette phrase est trop longue et ne peut-etre compilee") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_""""_$$ZSUBST^%QZCHSUB(R,"""","""""")_"""" G DEPIL^%ANGEPIL
 
OBJET K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR,EMPIL^%ANGEPIL("OBJ1^%AN1")
 G:C="""" CHAINE
 G:((C?1N)!("."[C))!(C="-") NOMBRE
 G:(C="%")&(NOCOMPIL=0) VARTEMP^%AN3
 G:(C="%")!((C?1A)&(C'="$")) ATTRIBUT^%AN3
 G:(C="$")&($$^%QCAZG("^NAVARACT($J)")="") FONCTION^%AN2
 G:(C="$")&$$MOTRESERVE^%AN15 MOTRES^%AN25
 G:C="$" FONCTION^%AN2
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G RET^%ANGEPIL
 S %COMPIL=%COMPIL_"("
 D LEC,EMPIL^%ANGEPIL("OBJ0^%AN1") G EXPRESS^%AN4
OBJ0 G:RESULT=0 RET^%ANGEPIL
 D CAR I C'=")" D M("Il manque une ) ...") S RESULT=0 G RET^%ANGEPIL
 S %COMPIL=%COMPIL_")"
 D LEC G RET^%ANGEPIL
OBJ1 S:NOCOMPIL=1 %COMPIL=""
 G DEPIL^%ANGEPIL
 
OBJVARACT G:'($$MOTRESERVE^%AN15) FONCTION^%AN2
 G MOTRES^%AN25
 
CBINAIRE G CBINAIRE^%AN20
 
CTERNAIR G CTERNAIR^%AN20
 
OBINAIRE G OBINAIRE^%AN20
 
OLOGIQUE G OLOGIQUE^%AN20
 
OLOGBIN G OLOGBIN^%AN20
 
OPRECED G OPRECED^%AN20
 
ALFANUM K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'?1NA D M("Un caractere alphanumerique etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 S R=C D LEC
BALFA G:(C'?1NA)&(C'=".") FALFA S R=R_C D LEC G BALFA
FALFA S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ALFANUM"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL
CHAINEX K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="D" D EMPV^%ANGEPIL(TEMPO) S (NORES,D)=0
 D CAR I C'="""" D M("Un "" etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
BX S D=$$NEW^%ANA D SET^%ANA(D,"TYPE","CHAINEX"),SET^%ANA(D,1,NORES)
 D EMPIL^%ANGEPIL("BX1^%AN1") G ATOM
BX1 I RESULT=0 D KILL^%ANA(D) G DEPIL^%ANGEPIL
 D CAR
 I C="" D M("Il faut un "" pour terminer une chaine"),KILL^%ANA(D) S RESULT=0 G DEPIL^%ANGEPIL
 D SET^%ANA(D,2,NORES) S NORES=D I C'="""" S %COMPIL=%COMPIL_" " G BX
 D LEC G DEPIL^%ANGEPIL
CAREX K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'="""" D M("Un "" etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC1 S R=C I (C="")!(C="""") D M("Un caractere etait attendu ... ") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC1
 I C'="""" D M("Une chaine de caracteres doit se terminer par "" ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","CHAINE"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL
ATOM K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0
 D CAR,EMPIL^%ANGEPIL("ATOM1^%AN1") G:C'="@" NIMP
 D:$E(CH,P+1)="$" LEC G EXPRESS^%AN4
ATOM1 G DEPIL^%ANGEPIL
 
NIMP K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="R" D EMPV^%ANGEPIL(TEMPO),CAR
 S NORES=0,R="" D CAR F I=0:0 Q:""""[C  S R=R_C D LEC1
 D:C=" " LEC
 S %COMPIL=%COMPIL_R
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","NIMP"),SET^%ANA(NORES,"TEXTE",R) G DEPIL^%ANGEPIL

