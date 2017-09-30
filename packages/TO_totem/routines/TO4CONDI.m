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

;TO4CONDI^INT^1^59547,74871^0
TO4CONDI ;
 
CONDIT 
RAP I PCH'["RAPPORT" G DIF
 I PCH'["'" S ACOMP="^V($I,YA,"""_WB2_""")/^V($I,""REALISATION"","""_WB2_""")" G ALORS
 S PCHO=$P(PCH,"'",1),PCHP=$P(PCH,"'",2) I PCHP="" S PCH="RAPPORT" G RAP
 S ACOMP="^V($I,YA,"""_PCHP_""")/^V($I,""REALISATION"","""_PCHP_""")" G ALORS
DIF I PCH'["DIFFERENCE" G SOM
 I PCH'["'" S ACOMP="^V($I,YA,"""_WB2_""")-^V($I,""REALISATION"","""_WB2_""")" G ALORS
 S PCHO=$P(PCH,"'",1),PCHP=$P(PCH,"'",2) I PCHP="" S PCH="DIFFERENCE" G DIF
 S ACOMP="^V($I,YA,"""_PCHP_""")-^V($I,""REALISATION"","""_PCHP_""")" G ALORS
SOM 
 I PCH'["'" S ACOMP="^V($I,YA,"""_WB2_""")+^V($I,""REALISATION"","""_WB2_""")" G ALORS
 S PCHO=$P(PCH,"'",1),PCHP=$P(PCH,"'",2) I PCHP="" S PCH="SOMME" G SOM
 S ACOMP="^V($I,YA,"""_PCHP_""")+^V($I,""REALISATION"","""_PCHP_""")"
ALORS S IMPCTE=0 S:CONDI'=0 LOGI=$S($P(CONTAB,"^",CD+3)=$$^%QZCHW("ET"):"&",$P(CONTAB,"^",CD+3)=$$^%QZCHW("OU"):"!",1:"") S:$P(CONTAB,"^",CD+4)="" LOGI="" S:CD'<13 LOGI=""
CD2 S PCH2=$P(CONTAB,"^",CD+2)
 G:$P(CONTAB,"^",CD+1)="[]" BRAQ D ^TO3COPAR S:CONDI'=0 CONDI=CONDI_"("_ACOMP_$P(CONTAB,"^",CD+1)_CD2_")"_LOGI G FIN
BRAQ S BORN=$P(CONTAB,"^",CD+2),BORI=$P(BORN,",",1),BORS=$P(BORN,",",2) F PCH4="BORI","BORS" S PCH2=@PCH4 D ^TO3COPAR S @PCH4=CD2
 S:CONDI'=0 CONDI=CONDI_"((("_ACOMP_")'<"_BORI_")&(("_ACOMP_")'>"_BORS_"))"_LOGI
FIN Q

