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
;! Nomprog     : %VCRIFLD                                                     !
;! Module      : VIDEO                                                        !
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
;! HL002 ! HL     ! 14/02/07 ! Entrée sur %VCRIFLD(FLD,CX,CY,%LXG,%LXD)       !
;! HL003 ! HL     ! 15/02/07 ! PB a la ligne 23 saut a la ligne non souhaité  !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

 ;HL002 %VCRIFLD ;
%VCRIFLD(FLD,CX,CY,%LXG,%LXD) ;

 ;HL002 GECRIFLD(FLD,CX,CY,%LXG,%LXD) 
 ;S DX=CX,DY=CY,YG1=$E(FLD,1,%LXD-CX) X XY W YG1 S YG1=$E(FLD,(%LXD-CX)+1,999),DY=DY+1,DX=%LXG+1
 S DX=CX,DY=CY,YG1=$E(FLD,1,%LXD-CX) S $X=DX,$Y=DY X XY W YG1 S YG1=$E(FLD,(%LXD-CX)+1,999),DY=DY+1,DX=%LXG+1
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K YG1,YG2,LG Q
TEST
 D ^%IS
 D CLEPAG^%VVIDEO F DX=20,25 S DY=5 X XY W "*"
 D ^%VCRIFLD("ABCDEFGHIJKLMNOPQRSTUV",21,5,20,25) Q

