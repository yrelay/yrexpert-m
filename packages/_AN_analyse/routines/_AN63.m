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

;%AN63^INT^1^59547,73866^0
%AN63 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
 
 
 
ELEM(FONC) 
 
 S (OBJ,VERS,NUM)=0
 I (FONC'="POINT")&(FONC'="TEXTE") S (EP,TR)=0 I (FONC'="RACCORDEMENT")&(FONC'="FLECHE") S SYN=0
 
 F I=1:1:$L($$^%QZCHW("$CREER."_FONC)) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $CREER."_FONC) Q 0
 
 I $$LIRE^%AN62("OBJ",";")=0 Q 0
 
 I $$LIRE^%AN62("VERS",";")=0 Q 0
 
 I $$LIRE^%AN62("NUM",";")=0 Q 0
 I (FONC="POINT")!(FONC="TEXTE") Q 1
 
 I $$LIRE^%AN62("EP",";")=0 Q 0
 
 I $$LIRE^%AN62("TR",";")=0 Q 0
 I (FONC="RACCORDEMENT")!(FONC="FLECHE") Q 1
 S %COMPIL=""
 
 D LEC,EMPIL^%ANGEPIL("SYN^%AN63")
 G ENTIER^%AN1
SYN I RESULT=0 Q 0
 I (%COMPIL'=1)&(%COMPIL'=2) D M("le type de syntaxe doit etre egal a 1 ou 2") Q 0
 S SYN=NORES,TYPE=%COMPIL
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") Q 0
 Q 1
 
RESU(FONC) 
 
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION")
 D SET^%ANA(NORES,"TEXTE","$CREER."_FONC)
 D SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,NUM)
 I (FONC="POINT")!(FONC="TEXTE") Q
 D SET^%ANA(NORES,4,EP),SET^%ANA(NORES,5,TR)
 I (FONC'="RACCORDEMENT")&(FONC'="FLECHE") D SET^%ANA(NORES,6,SYN)
 Q
 
COOR(ABS,ORD,SEP) 
 D LEC
 G:C="(" COXY
 
 D EMPIL^%ANGEPIL("REFP^%AN63") G EXPRESS^%AN4
REFP I RESULT=0 Q 0
 S ABS=NORES
 G SEP
COXY 
 I $$LIRE^%AN62("ABS",";")=0 Q 0
 I $$LIRE^%AN62("ORD",")")=0 Q 0
 D LEC
SEP 
 D CAR
 Q:SEP="" 1
 I C'=SEP D M("Un """_SEP_""" etait attendu ...") Q 0
 Q 1
 
 
DROITE 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="SYN"
 S @TEMPO@(8)="P1",@TEMPO@(9)="P2",@TEMPO@(10)="P3",@TEMPO@(11)="P4",@TEMPO@(12)="P5",@TEMPO@(13)="TYPE",@TEMPO@(14)="COND",@TEMPO@(15)="SSCH",@TEMPO@(16)="P99"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:5 S @("P"_I)=0
 S SYN=0,P99=0
 I $$ELEM("DROITE")=0 G ERD
 
 I $$COOR(.P1,.P2,";")=0 G ERD
 I TYPE=2 G DR2
 
 I $$COOR(.P3,.P4,"")=0 G ERD
 I C=")" G FIND
 D EMPIL^%ANGEPIL("FIND^%AN63")
 G COND^%AN65
DR2 
 I $$LIRE^%AN62("P3",";")=0 G ERD
 
 I $$LIRE^%AN62("P4","")=0 G ERD
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERD
 I C=")" G FIND
 
 I $$LIRE^%AN62("P5","")=0 G ERD
 I C=")" G FIND
 D EMPIL^%ANGEPIL("FIND^%AN63")
 G COND^%AN65
FIND G:RESULT=0 ERD
 D RESU("DROITE")
 F I=1:1:5 S J=I+6 D SET^%ANA(NORES,J,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
ERD F I=OBJ,VERS,NUM,EP,TR,SYN D KILL^%ANA(I)
 F I=1:1:5 D KILL^%ANA(@("P"_I))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
CERCLE 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="SYN"
 S @TEMPO@(8)="P1",@TEMPO@(9)="P2",@TEMPO@(10)="P3",@TEMPO@(11)="P4",@TEMPO@(12)="TYPE",@TEMPO@(13)="COND",@TEMPO@(14)="P99",@TEMPO@(15)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:4 S @("P"_I)=0
 S P99=0
 I $$ELEM("CERCLE")=0 G ERC
 
 I $$COOR(.P1,.P2,";")=0 G ERC
 I TYPE=2 G CER2
 
 I $$COOR(.P3,.P4,"")=0 G ERC
 I C=")" G FINC
 D EMPIL^%ANGEPIL("FINC^%AN63")
 G COND^%AN65
CER2 
 I $$LIRE^%AN62("P3","")=0 G ERC
 I C=")" G FINC
 D EMPIL^%ANGEPIL("FINC^%AN63")
 G COND^%AN65
FINC G:RESULT=0 ERC
 D RESU("CERCLE")
 F I=1:1:4 S J=I+6 D SET^%ANA(NORES,J,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
ERC F I=OBJ,VERS,NUM,EP,TR,SYN D KILL^%ANA(I)
 F I=1:1:4 D KILL^%ANA(@("P"_I))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
RETELE 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (OBJ,VERS,NUM)=0
 
 F I=1:1:$L($$^%QZCHW("$SUPPRIMER.ELEMENT")) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $SUPPRIMER.ELEMENT") G ERS
 
 I $$LIRE^%AN62("OBJ",";")=0 G ERS
 
 I $$LIRE^%AN62("VERS",";")=0 G ERS
 
 I $$LIRE^%AN62("NUM",")")=0 G ERS
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$SUPPRIMER.ELEMENT")
 D SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,NUM)
 D LEC
 G DEPIL^%ANGEPIL
 
ERS F I=OBJ,VERS,NUM D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL

