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

;%AN30^INT^1^59547,73865^0
%AN30 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
REQ 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="NOEUDRES" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$REQUETE")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $REQUETE") S RESULT=0 G DEPIL^%ANGEPIL
 S NOEUDRES=$$NEW^%ANA,NPA=0
 D LEC,EMPIL^%ANGEPIL("REQ1^%AN30") G EXPRESS^%AN4
REQ1 G:RESULT=0 DEPIL^%ANGEPIL
 S NPA=NPA+1 D SET^%ANA(NOEUDRES,NPA,NORES)
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G REQSUI
 S APPD=APPD+1,APPD(APPD)="q."_$$RED^%ANA(NORES,"TEXTE")
REQSUI D CAR I C'=";" D M("Un ; etait attendu apres le nom de la requete") G EREQ
 D LEC,EMPIL^%ANGEPIL("REQ2^%AN30") G EXPRESS^%AN4
REQ2 I RESULT=0 G EREQ
 S NPA=NPA+1 D SET^%ANA(NOEUDRES,NPA,NORES)
 D CAR G:C=")" FREQ
 I C'=";" D M("Un ; etait attendu apres le nom de la liste") G EREQ
BREQ D LEC,EMPIL^%ANGEPIL("BREQ1^%AN30") G EXPRESS^%AN4
BREQ1 G:RESULT=0 EREQ
 S NPA=NPA+1 D SET^%ANA(NOEUDRES,NPA,NORES)
 D CAR G:C=")" FREQ
 I C'=";" D M("Un ; etait attendu entre deux parametres") G EREQ
 G BREQ
FREQ I C'=")" D M("Une ) etait attendue a la fin de $REQUETE") G EREQ
 D LEC
 S NORES=NOEUDRES
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$REQUETE")
 G DEPIL^%ANGEPIL
EREQ F I=1:1:NPA D KILL^%ANA($$RED^%ANA(NOEUDRES,I))
 D KILL^%ANA(NOEUDRES)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
INTER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LPA",@TEMPO@(3)="NPA" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$INTERSECTION")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $INTERSECTION") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0
INT D LEC,EMPIL^%ANGEPIL("INT1^%AN30") G EXPRESS^%AN4
INT1 G:RESULT=0 ERINT
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C=")" G FINT
 I C'=";" D M("Un ; etait attendu entre deux listes") G ERINT
 G INT
FINT I C'=")" D M("Une ) etait attendue a la fin de $INTERSECTION") G ERINT
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$INTERSECTION")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
ERINT S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
UNION 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LPA",@TEMPO@(3)="NPA" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$UNION")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $UNION") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0
UNI D LEC,EMPIL^%ANGEPIL("UNI1^%AN30") G EXPRESS^%AN4
UNI1 G:RESULT=0 ERUNI
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C=")" G FUNI
 I C'=";" D M("Un ; etait attendu entre deux listes") G ERUNI
 G UNI
FUNI I C'=")" D M("Une ) etait attendue a la fin de $UNION") G ERUNI
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$UNION")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
ERUNI S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
COMPL 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="L1",@TEMPO@(3)="L2" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$COMPLEMENT")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $COMPLEMENT") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COMP1^%AN30") G EXPRESS^%AN4
COMP1 G:RESULT=0 DEPIL^%ANGEPIL S L1=NORES
 D CAR I C=")" S L2=$$NEW^%ANA D SET^%ANA(L2,"TYPE","NIMP"),SET^%ANA(L2,"TEXTE","") G LFIC
 I C'=";" D M("Un ; etait attendu entre les deux listes"),KILL^%ANA(L1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COMP2^%AN30") G EXPRESS^%AN4
COMP2 I RESULT=0 D KILL^%ANA(L1) G DEPIL^%ANGEPIL
 S L2=NORES
LFIC D CAR I C'=")" D M("Une ) etait attendue a la fin de $COMPLEMENT"),KILL^%ANA(L1),KILL^%ANA(L2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$COMPLEMENT")
 D SET^%ANA(NORES,1,L1),SET^%ANA(NORES,2,L2)
 G DEPIL^%ANGEPIL

