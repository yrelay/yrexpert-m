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

;%QFNONAF^INT^1^59547,73875^0
GRNONAF ;
 I ZOOM D ZOFF^%QFZOOM,COMLIS S PAG=1 D APG^%QFPAG S RETOUR=1 Q
COMLIS I AFFLIST=0 D RESLIS,APG^%QFPAG,SIGL S RETOUR=1 Q
 E  D REDLIS,APG^%QFPAG,SIGL S RETOUR=1 Q
RESLIS S ARRET=NBPAG D CREPAG^%QFPAG
FLCLIS S NBPAG=NBPAL,NDLG=NDLGL,PAG=1,AFFLIST=1 Q
REDLIS S NBPAL=NBPAG,NDLGL=NDLG
 D MSG^%VZEATT("Selection des ""non-affectes""") S K=1,PAG=1,NBPAG=1,LI=6
LCPGL G:$D(^[QUI]GROUPE(NUFA,"LISTE2",K))=0 FLCPGL S OBJ=^[QUI]GROUPE(NUFA,"LISTE2",K),K=K+1 G:$D(^[QUI]GROAFF(NUFA,OBJ))=('(0)) LCPGL D:LI=21 PLCPGL S ^PAG($J,PAG,LI)=OBJ,LI=LI+1 G LCPGL
PLCPGL S PAG=PAG+1,NBPAG=PAG,LI=6 Q
FLCPGL F I=LI:1:20 K ^PAG($J,PAG,I)
 S PAG=1,AFFLIST=0 Q
SIGL D CADRG^%QFECRAN Q

