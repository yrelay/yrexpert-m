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

;%AN66^INT^1^59547,73866^0
AN66 ;
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
CONFIG 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="%ETUD",@TEMPO@(3)="%LISTE",@TEMPO@(4)="%REP",@TEMPO@(5)="%IND",@TEMPO@(6)="%LIEN",@TEMPO@(7)="%LAT1"
 S @TEMPO@(8)="%POCHE",@TEMPO@(9)="%LAT2",@TEMPO@(10)="%COMPO",@TEMPO@(11)="OBL",@TEMPO@(12)="%I"
 D EMPV^%ANGEPIL(TEMPO)
 S (%ETUD,%LISTE,%REP,%IND,%LIEN,%LAT1,%LAT2,%POCHE,%COMPO)=0
 S OBL=0
 S %COMPIL=""
 F I=1:1:$L($$^%QZCHW("$CONFIGURER"))+1 D LEC
 D EMPIL^%ANGEPIL("CON1^%AN66")
 G VARTEMP^%AN3
CON1 G:RESULT=0 DEPIL^%ANGEPIL
 S %ETUD=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
 D LEC
 I C=";" S OBL=1 G CON3
 D EMPIL^%ANGEPIL("CON2^%AN66") G EXPRESS^%AN4
CON2 G:RESULT=0 ERRCON
 S %LISTE=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
CON3 D LEC
 G:C=";" CON5
 D EMPIL^%ANGEPIL("CON4^%AN66") G EXPRESS^%AN4
CON4 G:RESULT=0 ERRCON
 S %REP=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
CON5 D LEC
 I (C=";")&(OBL=1) D M("Nom de l'individu obligatoire") G ERRCON
 G:C=";" CON7
 D EMPIL^%ANGEPIL("CON6^%AN66") G EXPRESS^%AN4
CON6 G:RESULT=0 ERRCON
 S %IND=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
CON7 D LEC
 D EMPIL^%ANGEPIL("CON8^%AN66") G LEX^%AN3
CON8 G:RESULT=0 ERRCON
 S %LIEN=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
 D LEC
 D EMPIL^%ANGEPIL("CON9^%AN66") G EXPRESS^%AN4
CON9 G:RESULT=0 ERRCON
 S %POCHE=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
 D LEC
 D EMPIL^%ANGEPIL("CON10^%AN66") G EXPRESS^%AN4
CON10 G:RESULT=0 ERRCON
 S %LAT1=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
 D LEC
 D EMPIL^%ANGEPIL("CON11^%AN66") G EXPRESS^%AN4
CON11 G:RESULT=0 ERRCON
 S %LAT2=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRCON
 D LEC
 G:C=")" CONF
 D EMPIL^%ANGEPIL("CON12^%AN66") G EXPRESS^%AN4
CON12 G:RESULT=0 ERRCON
 S %COMPO=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRCON
CONF D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CONFIGURER")
 S %I=1
 F I="%ETUD","%LISTE","%REP","%IND","%LIEN","%POCHE","%LAT1","%LAT2","%COMPO" D SET^%ANA(NORES,%I,@I) S %I=%I+1
 G DEPIL^%ANGEPIL
 
ERRCON F I="%ETUD","%LISTE","%REP","%IND","%LIEN","%LAT1","%LAT2","%POCHE","%COMPO" D KILL^%ANA(@I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
VARTEMP 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO),CAR
 I "%"'=C D M($$^%QZCHW("Une variable temporaire commence par ""%"" ...")) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D EMPIL^%ANGEPIL("VART1^%AN66") G IDF^%AN3
VART1 G:RESULT=0 DEPIL^%ANGEPIL
 S ^DOC($J,"%",%COMPIL)=1
 S %COMPIL=%COMP1_$S(%PROVEN'="SD":"$$^%EDCVAR("""_%COMPIL_""","""")",1:"$$^%QSCALVU(""%"","""","""","""_%COMPIL_""","""")")
 D SET^%ANA(NORES,"TYPE","VARIABLE")
 G DEPIL^%ANGEPIL
 ;
 ;

