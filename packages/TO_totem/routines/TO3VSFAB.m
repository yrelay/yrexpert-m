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

;TO3VSFAB^INT^1^59547,74870^0
TO3VSFAB ;
 
 K TVS Q:$D(^[QUI]PAR(SFA))
 K ^[QUI]PARP(SFA),^[QUI]HM(SFA)
 F TVS("IT")=$$^%QZCHW("MATIERE"),"FAMMAT",$$^%QZCHW("%MACHINE"),$$^%QZCHW("QTE.MISE.EN.OEUVRE"),$$^%QZCHW("QUANTITE") S ^[QUI]FULL(SFA,TVS("IT"))=1
 S TVS("PI")=-1,TVS("NPAR")=1 F TVS("UI")=0:0 S TVS("PI")=$N(^[QUI]FULL(SFA,TVS("PI"))) Q:TVS("PI")=-1  D TRAIT
FIN K TVS Q
TRAIT I (TVS("PI")["$ARG")!((TVS("PI")["%VAL")!(TVS("PI")["%ARG")) G END
 S ^[QUI]PAR(SFA,TVS("NPAR"))=TVS("PI")
 S TVS($$^%QZCHW("P"))="^[QUI]PARP(SFA," F TVS("I")=1:1 S TVS("FIC")=$P(TVS("PI"),".",TVS("I")),TVS("PP")=TVS($$^%QZCHW("P"))_""""_TVS("FIC")_""""_")",TVS($$^%QZCHW("P"))=TVS($$^%QZCHW("P"))_""""_TVS("FIC")_""""_"," Q:TVS("FIC")=""  S @TVS("PP")=TVS("NPAR")
 S TVS("NPAR")=TVS("NPAR")+1
END Q

