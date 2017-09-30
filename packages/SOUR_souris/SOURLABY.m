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
;! Nomprog     : SOURLABY                                                     !
;! Module      : SOUR (SOURIS)                                                !
;! But         : Afficher le labyrinthe                                       !
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

;SOURLABY^INT^1^59547,74869^0
SOURLABY ;
 
 K ^STOP($I),^XYBAR($I) F X1=1:1:19 S ^STOP($I,X1,11)=1,^STOP($I,X1,0)=1 I X1<11 S ^STOP($I,20,X1)=1,^STOP($I,0,X1)=1
DES S X1=-1 F %U=0:0 S X1=$N(@%LABY@(X1)) Q:X1=-1  S Y1=-1 F %U=0:0 S Y1=$N(@%LABY@(X1,Y1)) Q:Y1=-1  S ^XYBAR($I,X1,Y1)=1 D T0
FIN D NORM^%VVIDEO K LI,%U,CC,X1,Y1,CC1,X,Y,YY Q
T0 S X=X1/4,Y=11-(Y1/2),^STOP($I,X,Y)=1
 ;HL002 S DX=X1-2,DY=Y1-1 D REV^%VVIDEO F YY=1:1:3 X XY W "     " S DY=DY+1
 S DX=X1-2,DY=Y1-1 D REV^%VVIDEO F YY=1:1:3 X XY W "     " S ($X,$Y)=0 S DY=DY+1
 Q

