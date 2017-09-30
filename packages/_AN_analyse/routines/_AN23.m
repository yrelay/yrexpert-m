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

;%AN23^INT^1^59547,73865^0
%AN23 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2
 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
MODELE K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="CH2",@TEMPO@(3)="I",@TEMPO@(4)="X",@TEMPO@(5)="Y"
 S @TEMPO@(6)="%COMP1",@TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP3"
 D EMPV^%ANGEPIL(TEMPO)
 S (CH2,X,Y)=0
 F I=1:1:$L($$^%QZCHW("$MODELE")) D LEC
 D CAR
 I C'="(" D M("une ( etait attendue") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP5=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("MODELE1^%AN23") G EXPRESS^%AN4
MODELE1 G:RESULT=0 DEPIL^%ANGEPIL
 S CH2=NORES
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G MODSUI
 S APPD=APPD+1,APPD(APPD)="m."_$$RED^%ANA(NORES,"TEXTE")
MODSUI S %COMP1=%COMPIL,%COMP3="""""",%COMP2=0
 S %COMPIL=""
 D CAR
 I C=")" G MODELE4
 
 I C'=";" D M("un ; etait attendu") G ERMOD
 D LEC,EMPIL^%ANGEPIL("MODELE2^%AN23") G NOMBRE^%AN1
MODELE2 I RESULT=0 G ERMOD
 S Y=NORES
 I (%COMPIL'=1)&(%COMPIL'=0) D M("seules les valeurs 0 et 1 sont acceptees") G ERMOD
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR
 G:C=")" MODELE4
 I C'=";" D M("un ; ou une ) etait attendu") G ERMOD
 D LEC,EMPIL^%ANGEPIL("MODELE3^%AN23") G VARTEMP^%AN3
MODELE3 I RESULT=0 G ERMOD
 S X=NORES
 S %COMP3=%COMPIL
 D CAR
MODELE4 I C'=")" D M("une ) a la fin S.V.P.") G ERMOD
 I %COMP3'="""""" S %COMP3=$P($P(%COMP3,"(",2),",")
 S %COMPIL=%COMP5_"D ^%EDCMODL("_%COMP1_",$$^%QCAZG(""BASE""),$$^%QCAZG(""OBJET""),"_%COMP2_","_%COMP3_")"
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$MODELE")
 D SET^%ANA(NORES,1,CH2),SET^%ANA(NORES,2,X),SET^%ANA(NORES,3,Y)
 G DEPIL^%ANGEPIL
ERMOD 
 F I=CH2,X,Y D KILL^%ANA(I)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
TRAITER K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="CH2",@TEMPO@(3)="I",@TEMPO@(4)="X",@TEMPO@(5)="TRT",@TEMPO@(6)="%COMP1"
 S @TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP3",@TEMPO@(9)="%COMP4",@TEMPO@(10)="%COMP5",@TEMPO@(11)="VIS",@TEMPO@(12)="DERO"
 D EMPV^%ANGEPIL(TEMPO)
 S (CH2,X,VIS,DERO)=0
 F I=1:1:$L($$^%QZCHW("$TRAITER")) D LEC
 D CAR
 I C'="(" D M("une ( etait attendue") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP5=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("TRAITER1^%AN23") G EXPRESS^%AN4
TRAITER1 G:RESULT=0 DEPIL^%ANGEPIL
 S CH2=NORES
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G FINSI4
 S APPD=APPD+1,APPD(APPD)="t."_$$RED^%ANA(NORES,"TEXTE")
FINSI4 S TRT=%COMPIL
 G:NOCOMPIL=0 TRAIT21
 D CAR I C'=";" G TRAITER3
 
 D LEC,EMPIL^%ANGEPIL("TRAITER2^%AN23") G EXPRESS^%AN4
TRAITER2 I RESULT=0 D KILL^%ANA(CH2) G DEPIL^%ANGEPIL
 S X=NORES G TRAIT25
 
TRAIT21 
 S VIS=0,%COMPIL=""
 D CAR G:C=")" TRAITER3
 I C'=";" D M("un "";"" etait attendu") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRAIT22^%AN23") G CHAINE^%AN1
TRAIT22 G:RESULT=0 DEPIL^%ANGEPIL
 S VIS=$$RED^%ANA(NORES,"TEXTE")
 D KILL^%ANA(NORES)
 S VIS=$S(VIS=$$^%QZCHW("VISIBLE"):1,VIS=$$^%QZCHW("INVISIBLE"):0,1:-1)
 I VIS=-1 D KILL^%ANA(CH2),M("la chaine ""VISIBLE"" ou la chaine ""INVISIBLE"" etait attendue") S RESULT=0 G DEPIL^%ANGEPIL
 G TRAITER3
 
 
TRAIT25 D CAR G:C'=";" TRAITER3 D LEC,EMPIL^%ANGEPIL("TRAIT26^%AN23") G EXPRESS^%AN4
TRAIT26 G:RESULT=0 DEPIL^%ANGEPIL
 S DERO=NORES
 
TRAITER3 D CAR
 I C'=")" D M("une ) a la fin S.V.P."),KILL^%ANA(X),KILL^%ANA(CH2),KILL^%ANA(DERO) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMP5_"D ^%EDCTRT(BASE,OBJET,"_TRT_","_VIS_")"
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRAITER")
 D SET^%ANA(NORES,1,CH2),SET^%ANA(NORES,2,X),SET^%ANA(NORES,3,DERO)
 G DEPIL^%ANGEPIL
 
 
FORMAT K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="CH2",@TEMPO@(3)="I",@TEMPO@(4)="X",@TEMPO@(5)="FORM",@TEMPO@(6)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S (NORES,CH2)=0
 F I=1:1:$L($$^%QZCHW("$FORMAT")) D LEC
 D CAR I C'="(" D M("une ( etait attendue") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("FORMAT1^%AN23") G EXPRESS^%AN4
FORMAT1 G:RESULT=0 DEPIL^%ANGEPIL
 S CH2=NORES
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G FINSI4
 S APPD=APPD+1,APPD(APPD)="f."_$$RED^%ANA(NORES,"TEXTE")
FORMSUI S FORM=$$RED^%ANA(CH2,"TEXTE")
 D CAR I C'=")" D M("une ) etait attendue"),KILL^%ANA(CH2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMP1_"D EXT^%EDC3("""_FORM_""")"
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$FORMAT")
 D SET^%ANA(NORES,1,CH2)
 G DEPIL^%ANGEPIL

