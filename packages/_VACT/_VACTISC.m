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

;%VACTISC^INT^1^59547,74033^0
GEACTISC(SCR) 
 
B 
 N NET
 S NET=1
B1 D:'($D(^GCURGRIL($I,SCR))) ^%VCURWAY(SCR)
 I '($D(^%SCRE(SCR))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Desole, non encore disponoble....") H 3 D POCLEPA^%VVIDEO G FIN
 I ^%SCRE(SCR)=0 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Desole, non encore disponible....") H 3 D POCLEPA^%VVIDEO G FIN
 K:NET=1 RESUL
 S ABENDSCR=0,CTRLF=0 K DEJALU,PATOUCH,FRESU,^OABRES($I) S DX=0,DY=^%SCRE(SCR,1,3)
 S SCR1=SCR_",COMMENT"
SUITE D ^%VATYPA,^%VCURWAY(SCR) S %U=^%SCRE(SCR),%V=0
GRESU S %V=%V+1 G:%V>%U AFI
 I '($D(NET)) N NET S NET=1
 I $D(^%SCRE(SCR,%V,"INVISIBLE")) S @("RESUL(%V)="_^%SCRE(SCR,%V,"INVISIBLE"))
 E  S:NET=1 RESUL(%V)=""
 S PATOUCH(%V)=$S($D(^%SCRE(SCR,%V,"PATOUCH")):^%SCRE(SCR,%V,"PATOUCH"),1:""),DEJALU(%V)="" G GRESU
AFI D ^%VAFIGRI,^%VAFISCR
BEG S %AJM="ACTIV" D BEG^%VMODISC
FIN K DEJALU,PATOUCH Q
B2(NET) 
 G B1

