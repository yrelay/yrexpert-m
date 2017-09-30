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

;%QSYNT1^INT^1^59547,73884^0
RQSYNT1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
 
ENTIER(CH,P,A) N C,B,R S A=0 D CAR
 I C'?1N D M($$^%QZCHW("Un nombre etait attendu ...")) Q 0
 S R=C D LEC F B=0:0 Q:C'?1N  S R=R_C D LEC
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ENTIER"),SET^%ANA(A,"TEXTE",R) Q 1
 
NOMBRE(CH,P,A) N C,R S A=0 D CAR I C="." S R="" G N3
N1 I $$ENTIER(CH,.P,.A) S R=$$RED^%ANA(A,"TEXTE") D KILL^%ANA(A) G N2
 Q 0
N2 D CAR G:C="." N3 G NOK
N3 S R=R_"." D LEC I $$ENTIER(CH,.P,.A) S R=R_$$RED^%ANA(A,"TEXTE") D KILL^%ANA(A) G NOK
 Q 0
NOK S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","NOMBRE"),SET^%ANA(A,"TEXTE",R) Q 1
 
CHAINE(CH,P,A) N B,C,N,R S A=0 D CAR
 I C'="""" D M($$^%QZCHW("Une chaine de caracteres etait attendue ...")) Q 0
 D LEC1 S R="" F B=0:0 Q:(C="""")!(C="")  S R=R_C D LEC1
 I C'="""" D M($$^%QZCHW("Une chaine de caracteres doit se terminer par "" ...")) Q 0
 D LEC S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","CHAINE"),SET^%ANA(A,"TEXTE",R) Q 1
 
OBJET(CH,P,A) N C S A=0 D CAR
 Q:C="""" $$CHAINE(CH,.P,.A)
 Q:C?1N $$NOMBRE(CH,.P,.A)
 Q:C="$" $$FONCTION^%QSYNT2(CH,.P,.A)
 Q:C?1A $$ATTRIBUT^%QSYNT3(CH,.P,.A)
 I C'="(" D M($$^%QZCHW("Une ( etait attendue ...")) Q 0
 D LEC Q:'($$EXPRESS^%QSYNT4(CH,.P,.A)) 0
 D CAR I C'=")" D M($$^%QZCHW("Il manque une ) ...")) Q 0
 D LEC Q 1
 
CBINAIRE(CH,P,A) N C,R S A=0 D CAR
 S R="" G:C'="'" CB S R=C D LEC
CB I "><=[]"'[C D M($$^%QZCHW("Un comparateur >,<,=,[,ou ] etait attendu ...")) Q 0
 S R=R_C,A=$$NEW^%ANA D LEC
 D SET^%ANA(A,"TYPE","COMPARATEUR.BINAIRE"),SET^%ANA(A,"TEXTE",R) Q 1
 
CTERNAIR(CH,P,A) N C,R S A=0 D CAR
 I "[]"'[C D M($$^%QZCHW("Un comparateur [],[[,]],ou ][ etait attendu ...")) Q 0
 S R=C D LEC1
 I "[]"'[C D M($$^%QZCHW("Un comparateur [],[[,]],ou ][ etait attendu ...")) Q 0
 S R=R_C D LEC S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","COMPARATEUR.TERNAIRE"),SET^%ANA(A,"TEXTE",R) Q 1
 
OBINAIRE(CH,P,A) N C,R S A=0 D CAR
 Q:"+-*/\"'[C 0 S R=C D LEC S A=$$NEW^%ANA
 D SET^%ANA(A,"TYPE","OPERATEUR"),SET^%ANA(A,"TEXTE",R) Q 1
 
OLOGIQUE(CH,P,A) N C,I,R S A=0 D CAR
 S R=$E(CH,P,P+1)
 I (R'="ET")&(R'="OU") D M($$^%QZCHW("Operateur logique ET ou OU attendu ...")) Q 0
 S A=$$NEW^%ANA F I=1:1:2 D LEC
 D SET^%ANA(A,"TYPE","OPERATEUR.LOGIQUE"),SET^%ANA(A,"TEXTE",R) Q 1
 
OPRECED(CH,P,A) N C,R S A=0 D CAR
 S R=$E(CH,P,P+1)
 I R'="<<" D M("Operateur de precedence << attendu ...") Q 0
 D LEC,LEC
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","OPERATEUR.PRECEDENCE"),SET^%ANA(A,"TEXTE",R) Q 1
 
ALFANUM(CH,P,A) N C,R S A=0 D CAR
 I C'?1NA D M($$^%QZCHW("Un caractere alphanumerique etait attendu ...")) Q 0
 S R=C D LEC
BALFA G:(C'?1NA)&(C'=".") FALFA S R=R_C D LEC G BALFA
FALFA S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ALFA"),SET^%ANA(A,"TEXTE",R) Q 1

