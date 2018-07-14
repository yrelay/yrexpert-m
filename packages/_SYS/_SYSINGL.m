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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SYSINGL^INT^1^59547,73892^0
SYSINGL ;
 
 
 
 
 
 
 
 N DIR,RETOUR D CURRENT^%IS,CLEPAG^%VVIDEO
DEB 
 S DX=20,DY=0 X XY D BLD^%VVIDEO,REV^%VVIDEO,^%VZCDB("INITIALISATION DES GLOBALS DE BASE",0),NORM^%VVIDEO
 D INT^%DIR S RETOUR=%DIR
 S DX=5,DY=6 X XY D REV^%VVIDEO W "Vous etes sur la partition :" S DX=$X+1 X XY D NORM^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W RETOUR D NORM^%VVIDEO
 S DX=5,DY=10 X XY D BLD^%VVIDEO W "Donnez le nom de la partition a initialiser : " D NORM^%VVIDEO R DIR
 I DIR="" G END
 S $ZT="G ERR"
 D ^%VZEATT,ADR^%QCSCDIR("PDP",DIR)
RESTOR 
 S $ZT="",X0="ZL @(""%SYSING1"") F J=3:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL" X X0
FIN D POCLEPA^%VVIDEO S DX=30,DY=15 X XY W "*** FIN ***"
END D ADR^%QCSCDIR("PDP",RETOUR) Q
 
ERR S $ZT="" D ^%VZEAVT("La partition "_DIR_" n'existe pas ..."),CLEPAG^%VVIDEO G DEB

