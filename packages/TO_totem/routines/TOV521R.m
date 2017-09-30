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

;TOV521R^INT^1^59547,74876^0
TOV521R ;
 
 D CLEPAG^%VVIDEO
 S IMPR=0,DX=0,DY=10 X XY W $$^%QZCHW("Resultats sur (E)cran ou (I)mprimante [autre=Abandon] ") R *RET S RET=$C(RET) G:(RET'=$$^%QZCHW("E"))&(RET'=$$^%QZCHW("I")) FIN S IMPR=$S(RET=$$^%QZCHW("E"):0,1:^TABIDENT(WHOIS,"PRINTER")) D CLEPAG^%VVIDEO W:IMPR'=0 $$^%QZCHW("Impression en cours...") O IMPR U IMPR
 S MAT=-1 F %UU=1:1 S MAT=$N(^[QUI]EXAPMC(MAT)) Q:MAT=-1  D TRAIT
FIN C:IMPR'=0 IMPR Q
TRAIT S MSG=$$^%QZCHW("Famille machine ")_MAT W ?40-($L(MSG)\2),MAT,!,!,$$^%QZCHW("Liste des parametre explicites"),!,! S PEX=-1 F %VV=1:1 S PEX=$N(^[QUI]EXAPMC(MAT,0,PEX)) Q:PEX=-1  W !,?30,PEX
 W !,! S MT=0 F %WW=1:1 S MT=$N(^[QUI]EXAPMC(MAT,MT)) Q:MT=-1  W !,$S(^[QUI]EXAPMC(MAT,0)=^[QUI]EXAPMC(MAT,MT):"",1:"==> "),MT,?50,$S(^[QUI]EXAPMC(MAT,0)=^[QUI]EXAPMC(MAT,MT):$$^%QZCHW(" Complet"),1:$$^%QZCHW(" Incomplet"))
END Q

