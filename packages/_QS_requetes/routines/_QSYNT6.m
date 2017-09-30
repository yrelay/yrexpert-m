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

;%QSYNT6^INT^1^59547,73884^0
RQSYNT6 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
 
ACTTLT(CH,P,A) N C S A=0 D CAR
 I C'="$" D M($$^%QZCHW("Une fonction commence par un $ ...")) Q 0
 D LEC G TEX
ACTION(CH,P,A) N C S A=0 D CAR
 I C'="$" D M($$^%QZCHW("Une fonction commence par un $ ...")) Q 0
 D LEC
 
TEX Q:$E(CH,P,P+4)="TEXTE" $$TEXTE(CH,.P,.A)
 Q:$E(CH,P,P+7)="DESSINER" $$DESSINER(CH,.P,.A)
 Q:$E(CH,P,P+4)="GAMME" $$GAMME(CH,.P,.A)
 Q:$E(CH,P,P+6)="COMMENT" $$COMMENT(CH,.P,.A)
 Q:$E(CH,P,P+5)="QQSOIT" $$QQSOIT(CH,.P,.A)
 D M($$^%QZCHW("Action inconnue ...")) Q 0
 
QQSOIT(CH,P,A) N ATT,C,I,LIG,TEX S A=0 F I=1:1:6 D LEC
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC I '($$ATTRIBUT^%QSYNT3(CH,.P,.ATT)) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(ATT) Q 0
 D LEC I '($$ALFANUM^%QSYNT1(CH,.P,.TEX)) D KILL^%ANA(ATT) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(ATT),KILL^%ANA(TEX) Q 0
 D LEC I '($$EXPRESS^%QSYNT4(CH,.P,.LIG)) D KILL^%ANA(ATT),KILL^%ANA(TEX) Q 0
 D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue ...")),KILL^%ANA(ATT),KILL^%ANA(TEX),KILL^%ANA(LIG) Q 0
 D LEC S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ACTION"),SET^%ANA(A,"TEXTE","$QQSOIT"),SET^%ANA(A,1,ATT),SET^%ANA(A,2,TEX),SET^%ANA(A,3,LIG) Q 1
 
TEXTE(CH,P,A) N AL,C,E,I S A=0 D CAR S R=$E(CH,P,P+4) I R'="TEXTE" D M("Fonction $TEXTE attendue ...") Q 0
 F I=1:1:5 D LEC
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC I '($$EXPRESS^%QSYNT4(CH,.P,.E)) Q 0
 S AL=0 D CAR G:C'=";" FTEX
 D LEC I '($$ALFANUM^%QSYNT1(CH,.P,.AL)) Q 0
FTEX D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue ...")),KILL^%ANA(E) Q 0
 D LEC
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ACTION"),SET^%ANA(A,"TEXTE","$TEXTE")
 D SET^%ANA(A,1,E),SET^%ANA(A,2,AL) Q 1
 
DESSINER(CH,P,A) N C,I,MOD,NLI,OBJ,VER S A=0 D CAR S R=$E(CH,P,P+7) I R'="DESSINER" D M($$^%QZCHW("Fonction $DESSINER attendue ...")) Q 0
 F I=1:1:8 D LEC
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC I '($$LEX^%QSYNT3(CH,.P,.OBJ)) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(OBJ) Q 0
 D LEC I '($$ALFANUM^%QSYNT1(CH,.P,.VER)) D KILL^%ANA(OBJ) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(OBJ),KILL^%ANA(VER) Q 0
 D LEC I '($$ENTIER^%QSYNT1(CH,.P,.MOD)) D KILL^%ANA(OBJ),KILL^%ANA(VER) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD) Q 0
 D LEC I '($$EXPRESS^%QSYNT4(CH,.P,.NLI)) D KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD) Q 0
 D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue ...")),KILL^%ANA(OBJ),KILL^%ANA(VER),KILL^%ANA(MOD),KILL^%ANA(NLI) Q 0
 D LEC S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","ACTION"),SET^%ANA(A,"TEXTE","$DESSINER"),SET^%ANA(A,1,OBJ),SET^%ANA(A,2,VER),SET^%ANA(A,3,MOD),SET^%ANA(A,4,NLI) Q 1
 
GAMME(CH,P,A) N C,E,I S A=0 D CAR S R=$E(CH,P,P+4) I R'="GAMME" D M("Fonction $GAMME attendue ...")
 F I=1:1:5 D LEC
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC I '($$EXPRESS^%QSYNT4(CH,.P,.E)) Q 0
 D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue ...")),KILL^%ANA(E) Q 0
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ACTION"),SET^%ANA(A,"TEXTE","$GAMME")
 D LEC,SET^%ANA(A,1,E) Q 1
 
COMMENT(CH,P,A) N C,COM,I,NLI S A=0 D CAR S R=$E(CH,P,P+6) I R'="COMMENT" D M($$^%QZCHW("Fonction $COMMENT attendue ...")) Q 0
 F I=1:1:7 D LEC
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC I '($$CHAINE^%QSYNT1(CH,.P,.COM)) Q 0
 D CAR I C'=";" D M($$^%QZCHW("Un ; etait attendu ...")),KILL^%ANA(COM) Q 0
 D LEC I '($$EXPRESS^%QSYNT4(CH,.P,.NLI)) D KILL^%ANA(COM) Q 0
 D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue ...")),KILL^%ANA(COM),KILL^%ANA(NLI) Q 0
 D LEC S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ACTION"),SET^%ANA(A,"TEXTE","$COMMENT"),SET^%ANA(A,1,COM),SET^%ANA(A,2,NLI) Q 1

