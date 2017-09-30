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

;TODOLSIG^INT^1^59547,74871^0
TODOLSIG ;
 
 S EXP=EXF
DEB K ^DOL($I) S ^DOL($I,1)=$P(EXP,"$SIGMA1(",1) F %FF=2:1 Q:$P(EXP,"$SIGMA1(",%FF)=""  S ^DOL($I,%FF)=$P(EXP,"$SIGMA1(",%FF)
 F %FF=2:1 Q:'($D(^DOL($I,%FF)))  S AEXP=^DOL($I,%FF) D TRAIT
 S EXP=^DOL($I,1) F %FF=2:1 Q:'($D(^DOL($I,%FF)))  S EXP=EXP_"$SIGMA1("_^DOL($I,%FF)
 
FIN Q
TRAIT Q:AEXP=""
 S DD=$S($E(AEXP,1)="""":2,1:1) F %GG=DD:1 S AE=$A($E(AEXP,%GG)) Q:AE=-1  I (AE<49)!(((AE>57)&(AE<65))!(((AE>90)&(AE<97))!(AE>122))),(AE'=46)&(AE'=126) Q
 S AEXP=$S(DD=2:"",1:"""")_$E(AEXP,1,%GG-1)_$S(AE=34:"",1:"""")_$E(AEXP,%GG,599),^DOL($I,%FF)=AEXP
 Q
 
TEST W !,$$^%QZCHW("A tester : ") R EXF Q:EXF=""
 D ^TODOLSIG W !,?10,"===> ",EXP G TEST

