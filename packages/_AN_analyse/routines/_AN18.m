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

;%AN18^INT^1^59547,73865^0
AN18 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
FNOM K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V",@TEMPO@(3)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:L D LEC
 S V=0,%COMP1=%COMPIL,%COMPIL=""""""
 D CAR I C'="(" G FNOM2
 D LEC,EMPIL^%ANGEPIL("FNOM1^%AN18") G ATTRIBUT^%AN3
FNOM1 G:RESULT=0 DEPIL^%ANGEPIL S V=NORES
 S %COMPIL=""""_$$RED^%ANA($$RED^%ANA(V,1),"TEXTE")_""""
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $NOM ..."),KILL^%ANA(V) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
FNOM2 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$NOM"),SET^%ANA(NORES,1,V)
 S %COMPIL=%COMP1_"$$OBJPROX^%QSCALVU("_%COMPIL_",BASE,OBJET)"
 G DEPIL^%ANGEPIL
 
FPARAM K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:L+1 D LEC
 D EMPIL^%ANGEPIL("FPARAM1^%AN18") G IDF^%AN3
FPARAM1 G:RESULT=0 DEPIL^%ANGEPIL S V=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $PARAM ..."),KILL^%ANA(V) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$PARAM"),SET^%ANA(NORES,1,V) G DEPIL^%ANGEPIL
 
FSSCH K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="I",@TEMPO@(3)="P1",@TEMPO@(4)="P2" D EMPV^%ANGEPIL(TEMPO) S (NORES,CHA,P1,P2)=0
 F I=1:1:$L($$^%QZCHW("$SSCH")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $SSCH ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"$E("
 D LEC,EMPIL^%ANGEPIL("FSS1^%AN18") G EXPRESS^%AN4
FSS1 G:RESULT=0 DEPIL^%ANGEPIL S CHA=NORES
 D CAR G:C=")" FFS
 I C'=";" D M("Un  ; etait attendu ..."),KILL^%ANA(CHA) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("FFS2^%AN18") G EXPRESS^%AN4
FFS2 I RESULT=0 D KILL^%ANA(CHA) G DEPIL^%ANGEPIL
 S P1=NORES
 D CAR G:C=")" FFS
 I C'=";" D M("Un  ; etait attendu ..."),KILL^%ANA(CHA),KILL^%ANA(P1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("FFS3^%AN18") G EXPRESS^%AN4
FFS3 I RESULT=0 D KILL^%ANA(CHA),KILL^%ANA(P1) G DEPIL^%ANGEPIL
 S P2=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $SSCH ..."),KILL^%ANA(CHA),KILL^%ANA(P1),KILL^%ANA(P2) S RESULT=0 G DEPIL^%ANGEPIL
FFS S %COMPIL=%COMPIL_")"
 D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SSCH"),SET^%ANA(NORES,1,CHA),SET^%ANA(NORES,2,P1),SET^%ANA(NORES,3,P2)
 G DEPIL^%ANGEPIL
 
FPAR K @(TEMPO) S @TEMPO@(1)="CHA",@TEMPO@(2)="I",@TEMPO@(3)="SEP",@TEMPO@(4)="POS",@TEMPO@(5)="POS2" D EMPV^%ANGEPIL(TEMPO)
 S (CHA,SEP,POS,POS2,NORES)=0 F I=1:1:$L($$^%QZCHW("$PARTIE")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $PARTIE ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"$P(" D LEC,EMPIL^%ANGEPIL("FPAR1^%AN18") G EXPRESS^%AN4
FPAR1 G:RESULT=0 DEPIL^%ANGEPIL S CHA=NORES
 D CAR I C'=";" D M("Un  ; etait attendu ..."),KILL^%ANA(CHA) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("FPAR2^%AN18") G EXPRESS^%AN4
FPAR2 I RESULT=0 D KILL^%ANA(CHA) G DEPIL^%ANGEPIL
 S SEP=NORES
 D CAR G:C=")" FFPAR
 I C'=";" D M("Un  ; etait attendu ..."),KILL^%ANA(CHA),KILL^%ANA(SEP) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("FPAR3^%AN18") G EXPRESS^%AN4
FPAR3 I RESULT=0 D KILL^%ANA(CHA),KILL^%ANA(SEP) G DEPIL^%ANGEPIL
 S POS=NORES D CAR G:C=")" FFPAR
 I C'=";" D M("Un  ; etait attendu ..."),KILL^%ANA(CHA),KILL^%ANA(SEP) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"," D LEC,EMPIL^%ANGEPIL("FPAR4^%AN18") G EXPRESS^%AN4
FPAR4 I RESULT=0 D KILL^%ANA(CHA),KILL^%ANA(SEP),KILL^%ANA(POS) G DEPIL^%ANGEPIL
 S POS2=NORES D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $PARTIE ..."),KILL^%ANA(CHA),KILL^%ANA(SEP),KILL^%ANA(POS),KILL^%ANA(POS2) S RESULT=0 G DEPIL^%ANGEPIL
FFPAR D LEC
 S %COMPIL=%COMPIL_")",NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$PARTIE"),SET^%ANA(NORES,1,CHA),SET^%ANA(NORES,2,SEP)
 D SET^%ANA(NORES,3,POS),SET^%ANA(NORES,4,POS2) G DEPIL^%ANGEPIL

