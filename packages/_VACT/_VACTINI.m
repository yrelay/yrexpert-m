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
;! Nomprog     : %VACTINI                                                     !
;! Module      : VIDEO                                                        !
;! But         : Choix de la partition                                        !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                               Vendredi                                     !
;!                                                                            !
;!                               03 Juin 2005                                 !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                     Votre partition                                        !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!               17H13              Semaine 79          Jour 154              !
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

%VACTINI ; 
 D STANDI^%VTOZE
 ;HL D CURRENT^%IS,CLEPAG^%VVIDEO,ZD^%QMDATE4,^%QMDAK0 S %RNS=$E($$NOSEM^%QMDAK4($H),3,4),%DS="01/01/"_$P(%DAT,"/",3) D INT^%DATE S J1=%DN,%DS=$P(%DAT,"/",2)_"/"_$P(%DAT,"/",1)_"/"_$P(%DAT,"/",3)
 D CURRENT^%IS,CLEPAG^%VVIDEO,ZD^%QMDATE4,^%QMDAK0 S %RNS=$E($$NOSEM^%QMDAK4($H),5,6),%DS="01/01/"_$P(%DAT,"/",3) D INT^%DATE S J1=%DN,%DS=$P(%DAT,"/",2)_"/"_$P(%DAT,"/",1)_"/"_$P(%DAT,"/",3)
 D INT^%DATE S NBJ=(%DN-J1)+1
 S J1=$P("Jeudi,Vendredi,Samedi,Dimanche,Lundi,Mardi,Mercredi",",",($P($H,",",1)#7)+1),AN=$S($L($P(%DAT,"/",3))=2:"19"_$P(%DAT,"/",3),1:$P(%DAT,"/",3))
 S MS=$P("Janvier,Fevrier,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Decembre",",",$P(%DAT,"/",2))
 
 
 
 D CUROF^%VVIDEO,REV^%VVIDEO S MSG=$$^%QZCHW(J1),DX=31,DY=6 X XY W MSG
 S MSG=$P(%DAT,"/",1)_" "_$$^%QZCHW(MS)_" "_AN,DY=8,DX=31 X XY W MSG
 S DX=15,DY=17 X XY W HEURE
 
 S MSG=$$^%QZCHW("Semaine")_" "_%RNS,DX=34,DY=17 X XY W MSG
 S MSG=$$^%QZCHW("Jour")_" "_NBJ,DX=54,DY=17 X XY W MSG
 D NORM^%VVIDEO G:'($D(^TABUSER("USER"))) SUIT S MSG=^TABUSER("USER") W $$BIG^%VVIDEO1(MSG,20-($L(MSG)\2),1)
SUIT D CURON^%VVIDEO K %PNS,%DS,J1,%DN,MS,AN,MSG,NBJ Q

