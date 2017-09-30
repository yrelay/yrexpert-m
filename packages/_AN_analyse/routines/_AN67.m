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

;%AN67^INT^1^59547,73866^0
AN67 ;;05:59 PM  9 May 1996
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
CODBAR 
 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="%COMP1",@TEMPO@(3)="%COMP2",@TEMPO@(4)="%COMP3",@TEMPO@(5)="%COMP4",@TEMPO@(6)="%COMP5",@TEMPO@(7)="%COMP6",@TEMPO@(8)="%COMP7",@TEMPO@(9)="%COMP8"
 
 D EMPV^%ANGEPIL(TEMPO)
 
 S (%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,%COMP6,%COMP7)=""""""
 S OBL=0
 S %COMP8=%COMPIL,%COMPIL=""
 F I=1:1:$L($$^%QZCHW("$CODE.BARRE"))+1 D LEC
 
 D EMPIL^%ANGEPIL("CODB1^%AN67") G EXPRESS^%AN4
CODB1 G:RESULT=0 DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 D LEC
 
 D EMPIL^%ANGEPIL("CODB2^%AN67") G EXPRESS^%AN4
CODB2 G:RESULT=0 ERRCODB
 S %COMP2=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 
CODB3 D LEC
 G:C=";" CODB5
 D EMPIL^%ANGEPIL("CODB4^%AN67") G BOOL^%AN20
CODB4 G:RESULT=0 ERRCODB
 S %COMP3=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 
CODB5 D LEC
 G:C=";" CODB65
 D EMPIL^%ANGEPIL("CODB55^%AN67") G EXPRESS^%AN4
CODB55 G:RESULT=0 ERRCODB
 S %COMP4=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 
 
 ;Ajouter par FLB pour la version $CODE.BARRE de selmer
 
CODB65   D LEC
        G:C=";" CODB7
        D EMPIL^%ANGEPIL("CODB6^%AN67") G EXPRESS^%AN4
CODB6   G:RESULT=0 ERRCODB
        S %COMP7=%COMPIL,%COMPIL=""
        D CAR
        I C=")" G CODBF
        I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 
 
CODB7 D LEC
 D EMPIL^%ANGEPIL("CODB8^%AN67") G EXPRESS^%AN4
CODB8 G:RESULT=0 ERRCODB
 S %COMP5=%COMPIL,%COMPIL=""
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCODB
 
 D LEC
 D EMPIL^%ANGEPIL("CODB9^%AN67") G EXPRESS^%AN4
CODB9 G:RESULT=0 ERRCODB
 S %COMP6=%COMPIL,%COMPIL=""
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRCODB
CODBF D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CODE.BARRE")
 
 S %COMPIL=%COMP8_"D ^%EDCBARC("_%COMP1_","_%COMP2_","_%COMP3_","_%COMP4_","_%COMP7_","_%COMP5_","_%COMP6_")"
 G DEPIL^%ANGEPIL
 
ERRCODB F I="%COMP1","%COMP2","%COMP3","%COMP4","%COMP7","%COMP5","%COMP6" D KILL^%ANA(@I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
COPY 
 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="%COMP1",@TEMPO@(3)="%COMP2"
 
 D EMPV^%ANGEPIL(TEMPO)
 
 S %COMP1=""""""
 S OBL=0
 S %COMP2=%COMPIL,%COMPIL=""
 F I=1:1:$L($$^%QZCHW("$NOMBRE.COPIES"))+1 D LEC
 
 D EMPIL^%ANGEPIL("COPY1^%AN67") G EXPRESS^%AN4
COPY1 G:RESULT=0 DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRCOPY
COPYF D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$NOMBRE.COPIES")
 
 S %COMPIL=%COMP2_"D ^%EDCCOPY("_%COMP1_")"
 G DEPIL^%ANGEPIL
 
ERRCOPY F I="%COMP1" D KILL^%ANA(@I)
 S RESULT=0
 G DEPIL^%ANGEPIL

