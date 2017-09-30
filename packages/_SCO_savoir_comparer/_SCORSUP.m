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

;%SCORSUP^INT^1^59547,73888^0
SCORSUP ;
 
 
 
 
 
 N Y1,DOM,NDOM
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SUPPRESSION"))
AFF S DX=0,DY=10 X XY
 D LIRE2^%VREAD($$^%QZCHW("domaine a supprimer")_" : ","",8,RM-10,DY+1,DY-1,"","$$UC1^%SCORDUP",.CTR,.DOM)
 Q:(DOM="")!(CTR="A")
 D POCLEPA^%VVIDEO S DX=20 X XY
 S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("suppression")_" : ")
 I REP=1 K ^[QUI]SCOMPREG(DOM)
 S DX=0,DY=5 D CLEBAS^%VVIDEO
 G AFF
 
UC1(Y1,REAF) 
 S REAF=0
 I Y1="" Q 1
 I $E(Y1,$L(Y1))="?" G CHOIX
 I '($D(^[QUI]SCOMPREG(Y1))) D ^%VZEAVT($$^%QZCHW("domaine inconnu")) Q 0
 Q 1
CHOIX 
 D INIT^%QUCHOIP("^[QUI]SCOMPREG",1,"",0,5,80,17),AFF^%QUCHOIP
 S DOM=$$UN^%QUCHOIP
 D END^%QUCHOIP
 S DX=0,DY=5 D CLEBAS^%VVIDEO
 Q 1
 ;

