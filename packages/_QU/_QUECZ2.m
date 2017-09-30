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

;%QUECZ2^INT^1^59547,73885^0
QUECZ2 ;
 
 
 
 
 
SEL(MEN,ONE) N CTR,ADR
 D CLFEN^%VVIDEO(0,22,2,RM-4)
 D ^%VQUIKMN(0,RM-1,22,MEN,.ADR,.CTR)
 Q:(CTR="A")!(CTR="F") 1
 D:ADR'="" @ADR
 Q ONE
 
TEST F DY=0:1:23 S DX=0 X XY F DX=0:1:RM-2 W "X"
 D CLFEN^%VVIDEO(0,10,2,RM-1)
 W $$XY^%VVIDEO1(0,0)
 Q
TEST1 N XX S XX=1 D CLEPAG^%VVIDEO
 F DY=0:1:23 S DX=0 X XY F DX=0:1:RM-2 W "X"
 S (DX,DY)=0 X XY
 
 F DX=0:1:79 W DX#10
 S DX=0 F DY=0:1:23 X XY W DY
 D ^%QUECAFF("EC2")
 Q
 D CLFEN^%VVIDEO(10,5,10,20)
 D ^%VZEAVT("")
 W $$XY^%VVIDEO1(0,0)
 D CARSA^%VVIDEO(10,5,20,10)
 D ZLISTE(10,5,20,10,"^TATA",.XX,"ADD^%QULIMO","ADD^%QULIMO") Q

