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

;%AN31^INT^1^59547,73865^0
AN31 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
COP 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="N" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$COPIERL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $COPIERL") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COP1^%AN31") G EXPRESS^%AN4
COP1 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $COPIERL"),KILL^%ANA(N) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$COPIERL")
 D SET^%ANA(NORES,1,N)
 G DEPIL^%ANGEPIL
 
VALR 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="L",@TEMPO@(3)="A" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$VALEURL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $VALEURL") S RESULT=0 G DEPIL^%ANGEPIL
VAL D LEC,EMPIL^%ANGEPIL("VAL1^%AN31") G EXPRESS^%AN4
VAL1 G:RESULT=0 DEPIL^%ANGEPIL
 S L=NORES
 D CAR I C'=";" D M("Un ; etait attendu apres la liste"),KILL^%ANA(L) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("VAL2^%AN31") G EXPRESS^%AN4
VAL2 I RESULT=0 D KILL^%ANA(L) G DEPIL^%ANGEPIL
 S A=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin de $VALEURL"),KILL^%ANA(L),KILL^%ANA(A) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$VALEURL")
 D SET^%ANA(NORES,1,L),SET^%ANA(NORES,2,A)
 G DEPIL^%ANGEPIL
 
TRIER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="L",@TEMPO@(3)="LPA",@TEMPO@(4)="NPA",@TEMPO@(5)="ORD" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TRIERL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $TRIERL") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRI1^%AN31") G EXPRESS^%AN4
TRI1 G:RESULT=0 DEPIL^%ANGEPIL S L=NORES
 D CAR I C'=";" D M("Un ; etait attendu apres la liste"),KILL^%ANA(L) S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0
BTRI D LEC I (C'="<")&(C'=">") G ETRI
 S:C=">" ORD="<" S:C="<" ORD=">"
 D LEC,EMPIL^%ANGEPIL("TRI2^%AN31") G ATTRIBUT^%AN3
TRI2 G:RESULT=0 ETRI
 S NPA=NPA+1,LPA(NPA,1)=ORD,LPA(NPA,2)=NORES
 D CAR I C=")" G FTRI
 I C'=";" D M("Un ; etait attendu entre deux attributs de tri") G ETRI
 G BTRI
FTRI I C'=")" D M("Une ) etait attendue a la fin de $TRIERL") G ETRI
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRIERL")
 D SET^%ANA(NORES,1,L)
 F I=1:1:NPA S NORES2=$$NEW^%ANA D SET^%ANA(NORES2,"TYPE","NIMP"),SET^%ANA(NORES2,"TEXTE",LPA(I,1)),SET^%ANA(NORES,2*I,NORES2),SET^%ANA(NORES,(2*I)+1,LPA(I,2))
 G DEPIL^%ANGEPIL
ETRI S RESULT=0
 D KILL^%ANA(L)
 F I=1:1:NPA D KILL^%ANA(LPA(I,2))
 G DEPIL^%ANGEPIL
 
HISTO 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM",@TEMPO@(3)="LATTL",@TEMPO@(4)="%I",@TEMPO@(5)="TEX" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$HISTORIQUE")) D LEC
 S NOM=0
 D CAR I C'="(" D M("Une ( etait attendue apres $HISTORIQUE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("HISTO1^%AN31") G ATTRIBUT^%AN3
HISTO1 G:RESULT=0 DEPIL^%ANGEPIL S NOM=NORES
 D CAR S I=1
HISTO2 G:C=")" HISTO4
 S I=I+1
 I C'=";" D M("Un ; etait attendu apres le nom de l'attribut") G ERRHISTO
 D LEC,EMPIL^%ANGEPIL("HISTO3^%AN31") G ATTRIBUT^%AN3
HISTO3 G:RESULT=0 ERRHISTO
 I $E($$RED^%ANA($$RED^%ANA(NORES,1),"TEXTE"))="%" D M("Un attribut etait attendu") G ERRHISTO
 S LATTL(I)=NORES
 D CAR G HISTO2
HISTO4 D CAR I C'=")" D M("Une ) etait attendue a la fin") G ERRHISTO
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$HISTORIQUE")
 D SET^%ANA(NORES,1,NOM)
 F %I=2:1:I D SET^%ANA(NORES,%I,LATTL(%I))
 K LAT
 G DEPIL^%ANGEPIL
ERRHISTO S RESULT=0
 D KILL^%ANA(NOM)
 S I=-1 F %I=1:1 S I=$N(LATTL(I)) Q:I=-1  D KILL^%ANA(I)
 G DEPIL^%ANGEPIL

