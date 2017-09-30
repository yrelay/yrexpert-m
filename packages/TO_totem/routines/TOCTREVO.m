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

;TOCTREVO^INT^1^59547,74871^0
TOCTREVO ;
 K ^[QUI]TOCTREVO(ARTI),^TBTRI($J),^ORD($J) S %V=-1 F %U=1:1 S %V=$N(^[QUI]TRINIT(ARTI,%V)) Q:%V=-1  S ^TBTRI($J,^[QUI]TRINIT(ARTI,%V))=%V
 K ^TBEV($J) S TBEV="^[QUI]REPFICH(ARTI,""TOCTREV"")",%V=-1 F %U=1:1 S %V=$N(@TBEV@(%V)) Q:%V=-1  S ^TBEV($J,@TBEV@(%V))=1
 S YA=ARTI D ^TO4GEXPL S %V=-1 F %U=1:1 S %V=$N(^ITO4GEXP($I,%V)) Q:%V=-1  S ^TBTRI($J,%V)=0
 S %V=$P($T(TAB),";;",2) F %U=1:1 S %W=$P(%V,"/",%U) Q:%W=""  S ^TBTRI($J,%W)=0
 S TB="^[QUI]SENSFICH(ARTI,0,""TOCTREV"")",NF=-1
LNF D:NF'=-1 ORD S NF=$N(@TB@(NF)) G:NF=-1 FNF S DM=-1
LDM S DM=$N(@TB@(NF,"BES",DM)) G:DM=-1 LNF G:DM'="IMPLICI" REF S YA=-1
LYA S YA=$N(@TB@(NF,"BES",DM,YA)) G:YA=-1 LDM G:YA'=ARTI REF S PP=-1
LPP S PP=$N(@TB@(NF,"BES",DM,YA,PP)) G:PP=-1 LYA G:'($D(^TBTRI($J,PP))) REF S RG=-(^TBTRI($J,PP)),^ORD($J,NF,RG)=PP G LPP
REF K ^ORD($J,NF) G LNF
FNF S NF=-1 F %U=1:1 S NF=$N(^TBEV($J,NF)) Q:NF=-1  S ^[QUI]TOCTREVO(ARTI,0,NF)=1
 K %V,%U,TBEV,YA,%W,TB,NF,DM,PP,RG Q
ORD Q:'($D(^ORD($J,NF)))  S RG=$O(^ORD($J,NF,"")) Q:NF=""  K ^TBEV($J,NF) S ^[QUI]TOCTREVO(ARTI,1,^ORD($J,NF,RG),NF)=1 Q
TAB ;;QUANTITE/PERE/ARTICLE

