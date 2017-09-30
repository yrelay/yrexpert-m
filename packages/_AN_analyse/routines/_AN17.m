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

;%AN17^INT^1^59547,73865^0
AN17 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
JUST K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2,A3)=0 F I=1:1:$L($$^%QZCHW("$JUSTIFIER"))+1 D LEC
 S %COMPIL=%COMPIL_"$J(" D EMPIL^%ANGEPIL("JUST1^%AN17") G EXPRESS^%AN4
JUST1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M("Un "";"" apres l'attribut ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("JUST2^%AN17") G EXPRESS^%AN4
JUST2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES
 D CAR I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" apres le 1er entier ..."),KILL^%ANA(A1),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
 G:C=")" FJUST
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("JUST3^%AN17") G EXPRESS^%AN4
JUST3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 S A3=NORES
 D CAR I C'=")" D M("Une "")"" apres le 2nd entier ..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3) S RESULT=0 G DEPIL^%ANGEPIL
FJUST D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$JUSTIFIER"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 G DEPIL^%ANGEPIL
 
TROUV K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2,A3)=0 F I=1:1:$L($$^%QZCHW("$TROUVER"))+1 D LEC
 S %COMPIL=%COMPIL_"$F(" D EMPIL^%ANGEPIL("TROUV1^%AN17") G EXPRESS^%AN4
TROUV1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M("Un "";"" apres l'attribut ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("TROUV2^%AN17") G EXPRESS^%AN4
TROUV2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES
 D CAR I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" apres le 2nd parametre ..."),KILL^%ANA(A1),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
 G:C=")" FTROUV
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("TROUV3^%AN17") G EXPRESS^%AN4
TROUV3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 S A3=NORES
 D CAR I C'=")" D M("Une "")"" apres le 2nd entier ..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3) S RESULT=0 G DEPIL^%ANGEPIL
FTROUV D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$TROUVER"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3) G DEPIL^%ANGEPIL
 
LONG K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2)=0 F I=1:1:$L($$^%QZCHW("$LONGUEUR"))+1 D LEC
 S %COMPIL=%COMPIL_"$L(" D EMPIL^%ANGEPIL("LONG1^%AN17") G EXPRESS^%AN4
LONG1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR G:C=")" FLONG
 I C'=";" D M("Un "";"" apres le parametre ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("LONG2^%AN17") G EXPRESS^%AN4
LONG2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES D CAR I C'=")" D M("Une "")"" apres le parametre ..."),KILL^%ANA(A1),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
FLONG D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$LONGUEUR"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2) G DEPIL^%ANGEPIL
 
NETTOY K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$NETTOYER"))+1 D LEC
 S %COMPIL=%COMPIL_"$$GETLBLAN^%VTLBLAN(" D EMPIL^%ANGEPIL("NETTOY1^%AN17") G EXPRESS^%AN4
NETTOY1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=")" D M("Une "")"" apres le parametre ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION")
 D SET^%ANA(NORES,"TEXTE","$NETTOYER")
 D SET^%ANA(NORES,1,A1)
 G DEPIL^%ANGEPIL
 
ARROND K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,A1,A2,A3)=0 F I=1:1:$L($$^%QZCHW("$ARRONDIR"))+1 D LEC
 S %COMPIL=%COMPIL_"$J(" D EMPIL^%ANGEPIL("ARROND1^%AN17") G EXPRESS^%AN4
ARROND1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M("Un "";"" apres l'attribut ..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("ARROND2^%AN17") G EXPRESS^%AN4
ARROND2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES
 D CAR I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" apres le 1er entier ..."),KILL^%ANA(A1),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
 G:C=")" FARROND
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("ARROND3^%AN17") G BOOL^%AN20
ARROND3 I RESULT=0 D KILL^%ANA(A1),KILL^%ANA(A2) G DEPIL^%ANGEPIL
 S A3=NORES
 D CAR I C'=")" D M("Il manque une "")"" en fin de phrase ..."),KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(A3) S RESULT=0 G DEPIL^%ANGEPIL
FARROND D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ARRONDIR"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 G DEPIL^%ANGEPIL

