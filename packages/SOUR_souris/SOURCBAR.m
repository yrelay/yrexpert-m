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
;! Nomprog     : SOURCBAR                                                     !
;! Module      : SOUR (SOURIS)                                                !
;! But         : Choix des barrières                                          !
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
;! HL002 ! HL     ! 16/07/12 ! PB caractères parasites terminal-gnome         !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;SOURCBAR^INT^1^59547,74868^0
SOURCBAR ;
 
 D POCLEPA^%VVIDEO W $$^%QZCHW("(RETURN) pour mettre une barriere ; (CTRLA) fin ") S DX=4,DY=2,MPASX=4,MPASY=2,NXI=3,NXS=77,NYI=1,NYS=21 X XY
BEG D ^%VZECUR G:X1=1 FIN
 S X=$X/4,Y=11-($Y/2),^STOP($I,X,Y)=1,^XYBAR($I,$X,$Y)=1
 ;HL002 S DOLX=$X,DOLY=$Y,DX=$X-2,DY=$Y-1 D REV^%VVIDEO F YY=1:1:3 X XY W "     " S DY=DY+1
 S DOLX=$X,DOLY=$Y,DX=$X-2,DY=$Y-1 D REV^%VVIDEO F YY=1:1:3 X XY W "    " S ($X,$Y)=0 S DY=DY+1
SUIT D NORM^%VVIDEO S DX=DOLX,DY=DOLY X XY G BEG
FIN K MPASX,MPASY,X1 Q

