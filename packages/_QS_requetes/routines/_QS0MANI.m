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

;%QS0MANI^INT^1^59547,73879^0
ZLIGMANI() 
 
 
 
 N LISTE,M S M=$$^%QZCHW("GESTION MANUELLE D'UNE LISTE") D ^%QUAPAD(M)
 S LISTE=$$UN^%QUAPAGM Q:LISTE="" 1
 I $$^%QSCALVA("L0",LISTE,"ADRESSE")="" D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de retrouver les individus de cette liste ... desole") H 3 D POCLEPA^%VVIDEO Q 1
 I $$^%QSCALVA("L0",LISTE,"BASE")="" D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible de retrouver le repertoire des individus de cette liste ... desole") H 3 D POCLEPA^%VVIDEO Q 1
 D MANI(LISTE) Q 2
MANI(LISX) 
 D USE^%QS0(LISX) N TRI,CAR D CLEPAG^%VVIDEO,AFF
 S TRI=$$^%QSCALVA("L0",LISX,"TRIEE") I TRI'="" K @(TRI) D PSV^%QSGESTI("L0",LISX,"TRIABLE"),PSV^%QSGESTI("L0",LISX,"TRIEE")
 S CAR("ATT")=1,CAR("T")=0,CAR("X")=0,CAR("Y")=3,CAR("L")=80,CAR("H")=19,CAR("A")=$$^%QSCALVA("L0",LISX,"ADRESSE"),CAR("B")=$$^%QSCALVA("L0",LISX,"BASE"),CAR("AFF")="AFF^%QS0MANI",CAR("LIS")=LISX,CAR("MAN")=1
 D INIT^%QUAPAGM("CAR"),AFFICH^%QUAPAGM,GO^%QUAPAGM,END^%QUAPAGM Q
AFF S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1,MSG=LISX D 4^%VZCD Q

