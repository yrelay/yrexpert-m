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

;%AN33^INT^1^59547,73865^0
AN33 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
SINUS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SIN")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $SIN") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SIN1^%AN33") G EXPRESS^%AN4
SIN1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $SIN"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$SIN"",("_%COMPIL_"))"
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SIN")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
COS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$COS")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $COS") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COS1^%AN33") G EXPRESS^%AN4
COS1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $COS"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$COS"",("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$COS")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
ARCSIN 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ARCSIN")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ARCSIN") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ARSN1^%AN33") G EXPRESS^%AN4
ARSN1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $ARCSIN"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$ARCSIN"",("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ARCSIN")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
ARCOS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ARCOS")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $ARCOS") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ACOS1^%AN33") G EXPRESS^%AN4
ACOS1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $ARCOS"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$ARCOS"",("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ARCOS")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
COTG 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$COTG")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $COTG") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COTG1^%AN33") G EXPRESS^%AN4
COTG1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $COTG"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$COTG"",("_%COMPIL_"))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$COTG")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
 
VARUSER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="%COMP1" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$NOM.UTILISATEUR")) D LEC
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR I C'="(" D M("Une ( etait attendue apres $NOM.UTILISATEUR") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("VRU1^%AN33") G EXPRESS^%AN4
VRU1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $NOM.UTILISATEUR"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMP1_"$$^%TLCAFNC(""$NOM.UTILISATEUR"",("_%COMPIL_"))"
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$NOM.UTILISATEUR")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 ;

