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

;%AN65^INT^1^59547,73866^0
AN65 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
FLECHE 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="SYN"
 S @TEMPO@(8)="P1",@TEMPO@(9)="P2",@TEMPO@(10)="P3",@TEMPO@(11)="P4",@TEMPO@(12)="P5",@TEMPO@(13)="P6",@TEMPO@(14)="P7",@TEMPO@(15)="TYPE",@TEMPO@(16)="TEXTE",@TEMPO@(17)="COND",@TEMPO@(18)="P99",@TEMPO@(16)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:7 S @("P"_I)=0
 S SYN=0,TEXTE=0,P99=0
 I $$ELEM^%AN63("FLECHE")=0 G ERF
 
 I $$LIRE^%AN62("P1",";")=0 G ERF
 
 I $$LIRE^%AN62("P2",";")=0 G ERF
 
 I $$LIRE^%AN62("TEXTE",";")=0 G ERF
 
 S %COMPIL=""
 D LEC,EMPIL^%ANGEPIL("SYN^%AN65")
 G ENTIER^%AN1
SYN I RESULT=0 G ERF
 I (%COMPIL'=1)&(%COMPIL'=2) D M("le type de syntaxe doit etre egal a 1 ou 2") G ERF
 S SYN=NORES,TYPE=%COMPIL
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERF
 
 I $$COOR^%AN63(.P3,.P4,";")=0 G ERF
 I TYPE=2 G FL2
 
 I $$COOR^%AN63(.P5,.P6,"")=0 G ERF
 I C=")" G FINF
 D EMPIL^%ANGEPIL("FINF^%AN65")
 G COND
FL2 
 I $$LIRE^%AN62("P5",";")=0 G ERF
 
 I $$LIRE^%AN62("P6","")=0 G ERF
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERF
 I C=")" G FINF
 
 I $$LIRE^%AN62("P7","")=0 G ERF
 I C=")" G FINF
 D EMPIL^%ANGEPIL("FINF^%AN65")
 G COND
FINF D RESU^%AN63("FLECHE")
 D SET^%ANA(NORES,6,P1),SET^%ANA(NORES,7,P2)
 D SET^%ANA(NORES,8,SYN)
 F I=3:1:7 S J=I+6 D SET^%ANA(NORES,J,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D SET^%ANA(NORES,"PAR.TEXTE",TEXTE)
 D LEC
 G DEPIL^%ANGEPIL
 
ERF F I=OBJ,VERS,NUM,EP,TR,SYN,TEXTE D KILL^%ANA(I)
 F I=1:1:7 D KILL^%ANA(@("P"_I))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
RACCOR 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="P1",@TEMPO@(8)="P2",@TEMPO@(9)="P3",@TEMPO@(10)="P4",@TEMPO@(11)="COND",@TEMPO@(12)="P99",@TEMPO@(10)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:4 S @("P"_I)=0
 S P99=0
 I $$ELEM^%AN63("RACCORDEMENT")=0 G ERR
 
 I $$LIRE^%AN62("P1",";")=0 G ERR
 
 I $$LIRE^%AN62("P2",";")=0 G ERR
 
 I $$LIRE^%AN62("P3",";")=0 G ERR
 
 I $$LIRE^%AN62("P4","")=0 G ERR
 I C=")" G FINR
 D EMPIL^%ANGEPIL("FINR^%AN65")
 G COND
FINR G:RESULT=0 ERR
 D RESU^%AN63("RACCORDEMENT")
 F I=1:1:4 D SET^%ANA(NORES,I+5,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
ERR F I=OBJ,VERS,NUM,EP,TR D KILL^%ANA(I)
 F I=1:1:4 D KILL^%ANA(@("P"_I))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
DESSIN 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS",@TEMPO@(4)="X0",@TEMPO@(5)="Y0",@TEMPO@(6)="AGR"
 S @TEMPO@(7)="%COMP1",@TEMPO@(8)="%COMP2",@TEMPO@(9)="%COMP3",@TEMPO@(10)="%COMP4",@TEMPO@(11)="%COMP5"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP5=%COMPIL
 S (COL,VERS,X0,Y0,AGR)=0
 F I=1:1:$L($$^%QZCHW("$DESSINER.SCENE")) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $DESSINER.SCENE") G ERD
 
 I $$LIRE^%AN62("COL",";")=0 G ERD
 S %COMP1=%COMPIL
 
 I $$LIRE^%AN62("VERS","")=0 G ERD
 S %COMP2=%COMPIL,(%COMP3,%COMP4)=""
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERD
 I C=")" S %COMPIL="""""" G FIND
 
 I $$LIRE^%AN62("X0",";")=0 G ERD
 S %COMP3=%COMPIL
 
 I $$LIRE^%AN62("Y0","")=0 G ERD
 S %COMP4=%COMPIL
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERD
 
 I C=")" S %COMPIL="""""" G FIND
 I $$LIRE^%AN62("AGR",")")=0 G ERD
FIND 
 S %COMPIL="D ^%EDCSCEN("_%COMP1_","_%COMP2_","_"^V($J,""%"",""%X"",1)"_","_"^V($J,""%"",""%Y"",1)"_","_%COMPIL_")"
 I (%COMP3'="")&(%COMP4'="") S %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP3_",^V($J,""%"",""%Y"",1)="_%COMP4_" "_%COMPIL
 S:%COMP5'=" " %COMPIL=%COMP5_%COMPIL
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$DESSINER.SCENE")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS)
 D SET^%ANA(NORES,3,X0),SET^%ANA(NORES,4,Y0),SET^%ANA(NORES,5,AGR)
 
 D SET^%ANA(NORES,"CONDITION",0)
 D LEC
 G DEPIL^%ANGEPIL
 
ERD F I=COL,VERS,X0,Y0,AGR D KILL^%ANA(I)
 S RESULT=0 G DEPIL^%ANGEPIL
 
COND 
 D LEC S COND=""
 I C="" G RET^%ANGEPIL
 S PP=P,SSCH=C,NOCOMPIL=0
 F I=0:0 S P=P+1 D LEC^%AN7,CAR Q:((C=" ")!(C=""))!(C=";")  S SSCH=SSCH_C
 I SSCH'="""CONDITION""" S RESULT=0 D M("la chaine de caractere ""CONDITION"" etait attendue") G RET^%ANGEPIL
 I C'=";" D M("Un "";"" etait attendu") S RESULT=0 G RET^%ANGEPIL
 D LEC,CAR,EMPIL^%ANGEPIL("COND0^%AN65")
 S %COMPIL="" G CHAINE^%AN1
COND0 G:'(RESULT) DEPIL^%ANGEPIL
 S P99=NORES
 S NOCOMPIL=1
 D CAR
 I C'=")" D M("Un "")"" etait attendue") S RESULT=0 G RET^%ANGEPIL
 G RET^%ANGEPIL

