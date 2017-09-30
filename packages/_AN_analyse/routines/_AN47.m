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

;%AN47^INT^1^59547,73865^0
AN47 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
SAISIE 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="A1",@TEMPO@(3)="T" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SAISIR"))+1 D LEC
 D CAR,EMPIL^%ANGEPIL("SAIS1^%AN47") G ATTRIBUT^%AN3
SAIS1 I RESULT=0 G DEPIL^%ANGEPIL
 S A1=$$NEW^%ANA D SET^%ANA(A1,1,NORES)
 D CAR
 I C'=";" D M("Un "";"" l'attribut representant la note de presentation "),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SAIS2^%AN47") G ATTRIBUT^%AN3
SAIS2 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 D SET^%ANA(A1,2,NORES)
 S I=3
 D CAR
 I (C'=")")&(C'=";") D M("Un "";"" ou une "")"" apres l'attribut representant la note d'aide"),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
BOUCL 
 D CAR
 I (C'=")")&(C'=";") D M("Un "";"" ou une "")"" apres une valeur legale"),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 I C=")" G FBOUCL
 D LEC,EMPIL^%ANGEPIL("BOUCL1^%AN47") G EXPLEGAL^%AN20
BOUCL1 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S T=$$RED^%ANA(NORES,"TEXTE")_$$RED^%ANA($$RED^%ANA(NORES,2),"TEXTE")_$S($$RED^%ANA(NORES,"TYPE")="COMPARATEUR.BINAIRE":"",1:","_$$RED^%ANA($$RED^%ANA(NORES,3),"TEXTE"))
 D SET^%ANA(A1,"EXPRESSION.LEGALE."_(I-2),T),SET^%ANA(A1,I,NORES)
 S I=I+1 G BOUCL
FBOUCL 
 S NORES=A1
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SAISIR"),LEC
 G DEPIL^%ANGEPIL
 
LSSNIV 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LIEN",@TEMPO@(3)="NIVEAU",@TEMPO@(4)="INDIV" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$LISTE.SOUS.NIVEAU"))+1 D LEC
 S INDIV=0
 D EMPIL^%ANGEPIL("LSNIV1^%AN47") G EXPRESS^%AN4
LSNIV1 I RESULT=0 G DEPIL^%ANGEPIL
 S LIEN=NORES
 D CAR
 I C'=";" S RESULT=0 D KILL^%ANA(LIEN),M("Un ; etait attendu apres le nom du lien ...") G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LSNIV2^%AN47") G EXPRESS^%AN4
LSNIV2 I RESULT=0 D KILL^%ANA(LIEN) G DEPIL^%ANGEPIL
 S NIVEAU=NORES
 D CAR
 G:C=")" LSNIVF
 I C'=";" S RESULT=0 D KILL^%ANA(LIEN),KILL^%ANA(NIVEAU),M("Un ; etait attendu apres le niveau ...") G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LSNIV3^%AN47") G ATTRIBUT^%AN3
LSNIV3 I RESULT=0 D KILL^%ANA(LIEN),KILL^%ANA(NIVEAU) G DEPIL^%ANGEPIL
 S INDIV=NORES
 D CAR
LSNIVF I C'=")" S RESULT=0 D KILL^%ANA(LIEN),KILL^%ANA(NIVEAU),KILL^%ANA(INDIV) S RESULT=0 D M("Une ) etait attendue ...") G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$LISTE.SOUS.NIVEAU")
 D SET^%ANA(NORES,1,LIEN),SET^%ANA(NORES,2,NIVEAU),SET^%ANA(NORES,3,INDIV)
 G DEPIL^%ANGEPIL
 
 
EVALUER 
 K @(TEMPO)
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1"
 D EMPV^%ANGEPIL(TEMPO)
 
 F I=1:1:$L($$^%QZCHW("$EVALUER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("EVALU0^%AN47") G EXPRESS^%AN4
EVALU0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S V1=$$NEW^%ANA D SET^%ANA(V1,1,NORES)
 D CAR
 
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom du noeud")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EVALU1^%AN47") G EXPRESS^%AN4
EVALU1 
 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,2,NORES)
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres le nom du repertoire focus")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EVALU2^%AN47") G EXPRESS^%AN4
EVALU2 
 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,3,NORES)
 D CAR
 
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de l'individu focus")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EVALU3^%AN47") G EXPRESS^%AN4
EVALU3 
 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,4,NORES)
 D CAR
 
 I C'=")" D M(""")"" "_$$^%QZCHW("manquant apres le nom de l'etude")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
STOTYP 
 S NORES=V1 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$EVALUER")
 
 D LEC
 G DEPIL^%ANGEPIL

