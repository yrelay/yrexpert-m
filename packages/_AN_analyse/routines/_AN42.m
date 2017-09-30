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

;%AN42^INT^1^59547,73865^0
AN42 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
HACHUR K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="E",@TEMPO@(3)="I",@TEMPO@(4)="L",@TEMPO@(5)="N",@TEMPO@(6)="X",@TEMPO@(7)="Y",@TEMPO@(8)="%COMP1",@TEMPO@(9)="%COMP2",@TEMPO@(10)="%COMP3",@TEMPO@(11)="%COMP4",@TEMPO@(12)="%COMP5" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,E,L,X,Y)=0,N=$$^%QZCHW("$HACHURER"),L=$L(N),(%COMP1,%COMP2,%COMP3,%COMP4,%COMP5)=""
 I $E(CH,P,(P+L)-1)'=N D M("$HACHURER etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 D CAR I C'="(" D M("Une ( est necessaire avant $HACHURER ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP5=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("HACHUR1^%AN42") G EXPRESS^%AN4
HACHUR1 G:RESULT=0 DEPIL^%ANGEPIL S E=NORES
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'=";" D M("Il faut un ; pour separer les parametres ..."),KILL^%ANA(E) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("HACHUR2^%AN42") G EXPRESS^%AN4
HACHUR2 G:RESULT=0 DEPIL^%ANGEPIL S L=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR G:C'=";" HACHUR5
 D LEC,EMPIL^%ANGEPIL("HACHUR3^%AN42") G EXPRESS^%AN4
HACHUR3 I RESULT=0 D KILL^%ANA(E) G DEPIL^%ANGEPIL
 S %COMP3=%COMPIL,%COMPIL=""
 S X=NORES
 D CAR I C'=";" D M("Il faut un ; pour separer les parametres ..."),KILL^%ANA(E),KILL^%ANA(X) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("HACHUR4^%AN42") G EXPRESS^%AN4
HACHUR4 I RESULT=0 D KILL^%ANA(E),KILL^%ANA(X) G DEPIL^%ANGEPIL
 S %COMP4=%COMPIL,%COMPIL=""
 S Y=NORES
HACHUR5 D CAR I C'=")" D M("Une ) est necessaire a la fin de $HACHURER ..."),KILL^%ANA(E),KILL^%ANA(X),KILL^%ANA(Y) S RESULT=0 G DEPIL^%ANGEPIL
 
 
 
 
 S %COMPIL="S ^V($J,""%"",""%X2"",1)="_%COMP1_",^V($J,""%"",""%Y2"",1)="_%COMP2_" S %FONC=""HACHURER"" D GRAPH^%EDCENVL"
 S:(%COMP3'="")&(%COMP4'="") %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP3_",^V($J,""%"",""%Y"",1)="_%COMP4_" "_%COMPIL
 S %COMPIL=%COMP5_%COMPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$HACHURER")
 D SET^%ANA(NORES,1,E),SET^%ANA(NORES,2,L),SET^%ANA(NORES,3,X),SET^%ANA(NORES,4,Y) G DEPIL^%ANGEPIL
HACHURF K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="E",@TEMPO@(3)="I",@TEMPO@(4)="L",@TEMPO@(5)="N",@TEMPO@(6)="X",@TEMPO@(7)="Y",@TEMPO@(8)="%COMP1",@TEMPO@(9)="%COMP2",@TEMPO@(10)="%COMP3",@TEMPO@(11)="%COMP4",@TEMPO@(12)="%COMP5" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,E,L,X,Y)=0,N=$$^%QZCHW("$HACHURER.FORT"),L=$L(N),(%COMP1,%COMP2,%COMP3,%COMP4,%COMP5)=""
 I $E(CH,P,(P+L)-1)'=N D M("$HACHURER.FORT etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 D CAR I C'="(" D M("Une ( est necessaire avant $HACHURER.FORT ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP5=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("HACHURF1^%AN42") G EXPRESS^%AN4
HACHURF1 G:RESULT=0 DEPIL^%ANGEPIL S E=NORES
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'=";" D M("Il faut un ; pour separer les parametres ..."),KILL^%ANA(E) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("HACHURF2^%AN42") G EXPRESS^%AN4
HACHURF2 G:RESULT=0 DEPIL^%ANGEPIL S L=NORES
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR G:C'=";" HACHURF5
 D LEC,EMPIL^%ANGEPIL("HACHURF3^%AN42") G EXPRESS^%AN4
HACHURF3 I RESULT=0 D KILL^%ANA(E) G DEPIL^%ANGEPIL
 S %COMP3=%COMPIL,%COMPIL=""
 S X=NORES
 D CAR I C'=";" D M("Il faut un ; pour separer les parametres ..."),KILL^%ANA(E),KILL^%ANA(X) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("HACHURF4^%AN42") G EXPRESS^%AN4
HACHURF4 I RESULT=0 D KILL^%ANA(E),KILL^%ANA(X) G DEPIL^%ANGEPIL
 S %COMP4=%COMPIL,%COMPIL=""
 S Y=NORES
HACHURF5 D CAR I C'=")" D M("Une ) est necessaire a la fin de $HACHURER.FORT ..."),KILL^%ANA(E),KILL^%ANA(X),KILL^%ANA(Y) S RESULT=0 G DEPIL^%ANGEPIL
 
 
 
 
 S %COMPIL="S ^V($J,""%"",""%X2"",1)="_%COMP1_",^V($J,""%"",""%Y2"",1)="_%COMP2_" S %FONC=""HACHURER.FORT"" D GRAPH^%EDCENVL"
 S:(%COMP3'="")&(%COMP4'="") %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP3_",^V($J,""%"",""%Y"",1)="_%COMP4_" "_%COMPIL
 S %COMPIL=%COMP5_%COMPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$HACHURER.FORT")
 D SET^%ANA(NORES,1,E),SET^%ANA(NORES,2,L),SET^%ANA(NORES,3,X),SET^%ANA(NORES,4,Y) G DEPIL^%ANGEPIL
 ;

