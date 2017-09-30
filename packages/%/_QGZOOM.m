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

;%QGZOOM^INT^1^59547,73876^0
GRZOOM ;
ZOOM I AFFLIST=0 D ^%QGNONAF
 I $D(ZOOM)=0 S LIS=$Y G:$D(^PAD($J,PAD,LIS))=0 END1 S GROZOOM=^PAD($J,PAD,LIS) D ZON G FIN1
 I ZOOM=0 S LIS=$Y G:$D(^PAD($J,PAD,LIS))=0 END1 S GROZOOM=^PAD($J,PAD,LIS) D ZON G FIN1
 D ZOFF G FIN1
ZON S ZOOM=1,NBPAZ=NBPAG,NDLGZ=NDLG
 D MSG^%VZEATT("Selection des elements de "_GROZOOM) S OBJ=-1,PAG=1,NBPAG=1,LI=6
LCPGZ S OBJ=$N(@GROUPE@(1,GROZOOM,"OBJET",OBJ)) G:OBJ=-1 FLCPGZ D:LI=21 PLCPGZ S ^PAG($J,PAG,LI)=OBJ,LI=LI+1 G LCPGZ
PLCPGZ S PAG=PAG+1,NBPAG=PAG,LI=6 Q
FLCPGZ F I=LI:1:20 K ^PAG($J,PAG,I)
 S PAG=1 D APG^%QGPAG,CADRG^%QGECRAN Q
ZOFF S ARRET=NBPAG D CREPAG^%QGPAG
FLZOF S NBPAG=NBPAZ,NDLG=NDLGZ,PAG=1,ZOOM=0 D CADRG^%QGECRAN,APG^%QGPAG Q
FIN1 S RETOUR=1 Q
END1 D ^%VSQUEAK S RETOUR=2 Q

