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

;%QSYNT3^INT^1^59547,73884^0
RQSYNT3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%QSYNT7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%QSYNT7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%QSYNT7,CAR Q
LEC1(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 2 D POCLEPA^%VVIDEO Q
 
VARIABLE(CH,P,A) Q:'($$IDF(CH,.P,.A)) 0 D SET^%ANA(A,"TYPE","VARIABLE") Q 1
 
IDF(CH,P,A) N C,R S A=0 D CAR
 I C'?1A D M($$^%QZCHW("Un identificateur commence toujours par une lettre ...")) Q 0
 S R=C
BIDF D LEC1 G:C'?1NA FIDF S R=R_C G BIDF
FIDF D:C=" " LEC
 S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","IDF"),SET^%ANA(A,"TEXTE",R) Q 1
 
LEX(CH,P,A) N C,N,R S A=0,R="" Q:'($$IDF(CH,.P,.N)) 0
BLEX S R=R_$$RED^%ANA(N,"TEXTE") D KILL^%ANA(N),CAR G:C'="." FLEX
 S R=R_C D LEC G:$$IDF(CH,.P,.N) BLEX D KILL^%ANA(N) Q 0
FLEX S PCH=R D ^%LXABR
 I CONCUR=0 D ^MES(
 I CONCUR=1 D POCLEPA^%VVIDEO W PCH," --> ",PCHCOMP H 1 D POCLEPA^%VVIDEO G OKLEX
 I CONCUR>1 D POCLEPA^%VVIDEO,^%VSQUEAK W R,$$^%QZCHW(" est ambigu au lexique, refuse ...") H 2 D POCLEPA^%VVIDEO Q 0
78 Q 0
79 S PCHCOMP=PCH G OKLEX
OKLEX S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","NOM"),SET^%ANA(A,"TEXTE",PCHCOMP) Q 1
 
ATTRIBUT(CH,P,A) N C S A=0 D CAR
 N IND,NOM,VAR S (IND,NOM,VAR)=0 I '($$LEX(CH,.P,.NOM)) Q 0
 D CAR G:C'="(" VARLEX I '($$INDICE(CH,.P,.IND)) D KILL^%ANA(NOM) Q 0
VARLEX D CAR G:C'="^" ENDLEX
 D LEC I '($$VARIABLE(CH,.P,.VAR)) D KILL^%ANA(NOM),KILL^%ANA(IND) Q 0
ENDLEX S A=$$NEW^%ANA D SET^%ANA(A,"TYPE","ATTRIBUT")
 D SET^%ANA(A,1,NOM),SET^%ANA(A,2,IND),SET^%ANA(A,3,VAR) Q 1
 
INDICE(CH,P,A) N C S A=0 D CAR
 I C'="(" D ^%VZEAVT($$^%QZCHW("Une ( doit preceder l'indice ...")) Q 0
 D LEC G:C="""" INDCHA
 
INDNUM I '($$NOMBRE^%QSYNT1(CH,.P,.A)) Q 0
 G INDEND
 
INDCHA I '($$CHAINE^%QSYNT1(CH,.P,.A)) Q 0
INDEND D CAR I C'=")" D ^%VZEAVT($$^%QZCHW("Une ) doit terminer l'indice ...")) Q 0
 D LEC Q 1

