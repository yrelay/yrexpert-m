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

;%AN13^INT^1^59547,73865^0
AN13 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
L1(CH,P,A) N II,%COMPIL,TEMPO,RESULT,NORES,ATT,C,CHE,N,NOCOMPIL
 D INIT^%ANGEPIL S RESULT=1,%COMPIL="BIDON POUR REQUETES"
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S NOCOMPIL=1
 S (A,NORES,ATT,LIV)=0 D EMPIL^%ANGEPIL("L10^%AN13") G LIV
L10 I RESULT=0 D EPIL^%ANGEPIL K @(TEMPO) Q 0
 S LIV=NORES,II=$$RED^%ANA(LIV,"TEXTE")
 I $E(II)="%" D KILL^%ANA(LIV),M("Un individu intermediaire ne doit pas commencer par ""%"" "),EPIL^%ANGEPIL K @(TEMPO) Q 0
 D CAR
 I C'=":" D KILL^%ANA(LIV),M("Un : etait attendu apres les individus"),EPIL^%ANGEPIL K @(TEMPO) Q 0
 D LEC,EMPIL^%ANGEPIL("L11^%AN13") G ATTRIBUT^%AN3
L11 I RESULT=0 D KILL^%ANA(LIV),EPIL^%ANGEPIL K @(TEMPO) Q 0
 S ATL=$$RED^%ANA($$RED^%ANA(NORES,1),"TEXTE")
 G:(ATL'="LIEN")&(ATL'="INVERSE") LS
 S RRE=$$RED^%ANA($$RED^%ANA(NORES,2),"TEXTE")
 I RRE="" D KILL^%ANA(LIV),KILL^%ANA(NORES),M("Le repertoire n'est pas defini"),EPIL^%ANGEPIL K @(TEMPO) Q 0
 S ATL=ATL_"."_RRE
 D KILL^%ANA($$RED^%ANA(NORES,2)),SET^%ANA($$RED^%ANA(NORES,1),"TEXTE",ATL),SET^%ANA(NORES,2,0)
LS S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","VARIABLES.INTERMEDIAIRES")
 D SET^%ANA(A,1,LIV)
 D SET^%ANA(A,2,NORES),EPIL^%ANGEPIL K @(TEMPO) Q 1
LIV K @(TEMPO) S @TEMPO@(1)="VA" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("LIV0^%AN13") G VARIABLE^%AN3
LIV0 G:RESULT=0 DEPIL^%ANGEPIL S VA=NORES
 D EMPIL^%ANGEPIL("LIV1^%AN13") G SVA
LIV1 G DEPIL^%ANGEPIL
 
SVA K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="V"
 D EMPV^%ANGEPIL(TEMPO) S NOPRES=0
SV1 D CAR I C=":" S NORES=VA G DEPIL^%ANGEPIL
 I C'="," D KILL^%ANA(VA) S (RESULT,OK)=0 D M(""","" attendue") G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SV10^%AN13") G VARIABLE^%AN3
SV10 I RESULT=0 D KILL^%ANA(VA) G DEPIL^%ANGEPIL
 S V=NORES,N=$$NEW^%ANA
 D SET^%ANA(N,"TYPE","LISTE.VARIABLES")
 D SET^%ANA(N,1,VA)
 D SET^%ANA(N,2,V)
 S VA=N G SV1
 
CHE K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N"
 D EMPV^%ANGEPIL(TEMPO) S NORES=0
CH1 D CAR I "@+-*/=<>[]'"[C S NORES=CHE G DEPIL^%ANGEPIL
 I C'="^" D KILL^%ANA(CHE),M("^ attendu") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CH10^%AN13") G LIE
CH10 I RESULT=0 D KILL^%ANA(CHE) G DEPIL^%ANGEPIL
 S N=$$NEW^%ANA
 D SET^%ANA(N,"TYPE","CHEMIN")
 D SET^%ANA(N,1,NORES)
 D SET^%ANA(N,2,CHE)
 S CHE=N G CH1
LIE 
 K @(TEMPO) S @TEMPO@(1)="ID",@TEMPO@(2)="IN",@TEMPO@(3)="N" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,ID,IN)=0
 D EMPIL^%ANGEPIL("LIE1^%AN13") G ATTRIBUT^%AN3
LIE1 G:RESULT=0 DEPIL^%ANGEPIL S ID=NORES
 D CAR G:C=('("(")) LIE3
 D EMPIL^%ANGEPIL("LIE2^%ANGEPIL") G INDICE^%AN3
LIE2 I RESULT=0 D KILL^%ANA(ID) G DEPIL^%ANGEPIL
 S IN=NORES
LIE3 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","LIEN")
 D SET^%ANA(NORES,1,ID)
 D SET^%ANA(NORES,2,IN)
 G DEPIL^%ANGEPIL

