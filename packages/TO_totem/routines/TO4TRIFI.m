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

;TO4TRIFI^INT^1^59547,74871^0
TO4TRIFI ;
 
 K ^[QUI]IMPBIS(ARTI) S NBIS=1,NARTI=1,NUP=-1 F WW=0:0 S NUP=$N(^[QUI]TRINIT(ARTI,NUP)) G:NUP=-1 END S PARTR=^[QUI]TRINIT(ARTI,NUP) I PARTR'["~" D ALORS
ALORS S NUIMP=-1,TABIMP="^[QUI]FLIMPLI(ARTI,PARTR)"
 F IY=0:0 S NUIMP=$N(@TABIMP@(NUIMP)) Q:NUIMP=-1  D T0
 G FIN
T0 I $D(^[QUI]NONTRI(ARTI,PARTR,NUIMP))!$D(^[QUI]FLIMPLI(ARTI,PARTR,"DEDUIT")) G T2
T1 I (NUIMP=$$^%QZCHW("SINON"))&$D(^[QUI]RANG(ARTI,PARTR)) D INDEF G T2
 I $D(^[QUI]RANG(ARTI,PARTR)) G T2
 S ^[QUI]TRI(ARTI,NARTI)="("""_ARTI_""","""_PARTR_""","""_NUIMP_""")",NARTI=NARTI+1 G FIN
T2 S ^[QUI]IMPBIS(ARTI,NBIS)="("""_ARTI_""","""_PARTR_""","""_NUIMP_""")",NBIS=NBIS+1
FIN Q
END K NUP,WW,NUIMP,PARTR Q
INDEF S DD=$P(TABNAM,"]",2),BT="^[QUI]PARINDEF(ARTI,DD,PARTR)",NI=-1 F %U=1:1 S NI=$N(@BT@(NI)) Q:NI=-1  I NI'=$$^%QZCHW("SINON") S VI=-1 F %U1=1:1 S VI=$N(@BT@(NI,VI)) Q:VI=-1  S @BT@($$^%QZCHW("SINON"),VI)=1
 K BT,NI,VI,%U,%U1 G FIN

