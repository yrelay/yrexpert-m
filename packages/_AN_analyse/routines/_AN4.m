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

;%AN4^INT^1^59547,73865^0
AN4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
EXPRESS K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="NOPE",@TEMPO@(3)="GA",@TEMPO@(4)="R",@TEMPO@(5)="T" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 D EMPIL^%ANGEPIL("EXPRE1^%AN4") G OBJET^%AN1
EXPRE1 G:RESULT=0 DEPIL^%ANGEPIL
SEXPRE 
BS S GA=NORES D CAR G:("_#+-*/\"'[C)!(C="") DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("BS1^%AN4") G OBINAIRE^%AN1
BS1 I RESULT=0 D KILL^%ANA(GA) G DEPIL^%ANGEPIL
 S NOPE=NORES
 D SET^%ANA(NOPE,1,GA),EMPIL^%ANGEPIL("BS2^%AN4") G OBJET^%AN1
BS2 I RESULT=0 D KILL^%ANA(NOPE) G DEPIL^%ANGEPIL
 D SET^%ANA(NOPE,2,NORES) S NORES=NOPE G BS
 
PRECED K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="V1",@TEMPO@(4)="V2",NORES=0 D CAR,EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("PRECED1^%AN4") G VARIABLE^%AN3
PRECED1 G:RESULT=0 DEPIL^%ANGEPIL
 S V1=NORES D EMPIL^%ANGEPIL("PRECED2^%AN4") G OPRECED^%AN1
PRECED2 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 S V2=NORES D EMPIL^%ANGEPIL("PRECED3^%AN4") G VARIABLE^%AN3
PRECED3 I RESULT=0 D KILL^%ANA(V1),KILL^%ANA(V2) G DEPIL^%ANGEPIL
 D SET^%ANA(V2,1,V1),SET^%ANA(V2,2,NORES) S NORES=V2 G DEPIL^%ANGEPIL
 
CONDIT K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="L",@TEMPO@(4)="N",NORES=0
 D EMPV^%ANGEPIL(TEMPO)
 S N=$$^%QZCHW("SI"),L=$L(N) D CAR
 I $E(CH,P,(P+L)-1)'=N D M("un SI etait attendu ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 S %COMPIL=%COMPIL_"I (" D EMPIL^%ANGEPIL("CONDIT2^%AN4") G COND
CONDIT2 G:RESULT=0 DEPIL^%ANGEPIL
 S N=$$^%QZCHW("ALORS"),L=$L(N),%COMPIL=%COMPIL_") "
 I $E(CH,P,(P+L)-1)'=N D KILL^%ANA(NORES),M("Vous avez oublie le ALORS ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 G DEPIL^%ANGEPIL
 
COND K @(TEMPO)
 S @TEMPO@(1)="NG",@TEMPO@(2)="NC",@TEMPO@(3)="ND",@TEMPO@(4)="ET"
 S @TEMPO@(5)="OU",@TEMPO@(6)="EXT",@TEMPO@(7)="LON",@TEMPO@(8)="I"
 S @TEMPO@(9)="OL",@TEMPO@(10)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO)
 D CAR
 I C="(" D EMPIL^%ANGEPIL("COND1^%AN4"),LEC S %COMPIL=%COMPIL_"(" G COND
 D EMPIL^%ANGEPIL("COND2^%AN4") G CRIT
COND1 D CAR
 I C'=")" D M("Une "")"" etait attendue...") S RESULT=0 D KILL^%ANA(NORES) G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_")"
 D LEC
COND2 G:RESULT=0 DEPIL^%ANGEPIL
 S ET=$$^%QZCHW("ET"),LON=$L(ET),EXT=$E(CH,P,(P+LON)-1),OL="&"
 G:EXT=ET COND3
 S OU=$$^%QZCHW("OU"),LON=$L(OU),EXT=$E(CH,P,(P+LON)-1),OL="!"
 G:EXT'=OU DEPIL^%ANGEPIL
COND3 S NG=NORES,NC=$$NEW^%ANA
 F I=1:1:LON D LEC
 S %COMP1=%COMPIL_OL,%COMPIL=""
 D SET^%ANA(NC,"TYPE","OPERATEUR.LOGIQUE"),SET^%ANA(NC,"TEXTE",OL),SET^%ANA(NC,1,NG)
 D EMPIL^%ANGEPIL("COND4^%AN4")
 G COND
COND4 I RESULT=0 D KILL^%ANA(NC) G DEPIL^%ANGEPIL
 S %COMPIL=%COMP1_%COMPIL
 S ND=NORES,NORES=NC
 D SET^%ANA(NORES,2,ND)
 G DEPIL^%ANGEPIL
 
 
CRIT K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="L"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 S %NEG="" D EMPIL^%ANGEPIL("CRIT0^%AN4")
 G:C'="'" CRIT1
 D LEC
 S N=$$NEW^%ANA,%NEG="'" D SET^%ANA(N,"TYPE","NEGATION"),SET^%ANA(N,"TEXTE","NON")
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("CRITNEG^%AN4") G CRIT1
CRITNEG I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 D SET^%ANA(N,1,NORES) S NORES=N G DEPIL^%ANGEPIL
 
CRIT0 G DEPIL^%ANGEPIL
 
CRIT1 K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR,EMPIL^%ANGEPIL("CRIT10^%AN4")
 G:C'="$" CRITERE^%AN5
 G:$$FONLOG^%AN51 FLOG^%AN51
 G CRITERE^%AN5
CRIT10 G DEPIL^%ANGEPIL
 
INDICE 
 K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'="(" D M($$^%QZCHW("Une ( doit preceder l'indice ...")) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("INDEND^%AN4")
 S %COMPIL=""
 G:C="""" CHAINE^%AN1
 G:C?1N NOMBRE^%AN1
 G VARTEMP^%AN3
INDEND G:RESULT=0 DEPIL^%ANGEPIL
 D CAR I C'=")" D M($$^%QZCHW("Une ) doit terminer l'indice ...")) S RESULT=0 D KILL^%ANA(NORES) G DEPIL^%ANGEPIL
 D LEC G DEPIL^%ANGEPIL
 ;

