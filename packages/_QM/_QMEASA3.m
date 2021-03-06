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

;%QMEASA3^INT^1^59547,73878^0
QMEASA3 ;
 
 N MN1,MEN1,AD,CONTR
 S MN="MEN1"
CDIAL K @(MN) D MENU(MN),POCLEPA^%VVIDEO
DIAL D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) Q:(CONTR="A")!(CONTR="F")
 I AD'="" G @AD
 G DIAL
AJ 
CDIAL2 K @(MN) D MENU2(MN),POCLEPA^%VVIDEO
DIAL2 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") CDIAL
 I AD'="" G @AD
 G DIAL2
CONS 
 G DIAL
MODIF 
 G DIAL
SUP 
 G DIAL
PRES 
 G DIAL2
ATTR 
CDIAL3 K @(MN) D MENU3(MN),POCLEPA^%VVIDEO
DIAL3 D ^%VQUIKMN(0,80,23,MN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") CDIAL2
 I AD'="" G @AD
 G DIAL3
VALL 
 G DIAL3
AIDE 
 G DIAL3
MENU(MEN) 
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Consulter")_"^CONS"
 S @MEN@(1,"COM")=$$^%QZCHW("Consultation de valeurs legales")
 S @MEN@(2)=$$^%QZCHW("Ajouter")_"^AJ"
 S @MEN@(2,"COM")=$$^%QZCHW("Ajout de valeurs legales")
 S @MEN@(3)=$$^%QZCHW("Modifier")_"^MODIF"
 S @MEN@(3,"COM")=$$^%QZCHW("Modification de valeurs legales")
 S @MEN@(4)=$$^%QZCHW("Supprimer")_"^SUP"
 S @MEN@(4,"COM")=$$^%QZCHW("Suppression de valeurs legales")
 Q
MENU2(MEN) 
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Presentation")_"^PRES"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte de presentation")
 S @MEN@(2)=$$^%QZCHW("Attributs")_"^ATTR"
 S @MEN@(2,"COM")=$$^%QZCHW("Acces aux attributs")
 Q
MENU3(MEN) 
 S @MEN="22^10^79"
 S @MEN@(1)=$$^%QZCHW("Aide")_"^AIDE"
 S @MEN@(1,"COM")=$$^%QZCHW("Acces au texte d'aide")
 S @MEN@(2)=$$^%QZCHW("Valeurs legales")_"^VALL"
 S @MEN@(2,"COM")=$$^%QZCHW("Acces aux valeurs legales")
 Q
STOCP(S,V,O) 
 
 D PA^%QSGESTI("SAISIE.I",S,"PRESENTATION",V,O)
 Q

