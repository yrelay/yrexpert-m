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

;%LXSEE^INT^1^59547,73871^0
LEXSEE ;
 
 
 
 
 N MNLEX,ADR,CTR,MOT,ENSMOT,Z,IMOT,Z2
 D CLEPAG^%VVIDEO
 D ^%VZEATT
 D INIT^%QUCHOIP("^[QUI]TOLEX",1,"",0,5,80,17)
 S Z=^QX($J)
 S MNLEX(1)=$$^%QZCHW("Entrer")_"^ENTR"
 S MNLEX(2)=$$^%QZCHW("Visualiser")_"^VISU"
 S MNLEX(3)=$$^%QZCHW("Supprimer")_"^SUPPR"
 S MNLEX(4)=$$^%QZCHW("Verifier.Lexique")_"^VERIF"
 S MNLEX(5)="+^PSUIV"
 S MNLEX(6)="-^PPREC"
 S ENSMOT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DESTRUCT")
 
 D REAFF
 
CHOI D POCLEPA^%VVIDEO
 D ^%VQUIKMN(1,80,22,"MNLEX",.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FIN
 I CTR'="" D ^%VSQUEAK G CHOI
 G @ADR
 
FIN D END^%QUCHOIP
 Q
 
ENTR 
 D PAD("ACCES")
 S MOT=$$UN^%QUCHOIP
 G CHOI
 
VISU 
 D PAD("VISUALISATION")
 S MOT=$$UN^%QUCHOIP
 G:MOT="" CHOI
 D CLEPAG^%VVIDEO
 S Z2=Z
 D AFF^%LXIQ(MOT)
 D ^%VZEAVT("")
 S Z=Z2
 D CLEPAG^%VVIDEO
 D REAFF
 G VISU
 
SUPPR 
 D PAD("SUPPRESSION")
 K @(ENSMOT)
 D ^%QUCHOYP(ENSMOT)
 G:'($D(@ENSMOT)) CHOI
 D POCLEPA^%VVIDEO
 I '($$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous la suppression de ce(s) mot(s) ?"))) D REAF2 G CHOI
 S MOT=""
BSUPPR S MOT=$O(@ENSMOT@(MOT))
 I MOT="" D REINIT G CHOI
 S CTR=$$SUPP^%LXSUPP(MOT)
 I CTR=2 D POCLEPA^%VVIDEO W $$^%QZCHW("Suppression interdite")_" : "_MOT_" "_$$^%QZCHW("est un mot reserve.") H 5
 G BSUPPR
 
PPREC 
 S CTR=$$D45^%QUCHOIP
 G CHOI
 
PSUIV 
 S CTR=$$D43^%QUCHOIP
 G CHOI
 
VERIF 
 D NEW^%LXMAJ
 G CHOI
 
REAFF 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Mots maitres du LEXIQUE"))
 D AFF^%QUCHOIP
 Q
 
REAF2 D AFF^%QUCHOIP
 Q
 
REINIT D END^%QUCHOIP
 D INIT^%QUCHOIP("^[QUI]TOLEX",1,"",0,5,80,17)
 D AFF^%QUCHOIP
 Q
 
PAD(MES) 
 D ^%QUAPAD($$^%QZCHW(MES))
 Q
 ;

