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

;%AN62^INT^1^59547,73866^0
AN62 ;
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
LIRE(PAR,SEP) 
 
 S %COMPIL=""
 D LEC
 I C=";" S NORES=0,@PAR=0 Q 1
 D EMPIL^%ANGEPIL("LIR0^%AN62") G EXPRESS^%AN4
LIR0 I RESULT=0 Q 0
 S @PAR=NORES
 D CAR
 I SEP="" Q 1
 
 I C=SEP Q 1
 I SEP=")" D M("Une """_SEP_""" etait attendue ...") Q 0
 D M("Un """_SEP_""" etait attendu ...")
 Q 0
 
COL(FONC,SEP) 
 
 S (COL,VERS)=0
 
 F I=1:1:$L($$^%QZCHW("$"_FONC)) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $"_FONC) Q 0
 
 I $$LIRE("COL",";")=0 Q 0
 
 I $$LIRE("VERS",SEP)=0 Q 0
 Q 1
 
 
RETOBJ 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S NUM=0
 I $$COL("RETIRER.OBJET",";")=0 G ERR
 
 I $$LIRE("NUM",")")=0 G ERR
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$RETIRER.OBJET")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,NUM)
 D LEC
 G DEPIL^%ANGEPIL
 
ERR F I=COL,VERS,NUM D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
AJOBJ 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS",@TEMPO@(4)="NUM",@TEMPO@(5)="OBJ",@TEMPO@(6)="VO",@TEMPO@(7)="X0",@TEMPO@(8)="Y0",@TEMPO@(9)="ANG",@TEMPO@(10)="ECH"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (NUM,OBJ,VO,X0,Y0,ANG,ECH)=0
 I $$COL("AJOUTER.OBJET",";")=0 G ERA
 
 I $$LIRE("NUM",";")=0 G ERA
 
 I $$LIRE("OBJ",";")=0 G ERA
 
 I $$LIRE("VO","")=0 G ERA
 
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendu") G ERA
 
 I C=")" G FAJ
 
 I $$LIRE("X0",";")=0 G ERA
 
 I $$LIRE("Y0",";")=0 G ERA
 
 I $$LIRE("ANG",";")=0 G ERA
 
 I $$LIRE("ECH",")")=0 G ERA
FAJ S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$AJOUTER.OBJET")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,NUM)
 D SET^%ANA(NORES,4,OBJ),SET^%ANA(NORES,5,VO),SET^%ANA(NORES,6,X0)
 D SET^%ANA(NORES,7,Y0),SET^%ANA(NORES,8,ANG),SET^%ANA(NORES,9,ECH)
 D LEC
 G DEPIL^%ANGEPIL
 
ERA F I=COL,VERS,NUM,OBJ,VO,X0,Y0,ANG,ECH D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
CNTCOL 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS",@TEMPO@(4)="X0",@TEMPO@(5)="Y0",@TEMPO@(6)="ANG",@TEMPO@(7)="ECH"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (X0,Y0,ANG,ECH)=0
 I $$COL("CONTEXTE.COLLECTION",";")=0 G ERC
 
 I $$LIRE("X0",";")=0 G ERC
 
 I $$LIRE("Y0",";")=0 G ERC
 
 I $$LIRE("ANG",";")=0 G ERC
 
 I $$LIRE("ECH",")")=0 G ERC
FCOL S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$CONTEXTE.COLLECTION")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,X0)
 D SET^%ANA(NORES,4,Y0),SET^%ANA(NORES,5,ANG),SET^%ANA(NORES,6,ECH)
 D LEC
 G DEPIL^%ANGEPIL
 
ERC F I=COL,VERS,X0,Y0,ANG,ECH D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
SUPCOL 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 I $$COL("SUPPRIMER.COLLECTION",")")=0 G ERS
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$SUPPRIMER.COLLECTION")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS)
 D LEC
 G DEPIL^%ANGEPIL
 
ERS F I=COL,VERS D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
POINT 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="COL",@TEMPO@(3)="VERS",@TEMPO@(4)="NPT",@TEMPO@(5)="X",@TEMPO@(6)="Y"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (NPT,X,Y)=0
 I $$COL("POINT.COLLECTION",";")=0 G ERP
 
 I $$LIRE("NPT",";")=0 G ERP
 
 I $$LIRE("X",";")=0 G ERP
 
 I $$LIRE("Y",")")=0 G ERP
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$POINT.COLLECTION")
 D SET^%ANA(NORES,1,COL),SET^%ANA(NORES,2,VERS),SET^%ANA(NORES,3,NPT)
 D SET^%ANA(NORES,4,X),SET^%ANA(NORES,5,Y)
 D LEC
 G DEPIL^%ANGEPIL
 
ERP F I=COL,VERS,NPT,X,Y D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL

