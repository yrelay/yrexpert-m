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

;%SDOCHGE^INT^1^59547,73889^0
SDOCHGE ;
 
 
 
 
 
 
 
 
 
 
 
 N ENSEM,AD,I,RES,MENU1
 S ENSEM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LMOD")
AFF K @(ENSEM)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("REGENERATION D'OBJETS GRAPHIQUES"))
 S MENU1(1)=$$^%QZCHW("SELECTION")_"^SEL"
 S MENU1(2)=$$^%QZCHW("TOUS")_"^TOUS"
DIAL2 D ^%VQUIKMN(23,78,22,"MENU1",.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 I AD'="" G @AD
 G DIAL2
 
TOUS N OBJ,VERS,CTRLA,ABANDON
 S ABANDON=0
 D CLEPAG^%VVIDEO,^%VZCDB("Regeneration d'Objets graphiques",0)
 S OBJ=""
LOBJ S OBJ=$O(^[QUI]SDOBJ(OBJ)) Q:OBJ=""
 S VERS=""
LVERS S VERS=$O(^[QUI]SDOBJ(OBJ,VERS)) G:VERS="" LOBJ
 U 0
 D CLFEN^%VVIDEO(0,6,7,80)
 S DX=2,DY=7 X XY W "Objet : "_OBJ
 S DX=2,DY=13 X XY W "Version : "_VERS
 D EXT^%SDOGEN(OBJ,VERS)
 I $$ISCTRLA^%SYSCLAV D ARRET Q:ABANDON
 G LVERS
 
SEL D ^%SDOGEN
 Q
 
 
 
ARRET D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 Q

