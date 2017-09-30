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

;%MZDELGA^INT^1^59547,73871^0
MOZDELGA ;
 
 Q:PGM=""  D CLEPAG^%VVIDEO,ONTTREV^%VVIDEO S DXG=1,DYH=1,DXD=38,DYB=22,GRAPH=1,MSG="" D 4^%VZCD
 S DY=5,MSG="ATTENTION SUPPRESSION !",DX=20-($L(MSG)\2) X XY W MSG S DX=19,DY=DY+2 X XY W "de" S DY=DY+2,DX=20-($L(PGM)\2) X XY W PGM
 S MSG="Confirmez votre suppression",DX=20-($L(MSG)\2),DY=DY+2 X XY W MSG S DY=DY+1,MSG="en redonnant le numero de gamme",DX=20-($L(MSG)\2) X XY W MSG
 S DXG=5,DYH=15,LH=30,LV=3,BLD=0 D CARS^%VVIDEO
QU S DX=7,DY=16 D ^%VLEC G:Y1="" FIN I Y1'=PGM S DX=7,DY=16 X XY W "                        " G QU
KQUER G:'($D(^[QUI]TOMOZGAM(1,PGM))) FIM S TK=^[QUI]TOMOZGAM(1,PGM),%U=$P(TK,"^",1),TK=$P(TK,"^",2) K ^[QUI]TOMOZGAM(1,PGM),^[QUI]TOMOZGAM(2,%U,TK)
FIM K @%TT@($J),^RESMEM($J)
FIN K MSG,TBK,TK,%U,%V,CTRLA,CTRLF,CTRLE,CTRLJ,CTRLR,CTRLL,CTRLZ,CTRLB,CTRLH,Y1 D OFTTREV^%VVIDEO,CLEPAG^%VVIDEO,STAT1^%MZWORD S %EDLL=EDSL,%="S" O 0 Q
KILL ;;

