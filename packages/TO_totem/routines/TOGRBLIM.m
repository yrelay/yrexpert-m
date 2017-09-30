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

;TOGRBLIM^INT^1^59547,74872^0
TOGRBLIM ;
 
 S TBL="^[QUI]BLOCIMPL(ARTI,""%GR"")",GR=0,US=-1 F %U1=1:1 S US=$N(@TBL@(US)) Q:US=-1  S BY=-1 F %U2=1:1 S BY=$N(@TBL@(US,BY)) Q:BY=-1  S GR=GR+1 D T0
FIN K TBL,GR,US,%U1,BY,%U2,SGR,NO,%U3,RBL,NU,TCP,ISGR,^PILBL($I),^PILPAR($I),^PILCOM($I) Q
T0 S SGR=0,NO=-1 K ^PILBL($I) F %U3=1:1 S NO=$N(@TBL@(US,BY,NO)) Q:NO=-1  S ^PILBL($I,@TBL@(US,BY,NO))=1
 Q:'($D(^PILBL($I)))
LSGR S SGR=SGR+1,RBL=$N(^PILBL($I,-1)) Q:RBL=-1  S RBLI=$P(RBL,"|",2),NU=1,TCP="^[QUI]BLOCIMPL("_RBLI_")",NO=0 K ^PILPAR($I) F %U3=1:1 S NO=$N(@TCP@(NO)) Q:NO=-1  S ^PILPAR($I,NO)=@TCP@(NO),NU=NU+1
 S ^PILPAR($I)=NU,RBL=-1
LRBL S RBL=$N(^PILBL($I,RBL)) G:RBL=-1 LSGR S RBLI=$P(RBL,"|",2),NU=1,TCP="^[QUI]BLOCIMPL("_RBLI_")",NO=0 K ^PILCOM($I) F %U3=1:1 S NO=$N(@TCP@(NO)) Q:NO=-1  S ^PILCOM($I,NO)=@TCP@(NO),NU=NU+1
 G:NU'=^PILPAR($I) LRBL S NO=-1 F %U3=1:1 S NO=$N(^PILPAR($I,NO)) Q:NO=-1  G:'($D(^PILCOM($I,NO))) LRBL G:^PILPAR($I,NO)'=^PILCOM($I,NO) LRBL
 S ISGR=GR_"/"_SGR,NV=$S($D(^[QUI]BLOCIMPL(ARTI,"%SGR",ISGR)):^[QUI]BLOCIMPL(ARTI,"%SGR",ISGR),1:1),^[QUI]BLOCIMPL(ARTI,"%SGR",ISGR,NV)=RBL,^[QUI]BLOCIMPL(ARTI,"%SGR",ISGR)=NV+1,$P(@TCP@(0),"|",5)=ISGR K ^PILBL($I,RBL) G LRBL

