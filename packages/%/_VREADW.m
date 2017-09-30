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
;! Nomprog     : %VREADW                                                      !
;! Module      : VIDEO                                                        !
;! But         : Lire une réponse                                             !
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
;! HL002 ! HL     ! 03/09/09 ! Evite le saut de ligne                         !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VREADW^INT^1^59547,74036^0
GECRIFLD(FLD,DX,DY,%LXG,%LXD,%YB,MODE) 
 
 
 
 
 
 
 
 
 
 
 
 
 N YG1,YG2,LG,%U
 
 
 ;HL002 S YG1=$$FORMAT(FLD,.YG2,%LXD-DX,MODE) X XY W YG1 S DY=DY+1,DX=%LXG+1
 S YG1=$$FORMAT(FLD,.YG2,%LXD-DX,MODE) X XY W YG1 S ($X,$Y)=0 S DY=DY+1,DX=%LXG+1
 
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG1=$$FORMAT(YG2,.YG2,LG,MODE) Q:(MODE=1)&(YG1="")  Q:DY'<%YB  X XY W YG1 S DY=DY+1
 
 Q
 
 
 
 
 
 
FORMAT(SS,SD,SI,MODE) S SD=$E(SS,SI+1,999)
 Q:MODE $E(SS,1,SI)
 Q $E(SS,1,SI)_$J("",SI-$L(SS))




 
TEST D TEST1(1),TEST1(0) Q
TEST1(MODE) 
 D CLEPAG^%VVIDEO F DX=20,25 S DY=5 X XY W "*"
 S DX=20,DY=10 X XY W "*"
 D ^%VREADW("ABCDEFGHIJKLMNOPQRSTUV",21,5,20,25,10,MODE)
 D ^%VZEAVT("")
 D CLEPAG^%VVIDEO
 S (DX,DY)=0 X XY
 F DY=0:1:23 F DX=0:1:79 W DX#10
 F DX=20,25 S DY=5 X XY W "*"
 D ^%VREADW("ABCD",21,5,20,25,20,MODE)
 
 S DX=20,DY=20 X XY W "*"
 D ^%VZEAVT("")
 Q
TEST2 D ^%VREADW("ABCDEFGHIJKLMNOPQRSTUV",23,5,20,25,10,1)
 Q

