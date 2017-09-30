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

;%DLEVAL3^INT^1^59547,73867^0
DLEVAL3 ;
 
 
 
 
DATEFIX 
 S ADLIS=$$ADRLIS^%QSGEST7(NL)
 G:ADLIS="" FDATF
 I $$CARD^%QSGEST7(NL)=1 S LAN=$O(@ADLIS@("")) G DATEF2
 S LAN=$$TIT^%PKCHOIX(ADLIS,30,10,10,$$^%QZCHW("Veuillez choisir un lancement"),0)
DATEF2 I LAN="" G FDATF
 S REPART=$$ART^%DLCON2
 S ART=$$^%QSCALVA(REP,LAN,$$LIEN1^%QSGEL2(REP,REPART,3))
 I ART="" D ^%VZEAVT($$^%QZCHW("Pas de")_$$RART^%DLCON2) G DATEF3
 S GAM=$$^%QSCALVA(REP,LAN,"GAMME")
 I '($$VAIR^%QSGE5(REPART,ART,$$AG^%DLCON2,GAM)) S GAM=$$^%QSCALVA(REPART,ART,$$AG^%DLCON2) I GAM="" D ^%VZEAVT($$^%QZCHW("Pas de gamme sur")_" "_ART) G DATEF3
 D GAMME^%DLANCE3(LAN,ART_","_GAM)
 
DATEF3 G:$$CARD^%QSGEST7(NL)=1 FDATF
 D CLEPAG^%VVIDEO,TETE^%DLEVAL2(0)
 G DATEFIX
 
FDATF S AFF=1
 G AFF^%DLEVAL

