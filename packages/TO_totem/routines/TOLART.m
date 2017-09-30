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

;TOLART^INT^1^59547,74872^0
TOLART ;
 
 D CLEPAG^%VVIDEO I '($D(^[QUI]ANTETUDE(NOMART))) W !,$$^%QZCHW("AUCUNE ETUDE NE CONTIENT CET ARTICLE") D ^%VSQUEAK H 2 G FIN
 K LISTETUD,VALCLE S IE=$N(^[QUI]ANTETUDE(NOMART,-1))
BET G:IE=-1 FET S LISTETUD(IE)="",IE=$N(^[QUI]ANTETUDE(NOMART,IE)) G BET
FET S IE=$N(LISTETUD(-1))
BL G:IE=-1 FL D AA S IE=$N(^[QUI]LISTETUD(IE)) G BL
FL D IMPR
FIN K BIDON,NOMART,IE,IEE Q
AA S NOMTREE="^[QUI]TREEWORK("""_IE_"""",ADR="TTAA^TOLART" D ^%QCAGTU1 Q
TTAA S LISTETUD(IE,%TREFC)="" Q
IMPR D CLEPAG^%VVIDEO S IE=$N(LISTETUD(-1))
BIM G:IE=-1 FIM D IMP S IE=$N(LISTETUD(IE)) G BIM
FIM Q
IMP S IEE=$N(LISTETUD(IE,-1))
BIMP G:IEE=-1 FIMP W !,NOMART,$$^%QZCHW(" "),IE,$$^%QZCHW(" "),$P(@("^[QUI]TREEWORK("_IEE_")"),"^") S IEE=$N(LISTETUD(IE,IEE)) G BIMP
FIMP R *BIDON D CLEPAG^%VVIDEO Q
TEST D CLEPAG^%VVIDEO W !,$$^%QZCHW($$^%QZCHW("NOM DE L'ARTICLE: ")) R NOMART Q:NOMART=""  D TOLART G TEST

