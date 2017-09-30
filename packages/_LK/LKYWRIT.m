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

;LKYWRIT^INT^1^59547,74868^0
LKYWRIT(BASE,IND,DATA,BLK) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ATT,I,VAL,TYPE,J,OR,ATTI,VA,NUM,LIEN
 S NUM=""
NUM 
 S NUM=$O(@DATA@(BASE,"D",NUM)) Q:NUM=""
 S ATTI=$O(@DATA@(BASE,"D",NUM,""))
 F I=0:0 Q:ATTI=""  D T1 S ATTI=$O(@DATA@(BASE,"D",NUM,ATTI))
 G NUM
 
T1 
 I '($D(@DATA@(BASE,"D",NUM,ATTI,"ATT"))) S VA="" G FT1
 S ATT=@DATA@(BASE,"D",NUM,ATTI,"ATT")
 I ATT="CONSTANTE" G DEF
 
 S OR=@DATA@(BASE,"D",NUM,ATTI,"O")
 S LIEN=$P(ATT,"~",2)
 S VA=$$^%QSCALVU(LIEN,BASE,IND,$P(ATT,"~",1),OR)
 I VA="" S VA=@DATA@(BASE,"D",NUM,ATTI,"V")
 
FSOR I @DATA@(BASE,"D",NUM,ATTI,"N")'=0 S VA=$$NUME(VA,@DATA@(BASE,"D",NUM,ATTI,"N"),@DATA@(BASE,"D",NUM,ATTI,"NC")) G FT1
 I @DATA@(BASE,"D",NUM,ATTI,"F")'="" S VA=$$^%QMDAFFI(VA,@DATA@(BASE,"D",NUM,ATTI,"F")) G FT1
 G FT1
DEF 
 S VA=@DATA@(BASE,"D",NUM,ATTI,"V")
 
FT1 S @DATA@(BASE,"D",NUM,ATTI,"D")=VA
 Q
 
NUME(V,LN,C) N V1,V2
 S V1=$P(V,".",1),V2=$P(V,".",2)
 S V1=$E(V1,1,LN) I (LN-$L(V1))>0 S V1=$TR($J("",LN-$L(V1))," ",C)_V1
 S V1=V1_$S(V2="":"",1:"."_V2)
 Q V1
 ;
 ;

