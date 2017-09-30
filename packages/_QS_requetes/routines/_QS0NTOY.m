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

;%QS0NTOY^INT^1^59547,73879^0
%QS0NTOY() 
 
 
 
 
 N LISTE,TEMP,TLIS,VU,%IL,TTT
 S TTT(1)=$$^%QZCHW("Selectionner"),TTT(2)=$$^%QZCHW("Toutes")
 D POCLEPA^%VVIDEO S TTT=$$^%VZECH2("",TTT(1),TTT(2))
 I (TTT'=TTT(1))&(TTT'=TTT(2)) Q 1
 G:TTT=TTT(1) SELE
 S LISTE=0 F %IL=0:0 S LISTE=$$NXTRI^%QSTRUC8("L0",LISTE) Q:LISTE=""  D NET(LISTE)
 Q 2
SELE D ^%QUAPAD($$^%QZCHW("NETTOYAGE DE LISTES"))
 S TLIS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIS") K @(TLIS)
 D ENS^%QUAPAGM(TLIS)
 S VU=1
 S LISTE=0 F %IL=0:0 S LISTE=$O(@TLIS@(LISTE)) Q:LISTE=""  S VU=2 D NET(LISTE)
 I VU=1 D POCLEPA^%VVIDEO
 K @(TLIS)
 Q VU
NET(LISTE) 
 N ADR,IND,I,REPI
 S ADR=$$ADRLIS^%QSGEST7(LISTE) I ADR="" D DEL^%QSGES11(LISTE) Q
 I '($D(@ADR)) D DEL^%QSGES11(LISTE) Q
 S REPI=$$^%QSCALVA("L0",LISTE,"BASE")
 S IND="" F I=1:1 S IND=$O(@ADR@(IND)) Q:IND=""  D TRAIT(IND)
 D:$$^%QSCALVA("L0",LISTE,"CARD")=0 DEL^%QSGES11(LISTE)
 Q
TRAIT(IND) 
 
 
 
 
 D:$$^%QSCALVA(REPI,IND,"NOM")="" ELIMI^%QSGES11(LISTE,IND)
 Q

