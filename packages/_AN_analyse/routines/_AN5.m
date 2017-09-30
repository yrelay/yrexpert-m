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

;%AN5^INT^1^59547,73865^0
ANS5 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
CRITSIMP 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="N1",@TEMPO@(4)="N2",@TEMPO@(5)="R",@TEMPO@(6)="MOD"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0,R="",MOD=0 G CRITERE2
 
CRITERE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="N1",@TEMPO@(4)="N2",@TEMPO@(5)="R",@TEMPO@(6)="MOD",@TEMPO@(7)="%COMP1",@TEMPO@(8)="%COMP2",@TEMPO@(9)="%COMP3",@TEMPO@(10)="%COMP4",@TEMPO@(11)="%COMP5",@TEMPO@(12)="R2"
 S @TEMPO@(13)="LET",@TEMPO@(14)="LOU",@TEMPO@(15)="ET",@TEMPO@(16)="OU"
 S @TEMPO@(17)="%COMP6"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0,R="",MOD=1
CRITERE2 D CAR G:C'="(" 1
 S %COMPIL=%COMPIL_"("
 D LEC,EMPIL^%ANGEPIL("CR1^%AN5")
 G CRITERE
CR1 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR I C'=")" D M("Une "")"" manque ..."),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_")"
 D LEC G:MOD SCRIT G DEPIL^%ANGEPIL
 
CRIT1 K @(TEMPO)
 S @TEMPO@(1)="MOD"
 D EMPV^%ANGEPIL(TEMPO)
 S MOD=0
1 S %COMP6=%COMPIL,%COMPIL=""
 
 G:C="'" NEGFON
 
 I $$FONLOG^%AN51 D EMPIL^%ANGEPIL("40^%AN5") G FLOG^%AN51
 
 D EMPIL^%ANGEPIL("10^%AN5") G EXPRESS^%AN4
10 G:RESULT=0 DEPIL^%ANGEPIL S N1=NORES
 S R=$E(CH,P,P+1),R2=$E(CH,P,P+2) G:(((((((R'="[[")&(R'="]]"))&(R'="[]"))&(R'="]["))&(R2'="'[["))&(R2'="']]"))&(R2'="'[]"))&(R2'="'][") 2 G 3
2 
 S %COMPIL=%COMP6_"(("_%COMPIL_")"
 D EMPIL^%ANGEPIL("20^%AN5") G CBINAIRE^%AN1
20 I RESULT=0 D KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S N2=NORES
 S %COMPIL=%COMPIL_"("
 D EMPIL^%ANGEPIL("21^%AN5") G EXPRESS^%AN4
21 I RESULT=0 D KILL^%ANA(N2),KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S %COMPIL=%COMPIL_"))"
 D SET^%ANA(N2,1,N1),SET^%ANA(N2,2,NORES) S NORES=N2
 G:MOD SCRIT G DEPIL^%ANGEPIL
3 
 S %COMP1=%COMPIL,%COMPIL=""
 D EMPIL^%ANGEPIL("30^%AN5") G CTERNAIR^%AN1
30 I RESULT=0 D KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL=""
 S N=NORES D EMPIL^%ANGEPIL("31^%AN5") G EXPRESS^%AN4
31 I RESULT=0 D KILL^%ANA(N),KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S N2=NORES D CAR I C'="," D KILL^%ANA(N),KILL^%ANA(N1),KILL^%ANA(N2),M("Une virgule entre les deux bornes est necessaire ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP3=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("32^%AN5") G EXPRESS^%AN4
32 I RESULT=0 D KILL^%ANA(N),KILL^%ANA(N2),KILL^%ANA(N1) G DEPIL^%ANGEPIL
 S %COMP4=%COMPIL
 S %COMPIL=%COMP6_"((("_%COMP1_")"_$S($E(%COMP2,1)="[":"'<",1:">")_"("_%COMP3_"))&(("_%COMP1_")"_$S($E(%COMP2,2)="]":"'>",1:"<")_"("_%COMP4_")))"
 
 D SET^%ANA(N,1,N1),SET^%ANA(N,2,N2),SET^%ANA(N,3,NORES) S NORES=N
 G:'(MOD) DEPIL^%ANGEPIL
 G SCRIT
 
40 G:RESULT=0 DEPIL^%ANGEPIL
 S %COMPIL=%COMP6_"("_%COMPIL_")"
 G:'(MOD) DEPIL^%ANGEPIL
 
SCRIT D CAR
 G:C="" DEPIL^%ANGEPIL
 G:"!&"[C ETOU
 S ET=$$^%QZCHW("ET"),LET=$L(ET)-1,OU=$$^%QZCHW("OU"),LOU=$L(OU)-1
 G:$E(CH,P,P+LET)=ET ETOU
 G:$E(CH,P,P+LOU)=OU ETOU
 G DEPIL^%ANGEPIL
ETOU D EMPIL^%ANGEPIL("SCRIT1^%AN5") S N=NORES G OLOGBIN^%AN20
SCRIT1 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 D SET^%ANA(NORES,1,N) S N=NORES
 D EMPIL^%ANGEPIL("SCRIT2^%AN5") G CRITSIMP
SCRIT2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 D SET^%ANA(N,2,NORES) S NORES=N G SCRIT
 
 
NEGFON D LEC
 D EMPIL^%ANGEPIL("NEGFON1^%AN5") G FLOG^%AN51
NEGFON1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=$$NEW^%ANA,%NEG="'" D SET^%ANA(N,"TYPE","NEGATION"),SET^%ANA(N,"TEXTE","NON")
 D SET^%ANA(N,1,NORES) S NORES=N
 S %COMPIL=%COMP6_"'("_%COMPIL_")"
 G:'(MOD) DEPIL^%ANGEPIL
 G SCRIT
 
 
CRITREQ K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR,EMPIL^%ANGEPIL("CRREQ1^%AN5")
 G:$F(CH,"<<",0) PRECED^%AN4
 G CRITERE
CRREQ1 G DEPIL^%ANGEPIL
 
 
TTLT K @(TEMPO) S @TEMPO@(1)="ACT",@TEMPO@(2)="C",@TEMPO@(3)="COND" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR S COND=0 G:C="$" ACTI
 D EMPIL^%ANGEPIL("TTLT0^%AN5") G CONDIT^%AN4
TTLT0 G:RESULT=0 DEPIL^%ANGEPIL S COND=NORES
ACTI D EMPIL^%ANGEPIL("TTLT1^%AN5") G ACTTLT^%AN6
TTLT1 I RESULT=0 D KILL^%ANA(COND) G DEPIL^%ANGEPIL
 S ACT=NORES,NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","INFERENCE")
 D SET^%ANA(NORES,1,COND),SET^%ANA(NORES,2,ACT) G DEPIL^%ANGEPIL

