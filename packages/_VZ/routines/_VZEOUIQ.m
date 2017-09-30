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

;%VZEOUIQ^INT^1^59547,74037^0
ZYESNO(D) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N DX,DY
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 Q $$AUTRE(D)
MES(MS,D) 
 N (DX,DY,XY,MS,D) W MS_" "
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 Q $$AUTRE(D)
AUTRE(D) 
 S XG=$X,XD=$X+20,YH=$Y Q $$AD(D,XG,XD,YH)
ADM(MS,D,XG,XD,YH) 
 N (DX,DY,XY,MS,D,XG,XD,YH)
 W MS
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 Q $$AD(D,XG,XD,YH)
AD(D,XG,XD,YH) 
 O $I N MESSAGE,DX,DY
 S NDEF=$S(D=P1:POS2,D=P2:POS1),DEF=$S(D=P1:POS1,D=P2:POS2)
 S MESSAGE(1)=$$^%QZCHW(DEF)_"^DEF"
 S MESSAGE(2)=$$^%QZCHW(NDEF)_"^NDEF"
BOUC D ^VQUIKMN(XG,XD,YH,"MESSAGE",.AD,.CONT) G:(CONT="A")!(CONT="F") FIN G:AD'="" @AD G BOUC
DEF Q:DEF=POS1 1 Q:DEF=POS2 0
NDEF Q:NDEF=POS1 1 Q:NDEF=POS2 0
FIN Q:CONT="A" -1 Q:CONT="F" DEF

