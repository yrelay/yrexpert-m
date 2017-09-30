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

;TO3COPST^INT^1^59547,74870^0
TO3COPST ;
 
 S REFCOUR=TWREF
QU D POCLEPA^%VVIDEO W $$^%QZCHW("Quelle etude deja faite acceptez-vous ? ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) END G:Y1="" QU G:'($D(^ETUFAIT($I,Y1))) QU
 D ^TO3SAVTR S ACNUF=Y1,REFAET=^ETUFAIT($I,ACNUF) K ^ETUFAIT($I) S ADR="TRAIT^TO3COPST",NOMTREE="^[QUI]TREEWORK(ACNUF,"_REFAET,NIV=2,AQT=$P(@("^[QUI]TREEWORK(ACNUF,"_REFAET_")"),"^",3) D POCLEPA^%VVIDEO W $$^%QZCHW("Patientez un instant....") D ^%QCAGTU1
 D POCLEPA^%VVIDEO G FIN
TRAIT D ^TO3GREF,^TO3RPERE S DATAC=@NOM,AQTF=$P(DATAC,"^",3),RAPQTE=AQTF\AQT,NQTE=^V($I,YA,$$^%QZCHW("QUANTITE"))*RAPQTE,NEWREF=REFCOUR_$P(TWREF,REFAET,2),@("^[QUI]TREEWORK(NUFA,"_NEWREF_")")=DATAC,$P(@("^[QUI]TREEWORK(NUFA,"_NEWREF_")"),"^",3)=NQTE
 S ^[QUI]RAISON(NUFA,REFCOUR_$P(TWRP,REFAET,2),$P(DATAC,"^",2),NEWREF)="NOMENCCOPI("_ACNUF,^ETUDIE(NUFA,NEWREF)=1
SAVTV 
 S AS=-1,GLOB="^[QUI]TVPAR(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]TVPAR(NUFA,NEWREF,AS)=@GLOB@(AS),^[QUI]RAISON(NUFA,NEWREF,AS)="IMPLICICOPI("_ACNUF S:AS'=$$^%QZCHW("QUANTITE") ^V($I,$P(DATAC,"^",1),AS)=@GLOB@(AS)
 S ^TVPAR(NUFA,NEWREF,$$^%QZCHW("QUANTITE"))=NQTE,^V($I,$P(DATAC,"^",1),$$^%QZCHW("QUANTITE"))=NQTE
 I '($D(^[QUI]TVPAR(NUFA,NEWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE")))) G SAVPH
 S ^[QUI]TVPAR(NUFA,NEWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))=^[QUI]TVPAR(NUFA,NEWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))*RAPQTE
 S ^V($I,$P(DATAC,"^",1),$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))=^[QUI]TVPAR(NUFA,NEWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))
SAVPH S AS=-1,GLOB="^[QUI]PHAS(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]PHAS(NUFA,NEWREF,AS)=@GLOB@(AS),^[QUI]RAISON(NUFA,NEWREF,AS)="PHASECOPI("_ACNUF,^[QUI]RAISON(NUFA,NEWREF,@GLOB@(AS))="FORMULECOPI("_ACNUF
SAVPM S AS=-1,GLOB="^[QUI]PARMAT(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]PARMAT(NUFA,NEWREF,AS)=@GLOB@(AS)
SAVCT S AS=-1,GLOB="^[QUI]COUT(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]COUT(NUFA,NEWREF,AS)=@GLOB@(AS)
SAVTE S AS=-1,GLOB="^[QUI]DUREE(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]DUREE(NUFA,NEWREF,AS)=@GLOB@(AS)
SAVSE S AS=-1,GLOB="^[QUI]SECT(ACNUF,TWREF)" F YR=0:0 S AS=$N(@GLOB@(AS)) Q:AS=-1  S ^[QUI]SECT(NUFA,NEWREF,AS)=@GLOB@(AS)
END Q
FIN D ^TO3RESTR S STOP="F",TWREF=REFCOUR Q

