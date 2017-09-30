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

;%AN57^INT^1^59547,73866^0
%AN57 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
JALON 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="LISTE",@TEMPO@(3)="SENS",@TEMPO@(4)="CAPLIM",@TEMPO@(5)="DATE",@TEMPO@(6)="ETU",@TEMPO@(7)="LAN",@TEMPO@(8)="DEC"
 S @TEMPO@(9)="COCONT",@TEMPO@(10)="MAXITER",@TEMPO@(11)="TYPDEC"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("JAL")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (ETU,LAN,LISTE,SENS,CAPLIM,DATE,DEC,TYPDEC,COCONT,MAXITER)=0
 
 F I=1:1:$L($$^%QZCHW("$JALONNER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("JAL0^%AN57") G VARTEMP^%AN3
JAL0 I RESULT=0 G DEPIL^%ANGEPIL
 S ETU=NORES
 D CAR
 
 I C=")" G JALF
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL1^%AN57") G EXPRESS^%AN4
JAL1 I RESULT=0 G DEPIL^%ANGEPIL
 S LAN=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL2^%AN57") G EXPRESS^%AN4
JAL2 I RESULT=0 G DEPIL^%ANGEPIL
 S LISTE=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL3^%AN57") G EXPRESS^%AN4
JAL3 I RESULT=0 G ERR
 S SENS=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL4^%AN57") G EXPRESS^%AN4
JAL4 I RESULT=0 G ERR
 S CAPLIM=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL5^%AN57") G EXPRESS^%AN4
JAL5 I RESULT=0 G ERR
 S DATE=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL50^%AN57") G EXPRESS^%AN4
JAL50 I RESULT=0 G ERR
 S DEC=NORES
 D CAR
 G:C=")" JALF
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL6^%AN57") G EXPRESS^%AN4
JAL6 I RESULT=0 G ERR
 S TYPDEC=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL7^%AN57") G EXPRESS^%AN4
JAL7 I RESULT=0 G ERR
 S COCONT=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("JAL8^%AN57") G EXPRESS^%AN4
JAL8 I RESULT=0 G ERR
 S MAXITER=NORES
 D CAR
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERR
JALF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$JALONNER")
 D SET^%ANA(NORES,1,ETU),SET^%ANA(NORES,2,LAN),SET^%ANA(NORES,3,LISTE)
 D SET^%ANA(NORES,4,SENS),SET^%ANA(NORES,5,CAPLIM),SET^%ANA(NORES,6,DATE)
 D SET^%ANA(NORES,7,DEC),SET^%ANA(NORES,8,TYPDEC),SET^%ANA(NORES,9,COCONT)
 D SET^%ANA(NORES,10,MAXITER)
 D LEC
 G DEPIL^%ANGEPIL
 
ERR F I=ETU,LAN,LISTE,SENS,CAPLIM,DATE,MAXITER,DEC,TYPDEC,COCONT D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
BAC 
 K @(TEMPO)
 S @TEMPO@(1)="A",@TEMPO@(2)="PAR",@TEMPO@(3)="%COMP1",@TEMPO@(4)="%COMP2"
 D EMPV^%ANGEPIL(TEMPO)
 S A=0,(%COMP1,%COMP2)=""
 
 F I=1:1:$L($$^%QZCHW("$SELECTIONNER.BAC"))+1 D LEC
 
 S %COMP1=%COMPIL,%COMPIL=""
 D EMPIL^%ANGEPIL("BAC0^%AN57") G ENTIER^%AN1
BAC0 I RESULT=0 G DEPIL^%ANGEPIL
 S PAR=$$RED^%ANA(NORES,"TEXTE")
 I (PAR'=1)&(PAR'=2) D M("Valeurs attendues : 1 ou 2"),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 D CAR I C'=")" D M("Une "")"" etait attendue ..."),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP2=$S(PAR=1:"S %FONC=""BAC.1""",1:"S %FONC=""BAC.2""")
 S %COMPIL=%COMP1_%COMP2_" D ^%PBPZ"
 S A=NORES,NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SELECTIONNER.BAC"),SET^%ANA(NORES,1,A)
 D LEC G DEPIL^%ANGEPIL
 
 
COMPAR 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="DOM",@TEMPO@(3)="TO",@TEMPO@(4)="ARPREM",@TEMPO@(5)="ETU",@TEMPO@(6)="BA",@TEMPO@(7)="LST"
 D EMPV^%ANGEPIL(TEMPO)
 
 S (ETU,BA,LST,DOM,TO,ARPREM)=0
 
 F I=1:1:$L($$^%QZCHW("$COMPARER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("COMP^%AN57") G VARTEMP^%AN3
COMP I RESULT=0 G DEPIL^%ANGEPIL
 S ETU=NORES
 D CAR I C'=";" D M("Un "";"" etait attendu ...") G COMPER
 D LEC,EMPIL^%ANGEPIL("COMP0^%AN57")
 I (C="""")&($E(CH,P+1,P+1)="""") G CHAINE^%AN1
 G IDF2^%AN3
 D M("Des guillemets ou une variable % etaient attendus") G COMPER
COMP0 I RESULT=0 G DEPIL^%ANGEPIL
 S BA=NORES
 D CAR
 I C=")" G COMPF
 I C'=";" D M("Un "";"" etait attendu ...") G COMPER
 D LEC,EMPIL^%ANGEPIL("COMP1^%AN57") G EXPRESS^%AN4
COMP1 I RESULT=0 G DEPIL^%ANGEPIL
 S LST=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G COMPER
 D LEC,EMPIL^%ANGEPIL("COMP2^%AN57") G EXPRESS^%AN4
COMP2 I RESULT=0 G DEPIL^%ANGEPIL
 S DOM=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G COMPER
 D LEC,EMPIL^%ANGEPIL("COMP3^%AN57") G EXPRESS^%AN4
COMP3 I RESULT=0 G COMPER
 S TO=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G COMPER
 D LEC,EMPIL^%ANGEPIL("COMP4^%AN57") G EXPRESS^%AN4
COMP4 I RESULT=0 G COMPER
 S ARPREM=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G COMPER
COMPF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$COMPARER")
 D SET^%ANA(NORES,1,ETU)
 D SET^%ANA(NORES,2,BA),SET^%ANA(NORES,3,LST),SET^%ANA(NORES,4,DOM)
 D SET^%ANA(NORES,5,TO),SET^%ANA(NORES,6,ARPREM)
 D LEC
 G DEPIL^%ANGEPIL
 
COMPER F I=ETU,BA,LST,DOM,TO,ARPREM D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL

