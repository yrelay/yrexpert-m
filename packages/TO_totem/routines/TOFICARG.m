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

;TOFICARG^INT^1^59547,74872^0
TOFICARG ;
 
 K ^DON($I),^VALPAR($I) S NN=2,^DON($I,1)=LIB
 S DA=-1 F %FF=1:1 S DA=$N(^DON($I,DA)) Q:DA=-1  D TRAIT
 S OLIB=LIB,LIB=-1 F %FF=1:1 S LIB=$N(^VALPAR($I,LIB)) Q:LIB=-1  S TYP=^VALPAR($I,LIB) D AFFTYP^TORESTYL Q:%STOP=1
 S LIB=OLIB K DA,NN,OLIB,%FF,ARG,DA,NFI,REF,NNF,BIL Q
FIN Q
TRAIT S ARG=^DON($I,DA),NFI=$N(^[QUI]FLIMPLI(ARTI,ARG,-1)) G:NFI=-1 FIN
 S REF=ARG_" "_NFI_" " I '($D(^[QUI]REPFICH(ARTI,"IMPLICI",REF))) G FIN
 S NNF=^[QUI]REPFICH(ARTI,"IMPLICI",REF)
 S BIL=-1 F %GG=1:1 S BIL=$N(^[QUI]TYPLIB(ARTI,NNF,BIL)) Q:BIL=-1  D TT
 G FIN
TT I BIL["$ARG" S ^DON($I,NN)=BIL,NN=NN+1 G FIN
 I (BIL["%ARG")!(BIL["%VALA") G FIN
 S ^VALPAR($I,BIL)=^[QUI]TYPLIB(ARTI,NNF,BIL) G FIN

