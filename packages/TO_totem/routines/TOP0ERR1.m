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

;TOP0ERR1^INT^1^59547,74873^0
TOP0ERR1 ;
 
BEG U 0 S NBERR=0,OK=1,DX=0,DY=6 D CLEBAS^%VVIDEO,^TOP0ERRL,TRAIT
 I NBERR'=0 S REP=78 D ^%VSQUEAK,POCLEPA^%VVIDEO W "REMONTEZ LA BANDE CORRECTEMENT..." H 2
FIN K II,ADR,NBERR,RET,OK Q
TRAIT I RW S NBERR=NBERR+1,DY=DY+1 X XY W "BANDE EN COURS DE REMBOBINAGE "
 I '(WP) S NBERR=NBERR+1,DY=DY+1 X XY W "LA BANDE N'EST PAS PROTEGEE EN ECRITURE "
 I BOT=0 S NBERR=NBERR+1,DY=DY+1 X XY W "LA BANDE N'EST PAS EN BOT"
 I '(ONL) S NBERR=NBERR+1,DY=DY+1 X XY W "LE LECTEUR DE BANDE N'EST PAS ON LINE "
 I BT S NBERR=NBERR+1,DY=DY+1 X XY W "CE N'EST PAS LA BONNE BANDE "
 I BGL S NBERR=NBERR+1
 I PCRC S NBERR=NBERR+1
 I TC S NBERR=NBERR+1,DY=DY+1 X XY W "LE CONTROLER DE BANDE EST EN PANNE "
 I TNR S NBERR=NBERR+1,DY=DY+1 X XY W "LA BANDE N'EST PAS PRETE "
 Q

