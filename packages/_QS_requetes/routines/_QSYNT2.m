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

;%QSYNT2^INT^1^59547,73884^0
RQSYNT2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
 
FONCTION(CH,P,A) N C,I S A=0 D CAR
 I C'="$" D M($$^%QZCHW("Une fonction commence toujours par un $ ...")) Q 0
 D LEC
 G:$E(CH,P,P+2)="NOM" FNOM
 D M($$^%QZCHW("Fonction inconnue ...")) Q 0
 
FNOM F I=1:1:3 D LEC
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","FONCTION"),SET^%ANA(A,"TEXTE","$NOM") Q 1
FLOG(CH,P,A) N C,I S A=0 D CAR
 I C'="$" D M($$^%QZCHW("Une fonction logique commence toujours par un $ ...")) Q 0
 D LEC
 G:$E(CH,P,P+5)="EXISTE" FEXI
 D M($$^%QZCHW("Fonction logique inconnue ...")) Q 0
 
FEXI F I=1:1:6 D LEC
 N ATR,CHA S (ATR,CHA)=0
 I C'="(" D M($$^%QZCHW("Il faut une ( apres $EXISTE ...")) Q 0
 D LEC I '($$ATTRIBUT^%QSYNT3(CH,.P,.ATR)) Q 0
 D CAR G:C'=";" ENDEXI D LEC G:C'="""" FNUM
 I '($$CHAINE^%QSYNT1(CH,.P,.CHA)) D KILL^%ANA(ATR) Q 0
 G ENDEXI
FNUM I '($$NOMBRE^%QSYNT1(CH,.P,.CHA)) D KILL^%ANA(ATR) Q 0
ENDEXI D CAR I C'=")" D M($$^%QZCHW("Une ) etait attendue a la fin de $EXISTE ...")),KILL^%ANA(ATR) Q 0
 D LEC S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","FONCTION.LOGIQUE"),SET^%ANA(A,"TEXTE","$EXISTE"),SET^%ANA(A,1,ATR),SET^%ANA(A,2,CHA) Q 1

