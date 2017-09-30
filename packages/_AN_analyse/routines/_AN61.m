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

;%AN61^INT^1^59547,73866^0
AN61 ;
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
PASSI 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="TYPPAS",@TEMPO@(3)="NOMPAS",@TEMPO@(4)="SOURCE"
 D EMPV^%ANGEPIL(TEMPO)
 S (TYPPAS,NOMPAS,SOURCE)=0
 
 F I=1:1:$L($$^%QZCHW("$PASSERELLE.ENTREE")) D LEC
 D CAR
 I C'="(" D M("Une ( etait attendue apres $PASSERELLE.ENTREE") G ERR
 
 D LEC,EMPIL^%ANGEPIL("PASS0^%AN61") G EXPRESS^%AN4
PASS0 I RESULT=0 G DEPIL^%ANGEPIL
 S TYPPAS=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("PASS1^%AN61") G EXPRESS^%AN4
PASS1 I RESULT=0 G ERR
 S NOMPAS=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("PASS2^%AN61") G EXPRESS^%AN4
PASS2 I RESULT=0 G ERR
 S SOURCE=NORES
 D CAR
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERR
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION")
 D SET^%ANA(NORES,"TEXTE","$PASSERELLE.ENTREE")
 D SET^%ANA(NORES,1,TYPPAS),SET^%ANA(NORES,2,NOMPAS)
 D SET^%ANA(NORES,3,SOURCE)
 D LEC
 G DEPIL^%ANGEPIL
 
ERR F I=TYPPAS,NOMPAS,SOURCE D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
PASSO 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="TYPPAS",@TEMPO@(3)="NOMPAS",@TEMPO@(4)="LISTE",@TEMPO@(5)="FICHIER"
 D EMPV^%ANGEPIL(TEMPO)
 S (TYPPAS,NOMPAS,SOURCE,LISTE,FICHIER)=0
 
 F I=1:1:$L($$^%QZCHW("$PASSERELLE.SORTIE")) D LEC
 D CAR
 I C'="(" D M("Une ( etait attendue apres $PASSERELLE.SORTIE") G ERRO
 
 D LEC,EMPIL^%ANGEPIL("PASO0^%AN61") G EXPRESS^%AN4
PASO0 I RESULT=0 G DEPIL^%ANGEPIL
 S TYPPAS=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu ...") G ERRO
 
 D LEC,EMPIL^%ANGEPIL("PASO1^%AN61") G EXPRESS^%AN4
PASO1 I RESULT=0 G ERRO
 S NOMPAS=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRO
 
 D LEC,EMPIL^%ANGEPIL("PASO2^%AN61") G EXPRESS^%AN4
PASO2 I RESULT=0 G ERRO
 S LISTE=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRO
 
 D LEC,EMPIL^%ANGEPIL("PASO3^%AN61") G EXPRESS^%AN4
PASO3 I RESULT=0 G ERRO
 S FICHIER=NORES
 D CAR
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERRO
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION")
 D SET^%ANA(NORES,"TEXTE","$PASSERELLE.SORTIE")
 D SET^%ANA(NORES,1,TYPPAS),SET^%ANA(NORES,2,NOMPAS)
 D SET^%ANA(NORES,3,LISTE),SET^%ANA(NORES,4,FICHIER)
 D LEC
 G DEPIL^%ANGEPIL
 
ERRO F I=TYPPAS,NOMPAS,LISTE,FICHIER D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
SUPOBJ 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (OBJ,VERS)=0
 F I=1:1:$L($$^%QZCHW("$SUPPRIMER.OBJET")) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $SUPPRIMER.OBJET") G ERS
 
 I $$LIRE^%AN62("OBJ",";")=0 G ERS
 
 I $$LIRE^%AN62("VERS",")")=0 G ERS
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$SUPPRIMER.OBJET")
 D SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,VERS)
 D LEC
 G DEPIL^%ANGEPIL
 
ERS F I=OBJ,VERS D KILL^%ANA(I)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
CNTOBJ 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="OBJ",@TEMPO@(3)="VERS",@TEMPO@(4)="X0",@TEMPO@(5)="Y0"
 D EMPV^%ANGEPIL(TEMPO)
 I '($$OKR^%INCOIN("SD")) D M("Vous n'avez pas acces a cette action...") S RESULT=0 G DEPIL^%ANGEPIL
 S (OBJ,VERS,X0,Y0)=0
 F I=1:1:$L($$^%QZCHW("$CONTEXTE.OBJET")) D LEC
 D CAR
 I C'="(" D M("Une ""("" etait attendue apres $CONTEXTE.OBJET") G ERC
 
 I $$LIRE^%AN62("OBJ",";")=0 G ERC
 
 I $$LIRE^%AN62("VERS",";")=0 G ERC
 
 I $$LIRE^%AN62("X0",";")=0 G ERC
 
 I $$LIRE^%AN62("Y0",")")=0 G ERC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION")
 D SET^%ANA(NORES,"TEXTE","$CONTEXTE.OBJET")
 D SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,VERS)
 D SET^%ANA(NORES,3,X0),SET^%ANA(NORES,4,Y0)
 D LEC
 G DEPIL^%ANGEPIL
 
ERC F I=OBJ,VERS,X0,Y0 D KILL^%ANA(I)
 S RESULT=0 G DEPIL^%ANGEPIL

