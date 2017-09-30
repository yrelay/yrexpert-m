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

;%AN35^INT^1^59547,73865^0
AN35 ;
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
MIN 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="N2",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MIN")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $MIN") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0,%COMP1=%COMPIL,(%COMP2,%COMPIL)=""
BMIN D LEC,EMPIL^%ANGEPIL("MIN1^%AN35") G EXPRESS^%AN4
MIN1 G:RESULT=0 EMIN
 S NPA=NPA+1,LPA(NPA)=NORES
 I NOCOMPIL=0 S %COMP2=%COMP2_$S(%COMPIL["$$":$$ZSUBST^%QZCHSUB(%COMPIL,"""",""""""),1:%COMPIL)_"/",%COMPIL=""
 D CAR I C=")" G FMIN
 I C'=";" D M("Un ; etait attendu entre deux arguments") G EMIN
 G BMIN
FMIN I C'=")" D M("Une ) etait attendue a la fin de $MIN") G EMIN
 D LEC
 S NORES=$$NEW^%ANA
 I NOCOMPIL=0 S %COMPIL=%COMP1_"$$^%TLCAFON(""$MIN"",""^%EDCAMIN"",""ENT^%TLCAFON/""_"_"("""_%COMP2_"""))"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MIN")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
EMIN S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
MAX 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="N2",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MAX")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $MAX") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0,%COMP1=%COMPIL,(%COMP2,%COMPIL)=""
BMAX D LEC,EMPIL^%ANGEPIL("MAX1^%AN35") G EXPRESS^%AN4
MAX1 G:RESULT=0 EMAX
 S NPA=NPA+1,LPA(NPA)=NORES
 I NOCOMPIL=0 S %COMP2=%COMP2_$S(%COMPIL["$$":$$ZSUBST^%QZCHSUB(%COMPIL,"""",""""""),1:%COMPIL)_"/",%COMPIL=""
 D CAR I C=")" G FMAX
 I C'=";" D M("Un ; etait attendu entre deux arguments") G EMAX
 G BMAX
FMAX I C'=")" D M("Une ) etait attendue a la fin de $MAX") G EMAX
 D LEC
 S NORES=$$NEW^%ANA
 I NOCOMPIL=0 S %COMPIL=%COMP1_"$$^%TLCAFON(""$MAX"",""^%EDCAMAX"",""ENT^%TLCAFON/""_"_"("""_%COMP2_"""))"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MAX")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
EMAX S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
MINOR 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="N2",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MINOR")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $MINOR") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0,%COMP1=%COMPIL,(%COMP2,%COMPIL)=""
BMINR D LEC,EMPIL^%ANGEPIL("MINR1^%AN35") G EXPRESS^%AN4
MINR1 G:RESULT=0 EMINR
 S NPA=NPA+1,LPA(NPA)=NORES
 I NOCOMPIL=0 S %COMP2=%COMP2_$S(%COMPIL["$$":$$ZSUBST^%QZCHSUB(%COMPIL,"""",""""""),1:%COMPIL)_"/",%COMPIL=""
 D CAR I C=")" G FMINR
 I C'=";" D M("Un ; etait attendu entre deux arguments") G EMINR
 G BMINR
FMINR I C'=")" D M("Une ) etait attendue a la fin de $MINOR") G EMINR
 D LEC
 I NOCOMPIL=0 S %COMPIL=%COMP1_"$$^%TLCAFON(""$MINOR"",""^%EDCAMIR"",""ENT^%TLCAFON/""_"_"("""_%COMP2_"""))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MINOR")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
EMINR S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
MAJOR 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="N2",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MAJOR")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $MAJOR") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0,%COMP1=%COMPIL,(%COMP2,%COMPIL)=""
BMAJ D LEC,EMPIL^%ANGEPIL("MAJ1^%AN35") G EXPRESS^%AN4
MAJ1 G:RESULT=0 EMAJ
 S NPA=NPA+1,LPA(NPA)=NORES
 I NOCOMPIL=0 S %COMP2=%COMP2_$S(%COMPIL["$$":$$ZSUBST^%QZCHSUB(%COMPIL,"""",""""""),1:%COMPIL)_"/",%COMPIL=""
 D CAR I C=")" G FMAJ
 I C'=";" D M("Un ; etait attendu entre deux arguments") G EMAJ
 G BMAJ
FMAJ I C'=")" D M("Une ) etait attendue a la fin de $MAJOR") G EMAJ
 D LEC
 I NOCOMPIL=0 S %COMPIL=%COMP1_"$$^%TLCAFON(""$MAJOR"",""^%EDCAMAR"",""ENT^%TLCAFON/""_"_"("""_%COMP2_"""))"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MAJOR")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
EMAJ S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
ALEAL 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="N2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ALEAL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $ALEAL") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0
BALL D LEC,EMPIL^%ANGEPIL("ALL1^%AN35") G EXPRESS^%AN4
ALL1 G:RESULT=0 EALL
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C=")" G FALL
 I C'=";" D M("Un ; etait attendu entre deux valeurs") G EALL
 G BALL
FALL I C'=")" D M("Une ) etait attendue a la fin de $ALEAL") G EALL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$ALEAL")
 S N2=$$NEW^%ANA
 D SET^%ANA(N2,"TYPE","ENTIER"),SET^%ANA(N2,"TEXTE",NPA)
 D SET^%ANA(NORES,1,N2)
 F I=1:1:NPA D SET^%ANA(NORES,I+1,LPA(I))
 G DEPIL^%ANGEPIL
EALL S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL

