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

;TO3VBLIM^INT^1^59547,74870^0
TO3VBLIM ;
 
 I '($D(^BLOCI($I,NUFA,TWREF,RBL))) S PARAP=$P(RBL,"""",4),VPA="???" D AFF G FIN
 S TI="^[QUI]BLOCIMPL"_RBL,SGR=$P(@TI@(0),"|",5)
 S RB=^BLOCI($I,NUFA,TWREF,RBL),INUF=$P(RB,"^",1),ITW=$P(RB,"^",2),USER=$P(RB,"^",3),NO=-1
LNO S NO=$N(^[QUI]BLOCIMPL(YA,"%SGR",SGR,NO)) G:NO=-1 FIN S RBLT=^[QUI]BLOCIMPL(YA,"%SGR",SGR,NO),RBL="("_$P(RBLT,"|",2)_")",%TYBL=$P(RBLT,"|",1),RBLT=$S(%TYBL="PARA":"PARA",%TYBL="AUTREFO":"AUTRF",1:"TPCT")
 S TI="^[QUI]BLOCIMPL"_RBL,PI=$P(@TI@(0),"|",1),AI=$P(@TI@(0),"|",2),WH=$P(@TI@(0),"|",4)
 S RL=$P(PI,"'",2),PI=$P(PI,"'",1),TB=$S(RL="":"^[USER]TVPAR(",RL=$$^%QZCHW("MATIERE"):"^[USER]PARMAT(",1:"^[USER]TVPAR(")_"INUF,ITW)",PARAP=$P(RBL,"""",4)
 I PI="" S VPA="???" D AFF G LNO
 S VPA=$S($D(@TB@(PI)):@TB@(PI),1:"???") D AFF G LNO
AFF G @RBLT
PARA S ^V($I,YA,PARAP)=VPA,^[QUI]TVPAR(NUFA,TWREF,PARAP)=VPA,^[QUI]RAISON(NUFA,TWREF,PARAP)=$$^%QZCHW("IMPLICITYST(Valeur de ")_PI_$$^%QZCHW(" de ")_AI_$$^%QZCHW(" Etude : ")_INUF_$$^%QZCHW(" sur ")_WH G FAFF
TPCT S @("^TPBLIMP($I,NUFA,TWREF,"_$E(RBL,2,$L(RBL)-1)_")")=VPA G FAFF
AUTRF S @("^PHASADM($I,NUFA,TWREF,""BLAUOK"","_$E(RBL,2,$L(RBL)-1)_")")=VPA G FAFF
FAFF Q
FIN K ^BLOCI($I,NUFA,TWREF,RBL),AI,WH,SGR,NO,RB,INUF,ITW,USER,TI,PI,RL,TB,RBLT,%TYBL Q

