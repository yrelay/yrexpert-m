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

;TOGENFOR^INT^1^59547,74872^0
TOGENFOR ;
 
 S TIT=$$^%QZCHW("GENERATION DES TEMPS ET COUTS") D ^TOGETART
 S DX=0,DY=6 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant...")
 F %AA=1:1 Q:'($D(^TACOMPIL($I,%AA)))  S ARTI=^TACOMPIL($I,%AA) D TRAIT0
END K ^TACOMPIL($I),^COMPILVU($I),ARTI,PH,NUOR,OP,%PP,%NN,%OO,RET,DATA,%DD,SEMA,DON,MAC,%MM,LGR Q
TRAIT0 S PH=-1 F %PP=1:1 S PH=$N(^[QUI]PHASE(ARTI,PH)) Q:PH=-1  S NUOR=-1 F %NN=1:1 S NUOR=$N(^[QUI]PHASE(ARTI,PH,NUOR)) Q:NUOR=-1  S OP=-1 F %OO=1:1 S OP=$N(^[QUI]PHASE(ARTI,PH,NUOR,OP)) Q:OP=-1  D TRAIT
 Q
TRAIT Q:'($D(^[QUI]PHASE(ARTI,PH,NUOR,OP)))  S DATA=^[QUI]PHASE(ARTI,PH,NUOR,OP) F %DD=17:1:24 S SEMA=$P(DATA,"^",%DD) D TRAIT1
 Q
TRAIT1 
 S DX=0,DY=6 X XY W PH
 S DX=0,DY=7 X XY W NUOR
 S DX=0,DY=8 X XY W OP
 Q:SEMA=""  G:$D(^[QUI]SECTION(SEMA)) SUITR G:$D(^[QUI]DESMACH(SEMA)) SUITR
 
 
 
SUITR G:$D(^[QUI]FORMULE(ARTI,PH,OP,SEMA)) FINTR
 S DON="",$P(DON,"^",17)=0,$P(DON,"^",19)=0,$P(DON,"^",18)="TEMPS",$P(DON,"^",20)="TEMPS",^[QUI]FORMULE(ARTI,PH,OP,SEMA,1)=DON,^[QUI]FLFORM(ARTI,PH,OP,SEMA,1)=DON
FINTR Q

