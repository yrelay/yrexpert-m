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

;TODOLEXI^INT^1^59547,74871^0
TODOLEXI ;
 
 S EXP=EXF
 F FT="$EXISTE(","$COUT(","$DUREE(","$MACHINE(" D DEB
 G FIN
DEB K ^DOL($I) S ^DOL($I,1)=$P(EXP,FT,1) F %FF=2:1 Q:$P(EXP,FT,%FF)=""  S ^DOL($I,%FF)=$P(EXP,FT,%FF)
 F %FF=2:1 Q:'($D(^DOL($I,%FF)))  S AEXP=^DOL($I,%FF) D TRAIT
 S EXP=^DOL($I,1) F %FF=2:1 Q:'($D(^DOL($I,%FF)))  S EXP=EXP_FT_^DOL($I,%FF)
FIN Q
TRAIT Q:AEXP=""
 S AEXP1=$P(AEXP,")",1),AEXP2=")"_$P(AEXP,")",2),AEXP3="" F %U=1:1 S AE=$P(AEXP1,";",%U) Q:AE=""  S AE=$S($E(AE,1)="""":"",1:"""")_AE_$S($E(AE,$L(AE))="""":"",1:""""),AEXP3=AEXP3_$S(AEXP3="":"",1:";")_AE
 S ^DOL($I,%FF)=AEXP3_AEXP2
 Q
TEST W !,$$^%QZCHW("A tester : ") R EXF Q:EXF=""  D ^TODOLEXI W !,?10,"===> ",EXP G TEST

