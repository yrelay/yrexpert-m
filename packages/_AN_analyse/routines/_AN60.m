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

;%AN60^INT^1^59547,73866^0
AN60 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
HAUT 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="HB",@TEMPO@(3)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S HB=1
 
 F I=1:1:$L($$^%QZCHW("$HAUT"))+1 D LEC
 S %COMP1=%COMPIL_"""!@#H",%COMPIL=""
 D EMPIL^%ANGEPIL("HAUT1^%AN60")
 G EXPRESS^%AN4
HAUT1 I RESULT=0 G DEPIL^%ANGEPIL
 D CAR,KILL^%ANA(NORES)
 S %COMPIL=%COMP1_$$ZSUBST^%QZCHSUB(%COMPIL,"""","""""")_"H#@!"""
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERRAD
 D LEC
 G DEPIL^%ANGEPIL
 
 
 
BAS 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="HB",@TEMPO@(3)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S HB=1
 
 F I=1:1:$L($$^%QZCHW("$BAS"))+1 D LEC
 S %COMP1=%COMPIL_"""!@#B",%COMPIL=""
 D EMPIL^%ANGEPIL("BAS1^%AN60")
 G EXPRESS^%AN4
BAS1 I RESULT=0 G DEPIL^%ANGEPIL
 D CAR,KILL^%ANA(NORES)
 S %COMPIL=%COMP1_$$ZSUBST^%QZCHSUB(%COMPIL,"""","""""")_"B#@!"""
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERRAD
 D LEC
 G DEPIL^%ANGEPIL
 
 
SYMB 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="HB",@TEMPO@(3)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 S HB=1
 
 F I=1:1:$L($$^%QZCHW("$SYMBOLE"))+1 D LEC
 S %COMP1=%COMPIL_"""!@#S",%COMPIL=""
 D EMPIL^%ANGEPIL("SYM1^%AN60")
 G EXPRESS^%AN4
SYM1 I RESULT=0 G DEPIL^%ANGEPIL
 D CAR
 S %COMPIL=%COMP1_$$ZSUBST^%QZCHSUB(%COMPIL,"""","""""")_"S#@!"""
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERRAD
 D LEC S HB=0
 G DEPIL^%ANGEPIL

