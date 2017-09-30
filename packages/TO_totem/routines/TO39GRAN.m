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

;TO39GRAN^INT^1^59547,74869^0
TO39GRAN ;
 
 K ^[QUI]TREEIMP(ARTI),^INTREE($I) S NP=0,NF=0
 S ^[QUI]RANG(ARTI,$$^%QZCHW("MATIERE"))=1,^[QUI]RANG(ARTI,"FAMMAT")=1,^[QUI]RANG(ARTI,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))=1,^[QUI]RANG(ARTI,$$^%QZCHW("PERE"))=1
 S PR=-1,NP=0
 F UU=0:0 S PR=$N(^[QUI]RELATION(ARTI,PR)),^INTREE($I,PR)=1,NP=NP+1 Q:PR=-1  S ^[QUI]TREEIMP(ARTI,NP)=PR,PRF=-1,NF=1 F VV=0:0 S PRF=$N(^[QUI]RELATION(ARTI,PR,PRF)) Q:PRF=-1  D TRAIT
END K ^REFTREE($I) S NP=NP+1 D FIMP,^TO4GETRI K ^INTREE($I) Q
TRAIT I (PRF=$$^%QZCHW("PERE"))!((PRF=$$^%QZCHW("MATIERE"))!((PRF="FAMMAT")!(PRF=$$^%QZCHW("QTE.MATIERE.EN.OEUVRE")))) S ^[QUI]REFLATER(ARTI,ARTI,$$^%QZCHW("MATIERE"))=1 G AFF
 I PRF["'" D TRAIT2 G FIN
 I $D(^[QUI]FLIMPLI(ARTI,PRF)) S ^[QUI]TREEIMP(ARTI,NP,NF)=PRF,NF=NF+1 G FIN
 I $D(^[QUI]EXPL(ARTI,PRF)) S TEXP=^[QUI]EXPL(ARTI,PRF) I (TEXP="ABAC")!(TEXP="I%%") S ^[QUI]TREEIMP(ARTI,NP,NF)=PRF,NF=NF+1 G FIN
 G FIN
TRAIT2 W "." S AAR=$P(PRF,"'",2),PAAR=$P(PRF,"'",1) I (AAR="FAMMAT")!((AAR=$$^%QZCHW("MATIERE"))!(AAR=$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))),^[QUI]REFLATER(ARTI,ARTI,$$^%QZCHW("MATIERE"))=1 G AFF
 S ^[QUI]REFLATER(ARTI,AAR,PAAR)=1
AFF S ^[QUI]RANG(ARTI,PR)=1
FIN Q
FIMP S PR=-1 F UU=0:0 S PR=$N(^[QUI]FLIMPLI(ARTI,PR)) Q:PR=-1  I '($D(^[QUI]RELATION(ARTI,PR))),'($D(^INTREE($I,PR))) S ^[QUI]TREEIMP(ARTI,NP)=PR,NP=NP+1
 G FIN

