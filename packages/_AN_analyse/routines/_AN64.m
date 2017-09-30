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

;%AN64^INT^1^59547,73866^0
AN64 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
ELLI 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="SYN"
 S @TEMPO@(8)="P1",@TEMPO@(9)="P2",@TEMPO@(10)="P3",@TEMPO@(11)="P4",@TEMPO@(12)="P5",@TEMPO@(13)="P6",@TEMPO@(14)="P7",@TEMPO@(15)="EL",@TEMPO@(16)="TYPE",@TEMPO@(17)="COND",@TEMPO@(18)="P99",@TEMPO@(19)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:7 S @("P"_I)=0
 S EL=$$GETLBLAN^%VTLBLAN($P($P(CH,"$CREER.",2),"(",1)),P99=0
 I $$ELEM^%AN63(EL)=0 G EREA
 
 I $$COOR^%AN63(.P1,.P2,";")=0 G EREA
 I TYPE=2 G ELL2
 
 I $$COOR^%AN63(.P3,.P4,";")=0 G EREA
 
 I $$COOR^%AN63(.P5,.P6,"")=0 G EREA
 I C=")" G FINE
 D EMPIL^%ANGEPIL("FINE^%AN64")
 G COND^%AN65
ELL2 
 I $$LIRE^%AN62("P3",";")=0 G EREA
 
 I $$LIRE^%AN62("P4",";")=0 G EREA
 
 I $$LIRE^%AN62("P5","")=0 G EREA
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G EREA
 I C=")" G FINE
 
 I $$LIRE^%AN62("P6",";")=0 G EREA
 
 I $$LIRE^%AN62("P7","")=0 G EREA
 I C=")" G FINE
 D EMPIL^%ANGEPIL("FINE^%AN64")
 G COND^%AN65
FINE D RESU^%AN63(EL)
 F I=1:1:7 S J=I+6 D SET^%ANA(NORES,J,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
EREA F I=OBJ,VERS,NUM,EP,TR,SYN D KILL^%ANA(I)
 F I=1:1:7 D KILL^%ANA(@("P"_I))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
ARC 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="TR",@TEMPO@(7)="SYN"
 S @TEMPO@(8)="P1",@TEMPO@(9)="P2",@TEMPO@(10)="P3",@TEMPO@(11)="P4",@TEMPO@(12)="P5",@TEMPO@(13)="P6",@TEMPO@(14)="P7",@TEMPO@(15)="TYPE",@TEMPO@(16)="COND",@TEMPO@(17)="P99",@TEMPO@(18)="J",@TEMPO@(19)="VERIF"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:7 S @("P"_I)=0
 S P99=0
 I $$ELEM^%AN63("ARC")=0 G EREA
 
 I $$COOR^%AN63(.P1,.P2,";")=0 G EREA
 I TYPE=2 G ARC2
 
 I $$COOR^%AN63(.P3,.P4,";")=0 G EREA
 
 I $$COOR^%AN63(.P5,.P6,"")=0 G EREA
 I C=")" G FINA
 D EMPIL^%ANGEPIL("FINA^%AN64")
 G COND^%AN65
ARC2 
 I $$LIRE^%AN62("P3",";")=0 G EREA
 
 I $$LIRE^%AN62("P4",";")=0 G EREA
 
 I $$LIRE^%AN62("P5","")=0 G EREA
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G EREA
 I C=")" G FINA
 
 I $$LIRE^%AN62("P6",";")=0 G EREA
 I P6'=0 S VERIF=$$RED^%ANA(P6,"TEXTE") I $E(VERIF)'="P" D M("Une reference a un point P<n> etait attendue") G EREA
 
 I $$LIRE^%AN62("P7","")=0 G EREA
 I P7'=0 S VERIF=$$RED^%ANA(P7,"TEXTE") I $E(VERIF)'="P" D M("Une reference a un point P<n> etait attendue") G EREA
 I C=")" G FINA
 D EMPIL^%ANGEPIL("FINA^%AN64")
 G COND^%AN65
FINA G:RESULT=0 EREA
 D RESU^%AN63("ARC")
 F I=1:1:7 S J=I+6 D SET^%ANA(NORES,J,@("P"_I))
 D SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
 
TEXTE 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="POL",@TEMPO@(6)="TEX",@TEMPO@(7)="ABS",@TEMPO@(8)="ORD",@TEMPO@(9)="ANG",@TEMPO@(10)="COND",@TEMPO@(9)="P99",@TEMPO@(9)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 S (POL,TEX,ANG,ABS,ORD,P99)=0
 I $$ELEM^%AN63("TEXTE")=0 G ERT
 
 I $$LIRE^%AN62("POL",";")=0 G ERT
 
 I $$COOR^%AN63(.ABS,.ORD,";")=0 G ERT
 
 I $$LIRE^%AN62("TEX","")=0 G ERT
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERT
 
 I C=")" G FINT
 I $$LIRE^%AN62("ANG","")=0 G ERT
 I C=")" G FINT
 D EMPIL^%ANGEPIL("FINT^%AN64")
 G COND^%AN65
FINT G:RESULT=0 ERT
 D RESU^%AN63("TEXTE")
 D SET^%ANA(NORES,4,POL),SET^%ANA(NORES,5,ABS),SET^%ANA(NORES,6,ORD)
 D SET^%ANA(NORES,7,TEX),SET^%ANA(NORES,8,ANG),SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
ERT F I=OBJ,VERS,NUM,POL,ABS,ORD,TEX,ANG D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
POINT 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="EP",@TEMPO@(6)="VIS",@TEMPO@(7)="NOM",@TEMPO@(8)="ABS",@TEMPO@(9)="ORD",@TEMPO@(10)="COND",@TEMPO@(11)="P99",@TEMPO@(12)="J"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette fonction...") S RESULT=0 G DEPIL^%ANGEPIL
 S (EP,VIS,NOM,ABS,ORD,P99)=0
 I $$ELEM^%AN63("POINT")=0 G ERP
 
 I $$LIRE^%AN62("NOM",";")=0 G ERP
 
 I $$LIRE^%AN62("EP",";")=0 G ERP
 
 I $$LIRE^%AN62("VIS",";")=0 G ERP
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERP
 D LEC
 I C'="(" D M("Une ""("" etait attendue") G ERP
 
 I $$LIRE^%AN62("ABS",";")=0 G ERP
 
 I $$LIRE^%AN62("ORD",")")=0 G ERP
 D LEC
 I C=")" G FINP
POIN2 D EMPIL^%ANGEPIL("FINP^%AN64")
 G COND^%AN65
FINP D RESU^%AN63("POINT")
 D SET^%ANA(NORES,4,NOM),SET^%ANA(NORES,5,EP),SET^%ANA(NORES,6,VIS)
 D SET^%ANA(NORES,7,ABS),SET^%ANA(NORES,8,ORD),SET^%ANA(NORES,"CONDITION",P99)
 D LEC
 G DEPIL^%ANGEPIL
 
ERP F I=OBJ,VERS,NUM,NOM,EP,VIS,ABS,ORD D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL

