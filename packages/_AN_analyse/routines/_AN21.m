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

;%AN21^INT^1^59547,73865^0
AN21 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
QQSOIT K @(TEMPO) S @TEMPO@(1)="ATT",@TEMPO@(2)="C",@TEMPO@(3)="I",@TEMPO@(4)="LIG",@TEMPO@(5)="TEX",NORES=0 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$QQSOIT")) D LEC
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("QQ1^%AN21") G ATTRIBUT^%AN3
QQ1 G:RESULT=0 DEPIL^%ANGEPIL S ATT=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(ATT) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("QQ2^%AN21") G ALFANUM^%AN1
QQ2 I RESULT=0 D KILL^%ANA(ATT) S RESULT=0 G DEPIL^%ANGEPIL
 S TEX=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(ATT),KILL^%ANA(TEX) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("QQ3^%AN21") G EXPRESS^%AN4
QQ3 I RESULT=0 D KILL^%ANA(ATT),KILL^%ANA(TEX) G DEPIL^%ANGEPIL
 S LIG=NORES
 D CAR I C'=")" D M("Une ) etait attendue ..."),KILL^%ANA(ATT),KILL^%ANA(TEX),KILL^%ANA(LIG) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$QQSOIT"),SET^%ANA(NORES,1,ATT),SET^%ANA(NORES,2,TEX),SET^%ANA(NORES,3,LIG)
 G DEPIL^%ANGEPIL
 
GAMME K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="E",@TEMPO@(3)="I" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 F I=1:1:$L($$^%QZCHW("$GAMME")) D LEC
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("GAM1^%AN21") G EXPRESS^%AN4
GAM1 G:RESULT=0 DEPIL^%ANGEPIL S E=NORES
 D CAR I C'=")" D M("Une ) etait attendue ..."),KILL^%ANA(E) S RESULT=0 G DEPIL^%ANGEPIL
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$GAMME")
 D LEC,SET^%ANA(NORES,1,E) G DEPIL^%ANGEPIL
 
COMMENT K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="COM",@TEMPO@(3)="I",@TEMPO@(4)="NLI" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 F I=1:1:$L($$^%QZCHW("$COMMENT")) D LEC
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COM1^%AN21") G CHAINE^%AN1
COM1 G:RESULT=0 DEPIL^%ANGEPIL S COM=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(COM) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("COM2^%AN21") G EXPRESS^%AN4
COM2 I RESULT=0 D KILL^%ANA(COM) G DEPIL^%ANGEPIL
 S NLI=NORES
 D CAR I C'=")" D M("Une ) etait attendue ..."),KILL^%ANA(COM),KILL^%ANA(NLI) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$COMMENT"),SET^%ANA(NORES,1,COM),SET^%ANA(NORES,2,NLI) G DEPIL^%ANGEPIL

