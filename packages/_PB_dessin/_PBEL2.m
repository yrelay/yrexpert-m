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

;%PBEL2^INT^1^59547,73873^0
PTEL2(NUFA,TWREF,O,V,EL,XT,YT,ROT,AGR,ME) 
 N CH
 S CH=^[QUI]GRAPHE2(O,V,EL) D @("^%PBEL2"_$P(CH,"^",1)) Q
 
VAL(NUFA,TWREF,PAR,ME,AB) 
 S:TWREF="" TWREF=0 N PD,R,S,SI,S2,VAL S AB=0
 S SI="+" I "+-"[$E(PAR,1) S SI=$E(PAR,1),PAR=$E(PAR,2,$L(PAR))
 S PCH=PAR D TO^%QZNBN1 I ISNUM S VAL=PAR G OKV
 I $D(@PARAM@(TWREF,PAR)) S VAL=@PARAM@(TWREF,PAR) G OKV
 G:NUFA="" ASK G:'($D(^[QUI]TVPAR(NUFA,TWREF,PAR))) ASK
 S VAL=^[QUI]TVPAR(NUFA,TWREF,PAR) G OK
ASK D ^%PBPZALF
L0 D POCLEPA^%VVIDEO W "Valeur de ",PAR," = " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA!(Y1="") S AB=1 D POCLEPA^%VVIDEO Q ""
 S S2="+" I "+-"[$E(Y1,1) S S2=$E(Y1,1),Y1=$E(Y1,2,$L(Y1))
 S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G L0
 S @("VAL="_S2_Y1) D POCLEPA^%VVIDEO
OK S @PARAM@(TWREF,PAR)=VAL
OKV S @("R="_SI_VAL) Q $P((R*1000)/ME,".",1)

