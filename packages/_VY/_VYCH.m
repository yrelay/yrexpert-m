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

;%VYCH^INT^1^59547,74036^0
ZUCCH ;
 
 
 
 
NUM 
 S (REFUSE,STOPUC)='($$NUM^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit etre numerique")) Q
 
ALPH 
 S (REFUSE,STOPUC)='($$ALPH^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit etre alphanumerique")) Q
 
ALPH2 
 
 I '($$ALPH^%QZNBN(RESUL(ICC))) D ^%VZEAVT($$^%QZCHW("Ce champ doit commencer par une lettre")) S REFUSE=1 Q
 S (REFUSE,STOPUC)='(RESUL(ICC)?.NA) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit etre alphanumerique")) Q
 
ENTP 
 S (REFUSE,STOPUC)='($$ENTP^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit etre entier naturel")) Q
 
ENT 
 S (REFUSE,STOPUC)='($$ENT^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit etre entier relatif")) Q
 
POS 
 S (REFUSE,STOPUC)='($$POS^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit avoir une valeur strictement positive")) Q
 
POSN 
 S (REFUSE,STOPUC)='($$POSN^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Ce champ doit avoir une valeur positive ou nulle")) Q
 
ANG 
 S (REFUSE,STOPUC)='($$ANG^%QZNBN(RESUL(ICC)))
 I REFUSE=1 D ^%VZEAVT($$^%QZCHW("La valeur de l'angle est incorrecte"))
 Q

