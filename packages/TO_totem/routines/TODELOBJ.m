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

;TODELOBJ^INT^1^59547,74871^0
TODELOBJ ;
 
 F J=0:1 S %TAB=$P($T(TAB+J),";;",2) Q:%TAB=""  S OBJC=$P(%TAB,"#",1),%TAB=$P(%TAB,"#",2) I (OBJC=OBJ)!((OBJ="")!(OBJC="")),%TAB'="" D SUIT
 S YA=LIB D DELFL,DLETUD K ^[QUI]ESTAPARU(LIB),^[QUI]RELATION(LIB),^[QUI]DEPARG(LIB) S ARTI=LIB
 I OBJ=$$^%QZCHW("ART") D ^TO3GPAR G FIN
 I OBJ="MAT" D ^TO3PIMAT G FIN
 I OBJ="MAC" D ^TO3PIMAC G FIN
 D ^TO3GPAR,^TO3PIMAT,^TO3PIMAC
FIN K PART,VART,OBJC,J,%TAB,OBJ,%UU,%TB,%A,%VV,%NU Q
SUIT F %UU=1:1 S %TB=$P(%TAB,"/",%UU) Q:%TB=""  S %TB="^[QUI]"_%TB K @%TB@(LIB)
 Q
DELFL S %TB=-1 F %UU=1:1 S %TB=$N(^NAMEFUL(%TB)) Q:%TB=-1  S %TAB=$P(^NAMEFUL(%TB),"^",1),%TAB="^[QUI]"_%TAB_"("""_LIB_""")" K @(%TAB)
 S PART="VALI"_LIB_"/",VART=$P(PART,"/",1)_$C($A("/")-1)_"z"
 F WB=0:0 S VART=$N(^[QUI]FLTRIP(VART)) Q:(VART=-1)!($E(VART,1,$L(PART))'=PART)  K ^[QUI]FLTRIP(VART)
 Q
DLETUD S NODEVI=-1 F %UU=1:1 S NODEVI=$N(^[QUI]ANTETUDE(LIB,NODEVI)) Q:NODEVI=-1  D DEL
 K ^[QUI]ANTETUDE(LIB),^[QUI]REFANTET(LIB) Q
DEL I '($D(^[QUI]TREEWORK(NODEVI))) D DEL1^TODELDEV G END
 S TWREF=$N(^[QUI]TREEWORK(NODEVI,-1))
 D DEL^TODELDEV
END Q
TAB ;;ART#EXPLICI/IMPLICI/NOMENC/PHASE/FORMULE/OUTCONS/DIMOUT/MATIERE/SELMAT/MACSEL/VALITOLE/AUTREFO
 ;;MAC#DESMACH/PEXPMACH/IMPMAC
 ;;MAT#MATSTOCK/IMPMAT
 ;;#ESSABAC

