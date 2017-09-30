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

;TOGETEXP^INT^1^59547,74872^0
TOGETEXP ;
 
 S EFFACE=0,REFUSE=1 Q:EXPRESS["$"  S REFUSE=0,EXP=EXPRESS D ^TOPARENT I REFUSE>0 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Mauvais parenthesage... ") H 2 S REFUSE=1 D POCLEPA^%VVIDEO G FIN
 S EXPRESS=EXP,EFFACE=1 G:EXP="" FIN S XDP="("_EXP_")" D ^%LXUC6 G:REFUSE=0 FIN
 D POCLEPA^%VVIDEO W $$^%QZCHW("(L)exique/(B)Cons.breve/[RETURN]") R *RET S RET=$C(RET) D:RET="B" ^%LXCONS D:RET="L" AJLEX
 D CLEPAG^%VVIDEO
FIN Q
AJLEX D ^%VKRSAV
 K ^DEJALU($I) S LU=-1 F UU=0:0 S LU=$N(DEJALU(LU)) Q:LU=-1  S ^DEJALU($I,LU)=DEJALU(LU)
 K DEJALU D ^%LXAJMOD,^%VKRRES K DEJALU S LU=-1 F UU=0:0 S LU=$N(^DEJALU($I,LU)) Q:LU=-1  S DEJALU(LU)=^DEJALU($I,LU)
 K ^DEJALU($I) S X1=13,REFUSE=1 Q

