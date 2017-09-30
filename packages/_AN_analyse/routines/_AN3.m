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

;%AN3^INT^1^59547,73865^0
%AN3 ;
 
 
 
 
 
M(M) Q:'(ERRMES)
 D ^%VZEAVT(M) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
VARIABLE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="%COMP1",@TEMPO@(3)="CARR" D EMPV^%ANGEPIL(TEMPO),CAR
 I (C'?1A)&("%"'[C) D M($$^%QZCHW("Une variable commence par une lettre ...")) S RESULT=0 G DEPIL^%ANGEPIL
 I (C="%")&($P(CH,P+1)=" ") D M($$^%QZCHW("Pas de "" "" apres le %")) S RESULT=0 G DEPIL^%ANGEPIL
 S CARR=C,%COMP1=%COMPIL,%COMPIL=""
 D EMPIL^%ANGEPIL("VAR1^%AN3") G IDF
VAR1 G:RESULT=0 DEPIL^%ANGEPIL
 I CARR="%" S ^DOC($J,"%",%COMPIL)=1,%COMPIL=%COMP1_"$$^%EDCVAR("""_%COMPIL_""",1)" G SVAR
 S %COMPIL=%COMP1_""""_%COMPIL_""""
SVAR D SET^%ANA(NORES,"TYPE","VARIABLE") G DEPIL^%ANGEPIL
 
 
VARTEMP 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="%COMP1",@TEMPO@(3)="%COMP2",@TEMPO@(4)="NO1"
 D EMPV^%ANGEPIL(TEMPO),CAR
 I "%"'=C D M($$^%QZCHW("Une variable temporaire commence par ""%"" ...")) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL="" D EMPIL^%ANGEPIL("VART1^%AN3") G IDF
VART1 G:RESULT=0 DEPIL^%ANGEPIL
 S NO1=NORES,^DOC($J,"%",%COMPIL)=1,%COMP2=%COMPIL,%COMPIL=""
 D CAR I C'="(" S %COMPIL="""""" G VART3
 D EMPIL^%ANGEPIL("VART2^%AN3") G INDICE^%AN4
VART2 G:RESULT=0 DEPIL^%ANGEPIL
 D KILL^%ANA(NORES)
VART3 S %COMPIL=%COMP1_$S(%PROVEN'="SD":"$$^%EDCVAR("""_%COMP2_""","_%COMPIL_")",1:"$$^%QSCALIN(""%"",$J,"""_%COMP2_""","_%COMPIL_")")
 D SET^%ANA(NO1,"TYPE","VARIABLE") S NORES=NO1 G DEPIL^%ANGEPIL
 
IDF 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="R" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I ((C'?1A)&("%"'[C))&(C'?1N) D M($$^%QZCHW("Caractere indesirable en debut d'identificateur ...")) S RESULT=0 G DEPIL^%ANGEPIL
 S R=C
BIDF D LEC1 G:(C'?1NA)&(C'=".") FIDF S R=R_C G BIDF
FIDF D:C=" " LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","IDF"),SET^%ANA(NORES,"TEXTE",R) S RI=R
 
 S %COMPIL=R
 G DEPIL^%ANGEPIL
 
IDF2 K @(TEMPO) S @TEMPO@(1)="A" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,RI="" D CAR
CONTI2 I (C'?1A)&("%"'[C) D M($$^%QZCHW("Le 1er caractere doit etre alphabetique ... ")) S RESULT=0 G DEPIL^%ANGEPIL
 S RI=RI_C
 I "%"=C D LEC1 G CONTI2
BIDF2 D LEC1 G:(C'?1NA)&(C'=".") FIDF2 S RI=RI_C G BIDF2
FIDF2 D:C=" " LEC
 S %COMPIL=RI
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","IDF"),SET^%ANA(NORES,"TEXTE",RI)
 
 S RR=RI G DEPIL^%ANGEPIL
 
LEX 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 S PP=P,NORES=0 D CAR
 I C="" S RESULT=0 G DEPIL^%ANGEPIL
 I C="@" D LEC S PP=PP+1
 D EMPIL^%ANGEPIL("LEX1^%AN3") G IDF2
LEX1 G:RESULT=0 DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,N=NORES,RI=$$RED^%ANA(N,"TEXTE")
 I $E(CH,PP,PP)="%" S PCHCOMP=RI G OKLEX
 S RO=""
BLEX S RO=RO_$$RED^%ANA(N,"TEXTE") D KILL^%ANA(N),CAR G:C'="." FLEX
 S RO=RO_C,%COMP1=RO D LEC,EMPIL^%ANGEPIL("BLEX1^%AN3") G IDF
BLEX1 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S N=NORES G BLEX
FLEX I %PROVEN="EDFORMAT" D M($$^%QZCHW("acces interdit aux attributs dans les formats")) G ERRLEX
 S PCH=RO,CONCUR=$$LEX^%LXSTOCK(PCH,.PCHCOMP)
 I ((CONCUR=1)&ERRMES)'=0 D POCLEPA^%VVIDEO W PCH_" --> "_PCHCOMP H 1 D POCLEPA^%VVIDEO G OKLEX
 G:CONCUR=1 OKLEX
 G:ERRMES=0 ERRLEX
 I CONCUR>1 D M(RO_$$^%QZCHW(" est ambigu au lexique")) G LEXI
 D M(RO_$$^%QZCHW(" est inconnu au lexique"))
LEXI D ADD^%AN7(RO),LEXIQ^%LXSTOCK(ROUTREAF) S CONCUR=$$LEX^%LXSTOCK(RO,.PCHCOMP)
FLS I CONCUR=1 D POCLEPA^%VVIDEO W PCH_" --> "_PCHCOMP H 1 D POCLEPA^%VVIDEO G OKLEX
 I CONCUR>1 D M(RO_$$^%QZCHW(" est ambigu au lexique"))
 D POCLEPA^%VVIDEO
ERRLEX S RESULT=0 G DEPIL^%ANGEPIL
OKLEX S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","NOM"),SET^%ANA(NORES,"TEXTE",PCHCOMP)
 S ATTD=ATTD+1,ATTD(ATTD)=PCHCOMP
 S %COMPIL=PCHCOMP G DEPIL^%ANGEPIL
 
ATTRIBUT 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="IND",@TEMPO@(3)="NOM",@TEMPO@(4)="%COMP1",@TEMPO@(5)="COMP",@TEMPO@(6)="%COMP2",@TEMPO@(7)="%COMP3",@TEMPO@(7)="COI",@TEMPO@(8)="LIENR",@TEMPO@(9)="NMREP"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S (IND,NOM,VARREP,LIENR)=0,(%COMP2,%COMP1,%COMP3)="",%COMP1=%COMPIL
 D EMPIL^%ANGEPIL("ATTR1^%AN3") G LEX
ATTR1 G:RESULT=0 DEPIL^%ANGEPIL
 S NOM=NORES,%COMP2=""""_%COMPIL_"""",COI=0,%COMPIL=""""""
 D CAR G:C'="(" VARLEX S COI=1 D EMPIL^%ANGEPIL("ATTR2^%AN3") G INDICE^%AN4
ATTR2 I RESULT=0 D KILL^%ANA(NOM) G DEPIL^%ANGEPIL
 S IND=NORES
VARLEX S %COMP3=%COMPIL,%COMPIL=""""""
 D CAR I ("^"'[C)!(C="") S NMREP="" G ENDATT
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ATTR3^%AN3") S COMP=0
 G:$D(^SANAREQ($J)) VARIABLE
 G LEX
ATTR3 I RESULT=0 D KILL^%ANA(NOM),KILL^%ANA(IND) G DEPIL^%ANGEPIL
 S VARREP=NORES,NMREP=$$RED^%ANA(VARREP,"TEXTE"),%COMPIL=""""_NMREP_""""
 G:(NMREP'="LIEN")&(NMREP'="INVERSE") ENDATT
 D CAR G:C'="(" ENDATT D LEC
 D EMPIL^%ANGEPIL("ATTR4^%AN3") G LEX
ATTR4 I RESULT=0 D KILL^%ANA(NOM),KILL^%ANA(IND),KILL^%ANA(VARREP) G DEPIL^%ANGEPIL
 D CAR I C'=")" D KILL^%ANA(NOM),KILL^%ANA(IND),KILL^%ANA(VARREP),KILL^%ANA(NORES),M($$^%QZCHW("Une ) etait attendue...")) G DEPIL^%ANGEPIL
 D LEC S NMREP=NMREP_"."_$$RED^%ANA(NORES,"TEXTE")
 D SET^%ANA(VARREP,"TEXTE",NMREP),KILL^%ANA(NORES)
 S %COMPIL=""""_NMREP_""""
ENDATT S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ATTRIBUT")
 D SET^%ANA(NORES,1,NOM),SET^%ANA(NORES,2,IND),SET^%ANA(NORES,3,VARREP)
 S %COMPIL=%COMP1_"$$^%EDVDAT("_%COMPIL_",BASE,OBJET,"_%COMP2_","_%COMP3_")"
 S %COMP2=$E(%COMP2,2,$L(%COMP2)-1)
 I COI=0 S ^DOC($J,"ATT",%COMP2)=1 G ENDA2
 S:$E(%COMP3)="""" %COMP3=$E(%COMP3,2,$L(%COMP3)-1)
 S:NOCOMPIL=0 ^DOC($J,"ATT",%COMP2,%COMP3)=1
ENDA2 
 I NOCOMPIL=0,$E(NMREP)="%" S ^DOC($J,"%INDIVIDU",NMREP)="" K ^DOC($J,"%",NMREP),^DOC($J,"ATT",%COMP2)
 G DEPIL^%ANGEPIL
 ;
 ;

