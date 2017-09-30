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

;%QS3INIT^INT^1^59547,73880^0
QS3INIT ;
 
 
 
 
 
 Q
V31 G:$D(^[QUI]RQSVERSI(31E-1)) V32 S ^[QUI]RQSVERSI(31E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.1, un instant ...") H 1
 D CARD^%QSGESTI
 D COMPL^%QS0
V32 G:$D(^[QUI]RQSVERSI(32E-1)) V33 S ^[QUI]RQSVERSI(32E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.2, un instant ...") H 1
 D:'($D(^[QUI]ANSA)) INIT^%ANA
V33 G:$D(^[QUI]RQSVERSI(33E-1)) V34 S ^[QUI]RQSVERSI(33E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.3, un instant ...") H 1
 D SYS^%QSDROIT("L0","ADRESSE")
 D VIS^%QSDROIT("L0","AUTEUR")
 D SYS^%QSDROIT("L0","AUTRE")
 D SYS^%QSDROIT("L0","BASE")
 D VIS^%QSDROIT("L0","CARD")
 D SYS^%QSDROIT("L0","CREATION")
 D VIS^%QSDROIT("L0","DATE.CREATION")
 D VIS^%QSDROIT("L0","DATE.UTILISATION")
 D VIS^%QSDROIT("L0","HEURE.CREATION")
 D VIS^%QSDROIT("L0","HEURE.UTILISATION")
 D VIS^%QSDROIT("L0","LOCALISATION")
 D VIS^%QSDROIT("L0","OBJET")
 D VIS^%QSDROIT("L0","SOURCE")
 D SYS^%QSDROIT("L0","TRIABLE")
 D SYS^%QSDROIT("L0","TRIEE")
 D SYS^%QSDROIT("L0","UTILISATION")
V34 G:$D(^[QUI]RQSVERSI(34E-1)) V35 S ^[QUI]RQSVERSI(34E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.4, un instant ...") H 1
 D CARD^%QSGESTI
V35 G:$D(^[QUI]RQSVERSI(35E-1)) V36 S ^[QUI]RQSVERSI(35E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.5, un instant ...") H 1
 D VIS^%QSDROIT("ECL","ARC")
 D VIS^%QSDROIT("ECL","ATTRIBUT.D.ECLATEMENT")
 D VIS^%QSDROIT("ECL","DATE")
 D VIS^%QSDROIT("ECL","DELAI.DEMANDE")
 D VIS^%QSDROIT("ECL","VALEUR.ATTRIBUT.D.ECLATEMENT")
V36 G:$D(^[QUI]RQSVERSI(36E-1)) V37 S ^[QUI]RQSVERSI(36E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.6, un instant ...") H 1
V37 G:$D(^[QUI]RQSVERSI(37E-1)) V38 S ^[QUI]RQSVERSI(37E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.7, un instant ...") H 1
V38 G:$D(^[QUI]RQSVERSI(38E-1)) V39 S ^[QUI]RQSVERSI(38E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.8, un instant ...") H 1
 D ^%QSIV38
V39 G:$D(^[QUI]RQSVERSI(39E-1)) V310 S ^[QUI]RQSVERSI(39E-1)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.9, un instant ...") H 1
 
V310 G:$D(^[QUI]RQSVERSI(310)) V311 S ^[QUI]RQSVERSI(310)=""
 D POCLEPA^%VVIDEO W $$^%QZCHW("Initialisation version Requetes 3.10, un instant ...") H 1
 
V311 Q

