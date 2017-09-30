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

;%AN39^INT^1^59547,73865^0
AN39 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
DELIER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM1",@TEMPO@(3)="REP1",@TEMPO@(4)="NOM2",@TEMPO@(5)="REP2" D EMPV^%ANGEPIL(TEMPO)
 S (NOM1,NOM2)=0
 F I=1:1:$L($$^%QZCHW("$DELIER.INDIVIDU")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $DELIER.INDIVIDU") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DELIER1^%AN39") G VARTEMP^%AN3
DELIER1 G:RESULT=0 ERRDELIER
 D CAR
 I C=")" S NOM1=0,NOM2=NORES G DELIER3
 S NOM1=NORES
 I C'=";" D M("Un ; etait attendu apres la variable temporaire") G ERRDELIER
 D LEC,EMPIL^%ANGEPIL("DELIER2^%AN39") G VARTEMP^%AN3
DELIER2 G:RESULT=0 ERRDELIER
 S NOM2=NORES D CAR
DELIER3 I C'=")" D M("Une ) etait attendue ") G ERRDELIER
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$DELIER.INDIVIDU")
 D SET^%ANA(NORES,1,NOM1),SET^%ANA(NORES,2,NOM2)
 G DEPIL^%ANGEPIL
ERRDELIER S RESULT=0 D KILL^%ANA(NOM1),KILL^%ANA(NOM2)
 G DEPIL^%ANGEPIL
 
 
PART 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LIST",@TEMPO@(3)="AREC",@TEMPO@(4)="ATT",@TEMPO@(5)="NATT" D EMPV^%ANGEPIL(TEMPO)
 S (AREC,ATT,LIST)=0
 F I=1:1:$L($$^%QZCHW("$PARTITIONNER")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $PARTITIONNER") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("PART1^%AN39") G ATTRIBUT^%AN3
PART1 G:RESULT=0 ERPART
 S AREC=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres l'attribut resultat") G ERPART
 D LEC,EMPIL^%ANGEPIL("PART2^%AN39") G EXPRESS^%AN4
PART2 G:RESULT=0 ERPART
 S ATT=NORES
 S NATT=$$RED^%ANA($$RED^%ANA(ATT,1),"TEXTE")
 I $E(NATT,1)="%" D M("Le nom de l'attribut de partitionnement ne doit pas commencer par %") G ERPART
 D CAR I C=")" S LIST=0 G FPART
 I C'=";" D M("Un ; etait attendu apres le nom de l'attribut de partitionnement") G ERPART
 D LEC,EMPIL^%ANGEPIL("PART3^%AN39") G EXPRESS^%AN4
PART3 G:RESULT=0 ERPART
 S LIST=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $PARTITIONNER") G ERPART
FPART D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PARTITIONNER")
 D SET^%ANA(NORES,1,AREC),SET^%ANA(NORES,2,ATT),SET^%ANA(NORES,3,LIST)
 G DEPIL^%ANGEPIL
ERPART S RESULT=0 D KILL^%ANA(AREC),KILL^%ANA(ATT),KILL^%ANA(LIST)
 G DEPIL^%ANGEPIL
 
 
LIND 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LIST",@TEMPO@(3)="AREC",@TEMPO@(4)="ATT",@TEMPO@(5)="NATT" D EMPV^%ANGEPIL(TEMPO)
 S (AREC,ATT,LIST)=0
 F I=1:1:$L($$^%QZCHW("$LISTE.INDICE")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $LISTE.INDICE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LIND1^%AN39") G ATTRIBUT^%AN3
LIND1 G:RESULT=0 ERLIND
 S AREC=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres l'attribut resultat") G ERLIND
 D LEC,EMPIL^%ANGEPIL("LIND2^%AN39") G ATTRIBUT^%AN3
LIND2 G:RESULT=0 ERLIND
 S ATT=NORES
 S NATT=$$RED^%ANA($$RED^%ANA(ATT,1),"TEXTE")
 I $E(NATT,1)="%" D M("Le nom de l'attribut ne doit pas commencer par %") G ERLIND
 D CAR I C=")" S LIST=0 G FLIND
 I C'=";" D M("Un ; etait attendu apres le nom de l'attribut") G ERLIND
 D LEC,EMPIL^%ANGEPIL("LIND3^%AN39") G EXPRESS^%AN4
LIND3 G:RESULT=0 ERLIND
 S LIST=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $LISTE.INDICE") G ERLIND
FLIND D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$LISTE.INDICE")
 D SET^%ANA(NORES,1,AREC),SET^%ANA(NORES,2,ATT),SET^%ANA(NORES,3,LIST)
 G DEPIL^%ANGEPIL
ERLIND S RESULT=0 D KILL^%ANA(AREC),KILL^%ANA(ATT),KILL^%ANA(LIST)
 G DEPIL^%ANGEPIL
 
LATTR 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NATT",@TEMPO@(3)="AREC",@TEMPO@(4)="ATT" D EMPV^%ANGEPIL(TEMPO)
 S (AREC,ATT)=0
 F I=1:1:$L($$^%QZCHW("$LISTE.ATTRIBUT")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $LISTE.ATTRIBUT") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LATT1^%AN39") G ATTRIBUT^%AN3
LATT1 G:RESULT=0 ERLATTR
 S AREC=NORES
 D CAR
 G:C=")" FINLAT
 I C'=";" D M("Un ; etait attendu apres l'attribut resultat") G ERLATTR
 D LEC,EMPIL^%ANGEPIL("LATT2^%AN39") G IDF2^%AN3
LATT2 G:RESULT=0 ERLIND
 S ATT=NORES
 D CAR
FINLAT I C'=")" D M("Une "")"" etait attendue") G ERLATTR
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$LISTE.ATTRIBUT")
 D SET^%ANA(NORES,1,AREC),SET^%ANA(NORES,2,ATT)
 G DEPIL^%ANGEPIL
ERLATTR D KILL^%ANA(ATT),KILL^%ANA(AREC) S RESULT=0
 G DEPIL^%ANGEPIL

