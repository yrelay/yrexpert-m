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

;%LXRAPTO^INT^1^59547,73871^0
%LXRAPTO ;;12:15 PM  4 Oct 1993; ; 05 Oct 93  5:57 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TOUS(LMOT) 
 N NUM,%N,NUM2,NUM3,MOT
 S NUM="" F %N=0:0 S NUM=$O(^[QUI]FULL(NUM)) Q:NUM=""  D BTOT1
 S NUM="" F %N=0:0 S NUM=$O(^[QUI]FORMULE(NUM)) Q:NUM=""  D BTOT4
 S NUM="" F %N=0:0 S NUM=$O(^[QUI]PHASE(NUM)) Q:NUM=""  D BTOT2
 S NUM="" F %N=0:0 S NUM=$O(^[QUI]AUTREFO(NUM)) Q:NUM=""  D BTOT5
 D MACHINES
 D INTERNE^TORAPLEX(LMOT)
 Q
 
 
QUELQUES(LISART,LMOT) 
 N NUM,%N,NUM2,NUM3,MOT
 N RLEX,VISU,ADR,%A,M,%M,GLOLX,ARTI
 S NUM=""
QLQ2 S NUM=$O(@LISART@(NUM)) G:NUM="" QLQ3
 D:$D(^[QUI]FULL(NUM)) BTOT1
 D:$D(^[QUI]PHASE(NUM)) BTOT2
 D:$D(^[QUI]FORMULE(NUM)) BTOT4
 D:$D(^[QUI]AUTREFO(NUM)) BTOT5
 G QLQ2
QLQ3 
 D MACHINES
 S GLOLX=LMOT
 S RLEX=1,ADR="TRAIT^TORAPLEX",VISU=0
 S ARTI="" F %A=0:0 S ARTI=$O(@LISART@(ARTI)) Q:ARTI=""  D RECABR^TORAPLEX
 Q
 
 
BTOT1 S @LMOT@(NUM)="",MOT=""
BTOT11 S MOT=$O(^[QUI]FULL(NUM,MOT)) Q:MOT=""  S @LMOT@(MOT)="" G BTOT11
 
 
 
BTOT2 S @LMOT@(NUM)="",NUM2=""
BTOT21 S NUM2=$O(^[QUI]PHASE(NUM,NUM2)) Q:NUM2=""  S @LMOT@(NUM2)="",NUM3=""
BTOT22 S NUM3=$O(^[QUI]PHASE(NUM,NUM2,NUM3)) G:NUM3="" BTOT21 S MOT=""
BTOT23 S MOT=$O(^[QUI]PHASE(NUM,NUM2,NUM3,MOT)) G:MOT="" BTOT22 S @LMOT@(MOT)="" G BTOT23
 
 
 
BTOT4 S @LMOT@(NUM)="",NUM2=""
BTOT41 S NUM2=$O(^[QUI]FORMULE(NUM,NUM2)) Q:NUM2=""  S NUM3=""
BTOT42 S NUM3=$O(^[QUI]FORMULE(NUM,NUM2,NUM3)) G:NUM3="" BTOT41 S MOT=""
BTOT43 S MOT=$O(^[QUI]FORMULE(NUM,NUM2,NUM3,MOT)) G:MOT="" BTOT42 S @LMOT@(MOT)="" G BTOT43
 
 
BTOT5 S @LMOT@(NUM)="",NUM2=""
BTOT51 S NUM2=$O(^[QUI]AUTREFO(NUM,NUM2)) Q:NUM2=""  S NUM3=""
BTOT52 S NUM3=$O(^[QUI]AUTREFO(NUM,NUM2,NUM3)) G:NUM3="" BTOT51 S MOT=""
BTOT53 S MOT=$O(^[QUI]AUTREFO(NUM,NUM2,NUM3,MOT)) G:MOT="" BTOT52 S @LMOT@(MOT)="" G BTOT53
 
MACHINES 
 S NUM=""
BTOT30 S NUM=$O(^[QUI]DESMACH(NUM)) Q:NUM=""  S @LMOT@(NUM)="",MOT=""
BTOT31 S MOT=$O(^[QUI]DESMACH(NUM,MOT)) G:MOT="" BTOT30 S @LMOT@(MOT)="" G BTOT31
 ;

