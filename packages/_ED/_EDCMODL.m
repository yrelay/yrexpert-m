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

;%EDCMODL^INT^1^59547,73869^0
EDCMODL(MODELE,ATT2,VAL,PAGE,INDIV) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %VAL,LIGNE,BASE,OBJET
 
 I '($$EXISTE^%EDDGEST(MODELE)) D POCLEPA^%VVIDEO W $$^%QZCHW("le modele")_" "_MODELE_" "_$$^%QZCHW("n'existe pas") H 3 Q
 I INDIV="" S BASE=ATT2,OBJET=VAL G TEST
 
 I '($D(CXT(INDIV,"BASE"))) D POCLEPA^%VVIDEO W $$^%QZCHW("l'individu symbolique")_" "_INDIV_" "_$$^%QZCHW("n'a pas de base") H 3 Q
 I '($D(CXT(INDIV,"OBJET"))) D POCLEPA^%VVIDEO W $$^%QZCHW("l'individu symbolique")_" "_INDIV_" "_$$^%QZCHW("n'a pas de nom") H 3 Q
 S BASE=CXT(INDIV,"BASE")
 S OBJET=CXT(INDIV,"OBJET")
 
TEST 
 I $D(LISTEMOD(MODELE)) D POCLEPA^%VVIDEO W $$^%QZCHW("vous bouclez sur le modele")," ",MODELE," ",$$^%QZCHW("arret de l'edition") S ARRET=1 Q
 
 
 
MOD1 
 S LISTEMOD(MODELE)=1
 I '($D(ADRM(MODELE))) S ADRM(MODELE)=0
 N ARRET,MOD,MODL
 S (MOD,MODL)=MODELE,ARRET=0
 S LIGNE=""
BOUCL 
 S LIGNE=$O(^[QUI]EDMOD(MODELE,"COMP",LIGNE))
 G:ARRET FIN
 G:LIGNE="" FIN
 G:^[QUI]EDMOD(MODELE,"COMP",LIGNE)="" FIN
 X ^[QUI]EDMOD(MODELE,"COMP",LIGNE)
 G BOUCL
FIN K LISTEMOD(MODELE),ADRM(MODELE)
 
 I PAGE=0 S %FONC="CLEAR" D ^%PBPZ
 Q

