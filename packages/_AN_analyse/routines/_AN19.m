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

;%AN19^INT^1^59547,73865^0
AN19 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
CADRE K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="X1",@TEMPO@(4)="X2",@TEMPO@(5)="Y1",@TEMPO@(6)="Y2" D EMPV^%ANGEPIL(TEMPO) S (NORES,X1,X2,Y1,Y2)=0
 F I=1:1:$L($$^%QZCHW("$CADRE"))+1 D LEC
 D EMPIL^%ANGEPIL("CADRE1^%AN19") G EXPRESS^%AN4
CADRE1 G:RESULT=0 DEPIL^%ANGEPIL S X1=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_";" D LEC,EMPIL^%ANGEPIL("CADRE2^%AN19") G EXPRESS^%AN4
CADRE2 I RESULT=0 D KILL^%ANA(X1) S RESULT=0 G DEPIL^%ANGEPIL
 S Y1=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1),KILL^%ANA(Y1) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_";" D LEC,EMPIL^%ANGEPIL("CADRE3^%AN19") G EXPRESS^%AN4
CADRE3 I RESULT=0 D KILL^%ANA(X1),KILL^%ANA(Y1) S RESULT=0 G DEPIL^%ANGEPIL
 S X2=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_";" D LEC,EMPIL^%ANGEPIL("CADRE4^%AN19") G EXPRESS^%AN4
CADRE4 I RESULT=0 D KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2) G DEPIL^%ANGEPIL
 S Y2=NORES
 
 
 
 
 S %COMPIL="S ^V($J,""%"",""%X"",1)="_$P(%COMPIL,";",1)_",^V($J,""%"",""%Y"",1)="_$P(%COMPIL,";",2)_",^V($J,""%"",""%X2"",1)="_$P(%COMPIL,";",3)_",^V($J,""%"",""%Y2"",1)="_$P(%COMPIL,";",4)_" S %FONC=""CADRE"" D GRAPH^%EDCENVL"
 D CAR I C'=")" D M("Une ) a la fin S.V.P. ..."),KILL^%ANA(X1),KILL^%ANA(Y1),KILL^%ANA(X2),KILL^%ANA(Y2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CADRE")
 D SET^%ANA(NORES,1,X1),SET^%ANA(NORES,2,Y1),SET^%ANA(NORES,3,X2),SET^%ANA(NORES,4,Y2) G DEPIL^%ANGEPIL
 
ALIGNER K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="C2",@TEMPO@(3)="CH2",@TEMPO@(4)="I",@TEMPO@(5)="X",@TEMPO@(6)="Y" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,CH2,C2,X,Y)=0
 F I=1:1:$L($$^%QZCHW("$ALIGNER"))+1 D LEC
 D EMPIL^%ANGEPIL("ALIG1^%AN19") G CHAINEX^%AN1
ALIG1 G:RESULT=0 DEPIL^%ANGEPIL S CH2=NORES D CAR
 I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(CH2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ALIG2^%AN19") G CAREX^%AN1
ALIG2 I RESULT=0 D KILL^%ANA(CH2) G DEPIL^%ANGEPIL
 S C2=NORES
 D CAR I C=")" G ALEX
 I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(CH2),KILL^%ANA(C2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ALIG3^%AN19") G EXPRESS^%AN4
ALIG3 I RESULT=0 D KILL^%ANA(CH2),KILL^%ANA(C2) G DEPIL^%ANGEPIL
 S X=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(CH2),KILL^%ANA(X),KILL^%ANA(C2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ALIG4^%AN19") G EXPRESS^%AN4
ALIG4 I RESULT=0 D KILL^%ANA(CH2),KILL^%ANA(X),KILL^%ANA(C2) S RESULT=0 G DEPIL^%ANGEPIL
 S Y=NORES
ALEX D CAR I C'=")" D M("Une ) a la fin S.V.P. ..."),KILL^%ANA(X),KILL^%ANA(Y),KILL^%ANA(CH2),KILL^%ANA(C2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ALIGNER")
 D SET^%ANA(NORES,1,CH2),SET^%ANA(NORES,2,C2),SET^%ANA(NORES,3,X),SET^%ANA(NORES,4,Y) G DEPIL^%ANGEPIL
 ;

