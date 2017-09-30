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

;%AN6^INT^1^59547,73866^0
AN6 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
ACTTLT K @(TEMPO) S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'="$" D M("Une fonction commence par un $ ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC G TEX
ACTION K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="L",@TEMPO@(3)="N" D EMPIL^%ANGEPIL(TEMPO) S NORES=0 D CAR
 I C'="$" D M("Une action commence par un $ ...") S RESULT=0 G DEPIL^%ANGEPIL
 
TEX D EMPIL^%ANGEPIL("TEX1^%AN6")
 S N=$$^%QZCHW("$TEXTE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N TEXTE
 S N=$$^%QZCHW("$DESSINER"),L=$L(N) G:$E(CH,P,(P+L)-1)=N DESSINER
 S N=$$^%QZCHW("$GAMME"),L=$L(N) G:$E(CH,P,(P+L)-1)=N GAMME^%AN21
 S N=$$^%QZCHW("$COMMENT"),L=$L(N) G:$E(CH,P,(P+L)-1)=N COMMENT^%AN21
 S N=$$^%QZCHW("$QQSOIT"),L=$L(N) G:$E(CH,P,(P+L)-1)=N QQSOIT^%AN21
 D M("Action inconnue ...") S RESULT=0
TEX1 G DEPIL^%ANGEPIL
 
TEXTE K @(TEMPO) S @TEMPO@(1)="AL",@TEMPO@(2)="C",@TEMPO@(3)="E",@TEMPO@(4)="I" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0 D CAR
 F I=1:1:$L($$^%QZCHW("$TEXTE")) D LEC
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TEXTE1^%AN6") G EXPRESS^%AN4
TEXTE1 G:RESULT=0 DEPIL^%ANGEPIL S E=NORES
 S AL=0 D CAR G:C'=";" FTEX
 D LEC,EMPIL^%ANGEPIL("TEXTE2^%AN6") G ALFANUM^%AN1
TEXTE2 I RESULT=0 D KILL^%ANA(E) G DEPIL^%ANGEPIL
 S AL=NORES
FTEX D CAR I C'=")" D M("Une ) etait attendue ..."),KILL^%ANA(E),KILL^%ANA(AL) S NORES=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TEXTE")
 D SET^%ANA(NORES,1,E),SET^%ANA(NORES,2,AL) G DEPIL^%ANGEPIL
 
DESSINER K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="MOD",@TEMPO@(4)="NLI",@TEMPO@(5)="OBJ",@TEMPO@(6)="VER" D EMPV^%ANGEPIL(TEMPO) S NORES=0 D CAR
 F I=1:1:$L($$^%QZCHW("$DESSINER")) D LEC
 I C'="(" D M("Une ( etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DES1^%AN6") G LEX^%AN3
DES1 G:RESULT=0 DEPIL^%ANGEPIL S OBJ=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(OBJ) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DES2^%AN6") G ALFANUM^%AN1
DES2 I RESULT=0 D KILL^%ANA(OBJ) G DEPIL^%ANGEPIL
 S VER=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(OBJ),KILL^%ANA(VER) G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DES3^%AN6") G ENTIER^%AN1
DES3 I RESULT=0 D KILL^%ANA(OBJ),KILL^%ANA(VER) G DEPIL^%ANGEPIL
 S MOD=NORES
 D CAR I C'=";" D M("Un ; etait attendu ..."),KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DES4^%AN6") G EXPRESS^%AN4
DES4 I RESULT=0 D KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD) G DEPIL^%ANGEPIL
 S NLI=NORES
 D CAR I C'=")" D M("Une ) etait attendue ..."),KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD),KILL^%ANA(NLI) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$DESSINER"),SET^%ANA(NORES,1,OBJ),SET^%ANA(NORES,2,VER),SET^%ANA(NORES,3,MOD),SET^%ANA(NORES,4,NLI) G DEPIL^%ANGEPIL

