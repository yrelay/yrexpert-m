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

;%AN54^INT^1^59547,73866^0
%AN54 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
PNOM 
 K @(TEMPO)
 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="IND",@TEMPO@(3)="ETI",@TEMPO@(4)="OBJ"
 S @TEMPO@(5)="LIE",@TEMPO@(6)="NIV",@TEMPO@(7)="PAR",@TEMPO@(8)="SEN",@TEMPO@(9)="DEJ",@TEMPO@(10)="PERE",@TEMPO@(11)="V3",@TEMPO@(12)="VIA"
 S @TEMPO@(13)="ATL",@TEMPO@(14)="LV"
 D EMPV^%ANGEPIL(TEMPO)
 S (OBJ,IND,LIE,NIV,ETI,PAR,SEN,DEJ,PERE,V3)=0
 I '($$OKR^%INCOIN("QMNF")) D M("Vous n'avez pas acces a cette action") G ERRPNOM
 
 F I=1:1:$L($$^%QZCHW("$PARCOURIR.NOMENCLATURE"))+1 D LEC
 
 D EMPIL^%ANGEPIL("PNOM0^%AN54") G VARTEMP^%AN3
PNOM0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S OBJ=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM1^%AN54") G VARTEMP^%AN3
PNOM1 
 G:RESULT=0 ERRPNOM
 S PERE=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM1S^%AN54") G VARTEMP^%AN3
PNOM1S 
 G:RESULT=0 ERRPNOM
 S IND=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM2^%AN54") G VARTEMP^%AN3
PNOM2 
 G:RESULT=0 ERRPNOM S NIV=NORES D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM3^%AN54") G ATTRIBUT^%AN3
PNOM3 
 G:RESULT=0 ERRPNOM S V3=NORES D CAR
 I C'=";" D M("Une "";"" apres le chemin ...") G ERRPNOM
 S VIA=$$RED^%ANA(V3,2) G:VIA=0 PNOM31
 S ATL=$$RED^%ANA(V3,1),LV=$$RED^%ANA(ATL,"TEXTE")
 I (LV="LIEN")!(LV="INVERSE") S LV=LV_"."_$$RED^%ANA(VIA,"TEXTE") D SET^%ANA(ATL,"TEXTE",LV),SET^%ANA(V3,2,0),KILL^%ANA(VIA) G PNOM31
 D M("Pas d'indice dans le chemin ... ") G ERRPNOM
PNOM31 
 S VIA=$$RED^%ANA(V3,3) G:VIA=0 PNOM32
 S VIA=$$RED^%ANA(VIA,"TEXTE") G:VIA="" PNOM32
 I $E(VIA)'="%" D M("Le ""^"" doit etre suivi d'une variable ou ne pas exister ... ") G ERRPNOM
 
PNOM32 D LEC,EMPIL^%ANGEPIL("PNOM4^%AN54") G EXPRESS^%AN4
PNOM4 
 G:RESULT=0 ERRPNOM S ETI=NORES D CAR
 G:C=")" PNOMF
 I C'=";" D M("Un "";"" ou une "")"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM5^%AN54") G EXPRESS^%AN4
PNOM5 
 G:RESULT=0 ERRPNOM S PAR=NORES D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM6^%AN54") G EXPRESS^%AN4
PNOM6 
 G:RESULT=0 ERRPNOM S SEN=NORES D CAR
 I C'=";" D M("Un "";"" etait attendu") G ERRPNOM
 
 D LEC
 D EMPIL^%ANGEPIL("PNOM7^%AN54") G EXPRESS^%AN4
PNOM7 
 G:RESULT=0 ERRPNOM S DEJ=NORES D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRPNOM
PNOMF D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PARCOURIR.NOMENCLATURE")
 D SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,PERE)
 D SET^%ANA(NORES,3,IND),SET^%ANA(NORES,4,NIV)
 D SET^%ANA(NORES,5,V3),SET^%ANA(NORES,6,ETI),SET^%ANA(NORES,7,PAR)
 D SET^%ANA(NORES,8,SEN),SET^%ANA(NORES,9,DEJ)
 G DEPIL^%ANGEPIL
 
ERRPNOM D KILL^%ANA(LIE),KILL^%ANA(ETI),KILL^%ANA(OBJ)
 D KILL^%ANA(IND),KILL^%ANA(NIV),KILL^%ANA(PAR)
 D KILL^%ANA(SEN),KILL^%ANA(DEJ),KILL^%ANA(V3)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
IMPRL 
 K @(TEMPO)
 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="LIS",@TEMPO@(3)="ATR"
 D EMPV^%ANGEPIL(TEMPO)
 S (LIS,ATR)=0
 
 F I=1:1:$L($$^%QZCHW("$IMPRIMERL"))+1 D LEC
 
 D EMPIL^%ANGEPIL("IMPL0^%AN54") G EXPRESS^%AN4
IMPL0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S LIS=NORES
 D CAR
 G:C=")" FIMPL
 
 I C'=";" D M("Un "";"" ou une "")"" etait attendu") G ERR
 
 D LEC
 D EMPIL^%ANGEPIL("IMPL1^%AN54") G EXPRESS^%AN4
IMPL1 
 G:RESULT=0 ERR
 S ATR=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERR
FIMPL D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$IMPRIMERL")
 D SET^%ANA(NORES,1,LIS),SET^%ANA(NORES,2,ATR)
 G DEPIL^%ANGEPIL
 
ERR D KILL^%ANA(LIS),KILL^%ANA(ATR)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
MOZ 
 K @(TEMPO)
 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="RE",@TEMPO@(3)="OB"
 D EMPV^%ANGEPIL(TEMPO)
 S (RE,OB)=0
 
 F I=1:1:$L($$^%QZCHW("$MOZART")) D LEC
 I '($$OKR^%INCOIN("MOZ")) D M("Action inaccessible") G ERRMOZ
 G:C'="(" FMOZ
 D LEC
 
 D EMPIL^%ANGEPIL("MOZ0^%AN54") G EXPRESS^%AN4
MOZ0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S RE=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu") G ERRMOZ
 
 D LEC
 D EMPIL^%ANGEPIL("MOZ1^%AN54") G EXPRESS^%AN4
MOZ1 
 G:RESULT=0 ERRMOZ
 S OB=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue") G ERRMOZ
FMOZ D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$MOZART")
 D SET^%ANA(NORES,1,RE),SET^%ANA(NORES,2,OB)
 G DEPIL^%ANGEPIL
 
ERRMOZ D KILL^%ANA(RE),KILL^%ANA(OB)
 S RESULT=0
 G DEPIL^%ANGEPIL
 ;

