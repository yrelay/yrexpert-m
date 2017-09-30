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

;%AN55^INT^1^59547,73866^0
AN55 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
CADTXT K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="A2",@TEMPO@(4)="A3",@TEMPO@(5)="A4",@TEMPO@(6)="A5",@TEMPO@(7)="A6",@TEMPO@(8)="A7",@TEMPO@(9)="A8",@TEMPO@(21)="A9",@TEMPO@(22)="A10",@TEMPO@(23)="PARAM"
 S @TEMPO@(10)="%COMP1",@TEMPO@(11)="%COMP2",@TEMPO@(12)="%COMP3",@TEMPO@(13)="%COMP4",@TEMPO@(14)="%COMP5",@TEMPO@(15)="%COMP6",@TEMPO@(16)="%COMP7"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$CADRER.TEXTE"))+1 D LEC
 S %COMP1=%COMPIL,%COMPIL="",(A1,A2,A3,A4,A5,A6,A7,A8,A9,A10)=0
 S %COMP2="",%COMP3="",%COMP4="",%COMP5="",%COMP6="",%COMP7=""
 
NOT D EMPIL^%ANGEPIL("NOTR^%AN55") G EXPRESS^%AN4
NOTR G:RESULT=0 ERR
 S %COMP2=%COMPIL
 S A2=NORES,%COMPIL=""
 D CAR I C'=";" D M($$^%QZCHW("Un "";"" etait attendu...")) S RESULT=0 G ERR
 D LEC
 
SAUT D EMPIL^%ANGEPIL("SAUTR^%AN55") G EXPRESS^%AN4
SAUTR G:RESULT=0 ERR
 S %COMP4=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A4=NORES,%COMPIL=""
 D CAR I C'=";" D M($$^%QZCHW("Un "";"" etait attendu...")) S RESULT=0 G ERR
 D LEC
 
LARG D EMPIL^%ANGEPIL("LARGR^%AN55") G EXPRESS^%AN4
LARGR G:RESULT=0 ERR
 S %COMP5=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A5=NORES,%COMPIL=""
 D CAR I C=")" G FINMOD
 I C'=";" D M($$^%QZCHW("Un "";"" etait attendu...")) S RESULT=0 G ERR
 D LEC
 
COX D EMPIL^%ANGEPIL("COXR^%AN55") G EXPRESS^%AN4
COXR G:RESULT=0 ERR
 S %COMP6=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A7=NORES,%COMPIL=""
 D CAR I C'=";" D M($$^%QZCHW("Un "";"" etait attendu...")) S RESULT=0 G ERR
 D LEC
 
COY D EMPIL^%ANGEPIL("COYR^%AN55") G EXPRESS^%AN4
COYR G:RESULT=0 ERR
 S %COMP7=$S($$NUM^%QZNBN(%COMPIL):$J(%COMPIL,1,2),1:%COMPIL),A8=NORES,%COMPIL=""
 D CAR
FCDTXT I C'=")" D M($$^%QZCHW("Une "")"" etait attendue...")) S RESULT=0 G ERR
 
FINMOD D LEC
 S %COMPIL=""
 S:%COMP6'="" %COMPIL="S ^V($J,""%"",""%X"",1)="_%COMP6_" "
 S:%COMP7'="" %COMPIL=%COMPIL_"S ^V($J,""%"",""%Y"",1)="_%COMP7_" "
 S %COMPIL=%COMP1_%COMPIL_"D COOR^%EDCENVL,TEXTE^%EDCNOTB("_%COMP2_","_%COMP4_","_%COMP5_")"
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CADRER.TEXTE")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2),SET^%ANA(NORES,3,A3)
 D SET^%ANA(NORES,4,A4),SET^%ANA(NORES,5,A5),SET^%ANA(NORES,6,A6)
 D SET^%ANA(NORES,7,A7),SET^%ANA(NORES,8,A8),SET^%ANA(NORES,9,A9)
 D SET^%ANA(NORES,10,A10)
 K ^TEMPORAI($J,$P($ZPOS,"^",2)) G DEPIL^%ANGEPIL
ERR F I="A1","A2","A3","A4","A5","A6","A7","A8","A9","A10" D KILL^%ANA(I)
 K ^TEMPORAI($J,$P($ZPOS,"^",2))
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
MAJ K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="L",@TEMPO@(4)="N",@TEMPO@(5)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,N=$$^%QZCHW("$MAJUSCULE"),L=$L(N)
 F I=1:1:L D LEC
 S %COMP1=%COMPIL
 S %COMPIL="",I=0 D LEC,EMPIL^%ANGEPIL("MAJ1^%AN55") G EXPRESS^%AN4
MAJ1 G:RESULT=0 DEPIL^%ANGEPIL
 S I=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $MAJUSCULE ..."),KILL^%ANA(I) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
DEND S NORES=$$NEW^%ANA,%COMPIL=%COMP1_"$$MAJ^%VMINUSC("_%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MAJUSCULE")
 D SET^%ANA(NORES,1,I)
 G DEPIL^%ANGEPIL
 
 
MIN K @(TEMPO)
 S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="L",@TEMPO@(4)="N",@TEMPO@(5)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,N=$$^%QZCHW("$MINUSCULE"),L=$L(N)
 F I=1:1:L D LEC
 S %COMP1=%COMPIL
 S %COMPIL="",I=0
 D LEC,EMPIL^%ANGEPIL("MIN1^%AN55") G EXPRESS^%AN4
MIN1 G:RESULT=0 DEPIL^%ANGEPIL
 S I=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $MINUSCULE ..."),KILL^%ANA(I) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMP1_"$$MIN^%VMINUSC("_%COMPIL_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MINUSCULE")
 D SET^%ANA(NORES,1,I) G DEPIL^%ANGEPIL

