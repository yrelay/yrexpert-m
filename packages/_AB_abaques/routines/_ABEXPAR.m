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

;%ABEXPAR^INT^1^59547,73864^0
%ABEXPAR ;
 
 S (YA,YY)=ARTI
LOOP S NPAR=7,^[QUI]FULL(YY,$$^%QZCHW("QUANTITE"))=1,^[QUI]FULL(YY,$$^%QZCHW("MATIERE"))=2,^[QUI]FULL(YY,"FAMMAT")=3,^[QUI]EXPL(YY,$$^%QZCHW("QUANTITE"))=1
 S ^[QUI]FULL(YY,$$^%QZCHW("ARTICLE"))=4,^[QUI]EXPL(YY,$$^%QZCHW("ARTICLE"))=4,^[QUI]FULL(YY,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))=5,^[QUI]FULL(YY,$$^%QZCHW("%MACHINE"))=6,^[QUI]FULL(YY,$$^%QZCHW("PERE"))=7,^[QUI]FULL(YY,"%PHASE")=8,^[QUI]FULL(YY,"%OPERATION")=9
 S A=-1
 F CYY=0:0 S A=$N(^[QUI]EXPLICI(YY,A)) Q:A=-1  S CP=$N(^[QUI]EXPLICI(YY,A,-1)) D GUNITE S ^[QUI]EXPL(YY,CP)=NPAR,PRX=CP D ^%ABBUILT S NPAR=NPAR+1 I $D(^[QUI]EXPGIMP(CP)) S %CP=CP,%TYEXP="%%" D ^%AB3GPSY
END Q
GUNITE S CHUN=^[QUI]EXPLICI(YY,A,CP),^[QUI]UNITE(YY,CP)=$P(CHUN,"^",1) Q

