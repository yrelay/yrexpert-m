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

;%QSGRECH^INT^1^59547,73882^0
RQSGRECH(B1,E1,CH,B2,E2) 
 
 
 N B,C,F,I,N,NT,O,%O,OO,%OO,X
 S N=1 F I=1:1:$L(CH) S:$E(CH,I,I)="^" N=N+1
DEB S F=$P($P(CH,"^",1),"(",1) G:'($D(^[QUI]RQSILIEN(B1,F,1))) ONE
 S B=^[QUI]RQSILIEN(B1,F,1) G:B'=B2 ONE S X=0
 S NT=0,O=-1 F %O=0:0 S O=$N(@E1@(O)) Q:O=-1  D TOF S NT=NT+1 D:(NT#100)=0 T
 K ^TEMPO($J) Q X
ONE K ^TEMPO($J,CH)
 S NT=0,O=-1 F %O=0:0 S O=$N(@E1@(O)) Q:O=-1  D TO S NT=NT+1 D:(NT#100)=0 T
 S E1="^TEMPO($J,"_""""_CH_""")",B1=B,CH=$P(CH,"^",2,N),N=N-1 G DEB
T W "." Q
TO S OO=O F %OO=0:0 S OO=$N(^[QUI]QUERY1(B,OO)) Q:(OO=-1)!(OO'[O)  S ^TEMPO($J,CH,OO)=""
 Q
TOF S OO=O F %OO=0:0 S OO=$N(^[QUI]QUERY1(B2,OO)) Q:(OO=-1)!(OO'[O)  S @E2@(OO)="",X=X+1
 Q

