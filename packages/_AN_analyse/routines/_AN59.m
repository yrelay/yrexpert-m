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

;%AN59^INT^1^59547,73866^0
AN59 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
ADDIT 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="AT",@TEMPO@(3)="EXPR"
 D EMPV^%ANGEPIL(TEMPO)
 S (AT,EXPR)=0
 
 F I=1:1:$L($$^%QZCHW("$ADDITIONNER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("ADSA0^%AN59")
 G:(C="%")&(NOCOMPIL=0) VARTEMP^%AN3
 G ATTRIBUT^%AN3
ADSA0 I RESULT=0 G DEPIL^%ANGEPIL
 S AT=NORES
 D CAR
 
 I C'=";" D M("Un "";""  etait attendu ...") G ERRAD
 
 D LEC,EMPIL^%ANGEPIL("ADSA1^%AN59") G EXPRESS^%AN4
ADSA1 I RESULT=0 G DEPIL^%ANGEPIL
 S EXPR=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRAD
ADSAF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ADDITIONNER")
 D SET^%ANA(NORES,1,AT),SET^%ANA(NORES,2,EXPR)
 D LEC
 G DEPIL^%ANGEPIL
 
ERRAD F I=SAIS,CONT,ACTRT,TRTSA,STO D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
POPER 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="TYP",@TEMPO@(3)="RACINE"
 D EMPV^%ANGEPIL(TEMPO)
 S (TYP,RACINE)=0
 
 F I=1:1:$L($$^%QZCHW("$POPER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("POP0^%AN59")
 G EXPRESS^%AN4
POP0 I RESULT=0 G DEPIL^%ANGEPIL
 S TYP=NORES
 D CAR
 
 G:C=")" POPAF
 I C'=";" D M("Un "";""  etait attendu ...") G ERRPO
 
 D LEC,EMPIL^%ANGEPIL("POP1^%AN59") G EXPRESS^%AN4
POP1 I RESULT=0 G DEPIL^%ANGEPIL
 S RACINE=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRPO
POPAF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$POPER")
 D SET^%ANA(NORES,1,TYP),SET^%ANA(NORES,2,RACINE)
 D LEC
 G DEPIL^%ANGEPIL
 
ERRPO D KILL^%ANA(TYP),KILL^%ANA(RACINE)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
CRSAIS 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="CPT",@TEMPO@(3)="NOSAIS"
 D EMPV^%ANGEPIL(TEMPO)
 
 F I=1:1:$L($$^%QZCHW("$CREER.SAISIE"))+1 D LEC
 
 S NOSAIS=$$NEW^%ANA
 
 D EMPIL^%ANGEPIL("CRSA0^%AN59")
 G EXPRESS^%AN4
CRSA0 I RESULT=0 G DEPIL^%ANGEPIL
 D SET^%ANA(NOSAIS,1,NORES)
 S CPT=2
 D CAR
 
CRSABO I C'=";" D M("Un "";""  etait attendu ...") G ERRCSA
 
 D LEC,EMPIL^%ANGEPIL("CRSA1^%AN59") G EXPRESS^%AN4
CRSA1 I RESULT=0 G ERRCSA
 D SET^%ANA(NOSAIS,CPT,NORES)
 S CPT=CPT+1
 D CAR
 
 G:C=")" CRSAAF
 G CRSABO
 
CRSAAF S NORES=NOSAIS
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CREER.SAISIE")
 D LEC
 G DEPIL^%ANGEPIL
 
ERRCSA D KILL^%ANA(NOSAIS)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
SAISIR 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="CPT",@TEMPO@(3)="NOSAIS"
 D EMPV^%ANGEPIL(TEMPO)
 
 F I=1:1:$L($$^%QZCHW("$SAISIR"))+1 D LEC
 
 S NOSAIS=$$NEW^%ANA
 
 D EMPIL^%ANGEPIL("SAIS0^%AN59")
 G EXPRESS^%AN4
SAIS0 I RESULT=0 G DEPIL^%ANGEPIL
 D SET^%ANA(NOSAIS,1,NORES)
 D CAR
 I C'=";" D M("Un "";""  etait attendu ...") G ERRSAI
 D LEC
 
 D EMPIL^%ANGEPIL("SAIS1^%AN59")
 G EXPRESS^%AN4
SAIS1 I RESULT=0 G DEPIL^%ANGEPIL
 D SET^%ANA(NOSAIS,2,NORES)
 S CPT=3
 D CAR
 
SAISBO G:C=")" SAISAF
 I C'=";" D M("Un "";""  etait attendu ...") G ERRSAI
 
 D LEC,EMPIL^%ANGEPIL("SAIS2^%AN59") G ATTRIBUT^%AN3
SAIS2 I RESULT=0 G ERRSAI
 D SET^%ANA(NOSAIS,CPT,NORES)
 S CPT=CPT+1
 D CAR
 G SAISBO
 
SAISAF S NORES=NOSAIS
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$SAISIR")
 D LEC
 G DEPIL^%ANGEPIL
 
ERRSAI D KILL^%ANA(NOSAIS)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
FOMAT K @(TEMPO)
 S @TEMPO@(1)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="%COMP2",@TEMPO@(4)="I",@TEMPO@(5)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S %COMP2="""""",(NORES,A1,A2)=0
 F I=1:1:$L($$^%QZCHW("$FORMATER.NOMBRE")) D LEC
 D CAR
 I C'="(" D M("Une ""("" est attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"$$NBCOMPT^%VFORMAT("
 D LEC
 D EMPIL^%ANGEPIL("FOMAT1^%AN59") G EXPRESS^%AN4
FOMAT1 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR
 S A1=NORES
 S %COMP1=%COMPIL_",",%COMPIL=""
 G:C=")" FOMATF
 I C'=";" D M("Un "";"" etait attendu ...") G ERRFOM
 D LEC
 D EMPIL^%ANGEPIL("FOMAT2^%AN59")
 G EXPRESS^%AN4
FOMAT2 G:RESULT=0 ERRFOM
 S A2=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRFOM
 
FOMATF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$FORMATER.NOMBRE")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2)
 S %COMPIL=$S(NOCOMPIL:"",1:%COMP1_%COMP2_")")
 K @(TEMPO)
 G DEPIL^%ANGEPIL
 
ERRFOM D KILL^%ANA(A1),KILL^%ANA(A2)
 S RESULT=0
 G DEPIL^%ANGEPIL

