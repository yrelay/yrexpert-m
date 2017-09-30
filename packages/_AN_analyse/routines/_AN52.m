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

;%AN52^INT^1^59547,73865^0
AN52 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
EQUI 
 K @(TEMPO)
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1"
 D EMPV^%ANGEPIL(TEMPO)
 
 F I=1:1:$L($$^%QZCHW("$EQUILIBRER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("EQU0^%AN52") G VARTEMP^%AN3
EQU0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S V1=$$NEW^%ANA F I=1:1:10 D SET^%ANA(V1,I,0)
 D SET^%ANA(V1,1,NORES)
 D CAR
 
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de l'etude")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU1^%AN52") G EXPRESS^%AN4
EQU1 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,2,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom du repertoire de la gamme")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU2^%AN52") G EXPRESS^%AN4
EQU2 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,3,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de la gamme")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU3^%AN52") G EXPRESS^%AN4
EQU3 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,4,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de la liste d'operations")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU4^%AN52") G EXPRESS^%AN4
EQU4 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,5,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de l'attribut capacite")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU5^%AN52") G EXPRESS^%AN4
EQU5 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,6,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le temps de cycle")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU6^%AN52") G EXPRESS^%AN4
EQU6 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,7,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom du TAL")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU7^%AN52") G EXPRESS^%AN4
EQU7 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,8,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom du TAG")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU8^%AN52") G EXPRESS^%AN4
EQU8 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,9,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom de la liste des groupes d'inseparables")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU9^%AN52") G EXPRESS^%AN4
EQU9 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,10,NORES)
 D CAR
 I C=")" G STOTYP
 I C'=";" D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant apres le nom du TAG")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("EQU10^%AN52") G:C="%" VARTEMP^%AN3 G ENTIER^%AN1
EQU10 
 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,11,NORES)
 D CAR
 
 I C'=")" D M(""")"" "_$$^%QZCHW("manquant apres le nombre max d'operateurs par poste")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
STOTYP 
 S NORES=V1
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$EQUILIBRER")
 
 D LEC
 G DEPIL^%ANGEPIL

