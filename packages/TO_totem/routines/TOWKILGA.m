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

;TOWKILGA^INT^1^59547,74876^0
TOWKILGA ;
 
 D CLEPAG^%VVIDEO S DX=0,DY=12 X XY W $$^%QZCHW("Alliage           : "),%AL,!,$$^%QZCHW("Etat              : "),%ET,!,$$^%QZCHW("Largeur           : "),%LA,!,$$^%QZCHW("epaisseur finale  : "),%EP
 W !,!,$$^%QZCHW("OK pour la destruction du schema decrit ci-dessus (O/N) ?") R *%9ACOR G:(%9ACOR'=79)&(%9ACOR'=111) FIN
 K ^[QUI]OCGRIL("GAMLAC",%AL,%ET,%LA,%EP) S CLE="LAF/"_%AL_"/"_%ET_"/"_%LA_"/"_%EP I '($D(^[QUI]GAMLAF(CLE))) G FIN
 S NUGAM=^[QUI]GAMLAF(CLE)
KILL K ^[QUI]GAMLAF(CLE),^[QUI]AUTOPLAF(NUGAM),^[QUI]SECT(NUGAM),^[QUI]DIM(NUGAM),^[QUI]PHAS(NUGAM),^[QUI]DUREE(NUGAM),^[QUI]COUT(NUGAM),^[QUI]TVPAR(NUGAM)
FIN D TESTF K %9ACOR Q
TESTF S %EP=$N(^[QUI]OCGRIL("GAMLAC",%AL,%ET,%LA,-1)) I %EP="zzNEXPOSI" K ^[QUI]OCGRIL("GAMLAC",%AL,%ET,%LA,%EP)
 Q

