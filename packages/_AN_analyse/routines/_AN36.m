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

;%AN36^INT^1^59547,73865^0
AN36 ;
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
CREER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM",@TEMPO@(3)="REPER",@TEMPO@(4)="VART",@TEMPO@(5)="OORD" D EMPV^%ANGEPIL(TEMPO)
 S (NOM,OORD,REPER,VART)=0
 F I=1:1:$L($$^%QZCHW("$CREER.INDIVIDU")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $CREER.INDIVIDU") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("CREER1^%AN36") G VARTEMP^%AN66
CREER1 G:RESULT=0 ERRCREER
 D CAR
 I C'=";" D M("Un ; etait attendu apres la variable temporaire") G ERRCREER
 S VART=NORES
 D LEC,EMPIL^%ANGEPIL("CREER2^%AN36") G EXPRESS^%AN4
CREER2 G:RESULT=0 ERRCREER
 D CAR
 I C'=";" D M("Un ; etait attendu apres le repertoire") G ERRCREER
 S REPER=NORES
 D LEC,EMPIL^%ANGEPIL("CREER3^%AN36") G EXPRESS^%AN4
CREER3 G:RESULT=0 ERRCREER
 S NOM=NORES
 D CAR G:C=")" FINCR
 I C'=";" D M("Une ) ou un ; etait attendu apres le nom de l'individu") G ERRCREER
 D LEC,EMPIL^%ANGEPIL("CREER4^%AN36") G EXPRESS^%AN4
CREER4 G:RESULT=0 ERRCREER
 S OORD=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue apres le no d'ordre  de l'individu") G ERRCREER
FINCR D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CREER.INDIVIDU")
 D SET^%ANA(NORES,1,VART),SET^%ANA(NORES,2,REPER),SET^%ANA(NORES,3,NOM),SET^%ANA(NORES,4,OORD)
 G DEPIL^%ANGEPIL
ERRCREER S RESULT=0 D KILL^%ANA(NOM),KILL^%ANA(VART),KILL^%ANA(REPER),KILL^%ANA(OORD)
 G DEPIL^%ANGEPIL
 
LIER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM1",@TEMPO@(3)="REP1",@TEMPO@(4)="NOM2",@TEMPO@(5)="REP2" D EMPV^%ANGEPIL(TEMPO)
 S (REP1,NOM1,REP2,NOM2)=0
 F I=1:1:$L($$^%QZCHW("$LIER.INDIVIDU")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $LIER.INDIVIDU") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("LIER1^%AN36") G EXPRESS^%AN4
LIER1 G:RESULT=0 ERRLIER
 S REP1=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres le 1er argument") G ERRLIER
 D LEC,EMPIL^%ANGEPIL("LIER2^%AN36") G EXPRESS^%AN4
LIER2 G:RESULT=0 ERRLIER
 S NOM1=NORES D CAR
 G:C=")" LIER5
 I C'=";" D M("Un ; etait attendu apres le 2nd argument") G ERRLIER
 D LEC,EMPIL^%ANGEPIL("LIER3^%AN36") G EXPRESS^%AN4
LIER3 G:RESULT=0 ERRLIER
 S REP2=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom du lien") G ERRLIER
 D LEC,EMPIL^%ANGEPIL("LIER4^%AN36") G EXPRESS^%AN4
LIER4 G:RESULT=0 ERRLIER
 S NOM2=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue apres l'individu") G ERRLIER
LIER5 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$LIER.INDIVIDU")
 I REP2=0 D SET^%ANA(NORES,1,0),SET^%ANA(NORES,2,0),SET^%ANA(NORES,3,REP1),SET^%ANA(NORES,4,NOM1) G DEPIL^%ANGEPIL
 D SET^%ANA(NORES,1,REP1),SET^%ANA(NORES,2,NOM1),SET^%ANA(NORES,3,REP2),SET^%ANA(NORES,4,NOM2)
 G DEPIL^%ANGEPIL
ERRLIER S RESULT=0 D KILL^%ANA(NOM1),KILL^%ANA(REP1),KILL^%ANA(NOM2),KILL^%ANA(REP2)
 G DEPIL^%ANGEPIL
 
DELIER 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NOM1",@TEMPO@(3)="REP1",@TEMPO@(4)="NOM2",@TEMPO@(5)="REP2",@TEMPO@(6)="LIEN" D EMPV^%ANGEPIL(TEMPO)
 S (NOM1,NOM2,LIEN)=0,NB=1
 F I=1:1:$L($$^%QZCHW("$DELIER.INDIVIDU")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $DELIER.INDIVIDU") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 I $L($E(CH,P,999999),";")'>2 G DELIER11
 D EMPIL^%ANGEPIL("DELIER1^%AN36") G VARTEMP^%AN3
DELIER1 G:RESULT=0 ERRDELIER
 D CAR
 S NOM1=NORES
 I C'=";" D M("Un ; etait attendu apres la variable temporaire") G ERRDELIER
 D LEC
DELIER11 D EMPIL^%ANGEPIL("DELIER2^%AN36") G EXPRESS^%AN4
DELIER2 G:RESULT=0 ERRDELIER
 S LIEN=NORES D CAR
 I C'=";" D M("Un ; etait attendu") G ERRDELIER
 D LEC
 D EMPIL^%ANGEPIL("DELIER3^%AN36") G VARTEMP^%AN3
DELIER3 G:RESULT=0 ERRDELIER
 S NOM2=NORES D CAR
 I C'=")" D M("Une ) etait attendue ") G ERRDELIER
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$DELIER.INDIVIDU")
 D SET^%ANA(NORES,1,NOM1),SET^%ANA(NORES,2,LIEN),SET^%ANA(NORES,3,NOM2)
 G DEPIL^%ANGEPIL
ERRDELIER S RESULT=0 D KILL^%ANA(NOM1),KILL^%ANA(NOM2),KILL^%ANA(LIEN)
 G DEPIL^%ANGEPIL
 ;

