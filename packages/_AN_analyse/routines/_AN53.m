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

;%AN53^INT^1^59547,73865^0
AN53 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
CRACT 
 K @(TEMPO)
 
 S @TEMPO@(1)="I",@TEMPO@(2)="NUM",@TEMPO@(3)="ACT",@TEMPO@(4)="GAM",@TEMPO@(5)="VVAR",@TEMPO@(6)="REP"
 D EMPV^%ANGEPIL(TEMPO)
 S (NUM,ACT,GAM,VVAR,REP)=0
 I '($$OKR^%INCOIN("MOZSF")) D M("Vous n'avez pas acces a cette action") G ERRCR
 F I=1:1:$L($$^%QZCHW("$CREER.ACTION"))+1 D LEC
 
 D EMPIL^%ANGEPIL("CRACTI^%AN53") G VARTEMP^%AN3
CRACTI 
 I RESULT=0 G ERRCR
 S VVAR=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCR
 
 D LEC
 D EMPIL^%ANGEPIL("CRACT0^%AN53") G EXPRESS^%AN4
CRACT0 
 I RESULT=0 G ERRCR
 S NUM=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCR
 
 D LEC
 D EMPIL^%ANGEPIL("CRACT1^%AN53") G EXPRESS^%AN4
CRACT1 
 G:RESULT=0 ERRCR
 S ACT=NORES
 D CAR
 
 G:C=")" CRACTF
 I C'=";" D M("Un "";"" ou une "")"" etait attendu") G ERRCR
 
 D LEC
 D EMPIL^%ANGEPIL("CRACT2^%AN53") G EXPRESS^%AN4
CRACT2 
 G:RESULT=0 ERRCR
 S GAM=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCR
 
 D LEC
 D EMPIL^%ANGEPIL("CRACT3^%AN53") G EXPRESS^%AN4
CRACT3 
 G:RESULT=0 ERRCR
 S REP=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRCR
 
CRACTF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CREER.ACTION")
 D SET^%ANA(NORES,1,VVAR)
 D SET^%ANA(NORES,2,NUM),SET^%ANA(NORES,3,ACT)
 D SET^%ANA(NORES,4,GAM),SET^%ANA(NORES,5,REP)
 G DEPIL^%ANGEPIL
 
ERRCR D KILL^%ANA(NUM),KILL^%ANA(ACT),KILL^%ANA(GAM),KILL^%ANA(VVAR),KILL^%ANA(REP)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
DERNI 
 K @(TEMPO)
 
 S @TEMPO@(1)="I",@TEMPO@(2)="ATTR"
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$DERNIER.INDICE"))+1 D LEC
 
 D EMPIL^%ANGEPIL("DERNI1^%AN53") G ATTRIBUT^%AN3
DERNI1 
 I RESULT=0 G DEPIL^%ANGEPIL
 D CAR
 I C'=")" D M("Une "")"" etait attendue"),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S ATTR=NORES
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$DERNIER.INDICE")
 D SET^%ANA(NORES,1,ATTR)
 G DEPIL^%ANGEPIL
 
 
COPGA 
 K @(TEMPO)
 
 S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="G1",@TEMPO@(4)="A2",@TEMPO@(5)="G2",@TEMPO@(6)="OR2"
 D EMPV^%ANGEPIL(TEMPO)
 S (A1,G1,A2,G2,OR2)=0
 I '($$OKR^%INCOIN("MOZSF")) D M("Vous n'avez pas acces a cette action") G ERRCO
 F I=1:1:$L($$^%QZCHW("$COPIER.GAMME"))+1 D LEC
 
 D EMPIL^%ANGEPIL("COPGA0^%AN53") G EXPRESS^%AN4
COPGA0 
 I RESULT=0 G DEPIL^%ANGEPIL
 S A1=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCO
 
 D LEC
 G:C=";" COPGA20
 D EMPIL^%ANGEPIL("COPGA1^%AN53") G EXPRESS^%AN4
COPGA1 
 G:RESULT=0 ERRCO
 S G1=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCO
 
COPGA20 D LEC
 D EMPIL^%ANGEPIL("COPGA2^%AN53") G EXPRESS^%AN4
COPGA2 
 G:RESULT=0 ERRCO
 S A2=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRCO
 D LEC
 G:C=")" COPGAF
 D EMPIL^%ANGEPIL("COPGA3^%AN53") G EXPRESS^%AN4
COPGA3 
 G:RESULT=0 ERRCO
 S G2=NORES
 D CAR
 G:C=")" COPGAF
 I C'=";" D M("Un "";"" etait attendu") G ERRCO
 D LEC
 D EMPIL^%ANGEPIL("COPGA4^%AN53") G EXPRESS^%AN4
COPGA4 
 G:RESULT=0 ERRCO
 S OR2=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRCO
COPGAF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$COPIER.GAMME")
 D SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,G1),SET^%ANA(NORES,3,A2)
 D SET^%ANA(NORES,4,G2),SET^%ANA(NORES,5,OR2)
 G DEPIL^%ANGEPIL
 
ERRCO D KILL^%ANA(A1),KILL^%ANA(A2),KILL^%ANA(G1)
 D KILL^%ANA(G2),KILL^%ANA(OR2)
 S RESULT=0
 G DEPIL^%ANGEPIL

