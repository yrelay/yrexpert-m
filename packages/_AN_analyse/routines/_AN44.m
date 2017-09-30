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

;%AN44^INT^1^59547,73865^0
AN44 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO
 Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
ACQU K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="A3",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2",@TEMPO@(6)="%COMP4",@TEMPO@(7)="%COMP5",@TEMPO@(8)="A4"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ACQUERIR"))+1 D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 S (A1,A2,A3,A4)=0
 D EMPIL^%ANGEPIL("ACQU1^%AN44") G:NOCOMPIL=0 SPECGDX G EXPRESS^%AN4
ACQU1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M("Un "";"" apres le repertoire ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ACQU2^%AN44") G:NOCOMPIL=0 SPECGDX G EXPRESS^%AN4
ACQU2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S %COMP4=%COMPIL,%COMPIL=""
 S A2=NORES
 D CAR I C'=";" D M("Un "";"" apres l'individu ..."),KILL^%ANA(A1),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ACQU3^%AN44") G EXPRESS^%AN4
ACQU3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 S A3=NORES,%COMP5=%COMPIL,%COMPIL=""
 D CAR
 I C=")" S %COMPIL="""""" G FINACQ
 I C'=";" D M("Un "";"" apres l'attrbut ..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ACQU4^%AN44") G EXPRESS^%AN4
ACQU4 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3) G DEPIL^%ANGEPIL
 S A4=NORES
 D CAR
 I C'=")" D M("Une "")"" apres le no d'ordre ...") S RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3),KILL^%ANA(A4) G DEPIL^%ANGEPIL
FINACQ D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ACQUERIR")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2)
 D SET^%ANA(NORES,3,A3),SET^%ANA(NORES,4,A4)
 G:NOCOMPIL=1 DEPIL^%ANGEPIL
 S %COMPIL=%COMP1_"$$VAL^%EDVDAT($$NOMINT^%QSF("_%COMP2_"),"_%COMP4_","_%COMP5_","_%COMPIL_")"
 G DEPIL^%ANGEPIL
SPECGDX D CAR
 G:C="""" CHAINE^%AN1
 G:(C?1N)!("."[C) NOMBRE^%AN1
 G:C="%" VARTEMP^%AN3
 G:(C?1A)&(C'="$") ATTRIBUT^%AN3
 D M("Utilisation de cet element non autorisee...")
 S RESULT=0 G RET^%ANGEPIL
 
 
ALEAN 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ALEAN")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $ALEAN") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ALN1^%AN44") G EXPRESS^%AN4
ALN1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $ALEAN"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 G:NOCOMPIL=1 ALN2
 S %COMPIL=%COMP1_"$$^%TLCAFON(""$ALEAN"",""^%EDCAALE"",""ENT^%TLCAFON/""_"_"("_%COMPIL_"))"
ALN2 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ALEAN")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
 
ALLER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(2)="%COMP1" D EMPV^%ANGEPIL(TEMPO) S %COMP1=""
 F I=1:1:$L($$^%QZCHW("$ALLER.A")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $ALLER.A") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("ALLER1^%AN44") G EXPRESS^%AN4
ALLER1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $ALLER.A"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMP1_"D ALLERA^%EDCETIQ("_%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ALLER.A")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL

