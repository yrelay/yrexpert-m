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

;%QS0MEN2^INT^1^59547,73879^0
QS0MEN2() 
 
 
 
 
 N AD,CT,MEN,R,Y
 S R=0,DX=0,DY=22 X XY D CLEBAS^%VVIDEO
 S MEN="21^10^79"
 S MEN(1)=$$^%QZCHW("Creer")_"^CREAT"
 S MEN(1,"COM")=$$^%QZCHW("Creation d'une nouvelle liste d'attributs")
 S MEN(2)=$$^%QZCHW("Consulter/Modifier")_"^MODIF"
 S MEN(2,"COM")=$$^%QZCHW("Consultation/Modification d'une liste d'attributs")
 S MEN(3)=$$^%QZCHW("Supprimer")_"^SUPPR"
 S MEN(3,"COM")=$$^%QZCHW("Suppression d'une liste d'attributs")
ACT 
 D ^%VQUIKMN(1,80,22,"MEN",.AD,.CT) Q:(CT="A")!(CT="F") R
 G:AD'="" @AD G ACT
CREAT 
 D CREAT^%QMLILAD
 S R=2 G FIN
MODIF 
 D MODIF^%QMLILAD
 S R=2 G FIN
SUPPR 
 D SUPPR^%QMLILAD
 S R=2 G FIN
AD N A S A=$$^%QS0MEN2 Q
FIN D CLEPAG^%VVIDEO G ACT

