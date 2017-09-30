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

;TOVERIEX^INT^1^59547,74876^0
TOVERIEX ;
 
 K ^ORDEXPLI($I) S PB=0 G:'($D(ARTI)) FIN G:ARTI="" FIN G:'($D(^[QUI]EXPLICI(ARTI))) FIN
 S NUM=-1,PLC=0 F I=1:1 S NUM=$N(^[QUI]EXPLICI(ARTI,NUM)) Q:NUM=-1  S PARA=-1 F J=1:1 S PARA=$N(^[QUI]EXPLICI(ARTI,NUM,PARA)) Q:PARA=-1  D TRAIT
 S NBPAR=PLC I PB=1 D REORG
FIN K ^ORDEXPLI($I),PLC,NBPAR,PB,I,J,PARA,NUM G END
END Q
TRAIT S PLC=PLC+1,^ORDEXPLI($I,PLC,PARA)=^[QUI]EXPLICI(ARTI,NUM,PARA) S:(J'=1)!(NUM'=I) PB=1
 G END
REORG K ^[QUI]EXPLICI(ARTI) F PLC=1:1:NBPAR S PARA=$N(^ORDEXPLI($I,PLC,-1)),^[QUI]EXPLICI(ARTI,PLC,PARA)=^ORDEXPLI($I,PLC,PARA)
 G END
 
TEST W !,$$^%QZCHW("Article :") R ARTI Q:ARTI=""
 D TOVERIEX G TEST

