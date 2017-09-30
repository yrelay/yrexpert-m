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

;%AN28^INT^1^59547,73865^0
%AN28 ;
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
FEX 
 K @(TEMPO) S @TEMPO@(1)="AC",@TEMPO@(2)="I",@TEMPO@(3)="LPA",@TEMPO@(4)="NPA",@TEMPO@(5)="T",@TEMPO@(6)="NOMFEXT",@TEMPO@(7)="TYPPAR" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$FEXTER")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $FEXTER") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("FEX1^%AN28") G EXPRESS^%AN4
FEX1 G:RESULT=0 DEPIL^%ANGEPIL S AC=NORES
 S NOMFEXT=$$RED^%ANA(NORES,"TEXTE") I '($D(^TTLEXTER(NOMFEXT))) D M("$FEXTER inconnu") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0,TYPPAR=$P(^TTLEXTER(NOMFEXT),"|",3)
 D CAR G:C=")" FFEX
 I C'=";" D M("Un ; etait attendu entre deux parametres") G EFEX
BFEX D LEC,EMPIL^%ANGEPIL("BFEX1^%AN28") G:$P(TYPPAR,"/",NPA+1)="EXPR" EXPRESS^%AN4 G ATTRIBUT^%AN3
BFEX1 G:RESULT=0 EFEX
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR G:C=")" FFEX
 I C'=";" D M("Un ; etait attendu entre deux parametres") G EFEX
 G BFEX
FFEX D CAR I C'=")" D M("Une ) etait attendue a la fin de $FEXTER") G EFEX
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$FEXTER")
 D SET^%ANA(NORES,1,AC)
 F I=1:1:NPA D SET^%ANA(NORES,I+1,LPA(I))
 G DEPIL^%ANGEPIL
EFEX D KILL^%ANA(AC) F I=1:1:NPA D KILL^%ANA(LPA(I))
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
REA 
 K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$REAFFICHER"))+1 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$REAFFICHER")
 G DEPIL^%ANGEPIL
 
 
REQ 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="L" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$REQUETE")) D LEC
 D CAR
 I C'="(" D M("Une ( etait attendue apres $REQUETE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("REQ1^%AN28") G CHAINE^%AN1
REQ1 G:RESULT=0 DEPIL^%ANGEPIL S N=NORES
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G REQ10
 S APPD=APPD+1,APPD(APPD)="q."_$$RED^%ANA(NORES,"TEXTE")
REQ10 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom de la requete"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("REQ2^%AN28") G EXPRESS^%AN4
REQ2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S L=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $REQUETE") G EREQ
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$REQUETE")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,L)
 G DEPIL^%ANGEPIL
EREQ D KILL^%ANA(N),KILL^%ANA(L)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
IMPRIM 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="L",@TEMPO@(4)="T",@TEMPO@(5)="T2",@TEMPO@(6)="T1" D EMPV^%ANGEPIL(TEMPO)
 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$IMPRIMER.ETAT")) D LEC
 D CAR
 I C'="(" D M("Une ( etait attendue apres $IMPRIMER.ETAT") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("IMP1^%AN28") G EXPRESS^%AN4
IMP1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom de l'etat"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("IMP2^%AN28") G EXPRESS^%AN4
IMP2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S L=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres la liste") G ERIMP
 D LEC,EMPIL^%ANGEPIL("IMP3^%AN28") G CHAINE^%AN1
IMP3 G:RESULT=0 ERIMP
 S T=NORES
 S T2=$$RED^%ANA(T,"TEXTE") S:T2="e" T2="E" S:T2="t" T2="T"
 I ("ET"'[T2)!(T2="") D M("""E"" pour Etat ou ""T"" pour Tableau etaient attendus") G ERIMP2
 D CAR
 I C'=";" D M("Un ; etait attendu apres le type") G ERIMP
 D LEC,EMPIL^%ANGEPIL("IMP4^%AN28") G CHAINE^%AN1
IMP4 G:RESULT=0 ERIMP
 S T1=NORES
 S T2=$$RED^%ANA(T1,"TEXTE") S:T2="s" T2="S" S:T2="g" T2="G"
 I ("SG"'[T2)!(T2="") D M("""S"" pour Standard ou ""G"" pour Graphique etaient attendus") G ERIMP3
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $IMPRIMER.ETAT") G ERIMP3
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$IMPRIMER.ETAT")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,L),SET^%ANA(NORES,3,T),SET^%ANA(NORES,4,T1)
 G DEPIL^%ANGEPIL
 
ERIMP3 D KILL^%ANA(T1)
ERIMP2 D KILL^%ANA(T)
ERIMP D KILL^%ANA(N),KILL^%ANA(L)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
TRAITL 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="L" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TRAITERL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $TRAITERL") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRL1^%AN28") G EXPRESS^%AN4
TRL1 G:RESULT=0 DEPIL^%ANGEPIL S N=NORES
 I $$RED^%ANA(NORES,"TYPE")'="CHAINE" S APPEX=APPEX+1 G TRL10
 S APPD=APPD+1,APPD(APPD)="t."_$$RED^%ANA(NORES,"TEXTE")
TRL10 D CAR I C'=";" D M("Un ; etait attendu apres le nom du traitement"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRL2^%AN28") G EXPRESS^%AN4
TRL2 I RESULT=0 D KILL^%ANA(N) G DEPIL^%ANGEPIL
 S L=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $TRAITERL") G ERTRL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRAITERL")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,L)
 G DEPIL^%ANGEPIL
ERTRL D KILL^%ANA(N),KILL^%ANA(L)
 S RESULT=0 G DEPIL^%ANGEPIL

